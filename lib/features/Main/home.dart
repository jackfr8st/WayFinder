import 'dart:async';
import 'dart:convert';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:http/http.dart' as http;
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:geocoding/geocoding.dart';
import 'package:geolocator/geolocator.dart';
import 'package:iconsax/iconsax.dart';
import 'package:latlong2/latlong.dart';
import 'package:wayfinder/data/repositories/auth_repo.dart';
import 'package:wayfinder/utils/constant/colors.dart';
import 'package:wayfinder/utils/constant/sizes.dart';
import 'package:wayfinder/utils/helpers/helper_functions.dart';


class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  final mapController = MapController();

  // Define a variable to store the current position
  LatLng currentLocation = const LatLng(19.039519, 72.859655);

  // // Create a timer that updates the current position every 10 seconds
  Timer? locationUpdateTimer;

  @override
  void initState() {
    super.initState();
    // Start the timer when the widget is initialized
    locationUpdateTimer =
        Timer.periodic(const Duration(seconds: 10), (Timer timer) async {
      // Update the current position
      Position newPosition = await getCurrentLocation();
      setState(() {
        currentLocation = LatLng(newPosition.latitude, newPosition.longitude);
        mapController.move(currentLocation, 17);
      });
    });
  }

  final start = TextEditingController();
  final end = TextEditingController();
  bool isVisible = true;
  bool routeExists = false;
  List<LatLng> routpoints = [LatLng(52.05884, -1.345583)];
  List<LatLng> routepoints1 = [LatLng(52.05884, -1.345583)];
  List<LatLng> routepoints2 = [LatLng(52.05884, -1.345583)];
  List<LatLng> routepoints3 = [LatLng(52.05884, -1.345583)];

  getCurrentLocation() async {
    LocationPermission permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied ||
        permission == LocationPermission.deniedForever) {
      LocationPermission ask = await Geolocator.requestPermission();
    } else {
      Position currentPosition = await Geolocator.getCurrentPosition(
          desiredAccuracy: LocationAccuracy.bestForNavigation);
      if (kDebugMode) {
        print("Lat: ${currentPosition.latitude.toString()}");
      }
      if (kDebugMode) {
        print("Lon: ${currentPosition.longitude.toString()}");
      }
      return currentPosition;
    }
  }

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      backgroundColor: Colors.grey[300],
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(0.0),
          child: SingleChildScrollView(
            child: Stack(
              children: [
                SizedBox(
                  height: 800,
                  width: 400,
                  child: Visibility(
                    visible: isVisible,
                    child: FlutterMap(
                      mapController: mapController,
                      options: MapOptions(
                        initialCenter: routepoints1.isNotEmpty ? routepoints1[0] : currentLocation,
                        initialZoom: 17,
                      ),
                      children: [
                        TileLayer(
                          urlTemplate: 'https://tile.openstreetmap.org/{z}/{x}/{y}.png',
                          userAgentPackageName: 'com.example.app',
                        ),
                        PolylineLayer(
                          polylineCulling: false,
                          polylines: [
                              Polyline(
                                points: routepoints1,
                                color: Colors.blue,
                                strokeWidth: 9,
                              ),
                          ],
                        ),
                        MarkerLayer(
                          markers: [
                            if (routepoints1.isNotEmpty)
                              Marker(
                                point: routepoints1.last,
                                width: 40,
                                height: 40,
                                child: const Icon(
                                  Icons.location_on,
                                  color: Colors.red,
                                  size: 36,
                                ),
                              ),
                          ],
                        ),
                        CircleLayer(
                          circles: [
                            CircleMarker(
                              point: currentLocation,
                              color: Colors.blue.withOpacity(0.3),
                              radius: 20,
                              useRadiusInMeter: true,
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
                Column(
                  children: [
                    Container(
                      padding: const EdgeInsets.all(TSizes.defaultSpace),
                      color: TColors.primary,
                      width: THelperFunctions.screenWidth(),
                      height: THelperFunctions.screenWidth()*0.25,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text("Hello Way-finder!",style: Theme.of(context).textTheme.headlineMedium),
                          SizedBox(
                            child: ElevatedButton(onPressed:  () async {
                              await AuthenticationRepository.instance.logout();
                            },style: ElevatedButton.styleFrom(shape: const CircleBorder(),backgroundColor: TColors.grey, foregroundColor: TColors.black), child:const Icon(Iconsax.logout_1)),
                          )
                        ],
                      ),
                    ),
                    Container(
                      padding: const EdgeInsets.all(8.0),
                      width: double.infinity,
                      child: SearchBar(
                        controller: end,
                        hintText: "Enter Destination",
                      ),
                    ),
                    ElevatedButton(
                      onPressed: loadMapS,
                      style: ElevatedButton.styleFrom(backgroundColor: TColors.primary),
                      child: const Text("Search"),
                    ),
                  ],
                )
              ],
            ),
          ),
        ),
      ),
    );
  }

  void loadMap() async {
    List<Location> end1 = await locationFromAddress(end.toString());

    var v1_1 = currentLocation.latitude;
    var v2_1 = currentLocation.longitude;
    var v3_1 = end1[0].latitude;
    var v4_1 = end1[0].longitude;

    // Route 1
    var url1 = Uri.parse(
        'http://router.project-osrm.org/route/v1/driving/$v2_1,$v1_1;$v4_1,$v3_1?steps=true&annotations=true&geometries=geojson&overview=full');
    var response1 = await http.get(url1);
    if (kDebugMode) {
      print(response1.body);
    }

    setState(() {
      routepoints1.clear();
      routepoints1 = [];
      var route1 =
          jsonDecode(response1.body)['routes'][0]['geometry']['coordinates'];
      for (int i = 0; i < route1.length; i++) {
        var point = route1[i].toString();
        point = point.replaceAll("[", "");
        point = point.replaceAll("]", "");
        var lat1 = point.split(',');
        var long1 = point.split(",");
        routepoints1.add(LatLng(double.parse(lat1[1]), double.parse(long1[0])));
      }
    });

    isVisible = true;
    routeExists = true;
  }

  Future<LatLng> getCoordinatesFromAddress(String address) async {
    final query = Uri.encodeQueryComponent(address);
    final url = Uri.parse('https://nominatim.openstreetmap.org/search?q=$query&format=json&polygon=1&addressdetails=1');

    final response = await http.get(url);

    if (response.statusCode == 200) {
      final data = jsonDecode(response.body);
      if (data.isEmpty) {
        throw Exception('No coordinates found for $address');
      }
      final lat = double.parse(data[0]['lat']);
      final lon = double.parse(data[0]['lon']);
      return LatLng(lat, lon);
    } else {
      throw Exception('Failed to fetch coordinates for $address');
    }
  }

  Future<List<LatLng>> getRouteFromOSRM(LatLng start, LatLng end) async {
    final startCoords = '${start.longitude},${start.latitude}';
    final endCoords = '${end.longitude},${end.latitude}';
    final url = Uri.parse(
        'http://router.project-osrm.org/route/v1/driving/$startCoords;$endCoords?steps=true&geometries=polyline&overview=full');

    final response = await http.get(url);

    if (response.statusCode == 200) {
      final data = jsonDecode(response.body);
      if (data['code'] == 'Ok') {
        final route = data['routes'][0]['geometry'];
        List<LatLng> routePoints = decodePolyline(route);
        return routePoints;
      } else {
        throw Exception('Failed to fetch route from OSRM: ${data['message']}');
      }
    } else {
      throw Exception('Failed to fetch route from OSRM');
    }
  }

  List<LatLng> decodePolyline(String encoded) {
    List<LatLng> poly = [];
    int index = 0, lat = 0, lng = 0;

    while (index < encoded.length) {
      int b, shift = 0, result = 0;
      do {
        b = encoded.codeUnitAt(index++) - 63;
        result |= (b & 0x1f) << shift;
        shift += 5;
      } while (b >= 0x20);
      int dlat = ((result & 1) != 0 ? ~(result >> 1) : (result >> 1));
      lat += dlat;

      shift = 0;
      result = 0;
      do {
        b = encoded.codeUnitAt(index++) - 63;
        result |= (b & 0x1f) << shift;
        shift += 5;
      } while (b >= 0x20);
      int dlng = ((result & 1) != 0 ? ~(result >> 1) : (result >> 1));
      lng += dlng;

      LatLng p = LatLng((lat / 1E5).toDouble(), (lng / 1E5).toDouble());
      poly.add(p);
    }
    return poly;
  }

  void loadMapS() async {
    try {
      final destinationCoords = await getCoordinatesFromAddress(end.text);
      final route = await getRouteFromOSRM(currentLocation, destinationCoords);
      setState(() {
        isVisible = true;
        routeExists = true;
        routepoints1 = route;
      });
    } catch (e) {
      if (kDebugMode) {
        print(e);
      }
    }
  }
}
