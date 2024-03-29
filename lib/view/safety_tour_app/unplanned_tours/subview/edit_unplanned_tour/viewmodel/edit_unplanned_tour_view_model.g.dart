// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'edit_unplanned_tour_view_model.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$EditUnPlannedTourViewModel on _EditUnPlannedTourViewModelBase, Store {
  final _$isClickedAtom =
      Atom(name: '_EditUnPlannedTourViewModelBase.isClicked');

  @override
  bool get isClicked {
    _$isClickedAtom.reportRead();
    return super.isClicked;
  }

  @override
  set isClicked(bool value) {
    _$isClickedAtom.reportWrite(value, super.isClicked, () {
      super.isClicked = value;
    });
  }

  final _$jsonFieldsAtom =
      Atom(name: '_EditUnPlannedTourViewModelBase.jsonFields');

  @override
  List<dynamic> get jsonFields {
    _$jsonFieldsAtom.reportRead();
    return super.jsonFields;
  }

  @override
  set jsonFields(List<dynamic> value) {
    _$jsonFieldsAtom.reportWrite(value, super.jsonFields, () {
      super.jsonFields = value;
    });
  }

  final _$selectedLocationIdAtom =
      Atom(name: '_EditUnPlannedTourViewModelBase.selectedLocationId');

  @override
  int? get selectedLocationId {
    _$selectedLocationIdAtom.reportRead();
    return super.selectedLocationId;
  }

  @override
  set selectedLocationId(int? value) {
    _$selectedLocationIdAtom.reportWrite(value, super.selectedLocationId, () {
      super.selectedLocationId = value;
    });
  }

  final _$jsonLocationsAtom =
      Atom(name: '_EditUnPlannedTourViewModelBase.jsonLocations');

  @override
  List<dynamic> get jsonLocations {
    _$jsonLocationsAtom.reportRead();
    return super.jsonLocations;
  }

  @override
  set jsonLocations(List<dynamic> value) {
    _$jsonLocationsAtom.reportWrite(value, super.jsonLocations, () {
      super.jsonLocations = value;
    });
  }

  final _$locationsAtom =
      Atom(name: '_EditUnPlannedTourViewModelBase.locations');

  @override
  List<LocationDDModel> get locations {
    _$locationsAtom.reportRead();
    return super.locations;
  }

  @override
  set locations(List<LocationDDModel> value) {
    _$locationsAtom.reportWrite(value, super.locations, () {
      super.locations = value;
    });
  }

  final _$fieldsAtom = Atom(name: '_EditUnPlannedTourViewModelBase.fields');

  @override
  List<FieldDDModel> get fields {
    _$fieldsAtom.reportRead();
    return super.fields;
  }

  @override
  set fields(List<FieldDDModel> value) {
    _$fieldsAtom.reportWrite(value, super.fields, () {
      super.fields = value;
    });
  }

  final _$usersAtom = Atom(name: '_EditUnPlannedTourViewModelBase.users');

  @override
  List<UserDDModel>? get users {
    _$usersAtom.reportRead();
    return super.users;
  }

  @override
  set users(List<UserDDModel>? value) {
    _$usersAtom.reportWrite(value, super.users, () {
      super.users = value;
    });
  }

  final _$userListAtom = Atom(name: '_EditUnPlannedTourViewModelBase.userList');

  @override
  List<MultiSelectItem<UserDDModel>> get userList {
    _$userListAtom.reportRead();
    return super.userList;
  }

  @override
  set userList(List<MultiSelectItem<UserDDModel>> value) {
    _$userListAtom.reportWrite(value, super.userList, () {
      super.userList = value;
    });
  }

  final _$getFieldsBasedOnSelectedLocationAsyncAction = AsyncAction(
      '_EditUnPlannedTourViewModelBase.getFieldsBasedOnSelectedLocation');

  @override
  Future<List<FieldDDModel?>?> getFieldsBasedOnSelectedLocation(
      int? selectedLocationId) {
    return _$getFieldsBasedOnSelectedLocationAsyncAction
        .run(() => super.getFieldsBasedOnSelectedLocation(selectedLocationId));
  }

  final _$updateUnplannedTourAsyncAction =
      AsyncAction('_EditUnPlannedTourViewModelBase.updateUnplannedTour');

  @override
  Future<void> updateUnplannedTour(TourModel tour) {
    return _$updateUnplannedTourAsyncAction
        .run(() => super.updateUnplannedTour(tour));
  }

  final _$getLocationsAsyncAction =
      AsyncAction('_EditUnPlannedTourViewModelBase.getLocations');

  @override
  Future<List<LocationDDModel>?> getLocations() {
    return _$getLocationsAsyncAction.run(() => super.getLocations());
  }

  final _$getFieldsAsyncAction =
      AsyncAction('_EditUnPlannedTourViewModelBase.getFields');

  @override
  Future<List<FieldDDModel>?> getFields() {
    return _$getFieldsAsyncAction.run(() => super.getFields());
  }

  final _$getUsersAsyncAction =
      AsyncAction('_EditUnPlannedTourViewModelBase.getUsers');

  @override
  Future<List<UserDDModel>?> getUsers() {
    return _$getUsersAsyncAction.run(() => super.getUsers());
  }

  final _$updateTourAsyncAction =
      AsyncAction('_EditUnPlannedTourViewModelBase.updateTour');

  @override
  Future updateTour(TourModel tour, BuildContext context) {
    return _$updateTourAsyncAction.run(() => super.updateTour(tour, context));
  }

  final _$_EditUnPlannedTourViewModelBaseActionController =
      ActionController(name: '_EditUnPlannedTourViewModelBase');

  @override
  void changeIsClicked() {
    final _$actionInfo = _$_EditUnPlannedTourViewModelBaseActionController
        .startAction(name: '_EditUnPlannedTourViewModelBase.changeIsClicked');
    try {
      return super.changeIsClicked();
    } finally {
      _$_EditUnPlannedTourViewModelBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  dynamic setSelectedLocationId(int? locationId) {
    final _$actionInfo =
        _$_EditUnPlannedTourViewModelBaseActionController.startAction(
            name: '_EditUnPlannedTourViewModelBase.setSelectedLocationId');
    try {
      return super.setSelectedLocationId(locationId);
    } finally {
      _$_EditUnPlannedTourViewModelBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
isClicked: ${isClicked},
jsonFields: ${jsonFields},
selectedLocationId: ${selectedLocationId},
jsonLocations: ${jsonLocations},
locations: ${locations},
fields: ${fields},
users: ${users},
userList: ${userList}
    ''';
  }
}
