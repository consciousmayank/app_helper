import 'package:flutter/material.dart';
import 'package:helper_package/helper_package.dart';

class DesktopParentWidget extends StatelessWidget {
  final AppBar? appBar;
  final Widget body;
  final Widget? backgroundImage;
  const DesktopParentWidget({
    super.key,
    this.appBar,
    this.backgroundImage,
    required this.body,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appBar,
      body: Center(
        child: backgroundImage!=null ?
        Stack(
          alignment: Alignment.center,
          children: [
            backgroundImage!,
            centerContainer()
          ],
        ) : centerContainer(),
      ),
    );
  }

  Widget centerContainer() {
    return Container(
          color: Colors.green,
          width: kdDesktopMaxContentWidth,
          height: kdDesktopMaxContentHeight,
          child: body,
        );
  }
}
