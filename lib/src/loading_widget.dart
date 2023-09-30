import 'package:flutter/material.dart';

class LoadingWidget extends StatelessWidget {
  const LoadingWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: SizedBox.fromSize(
        size: const Size(kToolbarHeight, kToolbarHeight),
        child: const CircularProgressIndicator(),
      ),
    );
  }
}
