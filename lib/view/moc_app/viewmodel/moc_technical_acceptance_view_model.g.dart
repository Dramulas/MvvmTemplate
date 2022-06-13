// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'moc_technical_acceptance_view_model.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$TechnicalAcceptanceViewModel
    on _TechnicalAcceptanceViewModelBase, Store {
  final _$isApproveClickedAtom =
      Atom(name: '_TechnicalAcceptanceViewModelBase.isApproveClicked');

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

  final _$showCPIAtom = Atom(name: '_TechnicalAcceptanceViewModelBase.showCPI');

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
      Atom(name: '_TechnicalAcceptanceViewModelBase.showApprovedText');

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
      Atom(name: '_TechnicalAcceptanceViewModelBase.showRejectedText');

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
      Atom(name: '_TechnicalAcceptanceViewModelBase.isRejectClicked');

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
      AsyncAction('_TechnicalAcceptanceViewModelBase.onTileClick');

  @override
  Future onTileClick(
      AsyncSnapshot<List<TechnicalOAModel>?> snapshot, int index) {
    return _$onTileClickAsyncAction
        .run(() => super.onTileClick(snapshot, index));
  }

  final _$_TechnicalAcceptanceViewModelBaseActionController =
      ActionController(name: '_TechnicalAcceptanceViewModelBase');

  @override
  void changeShowRejectedText() {
    final _$actionInfo =
        _$_TechnicalAcceptanceViewModelBaseActionController.startAction(
            name: '_TechnicalAcceptanceViewModelBase.changeShowRejectedText');
    try {
      return super.changeShowRejectedText();
    } finally {
      _$_TechnicalAcceptanceViewModelBaseActionController
          .endAction(_$actionInfo);
    }
  }

  @override
  void changeIsRejectClicked() {
    final _$actionInfo =
        _$_TechnicalAcceptanceViewModelBaseActionController.startAction(
            name: '_TechnicalAcceptanceViewModelBase.changeIsRejectClicked');
    try {
      return super.changeIsRejectClicked();
    } finally {
      _$_TechnicalAcceptanceViewModelBaseActionController
          .endAction(_$actionInfo);
    }
  }

  @override
  void changeShowCPI() {
    final _$actionInfo = _$_TechnicalAcceptanceViewModelBaseActionController
        .startAction(name: '_TechnicalAcceptanceViewModelBase.changeShowCPI');
    try {
      return super.changeShowCPI();
    } finally {
      _$_TechnicalAcceptanceViewModelBaseActionController
          .endAction(_$actionInfo);
    }
  }

  @override
  void changeShowApprovedText() {
    final _$actionInfo =
        _$_TechnicalAcceptanceViewModelBaseActionController.startAction(
            name: '_TechnicalAcceptanceViewModelBase.changeShowApprovedText');
    try {
      return super.changeShowApprovedText();
    } finally {
      _$_TechnicalAcceptanceViewModelBaseActionController
          .endAction(_$actionInfo);
    }
  }

  @override
  void changeIsApproveClicked() {
    final _$actionInfo =
        _$_TechnicalAcceptanceViewModelBaseActionController.startAction(
            name: '_TechnicalAcceptanceViewModelBase.changeIsApproveClicked');
    try {
      return super.changeIsApproveClicked();
    } finally {
      _$_TechnicalAcceptanceViewModelBaseActionController
          .endAction(_$actionInfo);
    }
  }

  @override
  void refresh() {
    final _$actionInfo = _$_TechnicalAcceptanceViewModelBaseActionController
        .startAction(name: '_TechnicalAcceptanceViewModelBase.refresh');
    try {
      return super.refresh();
    } finally {
      _$_TechnicalAcceptanceViewModelBaseActionController
          .endAction(_$actionInfo);
    }
  }

  @override
  dynamic navigateToTechnicalAcceptanceDetailView(TechnicalOAModel data) {
    final _$actionInfo =
        _$_TechnicalAcceptanceViewModelBaseActionController.startAction(
            name:
                '_TechnicalAcceptanceViewModelBase.navigateToTechnicalAcceptanceDetailView');
    try {
      return super.navigateToTechnicalAcceptanceDetailView(data);
    } finally {
      _$_TechnicalAcceptanceViewModelBaseActionController
          .endAction(_$actionInfo);
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
