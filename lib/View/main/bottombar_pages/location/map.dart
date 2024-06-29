import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class MapPage extends StatefulWidget {
  const MapPage({Key? key}) : super(key: key);

  @override
  _MapPageState createState() => _MapPageState();
}

class _MapPageState extends State<MapPage> {
  late GoogleMapController mapController;
  LatLng _initialLocation = const LatLng(7.8731, 80.7718); // Center of Sri Lanka
  final Set<Marker> _markers = {};

  @override
  void initState() {
    super.initState();
    _addVetMarkers();
  }

  void _addVetMarkers() {
    // Example: Fetch markers from a service or hard-code them as needed
    _markers.addAll([
      Marker(
        markerId: MarkerId('Vet1'),
        position: LatLng(6.9271, 79.8612), // Example coordinates for Colombo
        infoWindow: InfoWindow(title: 'Colombo Veterinary Hospital'),
      ),
      Marker(
        markerId: MarkerId('Vet2'),
        position: LatLng(7.2906, 80.6337), // Example coordinates for Kandy
        infoWindow: InfoWindow(title: 'Kandy Veterinary Clinic'),
      ),
      Marker(
        markerId: MarkerId('Vet3'),
        position: LatLng(6.0535, 80.2200), // Example coordinates for Galle
        infoWindow: InfoWindow(title: 'Galle Veterinary Services'),
      ),
      // Add more markers as needed
    ]);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
     
      body: GoogleMap(
        onMapCreated: (controller) {
          mapController = controller;
        },
        initialCameraPosition: CameraPosition(
          target: _initialLocation,
          zoom: 7.0, // Adjust zoom level as needed
        ),
        markers: _markers,
      ),
    );
  }
}
