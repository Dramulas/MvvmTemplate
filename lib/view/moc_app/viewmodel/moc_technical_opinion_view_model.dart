import '../model/moc_technical_opinion_acceptance_model.dart';
import '../service/moc_technical_opinion_acceptance_service.dart';
import 'package:flutter/material.dart';
import 'package:mobx/mobx.dart';
import '../../../../core/base/model/base_viewmodel.dart';
import '../../../../core/constants/navigation/navigation_constants.dart';
import '../../../../core/init/navigation/navigation_service.dart';

part 'moc_technical_opinion_view_model.g.dart';

class TechnicalOpinionViewModel = _TechnicalOpinionViewModelBase
    with _$TechnicalOpinionViewModel;

abstract class _TechnicalOpinionViewModelBase with Store, BaseViewModel {
  @override
  void setContext(BuildContext context) => this.context = context;
  @override
  void init() {}

  final service = TechnicalOpinionAcceptanceService.instance!;

  @observable
  bool isApproveClicked = false;

  @observable
  bool showCPI = false;

  @observable
  bool showApprovedText = false;

  @observable
  bool showRejectedText = false;

  @observable
  bool isRejectClicked = false;

  @action
  void changeShowRejectedText() => showRejectedText = !showRejectedText;

  @action
  void changeIsRejectClicked() => isRejectClicked = !isRejectClicked;

  @action
  void changeShowCPI() => showCPI = !showCPI;

  @action
  void changeShowApprovedText() => showApprovedText = !showApprovedText;

  @action
  void changeIsApproveClicked() => isApproveClicked = !isApproveClicked;

  @action
  void refresh() {}

  @action
  navigateToTechnicalOpinionDetailView(TechnicalOAModel data) {
    NavigationService.instance.navigateToPage(
        NavigationConstants.TECH_OPINION_DETAIL_VIEW,
        data: data);
  }

  @action
  onTileClick(
      AsyncSnapshot<List<TechnicalOAModel>?> snapshot, int index) async {
    await NavigationService.instance.navigateToPage(
        NavigationConstants.TECH_OPINION_DETAIL_VIEW,
        data: snapshot.data![index]);
  }
}
