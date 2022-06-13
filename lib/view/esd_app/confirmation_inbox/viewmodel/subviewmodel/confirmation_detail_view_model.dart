import 'package:flutter/material.dart';
import 'package:mobx/mobx.dart';

import '../../../../../core/base/model/base_viewmodel.dart';
import '../../model/approve_bypass_model.dart';
import '../../service/confirmation_inbox_service.dart';

part 'confirmation_detail_view_model.g.dart';

class ConfirmationDetailViewModel = _ConfirmationDetailViewModelBase
    with _$ConfirmationDetailViewModel;

abstract class _ConfirmationDetailViewModelBase with Store, BaseViewModel {
  @override
  void setContext(BuildContext context) => this.context = context;
  @override
  void init() {}

  @observable
  bool isApproveClicked = false;

  @observable
  bool isSuccessfull = false;

  @observable
  bool showCPI = false;

  @observable
  bool showApprovedText = false;

  @action
  void changeShowApprovedText() => showApprovedText = !showApprovedText;

  @action
  void changeShowCPI() => showCPI = !showCPI;

  @action
  void changeIsSuccessfull() => isSuccessfull = !isSuccessfull;

  @action
  void changeIsApproveClicked() => isApproveClicked = !isApproveClicked;

  @action
  approveByPassForm(ApproveByPassModel model) async {
    await ConfirmationInboxService.instance!.approveByPassForm(model);
  }
}
