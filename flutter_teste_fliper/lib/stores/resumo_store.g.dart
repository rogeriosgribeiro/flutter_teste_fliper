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
  Computed<bool> _$isRentabilidadeMesValidComputed;

  @override
  bool get isRentabilidadeMesValid => (_$isRentabilidadeMesValidComputed ??=
          Computed<bool>(() => super.isRentabilidadeMesValid,
              name: '_ResumoStore.isRentabilidadeMesValid'))
      .value;
  Computed<bool> _$isValorCDIValidComputed;

  @override
  bool get isValorCDIValid =>
      (_$isValorCDIValidComputed ??= Computed<bool>(() => super.isValorCDIValid,
              name: '_ResumoStore.isValorCDIValid'))
          .value;
  Computed<bool> _$isValorGanhoMesValidComputed;

  @override
  bool get isValorGanhoMesValid => (_$isValorGanhoMesValidComputed ??=
          Computed<bool>(() => super.isValorGanhoMesValid,
              name: '_ResumoStore.isValorGanhoMesValid'))
      .value;

  final _$valorInvestidoAtom = Atom(name: '_ResumoStore.valorInvestido');

  @override
  int get valorInvestido {
    _$valorInvestidoAtom.reportRead();
    return super.valorInvestido;
  }

  @override
  set valorInvestido(int value) {
    _$valorInvestidoAtom.reportWrite(value, super.valorInvestido, () {
      super.valorInvestido = value;
    });
  }

  final _$rentabilidadeMesAtom = Atom(name: '_ResumoStore.rentabilidadeMes');

  @override
  double get rentabilidadeMes {
    _$rentabilidadeMesAtom.reportRead();
    return super.rentabilidadeMes;
  }

  @override
  set rentabilidadeMes(double value) {
    _$rentabilidadeMesAtom.reportWrite(value, super.rentabilidadeMes, () {
      super.rentabilidadeMes = value;
    });
  }

  final _$valorCDIAtom = Atom(name: '_ResumoStore.valorCDI');

  @override
  double get valorCDI {
    _$valorCDIAtom.reportRead();
    return super.valorCDI;
  }

  @override
  set valorCDI(double value) {
    _$valorCDIAtom.reportWrite(value, super.valorCDI, () {
      super.valorCDI = value;
    });
  }

  final _$valorGanhoMesAtom = Atom(name: '_ResumoStore.valorGanhoMes');

  @override
  double get valorGanhoMes {
    _$valorGanhoMesAtom.reportRead();
    return super.valorGanhoMes;
  }

  @override
  set valorGanhoMes(double value) {
    _$valorGanhoMesAtom.reportWrite(value, super.valorGanhoMes, () {
      super.valorGanhoMes = value;
    });
  }

  final _$valoresVisibleAtom = Atom(name: '_ResumoStore.valoresVisible');

  @override
  bool get valoresVisible {
    _$valoresVisibleAtom.reportRead();
    return super.valoresVisible;
  }

  @override
  set valoresVisible(bool value) {
    _$valoresVisibleAtom.reportWrite(value, super.valoresVisible, () {
      super.valoresVisible = value;
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

  final _$processedAtom = Atom(name: '_ResumoStore.processed');

  @override
  bool get processed {
    _$processedAtom.reportRead();
    return super.processed;
  }

  @override
  set processed(bool value) {
    _$processedAtom.reportWrite(value, super.processed, () {
      super.processed = value;
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
  Future<ResumoModel> buscarResumo() {
    return _$buscarResumoAsyncAction.run(() => super.buscarResumo());
  }

  final _$_ResumoStoreActionController = ActionController(name: '_ResumoStore');

  @override
  void setValorInvestido(int value) {
    final _$actionInfo = _$_ResumoStoreActionController.startAction(
        name: '_ResumoStore.setValorInvestido');
    try {
      return super.setValorInvestido(value);
    } finally {
      _$_ResumoStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setRentabilidadeMes(double value) {
    final _$actionInfo = _$_ResumoStoreActionController.startAction(
        name: '_ResumoStore.setRentabilidadeMes');
    try {
      return super.setRentabilidadeMes(value);
    } finally {
      _$_ResumoStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setValorCDI(double value) {
    final _$actionInfo = _$_ResumoStoreActionController.startAction(
        name: '_ResumoStore.setValorCDI');
    try {
      return super.setValorCDI(value);
    } finally {
      _$_ResumoStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setValorGanhoMes(double value) {
    final _$actionInfo = _$_ResumoStoreActionController.startAction(
        name: '_ResumoStore.setValorGanhoMes');
    try {
      return super.setValorGanhoMes(value);
    } finally {
      _$_ResumoStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  void toggleValoresVisibility() {
    final _$actionInfo = _$_ResumoStoreActionController.startAction(
        name: '_ResumoStore.toggleValoresVisibility');
    try {
      return super.toggleValoresVisibility();
    } finally {
      _$_ResumoStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
valorInvestido: ${valorInvestido},
rentabilidadeMes: ${rentabilidadeMes},
valorCDI: ${valorCDI},
valorGanhoMes: ${valorGanhoMes},
valoresVisible: ${valoresVisible},
loading: ${loading},
processed: ${processed},
error: ${error},
isValorInvestidoValid: ${isValorInvestidoValid},
isRentabilidadeMesValid: ${isRentabilidadeMesValid},
isValorCDIValid: ${isValorCDIValid},
isValorGanhoMesValid: ${isValorGanhoMesValid}
    ''';
  }
}
