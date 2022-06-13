// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'moc_home_view_model.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$MocHomeModel on _MocHomeModelBase, Store {
  final _$isLoadingAtom = Atom(name: '_MocHomeModelBase.isLoading');

  @override
  bool get isLoading {
    _$isLoadingAtom.reportRead();
    return super.isLoading;
  }

  @override
  set isLoading(bool value) {
    _$isLoadingAtom.reportWrite(value, super.isLoading, () {
      super.isLoading = value;
    });
  }

  final _$signInMocAsyncAction = AsyncAction('_MocHomeModelBase.signInMoc');

  @override
  Future<void> signInMoc() {
    return _$signInMocAsyncAction.run(() => super.signInMoc());
  }

  final _$_MocHomeModelBaseActionController =
      ActionController(name: '_MocHomeModelBase');

  @override
  void isLoadingChange() {
    final _$actionInfo = _$_MocHomeModelBaseActionController.startAction(
        name: '_MocHomeModelBase.isLoadingChange');
    try {
      return super.isLoadingChange();
    } finally {
      _$_MocHomeModelBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
isLoading: ${isLoading}
    ''';
  }
}
