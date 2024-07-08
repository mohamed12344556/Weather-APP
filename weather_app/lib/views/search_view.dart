import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:weather_app/models/weather_model.dart';
import 'package:weather_app/services/weather_service.dart';

class SearchView extends StatefulWidget {
  const SearchView({super.key});

  @override
  State<SearchView> createState() => _SearchViewState();
}

class _SearchViewState extends State<SearchView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: Center(
          child: TextField(
            onSubmitted: (value) async {
              WeatherModel weathermodel =
                  await WeatherService(Dio()).getWeather(cityName: value);
                  log(weathermodel.cityName);
                  Navigator.of(context).pop();
            },
            decoration: InputDecoration(
              labelText: "Search",
              hintText: "Enter city name",
              suffixIcon: Icon(Icons.search),
              contentPadding:
                  EdgeInsets.symmetric(horizontal: 16, vertical: 32),
              border: OutlineInputBorder(
                borderSide: BorderSide(color: Colors.green),
                borderRadius: BorderRadius.all(
                  Radius.circular(10),
                ),
              ),
              hoverColor: Colors.green,
            ),
          ),
        ),
      ),
    );
  }
}
