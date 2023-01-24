import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  void initState() {
    super.initState();
  }

  Map<dynamic, dynamic> weatherMap = {};

  @override
  Widget build(BuildContext context) {
    weatherMap = weatherMap.isEmpty
        ? ModalRoute.of(context)!.settings.arguments as Map
        : weatherMap;
    return Scaffold(
        backgroundColor: Colors.blue[300],
        body: SafeArea(
            child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.fromLTRB(10.0, 10.0, 10.0, 0.0),
            child: Column(
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.circular(10.0),
                  child: Container(
                    decoration: BoxDecoration(
                        color: Colors.cyan[600],
                        boxShadow: const [
                          BoxShadow(
                              blurRadius: 10.0,
                              color: Colors.grey,
                              offset: Offset(5, 5))
                        ]),
                    child: Center(
                      child: Padding(
                          padding: const EdgeInsets.all(5.0),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Text(
                                  weatherMap["weather"]
                                      .toString()
                                      .toUpperCase(),
                                  style: const TextStyle(
                                      color: Colors.white, fontSize: 35.0)),
                              SvgPicture.asset(
                                "assets/${weatherMap["weather"].toString().toLowerCase()}.svg",
                                height: 150.0,
                                width: 150.0,
                              ),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  SvgPicture.asset(
                                    "assets/thermometer.svg",
                                    width: 60.0,
                                    height: 60.0,
                                  ),
                                  Text(
                                    "${double.parse(weatherMap["temp"].toString()).truncate()}\u2070C",
                                    style: const TextStyle(
                                        color: Colors.white, fontSize: 35.0),
                                  )
                                ],
                              ),
                              TextButton.icon(
                                  onPressed: () async {
                                    dynamic results = await Navigator.pushNamed(
                                        context, '/locations');

                                    setState(() {
                                      weatherMap = results;

                                      print(results);
                                    });
                                  },
                                  icon: const Icon(
                                    Icons.edit,
                                    color: Colors.white,
                                  ),
                                  label: Text(
                                      weatherMap["location"]
                                          .toString()
                                          .toUpperCase(),
                                      style: const TextStyle(
                                          color: Colors.white, fontSize: 40.0)))
                            ],
                          )),
                    ),
                  ),
                ),
                const SizedBox(
                  height: 20.0,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Flexible(
                      flex: 1,
                      fit: FlexFit.tight,
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(10.0),
                        child: Container(
                          padding: const EdgeInsets.all(15.0),
                          margin: const EdgeInsets.only(right: 5.0),
                          decoration: BoxDecoration(
                            boxShadow: const [
                              BoxShadow(
                                blurRadius: 20.0,
                                color: Colors.grey,
                              )
                            ],
                            color: Colors.blue[200],
                          ),
                          child: Column(
                            children: [
                              SvgPicture.asset(
                                "assets/humid.svg",
                                width: 100,
                              ),
                              Text(
                                weatherMap["humidity"].toString(),
                                style: const TextStyle(
                                    color: Colors.black, fontSize: 30.0),
                              ),
                              const Text("Humidity")
                            ],
                          ),
                        ),
                      ),
                    ),
                    Flexible(
                        flex: 1,
                        fit: FlexFit.tight,
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(10.0),
                          child: Container(
                            padding: const EdgeInsets.all(15.0),
                            margin: const EdgeInsets.only(left: 5.0),
                            decoration: BoxDecoration(
                              boxShadow: const [
                                BoxShadow(
                                  blurRadius: 20.0,
                                  color: Colors.grey,
                                )
                              ],
                              color: Colors.cyan[300],
                            ),
                            child: Column(
                              children: [
                                SvgPicture.asset(
                                  "assets/windsock.svg",
                                  width: 100,
                                ),
                                Text(
                                  weatherMap["wind"].toString(),
                                  style: const TextStyle(
                                      color: Colors.black, fontSize: 30.0),
                                ),
                                const Text("Wind")
                              ],
                            ),
                          ),
                        ))
                  ],
                ),
                const SizedBox(
                  height: 20.0,
                ),
                Container(
                  padding: const EdgeInsets.all(10.0),
                  decoration: BoxDecoration(
                      color: Colors.grey[200],
                      borderRadius: BorderRadius.circular(10.0)),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Flexible(
                        flex: 1,
                        fit: FlexFit.tight,
                        child: Column(
                          children: [
                            SvgPicture.asset(
                              "assets/sunrise.svg",
                              width: 100.0,
                            ),
                            Text(
                              weatherMap["sunrise"].toString(),
                              style: const TextStyle(fontSize: 20),
                            ),
                            const Text("Sunrise"),
                          ],
                        ),
                      ),
                      Flexible(
                        flex: 1,
                        fit: FlexFit.tight,
                        child: Column(
                          children: [
                            SvgPicture.asset(
                              "assets/sunset.svg",
                              width: 100.0,
                            ),
                            Text(
                              weatherMap["sunset"].toString(),
                              style: const TextStyle(fontSize: 20),
                            ),
                            const Text("Sunset"),
                          ],
                        ),
                      )
                    ],
                  ),
                )
              ],
            ),
          ),
        )));
  }
}
