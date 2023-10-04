import 'package:flutter/material.dart';
import 'package:helper_package/helper_package.dart';

class DesktopParentWidget extends StatelessWidget {
  final AppBar? appBar;
  final Widget body;
  final Widget? backgroundImage;
  final Color? containerColor;
  final double? desktopMaxContentWidth, desktopMaxContentHeight;
  const DesktopParentWidget({
    super.key,
    this.appBar,
    this.backgroundImage,
    this.containerColor,
    this.desktopMaxContentHeight,
    this.desktopMaxContentWidth,
    required this.body,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appBar,
      body: Center(
        child: backgroundImage != null
            ? Stack(
                alignment: Alignment.center,
                children: [backgroundImage!, centerContainer()],
              )
            : centerContainer(),
      ),
    );
  }

  Widget centerContainer() {
    return Container(
      color: containerColor,
      width: desktopMaxContentWidth ?? kdDesktopMaxContentWidth,
      height: desktopMaxContentHeight ?? kdDesktopMaxContentHeight,
      child: body,
    );
  }
}
