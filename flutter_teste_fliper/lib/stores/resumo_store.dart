import 'package:flutter_teste_fliper/models/resumo_model.dart';
import 'package:mobx/mobx.dart';

part 'resumo_store.g.dart';

class ResumoStore = _ResumoStore with _$ResumoStore;

abstract class _ResumoStore with Store {

  @observable
  int valorInvestido;

  @action
  void setValorInvestido(int value) => valorInvestido = value;

  @computed
  bool get isValorInvestidoValid => valorInvestido != null;
  String get valorInvestidoError => valorInvestido == null || isValorInvestidoValid ? null : "Valor Investido inválido";

  @observable
  double rentabilidadeMes;

  @action
  void setRentabilidadeMes(double value) => rentabilidadeMes = value;

  @computed
  bool get isRentabilidadeMesValid => rentabilidadeMes != null;
  String get rentabilidadeMesError => rentabilidadeMes == null || isRentabilidadeMesValid ? null : "Rentabilidade/mês inválido";

  @observable
  double valorCDI;

  @action
  void setValorCDI(double value) => valorCDI = value;

  @computed
  bool get isValorCDIValid => valorCDI != null;
  String get valorCDIError => valorCDI == null || isValorCDIValid ? null : "Valor CDI inválido";

  @observable
  double valorGanhoMes;

  @action
  void setValorGanhoMes(double value) => valorGanhoMes = value;

  @computed
  bool get isValorGanhoMesValid => valorGanhoMes != null;
  String get valorGanhoMesError => valorGanhoMes == null || isValorGanhoMesValid ? null : "Valor Ganho/mês inválido";

  @observable
  bool valoresVisible = false;

  @action
  void toggleValoresVisibility() => valoresVisible = !valoresVisible;

  @observable
  bool loading = false;

  @observable
  bool processed = false;

  @observable
  String error = "";

  @action
  Future<ResumoModel> buscarResumo() async {

    loading = true;
    ResumoModel objResumo;
    
    try {
      
      objResumo = await ResumoModel().buscarResumo();
      valorInvestido = objResumo.valorInvestido;
      rentabilidadeMes = objResumo.rentabilidadeMes;
      valorCDI = objResumo.valorCDI;
      valorGanhoMes = objResumo.valorGanhoMes;

      processed = true;

    } catch (e) {
      loading = false;
      error = e.toString();
    }

    loading = false;
    return objResumo;
  }
}