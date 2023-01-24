import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:hali_ya_anga_flutter/services/GeoLocation.dart';
import 'package:hali_ya_anga_flutter/services/Weather.dart';

class Locations extends StatefulWidget {
  const Locations({super.key});

  @override
  State<Locations> createState() => _LocationsState();
}

class _LocationsState extends State<Locations> {
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

  void getCurrentWeather({required currentLocation}) async {
    Weather getWeather = Weather(location: currentLocation, limit: "1");
    await getWeather.getWeather();

    // ignore: use_build_context_synchronously
    Navigator.pop(context,
    getWeather.weatherMap);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.green,
      appBar: AppBar(
        title: const Text("Choose location"),
        centerTitle: true,
        backgroundColor: Colors.green[600],
        elevation: 0,
      ),
      body: ListView.builder(
        itemCount: placesList.length,
        itemBuilder: (context, index) {
          return Card(
            child: Padding(
              padding: EdgeInsets.only(top: 10.0),
              child: ListTile(
                  onTap: () {
                    getCurrentWeather(currentLocation: placesList[index]);
                  },
                  leading: Image.network(
                      "https://upload.wikimedia.org/wikipedia/commons/thumb/4/49/Flag_of_Kenya.svg/64px-Flag_of_Kenya.svg.png"),
                  title: Text(placesList[index])),
            ),
          );
        },
      ),
    );
  }
}
