// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'confirmation_detail_view_model.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$ConfirmationDetailViewModel on _ConfirmationDetailViewModelBase, Store {
  final _$isApproveClickedAtom =
      Atom(name: '_ConfirmationDetailViewModelBase.isApproveClicked');

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

  final _$isSuccessfullAtom =
      Atom(name: '_ConfirmationDetailViewModelBase.isSuccessfull');

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

  final _$showCPIAtom = Atom(name: '_ConfirmationDetailViewModelBase.showCPI');

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
      Atom(name: '_ConfirmationDetailViewModelBase.showApprovedText');

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

  final _$approveByPassFormAsyncAction =
      AsyncAction('_ConfirmationDetailViewModelBase.approveByPassForm');

  @override
  Future approveByPassForm(ApproveByPassModel model) {
    return _$approveByPassFormAsyncAction
        .run(() => super.approveByPassForm(model));
  }

  final _$_ConfirmationDetailViewModelBaseActionController =
      ActionController(name: '_ConfirmationDetailViewModelBase');

  @override
  void changeShowApprovedText() {
    final _$actionInfo =
        _$_ConfirmationDetailViewModelBaseActionController.startAction(
            name: '_ConfirmationDetailViewModelBase.changeShowApprovedText');
    try {
      return super.changeShowApprovedText();
    } finally {
      _$_ConfirmationDetailViewModelBaseActionController
          .endAction(_$actionInfo);
    }
  }

  @override
  void changeShowCPI() {
    final _$actionInfo = _$_ConfirmationDetailViewModelBaseActionController
        .startAction(name: '_ConfirmationDetailViewModelBase.changeShowCPI');
    try {
      return super.changeShowCPI();
    } finally {
      _$_ConfirmationDetailViewModelBaseActionController
          .endAction(_$actionInfo);
    }
  }

  @override
  void changeIsSuccessfull() {
    final _$actionInfo =
        _$_ConfirmationDetailViewModelBaseActionController.startAction(
            name: '_ConfirmationDetailViewModelBase.changeIsSuccessfull');
    try {
      return super.changeIsSuccessfull();
    } finally {
      _$_ConfirmationDetailViewModelBaseActionController
          .endAction(_$actionInfo);
    }
  }

  @override
  void changeIsApproveClicked() {
    final _$actionInfo =
        _$_ConfirmationDetailViewModelBaseActionController.startAction(
            name: '_ConfirmationDetailViewModelBase.changeIsApproveClicked');
    try {
      return super.changeIsApproveClicked();
    } finally {
      _$_ConfirmationDetailViewModelBaseActionController
          .endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
isApproveClicked: ${isApproveClicked},
isSuccessfull: ${isSuccessfull},
showCPI: ${showCPI},
showApprovedText: ${showApprovedText}
    ''';
  }
}
