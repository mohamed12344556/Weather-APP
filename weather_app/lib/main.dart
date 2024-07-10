import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather_app/block/cubit/get_weather_cubit.dart';
import 'package:weather_app/views/home_view.dart';

void main() {
  runApp(const WeatherApp());
}

class WeatherApp extends StatelessWidget {
  const WeatherApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
        create: (context) => GetWeatherCubit(),
        child: Builder(
          builder: (context) => BlocBuilder<GetWeatherCubit, WeatherState>(
            builder: (context, state) {
              return MaterialApp(
                debugShowCheckedModeBanner: false,
                theme: ThemeData(
                  appBarTheme: AppBarTheme(
                    centerTitle: true,
                    backgroundColor: getWeatherColor(
                      BlocProvider.of<GetWeatherCubit>(context)
                          .weatherModel
                          ?.weatgher_condition,
                    ),
                  ),
                  primarySwatch: getWeatherColor(
                    BlocProvider.of<GetWeatherCubit>(context)
                        .weatherModel
                        ?.weatgher_condition,
                  ),
                ),
                home: HomeView(),
              );
            },
          ),
        ));
  }
}

MaterialColor getWeatherColor(String? condition) {
  if (condition == null) {
    return Colors.blue;
  }
  switch (condition) {
    case "Sunny":
    case "Clear":
      return Colors.yellow;

    case "Partly cloudy":
    case "Patchy rain possible":
    case "Patchy snow possible":
    case "Patchy sleet possible":
    case "Patchy freezing drizzle possible":
    case "Patchy light drizzle":
    case "Patchy light rain":
    case "Patchy light snow":
    case "Patchy moderate snow":
    case "Patchy heavy snow":
    case "Patchy light rain with thunder":
    case "Patchy light snow with thunder":
      return Colors.blueGrey;

    case "Cloudy":
    case "Overcast":
    case "Fog":
    case "Freezing fog":
      return Colors.grey;

    case "Mist":
    case "Thundery outbreaks possible":
      return Colors.deepPurple;

    case "Light drizzle":
    case "Light rain":
    case "Light snow":
    case "Light sleet":
    case "Light rain shower":
    case "Light sleet showers":
    case "Light snow showers":
    case "Light showers of ice pellets":
    case "Moderate snow":
    case "Moderate rain at times":
    case "Moderate or heavy freezing rain":
    case "Moderate or heavy sleet":
    case "Moderate or heavy sleet showers":
    case "Moderate or heavy rain shower":
    case "Moderate or heavy snow showers":
    case "Moderate or heavy showers of ice pellets":
    case "Moderate or heavy rain with thunder":
    case "Moderate or heavy snow with thunder":
      return Colors.blue;

    case "Heavy freezing drizzle":
    case "Heavy rain at times":
    case "Heavy rain":
    case "Heavy snow":
    case "Torrential rain shower":
      return Colors.blueGrey;

    case "Blowing snow":
    case "Ice pellets":
      return Colors.lightBlue;

    default:
      return Colors.grey; // Default color if no match found
  }
}
