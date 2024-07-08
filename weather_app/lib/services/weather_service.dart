import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:weather_app/constant/links.dart';
import 'package:weather_app/models/weather_model.dart';

class WeatherService {
  final Dio dio;
  WeatherService(this.dio);

  Future<WeatherModel> getWeather({required String cityName}) async {
    try {
      Response response = await dio.get("$baseURL/$apiKey&q=$cityName");
      WeatherModel weatherModel = WeatherModel.fromJson(response.data);
      return weatherModel;
    } on DioException catch (e) {
      final error =
          e.response?.data['error']['message'] ?? "oops something went wrong";
      throw Exception(error);
    } catch (e) {
      log(e.toString());
      throw Exception("oops something went wrong");
    }
  }
}
