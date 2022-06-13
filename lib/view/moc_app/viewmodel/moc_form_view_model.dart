import 'dart:io';

import 'package:template_mobile/view/moc_app/model/approve_moc_form_model.dart';

import '../model/moc_form_model.dart';
import '../view/moc_form_view.dart';
import 'package:flutter/material.dart';
import 'package:mobx/mobx.dart';

import '../../../../core/base/model/base_viewmodel.dart';
import '../../../../core/constants/navigation/navigation_constants.dart';
import '../../../../core/init/navigation/navigation_service.dart';
import '../service/moc_form_service.dart';
import '../../../../core/extensions/context_extension.dart';

part 'moc_form_view_model.g.dart';

class MocFormViewModel = _MocFormViewModelBase with _$MocFormViewModel;

abstract class _MocFormViewModelBase with Store, BaseViewModel {
  @override
  void setContext(BuildContext context) => this.context = context;
  @override
  void init() {}

  final service = MocFormService.instance!;

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
  navigateToMocFormDetailView(MocFormModel data) {
    NavigationService.instance
        .navigateToPage(NavigationConstants.MOC_FORM_DETAIL_VIEW, data: data);
  }

  @action
  approveMoc(MocFormModel data, BuildContext context) {
    return showDialog(
        context: context,
        builder: (_) => AlertDialog(
              title: Text("Moc Formunu Onayla"),
              content:
                  Text("Bu moc formu onaylamak istediğinizden emin misiniz?"),
              actions: [
                TextButton(
                    child: Text("Hayır"),
                    onPressed: () {
                      print(data.mocFormId);
                      Navigator.pop(context);
                    }),
                TextButton(
                    child: Text("Evet"),
                    onPressed: () async {
                      await approveMocForm(
                          ApproveMocFormModel(mocFormId: data.mocFormId),
                          context);
                      Navigator.pushAndRemoveUntil(
                        context,
                        MaterialPageRoute(builder: (context) => MocFormView()),
                        (route) => route.isFirst,
                      );
                    }),
              ],
            ));
  }

  @action
  rejectMoc(MocFormModel data, BuildContext context) {
    return showDialog(
        context: context,
        builder: (_) => AlertDialog(
              title: Text("Moc Formunu Reddet"),
              content:
                  Text("Bu moc formu reddetmek istediğinizden emin misiniz?"),
              actions: [
                TextButton(
                    child: Text("Hayır"),
                    onPressed: () {
                      print(data.mocFormId);
                      Navigator.pop(context);
                    }),
                TextButton(
                    child: Text("Evet"),
                    onPressed: () async {
                      await rejectMocForm(
                          ApproveMocFormModel(mocFormId: data.mocFormId),
                          context);
                      Navigator.pushAndRemoveUntil(
                        context,
                        MaterialPageRoute(builder: (context) => MocFormView()),
                        (route) => route.isFirst,
                      );
                    }),
              ],
            ));
  }

  @action
  Future<dynamic> approveMocForm(
      ApproveMocFormModel model, BuildContext context) async {
    final response = await service.approveMocForm(model);
    print(response);
    print(response.data);
    print(response.statusCode);
    if (response.statusCode == HttpStatus.ok) {
      final snackBar = SnackBar(
        content: Text('Onaylandı.'),
        backgroundColor: Colors.green,
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
  Future<dynamic> rejectMocForm(
      ApproveMocFormModel model, BuildContext context) async {
    final response = await service.rejectMocForm(model);
    print(response);
    print(response.data);
    print(response.statusCode);
    if (response.statusCode == HttpStatus.ok) {
      final snackBar = SnackBar(
        content: Text('Reddedildi.'),
        backgroundColor: Colors.red,
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
  onTileClick(AsyncSnapshot<List<MocFormModel>?> snapshot, int index) async {
    await NavigationService.instance.navigateToPage(
        NavigationConstants.MOC_FORM_DETAIL_VIEW,
        data: snapshot.data![index]);
  }
}
