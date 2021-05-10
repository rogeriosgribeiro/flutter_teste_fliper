import 'package:dio/dio.dart';
import 'package:flutter_teste_fliper/models/resumo_model.dart';
import 'package:flutter_teste_fliper/utils/constantes.dart';

class ResumoRepository {
  Dio client = Dio();

  ResumoRepository() {
    client.options.baseUrl = BASE_URL;
    client.options.connectTimeout = 5000;
    client.options.headers["content-type"] = "application/json";
    client.options.headers["x-hasura-admin-secret"] = SECRET;
  }
  
  Future<ResumoModel> buscarResumo() async {
    try {

      var body = "{ \"type\": \"select\", \"args\": { \"table\": \"wealthSummary\", \"columns\": [ \"id\", \"total\", \"profitability\", \"cdi\", \"gain\" ]}}";

      final response = await client.post(RESUMO_URL, data: body);
      
      if (response.statusCode == 200)
        return ResumoModel.fromJson(response.data[0]);
      else
        return Future.error(response.data["message"]);
    } on DioError catch (e) {
      return Future.error(e.message);
    }
  }
}