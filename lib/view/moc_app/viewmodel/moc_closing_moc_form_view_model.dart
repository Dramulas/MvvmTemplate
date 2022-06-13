import 'package:template_mobile/view/moc_app/model/moc_closing_approvals_model.dart';
import '../service/moc_closing_moc_form_service.dart';
import 'package:flutter/material.dart';
import 'package:mobx/mobx.dart';
import '../../../../core/base/model/base_viewmodel.dart';
import '../../../../core/constants/navigation/navigation_constants.dart';
import '../../../../core/init/navigation/navigation_service.dart';

part 'moc_closing_moc_form_view_model.g.dart';

class ClosingMocFormViewModel = _ClosingMocFormViewModelBase
    with _$ClosingMocFormViewModel;

abstract class _ClosingMocFormViewModelBase with Store, BaseViewModel {
  @override
  void setContext(BuildContext context) => this.context = context;
  @override
  void init() {}

  final service = ClosingMocFormService.instance!;

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
  navigateToClosingMocFormDetailView(ClosingMocFormModel data) {
    NavigationService.instance.navigateToPage(
        NavigationConstants.CLOSING_MOC_FORM_DETAIL_VIEW,
        data: data);
  }

  @action
  onTileClick(
      AsyncSnapshot<List<ClosingMocFormModel>?> snapshot, int index) async {
    await NavigationService.instance.navigateToPage(
        NavigationConstants.CLOSING_MOC_FORM_DETAIL_VIEW,
        data: snapshot.data![index]);
  }
}
