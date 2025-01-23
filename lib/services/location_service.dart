import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:geocoding/geocoding.dart';
import 'package:geolocator/geolocator.dart';

Future<void> getGeoLocationPosition(BuildContext context, Function(Position) onPositionReceived) async {
  // ignore: deprecated_member_use
  Position position = await  Geolocator.getCurrentPosition(desiredAccuracy: LocationAccuracy.bestForNavigation);
  onPositionReceived(position);
}

Future<void> getAddressFromLongLat(Position position, Function(String) onAddressReceived) async {
  // Latitude itu horizontal
  // Longitude itu vertikal
  List<Placemark> placemark = await placemarkFromCoordinates(position.latitude, position.longitude);
  Placemark place = placemark[0];
  String address = "${place.street}, ${place.subLocality}, ${place.postalCode}, ${place.country}";
  // Akan diprosess kalo udah nerima addressnya
  onAddressReceived(address);
}

Future<bool> handleLocationPermission(BuildContext context) async {
  // Buat check enable atau enggak
  bool serviceEnabled = await Geolocator.isLocationServiceEnabled();

  // Kalo service-nya gak aktif
  if (!serviceEnabled) {
    ScaffoldMessenger.of(context).showSnackBar(SnackBar(
      content: Row(
        spacing: 10,
        children: [
          SvgPicture.asset(
            'assets/icons/fi-rr-location-alt.svg'
          ),
          Text(
            "Location services are disabled",
          )
        ],
      ),
      backgroundColor: Colors.blueGrey,
      shape: StadiumBorder(),
      behavior: SnackBarBehavior.floating,
    ));

    // Mengembalikan nilai salah. Dan dia memblokir aksi user
    return false;
  }

  // Syntax buat kondisi true.
  LocationPermission permission = await Geolocator.checkPermission();

  // Ketika udah di-popup, tapi ditolak user.
  if (permission == LocationPermission.denied) {
    permission = await Geolocator.requestPermission();
    if (permission == LocationPermission.denied) {
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
        content: Row(
          children: [
            SvgPicture.asset(
              'assets/icons/fi-rr-location.svg'
            ),
            Text(
              'Location permission denied'
            )
          ],
        ) ,
        backgroundColor: Colors.blueGrey,
        shape: StadiumBorder(),
        behavior: SnackBarBehavior.floating,
      ));
      // Memblokir aksi user
      return false;
    }
  }

  // Kalo udah bener-bener gabisa diakses, sampai minta di-uninstall
  if (permission == LocationPermission.deniedForever) {
    ScaffoldMessenger.of(context).showSnackBar(SnackBar(
      content: Row(
        children: [
          SvgPicture.asset(
            'assets/icons/fi-rr-map-marker-cross.svg'
          ),
          Text(
            'Location permission denied forever'
          )
        ],
      ) ,
      backgroundColor: Colors.blueGrey,
      shape: StadiumBorder(),
      behavior: SnackBarBehavior.floating,
    ));
    // Blokir lagi tapi selamanya awokawok
    return false;
  }

  // Ketika user sudah mengizinkan.
  return true;
}