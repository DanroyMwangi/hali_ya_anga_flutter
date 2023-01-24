import 'package:flutter/material.dart';
import 'package:hali_ya_anga_flutter/pages/home.dart';
import 'package:hali_ya_anga_flutter/pages/loading.dart';
import 'package:hali_ya_anga_flutter/pages/loadingLocations.dart';

import 'pages/locations.dart';

void main() {
  runApp(MaterialApp(
    routes: {
      '/' :(context) => Loading(),
      '/home':(context) => Home(),
      '/loadingLocations':(context) => LoadingLocations(),
      '/locations':(context) => Locations(),
    },
  ));
}

