import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:connect_himal/res/app_color.dart';
import 'package:connect_himal/res/barrel_file.dart';

class CustomLoadingIndicator extends StatelessWidget {
  const CustomLoadingIndicator({super.key, this.color});
  final Color? color;

  @override
  Widget build(BuildContext context) {
    if (Theme.of(context).platform == TargetPlatform.iOS) {
      return Center(
        child: CupertinoActivityIndicator(
          color: color ?? primaryColor,
        ),
      );
    } else {
      return Center(
        child: CircularProgressIndicator(
          color: color ?? primaryColor,
        ),
      );
    }
  }
}
