import 'package:check/ui/common/index.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter/material.dart';

const double appButtonHeight = 54;
const double appButtonBorderRadius = 5;

class AppButton extends StatelessWidget {
  const AppButton.text({
    Key? key,
    required this.onPressed,
    required this.appButtonText,
    this.appButtonTextFontSize,
    this.width,
    this.height = appButtonHeight,
  })  : icon = null,
        type = AppButtonType.text,
        super(key: key);

  const AppButton.centerIcon({
    Key? key,
    required this.onPressed,
    required this.icon,
    this.width,
    this.height = appButtonHeight,
  })  : appButtonText = null,
        type = AppButtonType.centerIcon,
        appButtonTextFontSize = null,
        super(key: key);

  final String? appButtonText;
  final double height;
  final VoidCallback? onPressed;
  final double? width, appButtonTextFontSize;
  final Widget? icon;
  final AppButtonType type;

  Widget getProperChild() {
    switch (type) {
      case AppButtonType.text:
        return AppButtonTextWidget(
            appButtonText: appButtonText, fontSize: appButtonTextFontSize);

      case AppButtonType.centerIcon:
        return icon!;
      case AppButtonType.leftIconCenterText:
      // TODO: Handle this case.
      case AppButtonType.rightIconCenterText:
      // TODO: Handle this case.
      case AppButtonType.leftIconRightText:
      // TODO: Handle this case.
      case AppButtonType.righticonLeftText:
      // TODO: Handle this case.
      default:
        return AppButtonTextWidget(
          appButtonText: appButtonText,
          fontSize: appButtonTextFontSize,
        );
    }
  }

  @override
  Widget build(BuildContext context) {
    final borderRadius = BorderRadius.circular(appButtonBorderRadius.sp);
    return Container(
      width: width?.w,
      height: height.h,
      decoration: BoxDecoration(borderRadius: borderRadius, color: color5ef5),
      child: ElevatedButton(
        onPressed: onPressed,
        style: ButtonStyle(
          elevation: MaterialStateProperty.all(0),
          backgroundColor: MaterialStateProperty.all(Colors.transparent),
          shape: MaterialStateProperty.all(
            RoundedRectangleBorder(
              borderRadius: borderRadius,
            ),
          ),
        ),
        child: getProperChild(),
      ),
    );
  }
}

class AppButtonTextWidget extends StatelessWidget {
  const AppButtonTextWidget({
    Key? key,
    required this.appButtonText,
    this.fontSize,
  }) : super(key: key);

  final String? appButtonText;
  final double? fontSize;

  @override
  Widget build(BuildContext context) {
    return RichText(
        text: TextSpan(
      text: appButtonText!,
      style: TextStyle(
          fontSize: fontSize, color: colorWhite, fontWeight: FontWeight.w700),
    ));
  }
}

enum AppButtonType {
  text,
  centerIcon,
  leftIconCenterText,
  rightIconCenterText,
  leftIconRightText,
  righticonLeftText,
}
