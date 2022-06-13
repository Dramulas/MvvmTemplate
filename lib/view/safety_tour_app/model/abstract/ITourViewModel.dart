import 'package:multi_select_flutter/multi_select_flutter.dart';

import '../../unplanned_tours/subview/unplanned_tour_detail/model/finding_entry_model.dart';
import '../category_dd_model.dart';
import '../field_dd_model.dart';
import '../finding_model.dart';
import '../location_dd_model.dart';
import '../user_dd_model.dart';

abstract class IEditUnplannedTourViewModel {
  List<FieldDDModel> get fields;
  List<UserDDModel>? get users;
  List<LocationDDModel> get locations;
  setSelectedLocationId(int? locationId);
}

abstract class AddUnPlannedTourFindingView {
  List<MultiSelectItem<CategoryDDModel>> get categoryList;
  Future<FindingModel?> createFindingFourTour(
      FindingEntryModel model, int tourId);
}

abstract class IUserModel {
  List<UserDDModel>? get users;
}

abstract class IFieldModel {
  List<FieldDDModel>? get fields;
}

abstract class ILocationModel {
  List<LocationDDModel>? get locations;
}

abstract class ICategoryModel {
  List<MultiSelectItem<CategoryDDModel>> categoryList = [];
  List<CategoryDDModel>? get categories;
  List<dynamic> get jsonCategories;
}

abstract class IFabButton {
  Future<FindingModel?> createFindingFourTour(
      FindingEntryModel model, int tourId);
}
