class WeatherModel {
  final String cityName;
  final DateTime date;
  final String image;
  final double temp;
  final double tempMin;
  final double tempMax;
  final String weatgher_condition;

  WeatherModel({
    required this.cityName,
    required this.date,
    required this.image,
    required this.temp,
    required this.tempMin,
    required this.tempMax,
    required this.weatgher_condition,
  });
  factory WeatherModel.fromJson(json) {
    return WeatherModel(
      cityName: json['location']["name"], //city name
      date: DateTime.parse(json["current"]['last_updated']), //date
      image: json["forecast"]["forecastday"][0]["day"]["condition"]["icon"], // image
      temp: json["forecast"]["forecastday"][0]["day"]["avgtemp_c"], //temp
      tempMin: json["forecast"]["forecastday"][0]["day"]["mintemp_c"], //temp min
      tempMax: json["forecast"]["forecastday"][0]["day"]["maxtemp_c"], //temp max
      weatgher_condition: json["forecast"]["forecastday"][0]["day"]["condition"]["text"], //weather condition
    );
  }
}
