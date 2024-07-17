import 'package:flutter/material.dart';

class MapImage extends StatelessWidget {
  const MapImage({super.key});
  @override
  Widget build(BuildContext context) {
    return Image.asset("assets/images/map.jpeg",fit: BoxFit.fill);
  }
}


class DrowerIcon extends StatelessWidget {
  const DrowerIcon({super.key});
  @override
  Widget build(BuildContext context) {
    return  Image.asset("assets/icons/drower.png");
  }
}


class FireIcon extends StatelessWidget {
  const FireIcon({super.key});
  @override
  Widget build(BuildContext context) {
    return  Image.asset("assets/icons/fire.png");
  }
}


class LocationIcon extends StatelessWidget {
  const LocationIcon({super.key});
  @override
  Widget build(BuildContext context) {
    return  Image.asset("assets/icons/location.png");
  }
}