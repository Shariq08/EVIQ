import 'dart:typed_data';

import 'package:eviq/app/constants/image_constant.dart';
import 'package:eviq/app/modules/map/views/gist.dart';
import 'package:eviq/app/services/colors.dart';
import 'package:eviq/app/services/responsive_size.dart';
import 'package:eviq/app/services/text_style_util.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class MapScreen extends StatefulWidget {
  const MapScreen({super.key});

  @override
  _MapScreenState createState() => _MapScreenState();
}

class _MapScreenState extends State<MapScreen> {
  List<Marker> markers = [];

  @override
  Widget build(BuildContext context) {
    return GoogleMap(
      buildingsEnabled: false,
      initialCameraPosition:
          CameraPosition(target: LatLng(40.712776, -74.005974), zoom: 16),
      markers: markers.toSet(),
      onTap: (argument) {},
    );
  }

  @override
  void initState() {
    super.initState();

    MarkerGenerator(markerWidgets(), (bitmaps) {
      setState(() {
        markers = mapBitmapsToMarkers(bitmaps);
      });
    }).generate(context);
  }

  List<Marker> mapBitmapsToMarkers(List<Uint8List> bitmaps) {
    List<Marker> markersList = [];
    bitmaps.asMap().forEach((i, bmp) {
      markersList.add(Marker(
          markerId: MarkerId('currentlocation'),
          position: LatLng(40.712776, -74.005974),
          onTap: () {},
          icon: BitmapDescriptor.fromBytes(bmp)));
    });
    return markersList;
  }
}

// Example of marker widget
Widget _getMarkerWidget(String name) {
  return GestureDetector(
      onTap: () {},
      child: Container(
        height: 295.kh,
        width: 287.kw,
        decoration: BoxDecoration(
            color: ColorUtil.green800.withOpacity(0.12),
            shape: BoxShape.circle),
        child: Center(
          child: Container(
            height: 138.kh,
            width: 135.kw,
            decoration: BoxDecoration(
                color: ColorUtil.green800.withOpacity(0.3),
                shape: BoxShape.circle),
            child: Center(
              child: Container(
                height: 60.kh,
                width: 58.kw,
                decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    border:
                        Border.all(color: ColorUtil.kcPrimaryWhite, width: 2)),
                child: ClipOval(
                  child: Image.asset(
                    ImageConstant.mapProfile,
                    fit: BoxFit.fill,
                  ),
                ),
              ),
            ),
          ),
        ),
      ));
}

// Example of backing data
List<ChargerStation> chargerList = [
  ChargerStation("Thomas Hill Organics1", LatLng(40.712776, -74.005974)),
];

List<Widget> markerWidgets() {
  return chargerList.map((c) => _getMarkerWidget(c.name)).toList();
}

class ChargerStation {
  final String name;
  final LatLng position;

  ChargerStation(this.name, this.position);
}
