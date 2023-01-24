import 'dart:convert';

import 'package:http/http.dart';
import 'package:hali_ya_anga_flutter/services/GeoLocation.dart';
import 'package:intl/intl.dart';
import '../configurations/secretKeys.dart';

class Weather {
  String location, limit;
  late Map<String, dynamic> weatherMap;

  Weather({required this.location, required this.limit});

  Future<void> getWeather() async {
    GeoLocation geolocation = GeoLocation(location: location);

    // Call the getGeoLocation to generate the latitude and longitude of the location desired.
    await geolocation.getGeoLocation();

    // Create the url string
    String weatherUrl =
        "https://api.openweathermap.org/data/2.5/weather?lat=${geolocation.latitude}&lon=${geolocation.longitude}&appid=${SecretKeys.API_KEY}";

    //! Generate the weather response json from the string url above
    Response response = await get(Uri.parse(weatherUrl));

    var weatherData = jsonDecode(response.body);

    weatherMap = {
      "weather": weatherData["weather"][0]["main"].toString(),
      "id": weatherData["weather"][0]["id"].toString(),
      "temp":
          _getTemp(kelvin: weatherData["main"]["temp"].toString()).toString(),
      "humidity": weatherData["main"]["humidity"].toString(),
      "wind": weatherData["wind"]["speed"].toString(),
      "sunrise": _getTime(time: weatherData["sys"]["sunrise"].toString()),
      "sunset": _getTime(time: weatherData["sys"]["sunset"].toString()),
      "location": weatherData["name"].toString()
    };
  }

  double _getTemp({required String kelvin}) {
    return double.parse(kelvin) - 273.15;
  }

  String _getTime({required String time}) {
    int utcCurrentTime = int.parse(time);
    DateTime resultTime =
        DateTime.fromMillisecondsSinceEpoch(utcCurrentTime * 1000);
    var finalTime = DateFormat('hh:mm a').format(resultTime);
    return finalTime;
  }
}
