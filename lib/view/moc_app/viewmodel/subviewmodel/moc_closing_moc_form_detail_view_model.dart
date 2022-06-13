import 'package:template_mobile/view/moc_app/model/approve_closing_moc_form_model.dart';
import 'package:template_mobile/view/moc_app/model/give_technical_opinion_acceptance_model.dart';
import 'package:template_mobile/view/moc_app/service/moc_closing_moc_form_service.dart';
import 'package:template_mobile/view/moc_app/service/moc_technical_opinion_acceptance_service.dart';
import 'package:flutter/material.dart';
import 'package:mobx/mobx.dart';

import '../../../../../core/base/model/base_viewmodel.dart';
import '../../model/moc_closing_approvals_model.dart';

part 'moc_closing_moc_form_detail_view_model.g.dart';

class ClosingMocFormDetailViewModel = _ClosingMocFormDetailViewModelBase
    with _$ClosingMocFormDetailViewModel;

abstract class _ClosingMocFormDetailViewModelBase with Store, BaseViewModel {
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
  approveClosingMocForm(ApproveClosingMocFormModel model) async {
    await ClosingMocFormService.instance!.approveClosingMocForm(model);
  }
}
