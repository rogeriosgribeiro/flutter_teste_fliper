import 'package:flutter_teste_fliper/repositories/resumo_repository.dart';

class ResumoModel {
  
  int id;
  int valorInvestido;
  double rentabilidadeMes;
  double valorCDI;
  double valorGanhoMes;
  
  ResumoModel(
    {this.id,
    this.valorInvestido,
    this.rentabilidadeMes,
    this.valorCDI,
    this.valorGanhoMes});

  ResumoModel.fromJson(Map<String, dynamic> json) {

    id = json["id"];
    valorInvestido = json["total"];
    rentabilidadeMes = json["profitability"];
    valorCDI = json["cdi"];
    valorGanhoMes = json["gain"];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    
    data["id"] = this.id;
    data["total"] = this.valorInvestido;
    data["profitability"] = this.rentabilidadeMes;
    data["cdi"] = this.valorCDI;
    data["gain"] = this.valorGanhoMes;

    return data;
  }

  Future<ResumoModel> buscarResumo() async {
    ResumoModel objResumoModel = await ResumoRepository().buscarResumo();
    return objResumoModel;
  }
}