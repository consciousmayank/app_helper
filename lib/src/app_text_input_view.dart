import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

///A widget which produces a Text Widget
class AppTextInputView extends StatelessWidget {
  const AppTextInputView({
    Key? key,
    this.inputDecoration,
    this.defaultTextStyle,
    this.hintTextStyle,
    this.errorTextStyle,
    this.suffixIconColor,
    this.textValidator,
    this.textInputAction = TextInputAction.next,
    this.focusNode,
    this.controller,
    this.onEditingComplete,
    this.onFieldSubmitted,
    this.onTextChange,
    this.hint,
    this.errorText,
    this.inputFormatters,
    this.defaultTextAlignment = TextAlign.start,
    this.textCapitalization = TextCapitalization.none,
    this.keyboardType = TextInputType.text,
  })  : onButtonPressed = null,
        obscureText = null,
        super(
          key: key,
        );

  const AppTextInputView.password({
    Key? key,
    required this.obscureText,
    this.inputDecoration,
    this.defaultTextStyle,
    this.hintTextStyle,
    this.errorTextStyle,
    this.suffixIconColor,
    this.textValidator,
    this.textInputAction = TextInputAction.next,
    this.focusNode,
    this.controller,
    this.onEditingComplete,
    this.onFieldSubmitted,
    this.onTextChange,
    this.onButtonPressed,
    this.hint,
    this.errorText,
    this.inputFormatters,
    this.defaultTextAlignment = TextAlign.start,
    this.textCapitalization = TextCapitalization.none,
  })  : keyboardType = TextInputType.visiblePassword,
        super(key: key);

  final TextEditingController? controller;
  final FocusNode? focusNode;
  final String? hint;
  final InputDecoration? inputDecoration;
  final TextInputType keyboardType;
  final bool? obscureText;
  final VoidCallback? onButtonPressed;
  final VoidCallback? onEditingComplete;
  final ValueChanged<String>? onFieldSubmitted;
  final ValueChanged<String>? onTextChange;
  final TextInputAction textInputAction;
  final FormFieldValidator<String>? textValidator;
  final TextStyle? defaultTextStyle, errorTextStyle, hintTextStyle;
  final Color? suffixIconColor;
  final String? errorText;
  final List<TextInputFormatter>? inputFormatters;
  final TextCapitalization textCapitalization;
  final TextAlign defaultTextAlignment;

  InputDecoration getInputDecorationForForms({
    required BuildContext context,
    String? innerHintText,
  }) {
    return getProperInputDecoration(context: context).copyWith(
      suffixIcon: onButtonPressed == null
          ? null
          : InkWell(
              onTap: onButtonPressed,
              child: obscureText ?? false
                  ? Icon(
                      Icons.visibility_off,
                      size: 20,
                      color: suffixIconColor,
                    )
                  : Icon(
                      Icons.visibility,
                      size: 20,
                      color: suffixIconColor,
                    ),
            ),
      labelText: innerHintText,
      labelStyle: hintTextStyle,
      floatingLabelBehavior: FloatingLabelBehavior.auto,
      errorText: errorText,
      errorStyle: errorTextStyle?.copyWith(
        color: Colors.red,
        fontWeight: FontWeight.w400,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      textCapitalization: textCapitalization,
      key: key,
      obscureText: obscureText ?? false,
      style: defaultTextStyle,
      keyboardType: keyboardType,
      validator: textValidator,
      decoration: getInputDecorationForForms(
        context: context,
        innerHintText: hint,
      ),
      textAlign: defaultTextAlignment,
      controller: controller,
      focusNode: focusNode,
      onChanged: onTextChange,
      onEditingComplete: onEditingComplete,
      onFieldSubmitted: onFieldSubmitted,
      inputFormatters: getInputFormatter(
        inputFormatter: inputFormatters,
      ),
    );
  }

  List<TextInputFormatter> getInputFormatter(
      {List<TextInputFormatter>? inputFormatter}) {
    List<TextInputFormatter> formatter = [
      FilteringTextInputFormatter.deny(
        RegExp(
          '(\u00a9|\u00ae|[\u2000-\u3300]|\ud83c[\ud000-\udfff]|\ud83d[\ud000-\udfff]|\ud83e[\ud000-\udfff])',
        ),
      ),
    ];
    if (inputFormatter != null) {
      formatter.addAll(inputFormatter);
    }

    return formatter;
  }

  InputDecoration getProperInputDecoration({
    required BuildContext context,
  }) {
    if (inputDecoration == null) {
      return const InputDecoration().applyDefaults(
        Theme.of(context).inputDecorationTheme,
      );
    } else {
      return inputDecoration!;
    }
  }
}
