// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'moc_closing_moc_form_detail_view_model.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$ClosingMocFormDetailViewModel
    on _ClosingMocFormDetailViewModelBase, Store {
  final _$isApproveClickedAtom =
      Atom(name: '_ClosingMocFormDetailViewModelBase.isApproveClicked');

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
      Atom(name: '_ClosingMocFormDetailViewModelBase.isRejectedClicked');

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
      Atom(name: '_ClosingMocFormDetailViewModelBase.isSuccessfull');

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
      Atom(name: '_ClosingMocFormDetailViewModelBase.showCPI');

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
      Atom(name: '_ClosingMocFormDetailViewModelBase.showApprovedText');

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

  final _$approveClosingMocFormAsyncAction =
      AsyncAction('_ClosingMocFormDetailViewModelBase.approveClosingMocForm');

  @override
  Future approveClosingMocForm(ApproveClosingMocFormModel model) {
    return _$approveClosingMocFormAsyncAction
        .run(() => super.approveClosingMocForm(model));
  }

  final _$_ClosingMocFormDetailViewModelBaseActionController =
      ActionController(name: '_ClosingMocFormDetailViewModelBase');

  @override
  void changeShowApprovedText() {
    final _$actionInfo =
        _$_ClosingMocFormDetailViewModelBaseActionController.startAction(
            name: '_ClosingMocFormDetailViewModelBase.changeShowApprovedText');
    try {
      return super.changeShowApprovedText();
    } finally {
      _$_ClosingMocFormDetailViewModelBaseActionController
          .endAction(_$actionInfo);
    }
  }

  @override
  void changeShowRejectedText() {
    final _$actionInfo =
        _$_ClosingMocFormDetailViewModelBaseActionController.startAction(
            name: '_ClosingMocFormDetailViewModelBase.changeShowRejectedText');
    try {
      return super.changeShowRejectedText();
    } finally {
      _$_ClosingMocFormDetailViewModelBaseActionController
          .endAction(_$actionInfo);
    }
  }

  @override
  void changeShowCPI() {
    final _$actionInfo = _$_ClosingMocFormDetailViewModelBaseActionController
        .startAction(name: '_ClosingMocFormDetailViewModelBase.changeShowCPI');
    try {
      return super.changeShowCPI();
    } finally {
      _$_ClosingMocFormDetailViewModelBaseActionController
          .endAction(_$actionInfo);
    }
  }

  @override
  void changeIsSuccessfull() {
    final _$actionInfo =
        _$_ClosingMocFormDetailViewModelBaseActionController.startAction(
            name: '_ClosingMocFormDetailViewModelBase.changeIsSuccessfull');
    try {
      return super.changeIsSuccessfull();
    } finally {
      _$_ClosingMocFormDetailViewModelBaseActionController
          .endAction(_$actionInfo);
    }
  }

  @override
  void changeIsApproveClicked() {
    final _$actionInfo =
        _$_ClosingMocFormDetailViewModelBaseActionController.startAction(
            name: '_ClosingMocFormDetailViewModelBase.changeIsApproveClicked');
    try {
      return super.changeIsApproveClicked();
    } finally {
      _$_ClosingMocFormDetailViewModelBaseActionController
          .endAction(_$actionInfo);
    }
  }

  @override
  void changeIsRejectClicked() {
    final _$actionInfo =
        _$_ClosingMocFormDetailViewModelBaseActionController.startAction(
            name: '_ClosingMocFormDetailViewModelBase.changeIsRejectClicked');
    try {
      return super.changeIsRejectClicked();
    } finally {
      _$_ClosingMocFormDetailViewModelBaseActionController
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
