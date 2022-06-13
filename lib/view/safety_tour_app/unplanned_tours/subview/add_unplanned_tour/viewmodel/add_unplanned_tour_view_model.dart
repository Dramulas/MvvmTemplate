import '../../../../model/abstract/ITourViewModel.dart';
import 'package:flutter/material.dart';
import 'package:mobx/mobx.dart';
import 'package:multi_select_flutter/util/multi_select_item.dart';

import '../../../../../../core/base/model/base_viewmodel.dart';
import '../../../../../../core/constants/navigation/navigation_constants.dart';
import '../../../../../../core/init/navigation/navigation_service.dart';
import '../../../../model/field_dd_model.dart';
import '../../../../model/location_dd_model.dart';
import '../../../../model/tour_model.dart';
import '../../../../model/user_dd_model.dart';
import '../../../service/unplanned_tour_service.dart';

part 'add_unplanned_tour_view_model.g.dart';

class AddUnPlannedTourViewModel = _AddUnPlannedTourViewModelBase
    with _$AddUnPlannedTourViewModel, IEditUnplannedTourViewModel;

abstract class _AddUnPlannedTourViewModelBase with Store, BaseViewModel {
  void setContext(BuildContext context) => this.context = context;
  Future<void> init() async {
    locations = (await getLocations()) ?? [];
    jsonLocations = (await getJsonLocations()) ?? [];

    fields = (await getFields())!;
    jsonFields = (await getJsonFields()) ?? [];

    users = (await getUsers()) ?? [];
    userList = (users ?? [])
        .map((accompany) =>
            MultiSelectItem<UserDDModel>(accompany, accompany.fullName ?? ""))
        .toList();
  }

  GlobalKey<ScaffoldState> scaffoldState = GlobalKey();

  final unplannedTourService = UnPlannedTourService.instance!;

  @observable
  bool isSavePressed = false;

  @observable
  bool isClicked = false;

  @observable
  List<LocationDDModel> locations = <LocationDDModel>[];

  @observable
  List<dynamic> jsonLocations = [];

  @observable
  List<FieldDDModel> fields = <FieldDDModel>[];

  @observable
  List<dynamic> jsonFields = [];

  @observable
  List<UserDDModel>? users = <UserDDModel>[];

  @observable
  List<MultiSelectItem<UserDDModel>> userList =
      <MultiSelectItem<UserDDModel>>[];

  @observable
  int? selectedLocationId = -1;

  @action
  setSelectedLocationId(int? locationId) => selectedLocationId = locationId;

  @action
  changeIsSavePressed() {
    isSavePressed = !isSavePressed;
  }

  @action
  changeIsClicked() {
    isClicked = !isClicked;
  }

  @action
  Future<List<DropdownMenuItem<int?>>?> getFieldsBasedOnLocation(
      int? selectedLocationId) async {
    final retval = fields
        .where((element) => element.locationId == selectedLocationId)
        .map<DropdownMenuItem<int>>((FieldDDModel value) {
      return DropdownMenuItem<int>(
        value: value.id ?? 0,
        child: Text(value.fieldName ?? ""),
      );
    }).toList();
    if (retval.isEmpty) {
      return [
        DropdownMenuItem(value: -1, child: Text("Bu lokasyon altında alan yok"))
      ];
    } else {
      return retval;
    }
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
  Future<List<dynamic>> getJsonFieldsBasedOnSelectedLocation(
      int? selectedLocationId) async {
    final retval = jsonFields
        .where((element) => element['locationId'] == selectedLocationId)
        .map((item) {
      return ({
        "id": item['id'],
        "name": item["name"],
        "locationId": item["locationId"],
      });
    }).toList();
    if (retval.isEmpty) {
      return [];
    } else {
      return retval;
    }
  }

  Future<void> saveTour(GlobalKey<FormState> _formKey, TourModel tour,
      AddUnPlannedTourViewModel viewModel) async {
    final isValid = _formKey.currentState!.validate();
    if (isValid) {
      _formKey.currentState!.save();
      tour.isPlanned = false;
      await viewModel.addUnPlannedTour(tour, context);
    } else {
      final snackBar = SnackBar(
        content: Text("Lütfen gerekli alanları doldurunuz."),
        backgroundColor: Colors.red,
      );
      ScaffoldMessenger.of(context).showSnackBar(snackBar);
    }
  }

  Future<void> addUnPlannedTour(TourModel tour, BuildContext context) async {
    changeIsSavePressed();
    final addedTour =
        await unplannedTourService.createUnplannedTourMobile(tour, context);
    if (addedTour != null) {
      final snackBar = SnackBar(
        content:
            Text("Tur oluşturuldu. Bulgularınızı eklemeye başlayabilirsiniz!"),
        backgroundColor: Colors.green,
      );
      ScaffoldMessenger.of(context).showSnackBar(snackBar);
      Navigator.pop(context);
      await NavigationService.instance.navigateToPage(
          NavigationConstants.UNPLANNED_TOUR_DETAIL_VIEW,
          data: addedTour);
    } else {
      final snackBar = SnackBar(
        content: Text("Hata!."),
        backgroundColor: Colors.red,
      );
      ScaffoldMessenger.of(context).showSnackBar(snackBar);
    }
    changeIsSavePressed();
  }

  Future<List<LocationDDModel>?> getLocations() async {
    return await unplannedTourService.getLocations();
  }

  Future<List<dynamic>?> getJsonLocations() async {
    return await unplannedTourService.getJsonLocations();
  }

  Future<List<FieldDDModel>?> getFields() async {
    return await unplannedTourService.getFields();
  }

  Future<List<dynamic>?> getJsonFields() async {
    return await unplannedTourService.getJsonFields();
  }

  Future<List<UserDDModel>?> getUsers() async {
    return await unplannedTourService.getUsers();
  }
}
