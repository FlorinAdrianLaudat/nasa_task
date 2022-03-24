import 'package:flutter/material.dart';

class LoaderWidget extends StatelessWidget {
  const LoaderWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AbsorbPointer(
      child: Container(
        color: Colors.white.withOpacity(0.4),
        child: const Center(
          child: CircularProgressIndicator(
            strokeWidth: 2.5,
            valueColor: AlwaysStoppedAnimation<Color>(Colors.blueGrey),
          ),
        ),
      ),
    );
  }
}
