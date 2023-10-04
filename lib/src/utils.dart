import 'dart:math';

import 'package:flutter/material.dart';
import 'package:helper_package/helper_package.dart';

void hideKeyboard({required BuildContext context, FocusNode? focusNode}) {
  if (focusNode != null) {
    focusNode.unfocus();
  } else {
    FocusScopeNode currentFocus = FocusScope.of(context);
    if (!currentFocus.hasPrimaryFocus && currentFocus.focusedChild != null) {
      currentFocus.focusedChild?.unfocus();
    }
  }
}

TextStyle inputTextHintStyle({
  required TextStyle textStyle,
}) =>
    textStyle.copyWith(
      fontWeight: FontWeight.w500,
      color: Colors.grey[600],
    );

TextStyle inputTextErrorStyle({
  required TextStyle textStyle,
}) =>
    textStyle.copyWith(
      fontWeight: FontWeight.w800,
      fontStyle: FontStyle.italic,
      color: Colors.red,
    );
double get getDefaultElevation => 8;

RoundedRectangleBorder getCardShape({double? radius}) {
  return RoundedRectangleBorder(
    borderRadius: getBorderRadius(
      radius: radius,
    ),
  );
}

getBorderRadius({double? radius}) {
  return BorderRadius.circular(
    radius ?? getDefaultRadius,
  );
}

double get getDefaultRadius => 8;

NavigationRailDestination buildRotatedTextRailDestination(
    String text, double padding) {
  return NavigationRailDestination(
    icon: const SizedBox.shrink(),
    label: Padding(
      padding: EdgeInsets.symmetric(vertical: padding),
      child: RotatedBox(
        quarterTurns: 1,
        child: Text(text),
      ),
    ),
  );
}

RoundedRectangleBorder get roundedRectangularShape => RoundedRectangleBorder(
      borderRadius: defaultBorderRadius,
    );
get defaultBorderRadius => BorderRadius.circular(defaultBorder);
double get defaultBorder => 4;

//From Stacked

const double _tinySize = 5.0;
const double _smallSize = 10.0;
const double _mediumSize = 25.0;
const double _largeSize = 50.0;
const double _massiveSize = 120.0;

const Widget horizontalSpaceTiny = SizedBox(width: _tinySize);
const Widget horizontalSpaceSmall = SizedBox(width: _smallSize);
const Widget horizontalSpaceMedium = SizedBox(width: _mediumSize);
const Widget horizontalSpaceLarge = SizedBox(width: _largeSize);

const Widget verticalSpaceTiny = SizedBox(height: _tinySize);
const Widget verticalSpaceSmall = SizedBox(height: _smallSize);
const Widget verticalSpaceMedium = SizedBox(height: _mediumSize);
const Widget verticalSpaceLarge = SizedBox(height: _largeSize);
const Widget verticalSpaceMassive = SizedBox(height: _massiveSize);

Widget spacedDivider = const Column(
  children: <Widget>[
    verticalSpaceMedium,
    Divider(color: Colors.blueGrey, height: 5.0),
    verticalSpaceMedium,
  ],
);

/// The max width the content can ever take up on the screen
const double kdDesktopMaxContentWidth = 1150;

// The max height the homeview will take up
const double kdDesktopMaxContentHeight = 750;

Widget verticalSpace(double height) => SizedBox(height: height);

double screenWidth(BuildContext context) => MediaQuery.of(context).size.width;
double screenHeight(BuildContext context) => MediaQuery.of(context).size.height;

double screenHeightFraction(BuildContext context,
        {int dividedBy = 1, double offsetBy = 0, double max = 3000}) =>
    min((screenHeight(context) - offsetBy) / dividedBy, max);

double screenWidthFraction(BuildContext context,
        {int dividedBy = 1, double offsetBy = 0, double max = 3000}) =>
    min((screenWidth(context) - offsetBy) / dividedBy, max);

double halfScreenWidth(BuildContext context) =>
    screenWidthFraction(context, dividedBy: 2);

double thirdScreenWidth(BuildContext context) =>
    screenWidthFraction(context, dividedBy: 3);

double quarterScreenWidth(BuildContext context) =>
    screenWidthFraction(context, dividedBy: 4);

double getResponsiveHorizontalSpaceMedium(BuildContext context) =>
    screenWidthFraction(context, dividedBy: 10);
double getResponsiveSmallFontSize(BuildContext context) =>
    getResponsiveFontSize(context, fontSize: 14, max: 15);

double getResponsiveMediumFontSize(BuildContext context) =>
    getResponsiveFontSize(context, fontSize: 16, max: 17);

double getResponsiveLargeFontSize(BuildContext context) =>
    getResponsiveFontSize(context, fontSize: 21, max: 31);

double getResponsiveExtraLargeFontSize(BuildContext context) =>
    getResponsiveFontSize(context, fontSize: 25);

double getResponsiveMassiveFontSize(BuildContext context) =>
    getResponsiveFontSize(context, fontSize: 30);

double getResponsiveFontSize(BuildContext context,
    {double? fontSize, double? max}) {
  max ??= 100;

  var responsiveSize = min(
      screenWidthFraction(context, dividedBy: 10) * ((fontSize ?? 100) / 100),
      max);

  return responsiveSize;
}

({bool formHasErrors, String output}) notEmpty({
  required ({
    bool formHasErrors,
    String output,
  }) errorRecord,
  required String? value,
  required String? viewName,
  required Function({
    required String errorMessage,
  }) onValidationFailed,
}) {
  InputValidators validators = InputValidators();

  if (validators.fieldNotEmpty(value)) {
    onValidationFailed(errorMessage: cannotBeEmpty(viewName: viewName))?.call();

    return (
      formHasErrors: true,
      output: '${errorRecord.output}\n- ${cannotBeEmpty(viewName: viewName)}'
    );
  }

  return errorRecord;
}

({bool formHasErrors, String output}) notValid({
  required ({
    bool formHasErrors,
    String output,
  }) errorRecord,
  required String? value,
  required String? viewName,
  required Function({
    required String errorMessage,
  }) onValidationFailed,
}) {
  InputValidators validators = InputValidators();

  if (validators.fieldNotEmpty(value)) {
    onValidationFailed(errorMessage: isNotValid(viewName: viewName))?.call();

    return (
      formHasErrors: true,
      output: '${errorRecord.output}\n- ${isNotValid(viewName: viewName)}'
    );
  }

  return errorRecord;
}

String cannotBeEmpty({required viewName}) => '$viewName cannot be empty';

String get passwordsDoNotMatch => 'Passwords don\'t match';

String isNotValid({required viewName}) => '$viewName is not Valid';

String isNotProperLength({required viewName, required int length}) =>
    'Needs to be $length characters/numbers';

bool isInputFieldValueEmpty({
  required String? inputFieldValue,
}) {
  InputValidators validators = InputValidators();

  if (validators.fieldNotEmpty(inputFieldValue)) {
    return true;
  }

  return false;
}
