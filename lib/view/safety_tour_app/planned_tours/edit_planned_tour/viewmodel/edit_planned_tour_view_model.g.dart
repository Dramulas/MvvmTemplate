// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'edit_planned_tour_view_model.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$EditPlannedTourViewModel on _EditPlannedTourViewModelBase, Store {
  final _$locationsAtom = Atom(name: '_EditPlannedTourViewModelBase.locations');

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

  final _$isClickedAtom = Atom(name: '_EditPlannedTourViewModelBase.isClicked');

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

  final _$fieldsAtom = Atom(name: '_EditPlannedTourViewModelBase.fields');

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

  final _$usersAtom = Atom(name: '_EditPlannedTourViewModelBase.users');

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

  final _$userListAtom = Atom(name: '_EditPlannedTourViewModelBase.userList');

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
      Atom(name: '_EditPlannedTourViewModelBase.selectedLocationId');

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

  final _$updatePlannedTourAsyncAction =
      AsyncAction('_EditPlannedTourViewModelBase.updatePlannedTour');

  @override
  Future<void> updatePlannedTour(TourModel tour) {
    return _$updatePlannedTourAsyncAction
        .run(() => super.updatePlannedTour(tour));
  }

  final _$getLocationsAsyncAction =
      AsyncAction('_EditPlannedTourViewModelBase.getLocations');

  @override
  Future<List<LocationDDModel>?> getLocations() {
    return _$getLocationsAsyncAction.run(() => super.getLocations());
  }

  final _$getFieldsBasedOnSelectedLocationAsyncAction = AsyncAction(
      '_EditPlannedTourViewModelBase.getFieldsBasedOnSelectedLocation');

  @override
  Future<List<FieldDDModel?>?> getFieldsBasedOnSelectedLocation(
      int? selectedLocationId) {
    return _$getFieldsBasedOnSelectedLocationAsyncAction
        .run(() => super.getFieldsBasedOnSelectedLocation(selectedLocationId));
  }

  final _$getFieldsAsyncAction =
      AsyncAction('_EditPlannedTourViewModelBase.getFields');

  @override
  Future<List<FieldDDModel>?> getFields() {
    return _$getFieldsAsyncAction.run(() => super.getFields());
  }

  final _$getUsersAsyncAction =
      AsyncAction('_EditPlannedTourViewModelBase.getUsers');

  @override
  Future<List<UserDDModel>?> getUsers() {
    return _$getUsersAsyncAction.run(() => super.getUsers());
  }

  final _$updateTourAsyncAction =
      AsyncAction('_EditPlannedTourViewModelBase.updateTour');

  @override
  Future updateTour(TourModel tour, BuildContext context) {
    return _$updateTourAsyncAction.run(() => super.updateTour(tour, context));
  }

  final _$_EditPlannedTourViewModelBaseActionController =
      ActionController(name: '_EditPlannedTourViewModelBase');

  @override
  void changeIsClicked() {
    final _$actionInfo = _$_EditPlannedTourViewModelBaseActionController
        .startAction(name: '_EditPlannedTourViewModelBase.changeIsClicked');
    try {
      return super.changeIsClicked();
    } finally {
      _$_EditPlannedTourViewModelBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  dynamic setSelectedLocationId(int? locationId) {
    final _$actionInfo =
        _$_EditPlannedTourViewModelBaseActionController.startAction(
            name: '_EditPlannedTourViewModelBase.setSelectedLocationId');
    try {
      return super.setSelectedLocationId(locationId);
    } finally {
      _$_EditPlannedTourViewModelBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
locations: ${locations},
isClicked: ${isClicked},
fields: ${fields},
users: ${users},
userList: ${userList},
selectedLocationId: ${selectedLocationId}
    ''';
  }
}
