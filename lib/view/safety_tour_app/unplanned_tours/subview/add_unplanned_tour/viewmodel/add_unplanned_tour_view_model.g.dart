// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'add_unplanned_tour_view_model.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$AddUnPlannedTourViewModel on _AddUnPlannedTourViewModelBase, Store {
  final _$isSavePressedAtom =
      Atom(name: '_AddUnPlannedTourViewModelBase.isSavePressed');

  @override
  bool get isSavePressed {
    _$isSavePressedAtom.reportRead();
    return super.isSavePressed;
  }

  @override
  set isSavePressed(bool value) {
    _$isSavePressedAtom.reportWrite(value, super.isSavePressed, () {
      super.isSavePressed = value;
    });
  }

  final _$isClickedAtom =
      Atom(name: '_AddUnPlannedTourViewModelBase.isClicked');

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

  final _$locationsAtom =
      Atom(name: '_AddUnPlannedTourViewModelBase.locations');

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

  final _$jsonLocationsAtom =
      Atom(name: '_AddUnPlannedTourViewModelBase.jsonLocations');

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

  final _$fieldsAtom = Atom(name: '_AddUnPlannedTourViewModelBase.fields');

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

  final _$jsonFieldsAtom =
      Atom(name: '_AddUnPlannedTourViewModelBase.jsonFields');

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

  final _$usersAtom = Atom(name: '_AddUnPlannedTourViewModelBase.users');

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

  final _$userListAtom = Atom(name: '_AddUnPlannedTourViewModelBase.userList');

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

  final _$selectedLocationIdAtom =
      Atom(name: '_AddUnPlannedTourViewModelBase.selectedLocationId');

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

  final _$getFieldsBasedOnLocationAsyncAction =
      AsyncAction('_AddUnPlannedTourViewModelBase.getFieldsBasedOnLocation');

  @override
  Future<List<DropdownMenuItem<int?>>?> getFieldsBasedOnLocation(
      int? selectedLocationId) {
    return _$getFieldsBasedOnLocationAsyncAction
        .run(() => super.getFieldsBasedOnLocation(selectedLocationId));
  }

  final _$getFieldsBasedOnSelectedLocationAsyncAction = AsyncAction(
      '_AddUnPlannedTourViewModelBase.getFieldsBasedOnSelectedLocation');

  @override
  Future<List<FieldDDModel?>?> getFieldsBasedOnSelectedLocation(
      int? selectedLocationId) {
    return _$getFieldsBasedOnSelectedLocationAsyncAction
        .run(() => super.getFieldsBasedOnSelectedLocation(selectedLocationId));
  }

  final _$getJsonFieldsBasedOnSelectedLocationAsyncAction = AsyncAction(
      '_AddUnPlannedTourViewModelBase.getJsonFieldsBasedOnSelectedLocation');

  @override
  Future<List<dynamic>> getJsonFieldsBasedOnSelectedLocation(
      int? selectedLocationId) {
    return _$getJsonFieldsBasedOnSelectedLocationAsyncAction.run(
        () => super.getJsonFieldsBasedOnSelectedLocation(selectedLocationId));
  }

  final _$_AddUnPlannedTourViewModelBaseActionController =
      ActionController(name: '_AddUnPlannedTourViewModelBase');

  @override
  dynamic setSelectedLocationId(int? locationId) {
    final _$actionInfo =
        _$_AddUnPlannedTourViewModelBaseActionController.startAction(
            name: '_AddUnPlannedTourViewModelBase.setSelectedLocationId');
    try {
      return super.setSelectedLocationId(locationId);
    } finally {
      _$_AddUnPlannedTourViewModelBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  dynamic changeIsSavePressed() {
    final _$actionInfo =
        _$_AddUnPlannedTourViewModelBaseActionController.startAction(
            name: '_AddUnPlannedTourViewModelBase.changeIsSavePressed');
    try {
      return super.changeIsSavePressed();
    } finally {
      _$_AddUnPlannedTourViewModelBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  dynamic changeIsClicked() {
    final _$actionInfo = _$_AddUnPlannedTourViewModelBaseActionController
        .startAction(name: '_AddUnPlannedTourViewModelBase.changeIsClicked');
    try {
      return super.changeIsClicked();
    } finally {
      _$_AddUnPlannedTourViewModelBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
isSavePressed: ${isSavePressed},
isClicked: ${isClicked},
locations: ${locations},
jsonLocations: ${jsonLocations},
fields: ${fields},
jsonFields: ${jsonFields},
users: ${users},
userList: ${userList},
selectedLocationId: ${selectedLocationId}
    ''';
  }
}
