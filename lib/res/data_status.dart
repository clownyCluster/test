import 'package:flutter/material.dart';
import 'barrel_file.dart';

class CustomDataStatusWidget extends StatelessWidget {
  final DataStatus status;
  final Widget? loadingStatus;
  final Widget successStatus;
  final Widget errorStatus;

  const CustomDataStatusWidget({
    Key? key,
    required this.status,
    this.loadingStatus,
    required this.successStatus,
    required this.errorStatus,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    switch (status) {
      case DataStatus.Loading:
        return Center(child: loadingStatus ?? CustomLoadingIndicator());
      case DataStatus.Completed:
        return successStatus;
      case DataStatus.Error:
        return Center(child: errorStatus);
      default:
        return Container();
    }
  }
}
