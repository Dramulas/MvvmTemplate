import 'dart:io';

import '../view/confirmation_inbox_view.dart';
import 'package:flutter/material.dart';
import 'package:mobx/mobx.dart';

import '../../../../core/base/model/base_viewmodel.dart';
import '../../../../core/constants/navigation/navigation_constants.dart';
import '../../../../core/init/navigation/navigation_service.dart';
import '../model/approve_bypass_model.dart';
import '../model/bypass_form_model.dart';
import '../service/confirmation_inbox_service.dart';
import '../../../../core/extensions/context_extension.dart';

part 'confirmation_inbox_view_model.g.dart';

class ConfirmationInboxViewModel = _ConfirmationInboxViewModelBase
    with _$ConfirmationInboxViewModel;

abstract class _ConfirmationInboxViewModelBase with Store, BaseViewModel {
  @override
  void setContext(BuildContext context) => this.context = context;
  @override
  void init() {}

  final service = ConfirmationInboxService.instance!;

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
  navigateToConfirmationDetailView(ByPassFormModel data) {
    NavigationService.instance.navigateToPage(
        NavigationConstants.CONFIRMATION_DETAIL_VIEW,
        data: data);
  }

  @action
  approveByPass(ByPassFormModel data, BuildContext context) {
    return showDialog(
        context: context,
        builder: (_) => AlertDialog(
              title: Text("Bypass Onayla"),
              content: Text(
                  "Bu bypass formu onaylamak istediğinizden emin misiniz?"),
              actions: [
                TextButton(
                    child: Text("Evet"),
                    onPressed: () async {
                      await approveByPassForm(
                          ApproveByPassModel(
                              byPassFormId: data.id,
                              byPassFormTimeLineItemId:
                                  data.byPassFormTimelineItemId),
                          context);
                      Navigator.pushAndRemoveUntil(
                        context,
                        MaterialPageRoute(
                            builder: (context) => ConfirmationInboxView()),
                        (route) => route.isFirst,
                      );
                    }),
                TextButton(
                    child: Text("Hayır"),
                    onPressed: () {
                      print(data.byPassFormTimelineItemId);
                      print(data.id);
                      Navigator.pop(context);
                    }),
              ],
            ));
  }

  @action
  Future<dynamic> approveByPassForm(
      ApproveByPassModel model, BuildContext context) async {
    final response = await service.approveByPassForm(model);
    print(response);
    print(response.data);
    print(response.statusCode);
    if (response.statusCode == HttpStatus.ok) {
      final snackBar = SnackBar(
        content: Text('Onaylandı.'),
        backgroundColor: Colors.blue,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.all(
            Radius.circular(
              context.normalFreeSpace,
            ),
          ),
        ),
        margin: EdgeInsets.all(context.normalFreeSpace),
        behavior: SnackBarBehavior.floating,
      );

      ScaffoldMessenger.of(context).showSnackBar(snackBar);
    }
    return response;
  }

  @action
  onTileClick(AsyncSnapshot<List<ByPassFormModel>?> snapshot, int index) async {
    await NavigationService.instance.navigateToPage(
        NavigationConstants.CONFIRMATION_DETAIL_VIEW,
        data: snapshot.data![index]);
  }
}
