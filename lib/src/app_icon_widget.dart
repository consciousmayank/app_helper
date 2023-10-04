import 'dart:convert';
import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

const Color iconBg = Color(0xFFF6F6F6);
const double iconBorderRadius = 10;

class AppIconWidget extends StatelessWidget {
  final IconTypes iconType;
  final CustomPainter? painter;
  final BoxFit imageFit;
  final bool showRoundedBorder;
  final Size? size;
  final String? iconsBase64String, svgString;

  const AppIconWidget.painter({
    Key? key,
    required this.painter,
    this.imageFit = BoxFit.contain,
    this.size,
  })  : iconType = IconTypes.painter,
        showRoundedBorder = true,
        iconsBase64String = null,
        svgString = null,
        super(key: key);

  const AppIconWidget.painterNonBordered({
    Key? key,
    required this.painter,
    this.imageFit = BoxFit.contain,
    this.size,
  })  : iconType = IconTypes.painter,
        showRoundedBorder = false,
        iconsBase64String = null,
        svgString = null,
        super(key: key);

  const AppIconWidget.svgStringBordered({
    Key? key,
    this.size,
    required this.svgString,
    this.imageFit = BoxFit.contain,
  })  : iconType = IconTypes.svg,
        painter = null,
        showRoundedBorder = true,
        iconsBase64String = null,
        super(key: key);

  const AppIconWidget.svgStringNonBordered({
    Key? key,
    this.size,
    required this.svgString,
    this.imageFit = BoxFit.contain,
  })  : iconType = IconTypes.svg,
        painter = null,
        showRoundedBorder = false,
        iconsBase64String = null,
        super(key: key);

  const AppIconWidget.png({
    Key? key,
    this.size,
    this.imageFit = BoxFit.contain,
  })  : iconType = IconTypes.png,
        painter = null,
        showRoundedBorder = true,
        iconsBase64String = null,
        svgString = null,
        super(key: key);

  const AppIconWidget.borderedBase64({
    Key? key,
    this.size,
    this.imageFit = BoxFit.contain,
    required this.iconsBase64String,
  })  : iconType = IconTypes.bas64,
        painter = null,
        showRoundedBorder = true,
        svgString = null,
        super(key: key);

  @override
  Widget build(BuildContext context) {
    return showRoundedBorder
        ? Container(
            alignment: Alignment.center,
            height: 44,
            width: 44,
            decoration: BoxDecoration(
              color: iconBg,
              borderRadius: BorderRadius.circular(
                iconBorderRadius,
              ),
            ),
            child: getProperIcon(iconSize: size),
          )
        : getProperIcon(iconSize: size);
  }

  getProperIcon({Size? iconSize}) {
    switch (iconType) {
      case IconTypes.painter:
        return CustomPainterWidgetWidget(
          painter: painter,
          iconSize: iconSize,
        );
      case IconTypes.bas64:
        return getImageFrom(
          imageSize: iconSize ?? const Size(20, 20),
          base64String: iconsBase64String,
        );
      case IconTypes.svg:
        return SvgPicture.string(
          svgString!,
          height: size?.height ?? 20,
          width: size?.width ?? 20,
          fit: imageFit,
        );
      case IconTypes.png:
        // in future if we need to return an svg.

        return CustomPainterWidgetWidget(painter: painter);
    }
  }

  Widget getImageFrom({
    String? base64String,
    required Size imageSize,
    Widget? imageErrorWidget,
  }) {
    if (base64String == null) {
      return const Icon(Icons.error);
    } else {
      Uint8List image = const Base64Decoder()
          .convert(base64String.replaceAll(RegExp(r'\s+'), ''));

      if (image.isNotEmpty) {
        return Image.memory(
          image,
          height: imageSize.height,
          width: imageSize.width,
          fit: BoxFit.cover,
          errorBuilder: (context, error, stackTrace) =>
              imageErrorWidget ?? const Icon(Icons.error),
        );
      } else {
        return imageErrorWidget ?? const Icon(Icons.error);
      }
    }
  }
}

class CustomPainterWidgetWidget extends StatelessWidget {
  final CustomPainter? painter;
  final Size? iconSize;

  const CustomPainterWidgetWidget({
    this.iconSize,
    Key? key,
    required this.painter,
  }) : super(key: key);

  const CustomPainterWidgetWidget.customSize({
    Key? key,
    required this.painter,
    required this.iconSize,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CustomPaint(
      painter: painter,
      size: iconSize ?? const Size(20, 20),
    );
  }
}

enum IconTypes { painter, svg, png, bas64 }
