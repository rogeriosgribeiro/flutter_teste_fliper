// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'resumo_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$ResumoStore on _ResumoStore, Store {
  Computed<bool> _$isValorInvestidoValidComputed;

  @override
  bool get isValorInvestidoValid => (_$isValorInvestidoValidComputed ??=
          Computed<bool>(() => super.isValorInvestidoValid,
              name: '_ResumoStore.isValorInvestidoValid'))
      .value;

  final _$valorInvestidoAtom = Atom(name: '_ResumoStore.valorInvestido');

  @override
  String get valorInvestido {
    _$valorInvestidoAtom.reportRead();
    return super.valorInvestido;
  }

  @override
  set valorInvestido(String value) {
    _$valorInvestidoAtom.reportWrite(value, super.valorInvestido, () {
      super.valorInvestido = value;
    });
  }

  final _$valorInvestidoVisibleAtom =
      Atom(name: '_ResumoStore.valorInvestidoVisible');

  @override
  bool get valorInvestidoVisible {
    _$valorInvestidoVisibleAtom.reportRead();
    return super.valorInvestidoVisible;
  }

  @override
  set valorInvestidoVisible(bool value) {
    _$valorInvestidoVisibleAtom.reportWrite(value, super.valorInvestidoVisible,
        () {
      super.valorInvestidoVisible = value;
    });
  }

  final _$loadingAtom = Atom(name: '_ResumoStore.loading');

  @override
  bool get loading {
    _$loadingAtom.reportRead();
    return super.loading;
  }

  @override
  set loading(bool value) {
    _$loadingAtom.reportWrite(value, super.loading, () {
      super.loading = value;
    });
  }

  final _$errorAtom = Atom(name: '_ResumoStore.error');

  @override
  String get error {
    _$errorAtom.reportRead();
    return super.error;
  }

  @override
  set error(String value) {
    _$errorAtom.reportWrite(value, super.error, () {
      super.error = value;
    });
  }

  final _$buscarResumoAsyncAction = AsyncAction('_ResumoStore.buscarResumo');

  @override
  Future<void> buscarResumo() {
    return _$buscarResumoAsyncAction.run(() => super.buscarResumo());
  }

  final _$_ResumoStoreActionController = ActionController(name: '_ResumoStore');

  @override
  void setValorInvestido(String value) {
    final _$actionInfo = _$_ResumoStoreActionController.startAction(
        name: '_ResumoStore.setValorInvestido');
    try {
      return super.setValorInvestido(value);
    } finally {
      _$_ResumoStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  void toggleValorInvestidoVisibility() {
    final _$actionInfo = _$_ResumoStoreActionController.startAction(
        name: '_ResumoStore.toggleValorInvestidoVisibility');
    try {
      return super.toggleValorInvestidoVisibility();
    } finally {
      _$_ResumoStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
valorInvestido: ${valorInvestido},
valorInvestidoVisible: ${valorInvestidoVisible},
loading: ${loading},
error: ${error},
isValorInvestidoValid: ${isValorInvestidoValid}
    ''';
  }
}
