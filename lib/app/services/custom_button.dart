import 'package:flutter/material.dart';
import 'responsive_size.dart';
import 'colors.dart';
import 'text_style_util.dart';

class CustomButton extends StatelessWidget {
  final String title;
  final bool disabled;
  final bool isloading;
  final void Function()? onTap;
  final bool outline;
  final Widget? leading;
  final Widget? trailing;
  final LinearGradient? linearGradient;
  final Color? color;
  final double? borderRadius;

  const CustomButton({
    super.key,
    required this.title,
    this.disabled = false,
    this.isloading = false,
    this.onTap,
    this.leading,
    this.trailing,
    this.linearGradient,
    this.color,
    this.borderRadius,
  }) : outline = false;

  const CustomButton.outline({
    super.key,
    required this.title,
    this.onTap,
    this.leading,
    this.trailing,
    this.linearGradient,
    this.color,
    this.borderRadius,
  })  : disabled = false,
        isloading = false,
        outline = true;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        InkWell(
          onTap: onTap,
          child: Container(
            width: double.infinity,
            height: 48.kh,
            alignment: Alignment.center,
            decoration: !outline
                ? BoxDecoration(
                    // color: !disabled ? color ?? ColorUtil.kcPrimaryColor : color ?? ColorUtil.kcMediumGreyColor,
                    borderRadius: BorderRadius.circular(borderRadius ?? 12.kh),
                    // gradient: linearGradient ??
                    //     LinearGradient(begin: Alignment(0, 0), end: Alignment(0, 0), colors: [
                    //       !disabled ? color ?? ColorUtil. : color ?? ColorUtil.kcMediumGreyColor,
                    //       !disabled ? color ?? ColorUtil.kcPrimaryColor : color ?? ColorUtil.kcMediumGreyColor
                    //     ]),
                  )
                : BoxDecoration(
                    color: Colors.transparent,
                    borderRadius: BorderRadius.circular(borderRadius ?? 12.kh),
                    border: Border.all(
                      color: color ?? Colors.red,
                      width: 1,
                    )),
            child: !isloading
                ? Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      if (leading != null) leading!,
                      if (leading != null) SizedBox(width: 5.kw),
                      Text(
                        title,
                      ),
                      if (trailing != null) SizedBox(width: 5.kw),
                      if (trailing != null) trailing!,
                    ],
                  )
                : CircularProgressIndicator(
                    strokeWidth: 8,
                    valueColor: AlwaysStoppedAnimation(Colors.white),
                  ),
          ),
        ),
        Material(
          color: Colors.transparent,
          child: InkWell(
            onTap: () {},
            child: Ink(
              width: double.infinity,
              height: 48.kh,
            ),
          ),
        ),
      ],
    );
  }
}

ElevatedButton customRoundedButton({String? title, Function()? onPressed}) {
  return ElevatedButton(
      style: ElevatedButton.styleFrom(
          elevation: 0,
          shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.all(Radius.circular(12))),
          backgroundColor: ColorUtil.kcPrimaryColor),
      onPressed: onPressed,
      child: Text(
        title!,
        style: TextStyleUtil.inter600(
            fontSize: 16, color: ColorUtil.kcPrimaryWhite),
      ));
}
ElevatedButton customOutlinedButton({String? title, Function()? onPressed}) {
  return ElevatedButton(
      style: ElevatedButton.styleFrom(
          elevation: 0,
          shape: RoundedRectangleBorder(side: BorderSide(color: ColorUtil.kcPrimaryColor),
              borderRadius: BorderRadius.all(Radius.circular(12))),
          backgroundColor: ColorUtil.kcPrimaryWhite),
      onPressed: onPressed,
      child: Text(
        title!,
        style: TextStyleUtil.inter600(
            fontSize: 16, color: ColorUtil.kcPrimaryColor),
      ));
}
