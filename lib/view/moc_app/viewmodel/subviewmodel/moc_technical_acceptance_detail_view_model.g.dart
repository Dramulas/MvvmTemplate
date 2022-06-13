// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'moc_technical_acceptance_detail_view_model.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$TechnicalAcceptanceDetailViewModel
    on _TechnicalAcceptanceDetailViewModelBase, Store {
  final _$isApproveClickedAtom =
      Atom(name: '_TechnicalAcceptanceDetailViewModelBase.isApproveClicked');

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

  final _$isRejectedClickedAtom =
      Atom(name: '_TechnicalAcceptanceDetailViewModelBase.isRejectedClicked');

  @override
  bool get isRejectedClicked {
    _$isRejectedClickedAtom.reportRead();
    return super.isRejectedClicked;
  }

  @override
  set isRejectedClicked(bool value) {
    _$isRejectedClickedAtom.reportWrite(value, super.isRejectedClicked, () {
      super.isRejectedClicked = value;
    });
  }

  final _$isSuccessfullAtom =
      Atom(name: '_TechnicalAcceptanceDetailViewModelBase.isSuccessfull');

  @override
  bool get isSuccessfull {
    _$isSuccessfullAtom.reportRead();
    return super.isSuccessfull;
  }

  @override
  set isSuccessfull(bool value) {
    _$isSuccessfullAtom.reportWrite(value, super.isSuccessfull, () {
      super.isSuccessfull = value;
    });
  }

  final _$showCPIAtom =
      Atom(name: '_TechnicalAcceptanceDetailViewModelBase.showCPI');

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
      Atom(name: '_TechnicalAcceptanceDetailViewModelBase.showApprovedText');

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

  final _$giveTechnicalAcceptanceAsyncAction = AsyncAction(
      '_TechnicalAcceptanceDetailViewModelBase.giveTechnicalAcceptance');

  @override
  Future giveTechnicalAcceptance(GiveTechnicalOAModel model) {
    return _$giveTechnicalAcceptanceAsyncAction
        .run(() => super.giveTechnicalAcceptance(model));
  }

  final _$contestMocFormAsyncAction =
      AsyncAction('_TechnicalAcceptanceDetailViewModelBase.contestMocForm');

  @override
  Future contestMocForm(GiveTechnicalOAModel model) {
    return _$contestMocFormAsyncAction.run(() => super.contestMocForm(model));
  }

  final _$_TechnicalAcceptanceDetailViewModelBaseActionController =
      ActionController(name: '_TechnicalAcceptanceDetailViewModelBase');

  @override
  void changeShowApprovedText() {
    final _$actionInfo =
        _$_TechnicalAcceptanceDetailViewModelBaseActionController.startAction(
            name:
                '_TechnicalAcceptanceDetailViewModelBase.changeShowApprovedText');
    try {
      return super.changeShowApprovedText();
    } finally {
      _$_TechnicalAcceptanceDetailViewModelBaseActionController
          .endAction(_$actionInfo);
    }
  }

  @override
  void changeShowRejectedText() {
    final _$actionInfo =
        _$_TechnicalAcceptanceDetailViewModelBaseActionController.startAction(
            name:
                '_TechnicalAcceptanceDetailViewModelBase.changeShowRejectedText');
    try {
      return super.changeShowRejectedText();
    } finally {
      _$_TechnicalAcceptanceDetailViewModelBaseActionController
          .endAction(_$actionInfo);
    }
  }

  @override
  void changeShowCPI() {
    final _$actionInfo =
        _$_TechnicalAcceptanceDetailViewModelBaseActionController.startAction(
            name: '_TechnicalAcceptanceDetailViewModelBase.changeShowCPI');
    try {
      return super.changeShowCPI();
    } finally {
      _$_TechnicalAcceptanceDetailViewModelBaseActionController
          .endAction(_$actionInfo);
    }
  }

  @override
  void changeIsSuccessfull() {
    final _$actionInfo =
        _$_TechnicalAcceptanceDetailViewModelBaseActionController.startAction(
            name:
                '_TechnicalAcceptanceDetailViewModelBase.changeIsSuccessfull');
    try {
      return super.changeIsSuccessfull();
    } finally {
      _$_TechnicalAcceptanceDetailViewModelBaseActionController
          .endAction(_$actionInfo);
    }
  }

  @override
  void changeIsApproveClicked() {
    final _$actionInfo =
        _$_TechnicalAcceptanceDetailViewModelBaseActionController.startAction(
            name:
                '_TechnicalAcceptanceDetailViewModelBase.changeIsApproveClicked');
    try {
      return super.changeIsApproveClicked();
    } finally {
      _$_TechnicalAcceptanceDetailViewModelBaseActionController
          .endAction(_$actionInfo);
    }
  }

  @override
  void changeIsRejectClicked() {
    final _$actionInfo =
        _$_TechnicalAcceptanceDetailViewModelBaseActionController.startAction(
            name:
                '_TechnicalAcceptanceDetailViewModelBase.changeIsRejectClicked');
    try {
      return super.changeIsRejectClicked();
    } finally {
      _$_TechnicalAcceptanceDetailViewModelBaseActionController
          .endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
isApproveClicked: ${isApproveClicked},
isRejectedClicked: ${isRejectedClicked},
isSuccessfull: ${isSuccessfull},
showCPI: ${showCPI},
showApprovedText: ${showApprovedText}
    ''';
  }
}
