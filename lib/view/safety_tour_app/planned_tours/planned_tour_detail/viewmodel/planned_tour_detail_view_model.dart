import 'dart:async';

import '../../../../../core/base/model/base_viewmodel.dart';
import '../../../../../core/constants/navigation/navigation_constants.dart';
import '../../../../../core/init/navigation/navigation_service.dart';
import '../../../model/finding_model.dart';
import '../../../model/tour_model.dart';
import '../../service/planned_tour_service.dart';
import 'package:flutter/material.dart';
import 'package:mobx/mobx.dart';

part 'planned_tour_detail_view_model.g.dart';

class PlannedTourDetailViewModel = _PlannedTourDetailViewModelBase
    with _$PlannedTourDetailViewModel;

abstract class _PlannedTourDetailViewModelBase with Store, BaseViewModel {
  void setContext(BuildContext context) => this.context = context;
  void init() async {}

  Future<void> navigateToAddPlannedTourFinding(TourModel tour) async {
    await NavigationService.instance.navigateToPage(
      NavigationConstants.ADD_PLANNED_TOUR_FINDING,
      data: tour,
    );
  }

  @observable
  bool isVisible = false;

  @action
  void changeVisibilityTrue() {
    isVisible = true;
  }

  @action
  void changeVisibilityFalse() {
    isVisible = false;
  }

  Future<dynamic> showDialogDeleteTour(BuildContext context, int id) {
    return showDialog(
        context: context,
        builder: (_) => AlertDialog(
              title: Text("Plansız Tur Sil"),
              content: Text("Plansız Turu silmek istediğinize emin misiniz?"),
              actions: [
                TextButton(
                    child: Text("Evet"),
                    onPressed: () async {
                      final result =
                          await PlannedTourService.instance!.deleteTour(id);
                      if (result) {
                        final snackBar = SnackBar(
                            content: Text(
                                "$id numaralı plansız tur başarıyla silindi"));
                        ScaffoldMessenger.of(context).showSnackBar(snackBar);

                        await NavigationService.instance.navigateToPageClear(
                            NavigationConstants.TOURS_HOME_VIEW);
                      }
                    }),
                TextButton(
                    child: Text("Hayır"),
                    onPressed: () {
                      Navigator.pop(context);
                    }),
              ],
            ));
  }

  @action
  showWarningSnackbar(BuildContext context) {
    final snackBar = SnackBar(
      backgroundColor: Colors.blueGrey,
      elevation: 10,
      duration: const Duration(seconds: 2),
      content: Text(
        "Tur oluşumunu sonlandırmak için en az 1 adet bulgu girmelisiniz.",
        style: const TextStyle(color: Colors.white),
      ),
    );
    ScaffoldMessenger.of(context).showSnackBar(snackBar);
  }

  Future<dynamic> showDialogFinalizeTourCreation(
      BuildContext context, int tourId) {
    return showDialog(
      context: context,
      builder: (_) => AlertDialog(
          title: Text("Plansız Tur Kaydet"),
          content: Text("Plansız Turu kaydetmek istediğinize emin misiniz?"),
          actions: [
            TextButton(
                child: Text("Evet"),
                onPressed: () async {
                  final result =
                      await PlannedTourService.instance!.approveTour(tourId);
                  if (result) {
                    Navigator.pop(context);
                    final snackBar = SnackBar(
                        content: Text(
                            "$tourId numaralı plansız tur başarıyla kaydedildi"));
                    ScaffoldMessenger.of(context).showSnackBar(snackBar);
                    await NavigationService.instance.navigateToPageClear(
                      NavigationConstants.TOURS_HOME_VIEW,
                    );
                  }
                }),
            TextButton(
                child: Text("Hayır"),
                onPressed: () {
                  Navigator.pop(context);
                }),
          ]),
    );
  }

  Future<dynamic> navigateToEditPlannedTour(TourModel tour) {
    return NavigationService.instance
        .navigateToPage(NavigationConstants.EDIT_PLANNED_TOUR_VIEW, data: tour);
  }

  Future<dynamic> navigateToFindingDetail(FindingModel finding) {
    return NavigationService.instance.navigateToPage(
        NavigationConstants.PLANNED_TOUR_FINDING_DETAIL_VIEW,
        data: finding);
  }
}
