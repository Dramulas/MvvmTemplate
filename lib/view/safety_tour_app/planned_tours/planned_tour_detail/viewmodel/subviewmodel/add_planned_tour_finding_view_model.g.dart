// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'add_planned_tour_finding_view_model.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$AddPlannedTourFindingViewModel
    on _AddPlannedTourFindingViewModelBase, Store {
  final _$isLoadingAtom =
      Atom(name: '_AddPlannedTourFindingViewModelBase.isLoading');

  @override
  bool get isLoading {
    _$isLoadingAtom.reportRead();
    return super.isLoading;
  }

  @override
  set isLoading(bool value) {
    _$isLoadingAtom.reportWrite(value, super.isLoading, () {
      super.isLoading = value;
    });
  }

  final _$isUploadedAtom =
      Atom(name: '_AddPlannedTourFindingViewModelBase.isUploaded');

  @override
  bool get isUploaded {
    _$isUploadedAtom.reportRead();
    return super.isUploaded;
  }

  @override
  set isUploaded(bool value) {
    _$isUploadedAtom.reportWrite(value, super.isUploaded, () {
      super.isUploaded = value;
    });
  }

  final _$jsonCategoriesAtom =
      Atom(name: '_AddPlannedTourFindingViewModelBase.jsonCategories');

  @override
  List<dynamic> get jsonCategories {
    _$jsonCategoriesAtom.reportRead();
    return super.jsonCategories;
  }

  @override
  set jsonCategories(List<dynamic> value) {
    _$jsonCategoriesAtom.reportWrite(value, super.jsonCategories, () {
      super.jsonCategories = value;
    });
  }

  final _$categoriesAtom =
      Atom(name: '_AddPlannedTourFindingViewModelBase.categories');

  @override
  List<CategoryDDModel>? get categories {
    _$categoriesAtom.reportRead();
    return super.categories;
  }

  @override
  set categories(List<CategoryDDModel>? value) {
    _$categoriesAtom.reportWrite(value, super.categories, () {
      super.categories = value;
    });
  }

  final _$categoryListAtom =
      Atom(name: '_AddPlannedTourFindingViewModelBase.categoryList');

  @override
  List<MultiSelectItem<CategoryDDModel>> get categoryList {
    _$categoryListAtom.reportRead();
    return super.categoryList;
  }

  @override
  set categoryList(List<MultiSelectItem<CategoryDDModel>> value) {
    _$categoryListAtom.reportWrite(value, super.categoryList, () {
      super.categoryList = value;
    });
  }

  final _$createFindingFourTourAsyncAction =
      AsyncAction('_AddPlannedTourFindingViewModelBase.createFindingFourTour');

  @override
  Future<FindingModel?> createFindingFourTour(
      FindingEntryModel model, int tourId) {
    return _$createFindingFourTourAsyncAction
        .run(() => super.createFindingFourTour(model, tourId));
  }

  final _$pickImageAsyncAction =
      AsyncAction('_AddPlannedTourFindingViewModelBase.pickImage');

  @override
  Future<File?> pickImage(ImageSource imageSource) {
    return _$pickImageAsyncAction.run(() => super.pickImage(imageSource));
  }

  final _$getCategoriesAsyncAction =
      AsyncAction('_AddPlannedTourFindingViewModelBase.getCategories');

  @override
  Future<List<CategoryDDModel>?> getCategories() {
    return _$getCategoriesAsyncAction.run(() => super.getCategories());
  }

  final _$getJsonCategoriesAsyncAction =
      AsyncAction('_AddPlannedTourFindingViewModelBase.getJsonCategories');

  @override
  Future<List<dynamic>?> getJsonCategories() {
    return _$getJsonCategoriesAsyncAction.run(() => super.getJsonCategories());
  }

  final _$_AddPlannedTourFindingViewModelBaseActionController =
      ActionController(name: '_AddPlannedTourFindingViewModelBase');

  @override
  void changeIsLoading() {
    final _$actionInfo =
        _$_AddPlannedTourFindingViewModelBaseActionController.startAction(
            name: '_AddPlannedTourFindingViewModelBase.changeIsLoading');
    try {
      return super.changeIsLoading();
    } finally {
      _$_AddPlannedTourFindingViewModelBaseActionController
          .endAction(_$actionInfo);
    }
  }

  @override
  void changeIsUploaded() {
    final _$actionInfo =
        _$_AddPlannedTourFindingViewModelBaseActionController.startAction(
            name: '_AddPlannedTourFindingViewModelBase.changeIsUploaded');
    try {
      return super.changeIsUploaded();
    } finally {
      _$_AddPlannedTourFindingViewModelBaseActionController
          .endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
isLoading: ${isLoading},
isUploaded: ${isUploaded},
jsonCategories: ${jsonCategories},
categories: ${categories},
categoryList: ${categoryList}
    ''';
  }
}
