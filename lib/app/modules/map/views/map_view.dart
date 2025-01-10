import 'package:eviq/app/constants/image_constant.dart';
import 'package:eviq/app/modules/map/views/map.dart';
import 'package:eviq/app/services/colors.dart';
import 'package:eviq/app/services/responsive_size.dart';
import 'package:eviq/app/services/text_style_util.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/map_controller.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class MapView extends GetView<MapController> {
  const MapView({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Stack(
      children: [
        MapScreen(),
        // GoogleMap(
        //   initialCameraPosition:
        //       CameraPosition(target: LatLng(40.710751, -74.008330), zoom: 16),
        // ),
        IgnorePointer(
          child: Container(
            height: 197.kh,
            width: 412.kw,
            decoration: BoxDecoration(
                gradient: LinearGradient(
                    begin: Alignment.bottomCenter,
                    end: Alignment.topCenter,
                    colors: [
                  ColorUtil.kcPrimaryColor.withOpacity(0.0),
                  ColorUtil.kcPrimaryColor.withOpacity(0.2),
                  ColorUtil.kcPrimaryColor.withOpacity(0.3),
                  ColorUtil.kcPrimaryColor.withOpacity(0.4),
                  ColorUtil.kcPrimaryColor.withOpacity(0.5),
                ])),
          ),
        ),
        Positioned(
          top: 63,
          left: 20,
          right: 20,
          child: Card(
            elevation: 0,
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.all(Radius.circular(14))),
            child: Padding(
              padding: const EdgeInsets.all(12.0),
              child: Row(
                children: [
                  Expanded(
                    child: TextField(
                      decoration: InputDecoration(
                        hintText: 'Search station',
                        hintStyle: TextStyleUtil.cairo400(fontSize: 16),
                        prefixIcon:
                            Icon(Icons.search, color: ColorUtil.grey500),
                        filled: true,
                        fillColor: ColorUtil.grey400,
                        contentPadding:
                            EdgeInsets.symmetric(vertical: 18, horizontal: 20),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(12),
                          borderSide: BorderSide.none,
                        ),
                        enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(12),
                          borderSide: BorderSide.none,
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(12),
                          borderSide: BorderSide.none,
                        ),
                      ),
                      onChanged: (value) {},
                    ),
                  ),
                  16.kwidthBox,
                  Card(
                    elevation: 0,
                    color: ColorUtil.grey400,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.all(Radius.circular(14))),
                    child: Padding(
                      padding: const EdgeInsets.all(16.0),
                      child: Image.asset(ImageConstant.filterIcon),
                    ),
                  )
                ],
              ),
            ),
          ),
        )
      ],
    ));
  }
}
