import 'package:flutter/material.dart';
import 'package:mobx/mobx.dart';

import '../../../../../core/base/model/base_viewmodel.dart';
import '../../model/approve_moc_form_model.dart';
import '../../service/moc_form_service.dart';

part 'moc_form_detail_view_model.g.dart';

class MocFormDetailViewModel = _MocFormDetailViewModelBase
    with _$MocFormDetailViewModel;

abstract class _MocFormDetailViewModelBase with Store, BaseViewModel {
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
  approveMocForm(ApproveMocFormModel model) async {
    await MocFormService.instance!.approveMocForm(model);
  }
}
