import 'package:flutter_teste_fliper/repositories/resumo_repository.dart';

class ResumoModel {
  
  String valorInvestido;
  String rentabilidadeMes;
  String valorCDI;
  String valorGanhoMes;
  
  ResumoModel(
    {this.valorInvestido,
    this.rentabilidadeMes,
    this.valorCDI,
    this.valorGanhoMes});

  ResumoModel.fromJson(Map<String, dynamic> json) {

    valorInvestido = json[""];
    rentabilidadeMes = json[""];    
    valorCDI = json[""];
    valorGanhoMes = json[""];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    
    data["id"] = this.valorInvestido;
    data["username"] = this.rentabilidadeMes;
    data["token"] = this.valorCDI;
    data["idPlano"] = this.valorGanhoMes;

    return data;
  }

  Future<ResumoModel> buscarResumo(String secret) async {
    ResumoModel objResumoModel = await ResumoRepository().buscarResumo(secret);      
    return objResumoModel;
  }
}