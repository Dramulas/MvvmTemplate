// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'moc_technical_opinion_view_model.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$TechnicalOpinionViewModel on _TechnicalOpinionViewModelBase, Store {
  final _$isApproveClickedAtom =
      Atom(name: '_TechnicalOpinionViewModelBase.isApproveClicked');

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

  final _$showCPIAtom = Atom(name: '_TechnicalOpinionViewModelBase.showCPI');

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
      Atom(name: '_TechnicalOpinionViewModelBase.showApprovedText');

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
      Atom(name: '_TechnicalOpinionViewModelBase.showRejectedText');

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
      Atom(name: '_TechnicalOpinionViewModelBase.isRejectClicked');

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
      AsyncAction('_TechnicalOpinionViewModelBase.onTileClick');

  @override
  Future onTileClick(
      AsyncSnapshot<List<TechnicalOAModel>?> snapshot, int index) {
    return _$onTileClickAsyncAction
        .run(() => super.onTileClick(snapshot, index));
  }

  final _$_TechnicalOpinionViewModelBaseActionController =
      ActionController(name: '_TechnicalOpinionViewModelBase');

  @override
  void changeShowRejectedText() {
    final _$actionInfo =
        _$_TechnicalOpinionViewModelBaseActionController.startAction(
            name: '_TechnicalOpinionViewModelBase.changeShowRejectedText');
    try {
      return super.changeShowRejectedText();
    } finally {
      _$_TechnicalOpinionViewModelBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void changeIsRejectClicked() {
    final _$actionInfo =
        _$_TechnicalOpinionViewModelBaseActionController.startAction(
            name: '_TechnicalOpinionViewModelBase.changeIsRejectClicked');
    try {
      return super.changeIsRejectClicked();
    } finally {
      _$_TechnicalOpinionViewModelBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void changeShowCPI() {
    final _$actionInfo = _$_TechnicalOpinionViewModelBaseActionController
        .startAction(name: '_TechnicalOpinionViewModelBase.changeShowCPI');
    try {
      return super.changeShowCPI();
    } finally {
      _$_TechnicalOpinionViewModelBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void changeShowApprovedText() {
    final _$actionInfo =
        _$_TechnicalOpinionViewModelBaseActionController.startAction(
            name: '_TechnicalOpinionViewModelBase.changeShowApprovedText');
    try {
      return super.changeShowApprovedText();
    } finally {
      _$_TechnicalOpinionViewModelBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void changeIsApproveClicked() {
    final _$actionInfo =
        _$_TechnicalOpinionViewModelBaseActionController.startAction(
            name: '_TechnicalOpinionViewModelBase.changeIsApproveClicked');
    try {
      return super.changeIsApproveClicked();
    } finally {
      _$_TechnicalOpinionViewModelBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void refresh() {
    final _$actionInfo = _$_TechnicalOpinionViewModelBaseActionController
        .startAction(name: '_TechnicalOpinionViewModelBase.refresh');
    try {
      return super.refresh();
    } finally {
      _$_TechnicalOpinionViewModelBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  dynamic navigateToTechnicalOpinionDetailView(TechnicalOAModel data) {
    final _$actionInfo =
        _$_TechnicalOpinionViewModelBaseActionController.startAction(
            name:
                '_TechnicalOpinionViewModelBase.navigateToTechnicalOpinionDetailView');
    try {
      return super.navigateToTechnicalOpinionDetailView(data);
    } finally {
      _$_TechnicalOpinionViewModelBaseActionController.endAction(_$actionInfo);
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
