// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'moc_technical_opinion_detail_view_model.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$TechnicalOpinionDetailViewModel
    on _TechnicalOpinionDetailViewModelBase, Store {
  final _$isApproveClickedAtom =
      Atom(name: '_TechnicalOpinionDetailViewModelBase.isApproveClicked');

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
      Atom(name: '_TechnicalOpinionDetailViewModelBase.isRejectedClicked');

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
      Atom(name: '_TechnicalOpinionDetailViewModelBase.isSuccessfull');

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
      Atom(name: '_TechnicalOpinionDetailViewModelBase.showCPI');

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
      Atom(name: '_TechnicalOpinionDetailViewModelBase.showApprovedText');

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

  final _$giveTechnicalOpinionAsyncAction =
      AsyncAction('_TechnicalOpinionDetailViewModelBase.giveTechnicalOpinion');

  @override
  Future giveTechnicalOpinion(GiveTechnicalOAModel model) {
    return _$giveTechnicalOpinionAsyncAction
        .run(() => super.giveTechnicalOpinion(model));
  }

  final _$_TechnicalOpinionDetailViewModelBaseActionController =
      ActionController(name: '_TechnicalOpinionDetailViewModelBase');

  @override
  void changeShowApprovedText() {
    final _$actionInfo =
        _$_TechnicalOpinionDetailViewModelBaseActionController.startAction(
            name:
                '_TechnicalOpinionDetailViewModelBase.changeShowApprovedText');
    try {
      return super.changeShowApprovedText();
    } finally {
      _$_TechnicalOpinionDetailViewModelBaseActionController
          .endAction(_$actionInfo);
    }
  }

  @override
  void changeShowRejectedText() {
    final _$actionInfo =
        _$_TechnicalOpinionDetailViewModelBaseActionController.startAction(
            name:
                '_TechnicalOpinionDetailViewModelBase.changeShowRejectedText');
    try {
      return super.changeShowRejectedText();
    } finally {
      _$_TechnicalOpinionDetailViewModelBaseActionController
          .endAction(_$actionInfo);
    }
  }

  @override
  void changeShowCPI() {
    final _$actionInfo =
        _$_TechnicalOpinionDetailViewModelBaseActionController.startAction(
            name: '_TechnicalOpinionDetailViewModelBase.changeShowCPI');
    try {
      return super.changeShowCPI();
    } finally {
      _$_TechnicalOpinionDetailViewModelBaseActionController
          .endAction(_$actionInfo);
    }
  }

  @override
  void changeIsSuccessfull() {
    final _$actionInfo =
        _$_TechnicalOpinionDetailViewModelBaseActionController.startAction(
            name: '_TechnicalOpinionDetailViewModelBase.changeIsSuccessfull');
    try {
      return super.changeIsSuccessfull();
    } finally {
      _$_TechnicalOpinionDetailViewModelBaseActionController
          .endAction(_$actionInfo);
    }
  }

  @override
  void changeIsApproveClicked() {
    final _$actionInfo =
        _$_TechnicalOpinionDetailViewModelBaseActionController.startAction(
            name:
                '_TechnicalOpinionDetailViewModelBase.changeIsApproveClicked');
    try {
      return super.changeIsApproveClicked();
    } finally {
      _$_TechnicalOpinionDetailViewModelBaseActionController
          .endAction(_$actionInfo);
    }
  }

  @override
  void changeIsRejectClicked() {
    final _$actionInfo =
        _$_TechnicalOpinionDetailViewModelBaseActionController.startAction(
            name: '_TechnicalOpinionDetailViewModelBase.changeIsRejectClicked');
    try {
      return super.changeIsRejectClicked();
    } finally {
      _$_TechnicalOpinionDetailViewModelBaseActionController
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
