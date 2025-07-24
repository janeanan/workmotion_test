import 'package:dio/dio.dart';
import 'package:retrofit/retrofit.dart';
import 'package:workmotion_test/model/api/apis.dart';
import 'package:workmotion_test/model/out_source.dart';
part 'res_client.g.dart';

@RestApi(baseUrl: Apis.baseServiceUrl)
abstract class RestClient {
  factory RestClient(Dio dio, {String baseUrl}) = _RestClient;

  @GET(Apis.user)
  Future<List<OutSource>> getOutSource();
}
