import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

class Spin extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Center(
        child: SpinKitCircle(
          color: Colors.blueAccent,
          size: 50.0,
        ),
      ),
    );
  }
}
