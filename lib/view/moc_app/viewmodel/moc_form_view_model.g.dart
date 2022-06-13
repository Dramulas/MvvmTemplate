// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'moc_form_view_model.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$MocFormViewModel on _MocFormViewModelBase, Store {
  final _$isApproveClickedAtom =
      Atom(name: '_MocFormViewModelBase.isApproveClicked');

  @override
  bool get isApproveClicked {
    _$isApproveClickedAtom.reportRead();
    return super.isApproveClicked;
  }

  @override
  set isApproveClicked(bool value) {
    _$isApproveClickedAtom.reportWrite(value, super.isApproveClicked, () {
      super.isApproveClicked = value;
    });
  }

  final _$showCPIAtom = Atom(name: '_MocFormViewModelBase.showCPI');

  @override
  bool get showCPI {
    _$showCPIAtom.reportRead();
    return super.showCPI;
  }

  @override
  set showCPI(bool value) {
    _$showCPIAtom.reportWrite(value, super.showCPI, () {
      super.showCPI = value;
    });
  }

  final _$showApprovedTextAtom =
      Atom(name: '_MocFormViewModelBase.showApprovedText');

  @override
  bool get showApprovedText {
    _$showApprovedTextAtom.reportRead();
    return super.showApprovedText;
  }

  @override
  set showApprovedText(bool value) {
    _$showApprovedTextAtom.reportWrite(value, super.showApprovedText, () {
      super.showApprovedText = value;
    });
  }

  final _$showRejectedTextAtom =
      Atom(name: '_MocFormViewModelBase.showRejectedText');

  @override
  bool get showRejectedText {
    _$showRejectedTextAtom.reportRead();
    return super.showRejectedText;
  }

  @override
  set showRejectedText(bool value) {
    _$showRejectedTextAtom.reportWrite(value, super.showRejectedText, () {
      super.showRejectedText = value;
    });
  }

  final _$isRejectClickedAtom =
      Atom(name: '_MocFormViewModelBase.isRejectClicked');

  @override
  bool get isRejectClicked {
    _$isRejectClickedAtom.reportRead();
    return super.isRejectClicked;
  }

  @override
  set isRejectClicked(bool value) {
    _$isRejectClickedAtom.reportWrite(value, super.isRejectClicked, () {
      super.isRejectClicked = value;
    });
  }

  final _$approveMocFormAsyncAction =
      AsyncAction('_MocFormViewModelBase.approveMocForm');

  @override
  Future<dynamic> approveMocForm(
      ApproveMocFormModel model, BuildContext context) {
    return _$approveMocFormAsyncAction
        .run(() => super.approveMocForm(model, context));
  }

  final _$rejectMocFormAsyncAction =
      AsyncAction('_MocFormViewModelBase.rejectMocForm');

  @override
  Future<dynamic> rejectMocForm(
      ApproveMocFormModel model, BuildContext context) {
    return _$rejectMocFormAsyncAction
        .run(() => super.rejectMocForm(model, context));
  }

  final _$onTileClickAsyncAction =
      AsyncAction('_MocFormViewModelBase.onTileClick');

  @override
  Future onTileClick(AsyncSnapshot<List<MocFormModel>?> snapshot, int index) {
    return _$onTileClickAsyncAction
        .run(() => super.onTileClick(snapshot, index));
  }

  final _$_MocFormViewModelBaseActionController =
      ActionController(name: '_MocFormViewModelBase');

  @override
  void changeShowRejectedText() {
    final _$actionInfo = _$_MocFormViewModelBaseActionController.startAction(
        name: '_MocFormViewModelBase.changeShowRejectedText');
    try {
      return super.changeShowRejectedText();
    } finally {
      _$_MocFormViewModelBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void changeIsRejectClicked() {
    final _$actionInfo = _$_MocFormViewModelBaseActionController.startAction(
        name: '_MocFormViewModelBase.changeIsRejectClicked');
    try {
      return super.changeIsRejectClicked();
    } finally {
      _$_MocFormViewModelBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void changeShowCPI() {
    final _$actionInfo = _$_MocFormViewModelBaseActionController.startAction(
        name: '_MocFormViewModelBase.changeShowCPI');
    try {
      return super.changeShowCPI();
    } finally {
      _$_MocFormViewModelBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void changeShowApprovedText() {
    final _$actionInfo = _$_MocFormViewModelBaseActionController.startAction(
        name: '_MocFormViewModelBase.changeShowApprovedText');
    try {
      return super.changeShowApprovedText();
    } finally {
      _$_MocFormViewModelBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void changeIsApproveClicked() {
    final _$actionInfo = _$_MocFormViewModelBaseActionController.startAction(
        name: '_MocFormViewModelBase.changeIsApproveClicked');
    try {
      return super.changeIsApproveClicked();
    } finally {
      _$_MocFormViewModelBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void refresh() {
    final _$actionInfo = _$_MocFormViewModelBaseActionController.startAction(
        name: '_MocFormViewModelBase.refresh');
    try {
      return super.refresh();
    } finally {
      _$_MocFormViewModelBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  dynamic navigateToMocFormDetailView(MocFormModel data) {
    final _$actionInfo = _$_MocFormViewModelBaseActionController.startAction(
        name: '_MocFormViewModelBase.navigateToMocFormDetailView');
    try {
      return super.navigateToMocFormDetailView(data);
    } finally {
      _$_MocFormViewModelBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  dynamic approveMoc(MocFormModel data, BuildContext context) {
    final _$actionInfo = _$_MocFormViewModelBaseActionController.startAction(
        name: '_MocFormViewModelBase.approveMoc');
    try {
      return super.approveMoc(data, context);
    } finally {
      _$_MocFormViewModelBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  dynamic rejectMoc(MocFormModel data, BuildContext context) {
    final _$actionInfo = _$_MocFormViewModelBaseActionController.startAction(
        name: '_MocFormViewModelBase.rejectMoc');
    try {
      return super.rejectMoc(data, context);
    } finally {
      _$_MocFormViewModelBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
isApproveClicked: ${isApproveClicked},
showCPI: ${showCPI},
showApprovedText: ${showApprovedText},
showRejectedText: ${showRejectedText},
isRejectClicked: ${isRejectClicked}
    ''';
  }
}
