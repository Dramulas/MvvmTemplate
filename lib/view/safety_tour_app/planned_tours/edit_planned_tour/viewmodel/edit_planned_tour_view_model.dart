import 'package:flutter/material.dart';
import 'package:mobx/mobx.dart';
import 'package:multi_select_flutter/util/multi_select_item.dart';

import '../../../../../../core/base/model/base_viewmodel.dart';
import '../../../model/abstract/ITourViewModel.dart';
import '../../../model/field_dd_model.dart';
import '../../../model/location_dd_model.dart';
import '../../../model/tour_model.dart';
import '../../../model/user_dd_model.dart';
import '../../planned_tour_detail/view/planned_tour_detail_view.dart';
import '../../service/planned_tour_service.dart';

part 'edit_planned_tour_view_model.g.dart';

class EditPlannedTourViewModel = _EditPlannedTourViewModelBase
    with _$EditPlannedTourViewModel, IEditUnplannedTourViewModel;

abstract class _EditPlannedTourViewModelBase with Store, BaseViewModel {
  void setContext(BuildContext context) => this.context = context;
  Future<void> init() async {
    locations = (await getLocations())!;
    fields = (await getFields())!;
    users = (await getUsers())!;
    userList = users!
        .map((member) => MultiSelectItem<UserDDModel>(member, member.fullName!))
        .toList();
  }

  GlobalKey<ScaffoldState> scaffoldState = GlobalKey();

  var service = PlannedTourService.instance!;

  @observable
  List<LocationDDModel> locations = <LocationDDModel>[];

  @observable
  bool isClicked = false;

  @observable
  List<FieldDDModel> fields = <FieldDDModel>[];

  @observable
  List<UserDDModel>? users = <UserDDModel>[];

  @observable
  List<MultiSelectItem<UserDDModel>> userList =
      <MultiSelectItem<UserDDModel>>[];

  @action
  Future<void> updatePlannedTour(TourModel tour) async {
    final updatedTour = await service.updatePlannedTour(tour);
    // print(updatedTour!.tourTeamMembersIds!);
    if (updatedTour != null) {
      Navigator.of(context).pushAndRemoveUntil(
          MaterialPageRoute(
              builder: (context) => PlannedTourDetailView(),
              settings: RouteSettings(arguments: updatedTour)),
          (route) => route.isFirst);

      final snackBar = SnackBar(
        content: Text("Planlı tur başarıyla güncellendi."),
        backgroundColor: Colors.green,
      );
      ScaffoldMessenger.of(context).showSnackBar(snackBar);
    } else {
      final snackBar = SnackBar(
        content: Text("Hata!."),
        backgroundColor: Colors.red,
      );
      ScaffoldMessenger.of(context).showSnackBar(snackBar);
    }
  }

  @observable
  // ignore: avoid_init_to_null
  int? selectedLocationId = null;

  @action
  void changeIsClicked() {
    isClicked = !isClicked;
  }

  @action
  setSelectedLocationId(int? locationId) => selectedLocationId = locationId;

  @action
  Future<List<LocationDDModel>?> getLocations() async {
    return await PlannedTourService.instance!.getLocations();
  }

  @action
  Future<List<FieldDDModel?>?> getFieldsBasedOnSelectedLocation(
      int? selectedLocationId) async {
    final retval = fields
        .where((element) => element.locationId == selectedLocationId)
        .toList();
    if (retval.isEmpty) {
      return [];
    } else {
      return retval;
    }
  }

  @action
  Future<List<FieldDDModel>?> getFields() async {
    return await PlannedTourService.instance!.getFields();
  }

  @action
  Future<List<UserDDModel>?> getUsers() async {
    final users = await PlannedTourService.instance!.getUsers();
    return users;
  }

  @action
  updateTour(TourModel tour, BuildContext context) async {
    await service.updatePlannedTour(tour);
  }
}
