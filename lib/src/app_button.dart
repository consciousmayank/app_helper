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
    required this.btnBg,
    this.buttonTextColor = Colors.white,
  })  : icon = null,
        type = AppButtonType.text,
        super(key: key);

  const AppButton.centerIcon({
    Key? key,
    required this.onPressed,
    required this.icon,
    this.width,
    required this.btnBg,
    this.buttonTextColor = Colors.white,
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
  final Color btnBg, buttonTextColor;

  Widget getProperChild() {
    switch (type) {
      case AppButtonType.text:
        return AppButtonTextWidget(
          appButtonText: appButtonText,
          fontSize: appButtonTextFontSize,
          buttonTextColor: buttonTextColor,
        );

      case AppButtonType.centerIcon:
        return icon!;
      case AppButtonType.leftIconCenterText:
      case AppButtonType.rightIconCenterText:
      case AppButtonType.leftIconRightText:
      case AppButtonType.righticonLeftText:
        return AppButtonTextWidget(
          appButtonText: appButtonText,
          fontSize: appButtonTextFontSize,
          buttonTextColor: buttonTextColor,
        );
    }
  }

  @override
  Widget build(BuildContext context) {
    final borderRadius = BorderRadius.circular(appButtonBorderRadius);
    return Container(
      width: width,
      height: height,
      decoration: BoxDecoration(borderRadius: borderRadius, color: btnBg),
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
  final Color buttonTextColor;
  const AppButtonTextWidget({
    Key? key,
    this.buttonTextColor = Colors.white,
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
        fontSize: fontSize,
        color: Colors.white,
        fontWeight: FontWeight.w700,
      ),
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
