// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'planned_tour_list_view_model.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$PlannedTourListViewModel on _PlannedTourListViewModelBase, Store {
  final _$toursAtom = Atom(name: '_PlannedTourListViewModelBase.tours');

  @override
  List<TourModel> get tours {
    _$toursAtom.reportRead();
    return super.tours;
  }

  @override
  set tours(List<TourModel> value) {
    _$toursAtom.reportWrite(value, super.tours, () {
      super.tours = value;
    });
  }

  final _$getPlannedToursAsyncAction =
      AsyncAction('_PlannedTourListViewModelBase.getPlannedTours');

  @override
  Future<List<TourModel>?> getPlannedTours() {
    return _$getPlannedToursAsyncAction.run(() => super.getPlannedTours());
  }

  @override
  String toString() {
    return '''
tours: ${tours}
    ''';
  }
}
