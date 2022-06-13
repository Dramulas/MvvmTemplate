import 'dart:async';

import '../../../model/abstract/ITourModel.dart';
import 'package:flutter/material.dart';
import 'package:mobx/mobx.dart';

import '../../../../../core/base/model/base_viewmodel.dart';
import '../../../../../core/constants/navigation/navigation_constants.dart';
import '../../../../../core/init/navigation/navigation_service.dart';
import '../../../model/tour_model.dart';
import '../../service/planned_tour_service.dart';

part 'planned_tour_list_view_model.g.dart';

class PlannedTourListViewModel = _PlannedTourListViewModelBase
    with _$PlannedTourListViewModel;

abstract class _PlannedTourListViewModelBase with Store, BaseViewModel {
  void setContext(BuildContext context) => this.context = context;
  void init() {}

  @observable
  List<TourModel> tours = <TourModel>[];

  @action
  Future<List<TourModel>?> getPlannedTours() async {
    List<TourModel>? data =
        await PlannedTourService.instance!.getPlannedTours();
    return data;
  }

  Future<void> navigateToAddPlannedTourView() async {
    // await UnPlannedTourService.instance!.getUnplannedTours();

    await NavigationService.instance
        .navigateToPage(NavigationConstants.ADD_UNPLANNED_TOUR_VIEW);
  }

  Future<dynamic> navigateToPlannedTourDetailView(ITourModel tour) {
    return NavigationService.instance.navigateToPage(
        NavigationConstants.PLANNED_TOUR_DETAIL_VIEW,
        data: tour);
  }
}
