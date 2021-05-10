import 'package:flutter_teste_fliper/models/resumo_model.dart';
import 'package:mobx/mobx.dart';

part 'resumo_store.g.dart';

class ResumoStore = _ResumoStore with _$ResumoStore;

abstract class _ResumoStore with Store {

  @observable
  String valorInvestido = "";

  @action
  void setValorInvestido(String value) => valorInvestido = value;

  @computed
  bool get isValorInvestidoValid => valorInvestido != null;
  String get valorInvestidoError => valorInvestido == null || isValorInvestidoValid ? null : "Valor Investido inválido";

  @observable
  bool valorInvestidoVisible = false;

  @action
  void toggleValorInvestidoVisibility() => valorInvestidoVisible = !valorInvestidoVisible;

  @observable
  bool loading = false;

  @observable
  String error;

  @action
  Future<void> buscarResumo() async {

    loading = true;
    
    try {

      String secret = "fliperdevtest2020";
      final resumo = await ResumoModel().buscarResumo(secret);

    } catch (e) {
      loading = false;
      error = e.toString();
    }

    loading = false;
  }
}