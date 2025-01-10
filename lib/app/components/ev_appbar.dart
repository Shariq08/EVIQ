import 'package:eviq/app/services/colors.dart';
import 'package:eviq/app/services/text_style_util.dart';
import 'package:flutter/material.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_navigation/get_navigation.dart';

class EVAppbar extends StatelessWidget implements PreferredSizeWidget {
  final String title;
  final bool hasLeading;
  final VoidCallback? onLeadingPressed;
  final List<Widget> actions;

  const EVAppbar({
    required this.title,
    this.hasLeading = true,
    this.onLeadingPressed,
    this.actions = const [],
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: Text(
        title,
        style: TextStyleUtil.cairo600(
          fontSize: 18,
        ),
      ),
      leading: IconButton(
          onPressed: () {
            Get.back();
          },
          icon: Icon(
            Icons.arrow_back,
          )),
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
