import 'dart:convert';
import 'package:hali_ya_anga_flutter/configurations/secretKeys.dart';
import 'package:http/http.dart';

class GeoLocation {
  late final String location, limit;
  double? longitude, latitude;
  String? country, error;
  String message = "progress";

  GeoLocation({required this.location}) {
    this.limit = "1";
  }

  Future<void> getGeoLocation() async {
    try {
      Response response = await get(Uri.parse(
          "http://api.openweathermap.org/geo/1.0/direct?q=${this.location}&appid=${SecretKeys.API_KEY}"));

      // Store the results into a list
      List<dynamic> geoLocationResults = jsonDecode(response.body);

      // The results produce a list which has only one element that is a map.
      var geoLocationParsed = geoLocationResults.first;

      longitude = geoLocationParsed["lon"];
      latitude = geoLocationParsed['lat'];
      country = geoLocationParsed['country'];
      message = "success";
    } catch (e) {
      longitude = null;
      latitude = null;
      message = "failed";
      error = "location not found";
    }
  }
}
