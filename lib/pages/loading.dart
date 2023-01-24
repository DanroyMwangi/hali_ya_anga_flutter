import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:hali_ya_anga_flutter/services/GeoLocation.dart';
import 'package:hali_ya_anga_flutter/services/Weather.dart';
import 'package:http/http.dart';

class Loading extends StatefulWidget {
  const Loading({super.key});

  @override
  State<Loading> createState() => _LoadingState();
}

class _LoadingState extends State<Loading> {
  void getCurrentWeather() async {
    Weather getWeather = Weather(location: "Nairobi", limit: "1");
    await getWeather.getWeather();

    // ignore: use_build_context_synchronously
    Navigator.pushReplacementNamed(context, "/home", arguments: getWeather.weatherMap);
  }

  @override
  void initState() {
    super.initState();

    getCurrentWeather();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.blue[300],
        body: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: const [
            SpinKitRotatingCircle(
              color: Colors.white,
              size: 50.0,
            ),
            Padding(
              padding: EdgeInsets.all(10.0),
              child: Text(
                "Fetching weather details. Please wait...",
                style: TextStyle(color: Colors.white, fontSize: 16.0),
              ),
            )
          ],
        ));
  }
}
