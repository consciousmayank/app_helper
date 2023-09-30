import 'package:flutter/material.dart';
import 'package:helper_package/helper_package.dart';

class AnimatedSwitch extends StatefulWidget {
  final Function({required bool value}) onValueChanged;
  final Widget switchOn, switchOff;
  final Color switchOnColor, switchOffColor;
  final Size size;
  const AnimatedSwitch({
    super.key,
    required this.onValueChanged,
    required this.switchOff,
    required this.switchOn,
    this.size = const Size(100, 40),
    this.switchOnColor = Colors.green,
    this.switchOffColor = Colors.red,
  });

  @override
  _AnimatedSwitchState createState() => _AnimatedSwitchState();
}

class _AnimatedSwitchState extends State<AnimatedSwitch> {
  var isEnabled = true;
  final animationDuration = const Duration(milliseconds: 150);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        setState(() {
          isEnabled = !isEnabled;
          widget.onValueChanged(value: isEnabled)?.call();
        });
      },
      child: Card(
        shape: getCardShape(radius: 30),
        child: AnimatedContainer(
          height: widget.size.height,
          width: widget.size.width,
          duration: animationDuration,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(30),
            color: isEnabled ? widget.switchOnColor : widget.switchOffColor,
            border: Border.all(color: Colors.white, width: 2),
          ),
          child: Stack(
            alignment: Alignment.center,
            children: [
              AnimatedAlign(
                duration: animationDuration,
                alignment:
                    isEnabled ? Alignment.centerRight : Alignment.centerLeft,
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 2),
                  child: AnimatedContainer(
                    duration: animationDuration,
                    width: widget.size.width * 0.50,
                    height: widget.size.height * 0.75,
                    decoration: BoxDecoration(
                      shape: BoxShape.rectangle,
                      color: Colors.white,
                      borderRadius: BorderRadius.only(
                        topLeft: !isEnabled
                            ? const Radius.circular(30)
                            : Radius.circular(getDefaultRadius),
                        topRight: isEnabled
                            ? const Radius.circular(30)
                            : Radius.circular(getDefaultRadius),
                        bottomLeft: !isEnabled
                            ? const Radius.circular(30)
                            : Radius.circular(getDefaultRadius),
                        bottomRight: isEnabled
                            ? const Radius.circular(30)
                            : Radius.circular(getDefaultRadius),
                      ),
                    ),
                    child: Center(
                      child: AnimatedCrossFade(
                        duration: animationDuration,
                        firstChild: widget.switchOn,
                        secondChild: widget.switchOff,
                        crossFadeState: isEnabled
                            ? CrossFadeState.showFirst
                            : CrossFadeState.showSecond,
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
