// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'moc_closing_moc_form_view_model.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$ClosingMocFormViewModel on _ClosingMocFormViewModelBase, Store {
  final _$isApproveClickedAtom =
      Atom(name: '_ClosingMocFormViewModelBase.isApproveClicked');

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

  final _$showCPIAtom = Atom(name: '_ClosingMocFormViewModelBase.showCPI');

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
      Atom(name: '_ClosingMocFormViewModelBase.showApprovedText');

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
      Atom(name: '_ClosingMocFormViewModelBase.showRejectedText');

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
      Atom(name: '_ClosingMocFormViewModelBase.isRejectClicked');

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

  final _$onTileClickAsyncAction =
      AsyncAction('_ClosingMocFormViewModelBase.onTileClick');

  @override
  Future onTileClick(
      AsyncSnapshot<List<ClosingMocFormModel>?> snapshot, int index) {
    return _$onTileClickAsyncAction
        .run(() => super.onTileClick(snapshot, index));
  }

  final _$_ClosingMocFormViewModelBaseActionController =
      ActionController(name: '_ClosingMocFormViewModelBase');

  @override
  void changeShowRejectedText() {
    final _$actionInfo =
        _$_ClosingMocFormViewModelBaseActionController.startAction(
            name: '_ClosingMocFormViewModelBase.changeShowRejectedText');
    try {
      return super.changeShowRejectedText();
    } finally {
      _$_ClosingMocFormViewModelBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void changeIsRejectClicked() {
    final _$actionInfo =
        _$_ClosingMocFormViewModelBaseActionController.startAction(
            name: '_ClosingMocFormViewModelBase.changeIsRejectClicked');
    try {
      return super.changeIsRejectClicked();
    } finally {
      _$_ClosingMocFormViewModelBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void changeShowCPI() {
    final _$actionInfo = _$_ClosingMocFormViewModelBaseActionController
        .startAction(name: '_ClosingMocFormViewModelBase.changeShowCPI');
    try {
      return super.changeShowCPI();
    } finally {
      _$_ClosingMocFormViewModelBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void changeShowApprovedText() {
    final _$actionInfo =
        _$_ClosingMocFormViewModelBaseActionController.startAction(
            name: '_ClosingMocFormViewModelBase.changeShowApprovedText');
    try {
      return super.changeShowApprovedText();
    } finally {
      _$_ClosingMocFormViewModelBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void changeIsApproveClicked() {
    final _$actionInfo =
        _$_ClosingMocFormViewModelBaseActionController.startAction(
            name: '_ClosingMocFormViewModelBase.changeIsApproveClicked');
    try {
      return super.changeIsApproveClicked();
    } finally {
      _$_ClosingMocFormViewModelBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void refresh() {
    final _$actionInfo = _$_ClosingMocFormViewModelBaseActionController
        .startAction(name: '_ClosingMocFormViewModelBase.refresh');
    try {
      return super.refresh();
    } finally {
      _$_ClosingMocFormViewModelBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  dynamic navigateToClosingMocFormDetailView(ClosingMocFormModel data) {
    final _$actionInfo =
        _$_ClosingMocFormViewModelBaseActionController.startAction(
            name:
                '_ClosingMocFormViewModelBase.navigateToClosingMocFormDetailView');
    try {
      return super.navigateToClosingMocFormDetailView(data);
    } finally {
      _$_ClosingMocFormViewModelBaseActionController.endAction(_$actionInfo);
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
