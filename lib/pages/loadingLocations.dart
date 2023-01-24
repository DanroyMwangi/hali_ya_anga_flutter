import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

import '../services/GeoLocation.dart';

class LoadingLocations extends StatefulWidget {
  const LoadingLocations({super.key});

  @override
  State<LoadingLocations> createState() => _LoadingLocationsState();
}

class _LoadingLocationsState extends State<LoadingLocations> {
  final List<String> placesList = [
    "Nairobi",
    "Meru",
    "Mombasa",
    "Kisumu",
    "Nakuru",
    "Eldoret",
    "Machakos",
    "Kisii",
    "Mumias",
    "Thika",
    "Nyeri",
    "Malindi",
    "Kakamega",
    "Kendu Bay",
    "Lodwar",
    "Athi River",
    "Kilifi",
    "Sotik",
    "Garissa",
    "Kitale",
    "Bungoma",
    "Isiolo",
    "Wajir",
    "Embu",
    "Voi",
    "Homa Bay",
    "Nanyuki",
    "Busia",
    "Mandera",
    "Kericho",
    "Kitui",
    "Maralal",
    "Lamu",
    "Kapsabet",
    "Marsabit",
    "Hola",
    "Kiambu",
    "Kabarnet",
    "Migori",
    "Kerugoya",
    "Iten",
    "Nyamira",
    "Murang'a",
    "Sotik Post",
    "Siaya",
    "Kapenguria",
    "Wote",
    "Mwatate",
    "Kajiado",
    "Ol Kalou",
    "Narok",
    "Kwale",
    "Rumuruti"
  ];
  List<GeoLocation> geoLocations = [];

  void getGeoLocations() async {
    for (String place in placesList) {
      GeoLocation geoLocation = GeoLocation(location: place);
      await geoLocation.getGeoLocation();

      geoLocations.add(geoLocation);
    }
    Navigator.pushReplacementNamed(context, "/locations", arguments: {geoLocations});
  }

  @override
  void initState() {
    super.initState();
    getGeoLocations();
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
                "Fetching locations. Please wait...",
                style: TextStyle(color: Colors.white, fontSize: 16.0),
              ),
            )
          ],
        ));
  }
}
