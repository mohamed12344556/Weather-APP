part of 'get_weather_cubit.dart';

@immutable
sealed class WeatherState {}
class NoWeatherState extends WeatherState {}
class GetWeatherLoaded extends WeatherState {
  final WeatherModel weatherModel;

  GetWeatherLoaded({required this.weatherModel});
}
class GetWeatherError extends WeatherState {
  final String errorMassage;
  GetWeatherError({required this.errorMassage});
}

// final class GetWeatherInitial extends IntialWeatherState {}
