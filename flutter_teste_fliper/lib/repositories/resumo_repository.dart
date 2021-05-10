import 'package:dio/dio.dart';
import 'package:flutter_teste_fliper/models/resumo_model.dart';
import 'package:flutter_teste_fliper/utils/constantes.dart';

class ResumoRepository {
  Dio client = Dio();

  ResumoRepository() {
    client.options.baseUrl = BASE_URL;
    client.options.connectTimeout = 5000;
  }
  
  Future<ResumoModel> buscarResumo(String secret) async {
    try {
      var body = { "email": secret };
      
      var param = new Map<String, dynamic>();
      param['r'] = "Api/usuario/recupera-senha";

      final response = await client.post(
        "/index.php",
        data: body,
        queryParameters: param,
        options: Options(contentType: Headers.formUrlEncodedContentType));
      
      if (response.statusCode == 200) {
        if (response.data["status"] == "error")
          return Future.error(response.data["message"]);
        else
          return ResumoModel.fromJson(response.data["data"]);
      } else
        return Future.error(response.statusMessage);
    } on DioError catch (e) {
      return Future.error(e.message);
    }
  }
}