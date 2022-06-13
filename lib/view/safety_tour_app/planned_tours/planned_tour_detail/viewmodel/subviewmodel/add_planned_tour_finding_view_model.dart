import 'dart:io';

import '../../../../model/abstract/ITourViewModel.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:image_picker/image_picker.dart';
import 'package:mobx/mobx.dart';
import 'package:multi_select_flutter/util/multi_select_item.dart';

import '../../../../../../../../core/base/model/base_viewmodel.dart';
import '../../../../model/category_dd_model.dart';
import '../../../../model/finding_model.dart';
import '../../../../unplanned_tours/subview/unplanned_tour_detail/model/finding_entry_model.dart';
import '../../../service/planned_tour_service.dart';
import '../../service/planned_tour_detail_service.dart';

part 'add_planned_tour_finding_view_model.g.dart';

class AddPlannedTourFindingViewModel = _AddPlannedTourFindingViewModelBase
    with _$AddPlannedTourFindingViewModel, ICategoryModel, IFabButton;

abstract class _AddPlannedTourFindingViewModelBase with Store, BaseViewModel {
  void setContext(BuildContext context) => this.context = context;
  Future<void> init() async {
    categories = (await getCategories())!;
    categoryList = categories!
        .map((category) =>
            MultiSelectItem<CategoryDDModel>(category, category.name!))
        .toList();
        jsonCategories = (await getJsonCategories())!;
  }

  @observable
  bool isLoading = false;

  @observable
  bool isUploaded = true;

  @observable
  List<dynamic> jsonCategories = [];

  @observable
  List<CategoryDDModel>? categories = <CategoryDDModel>[];

  @observable
  List<MultiSelectItem<CategoryDDModel>> categoryList =
      <MultiSelectItem<CategoryDDModel>>[];

  GlobalKey<ScaffoldState> scaffoldState = GlobalKey();

  @action
  void changeIsLoading() {
    isLoading = !isLoading;
  }

  @action
  Future<FindingModel?> createFindingFourTour(
      FindingEntryModel model, int tourId) async {
    final resultFinding = await PlannedTourDetailService.instance!
        .createFindingForTour(model, tourId);
    if (resultFinding != null) return resultFinding;
    return null;
  }

  @action
  Future<File?> pickImage(ImageSource imageSource) async {
    try {
      final image = await ImagePicker().pickImage(source: ImageSource.camera);
      if (image == null) return null;

      final imageTemporary = File(image.path);
      return imageTemporary;
    } on PlatformException catch (e) {
      print("Resim secme islemi basarisiz oldu $e");
    }
  }

  @action
  void changeIsUploaded() {
    isUploaded = !isUploaded;
  }

  @action
  Future<List<CategoryDDModel>?> getCategories() async {
    return await PlannedTourService.instance!.getCategories();
  }

  @action
  Future<List<dynamic>?> getJsonCategories() async {
    return await PlannedTourService.instance!.getJsonCategories();
  }
}
