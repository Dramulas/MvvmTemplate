import 'package:template_mobile/view/moc_app/model/give_technical_opinion_acceptance_model.dart';
import 'package:template_mobile/view/moc_app/service/moc_technical_opinion_acceptance_service.dart';
import 'package:flutter/material.dart';
import 'package:mobx/mobx.dart';

import '../../../../../core/base/model/base_viewmodel.dart';

part 'moc_technical_opinion_detail_view_model.g.dart';

class TechnicalOpinionDetailViewModel = _TechnicalOpinionDetailViewModelBase
    with _$TechnicalOpinionDetailViewModel;

abstract class _TechnicalOpinionDetailViewModelBase with Store, BaseViewModel {
  @override
  void setContext(BuildContext context) => this.context = context;
  @override
  void init() {}

  @observable
  bool isApproveClicked = false;

  @observable
  bool isRejectedClicked = false;

  @observable
  bool isSuccessfull = false;

  @observable
  bool showCPI = false;

  @observable
  bool showApprovedText = false;

  @action
  void changeShowApprovedText() => showApprovedText = !showApprovedText;

  @action
  void changeShowRejectedText() => showApprovedText = !showApprovedText;

  @action
  void changeShowCPI() => showCPI = !showCPI;

  @action
  void changeIsSuccessfull() => isSuccessfull = !isSuccessfull;

  @action
  void changeIsApproveClicked() => isApproveClicked = !isApproveClicked;

  @action
  void changeIsRejectClicked() => isRejectedClicked = !isRejectedClicked;

  @action
  giveTechnicalOpinion(GiveTechnicalOAModel model) async {
    await TechnicalOpinionAcceptanceService.instance!.giveTechnicalOA(model);
  }
}
