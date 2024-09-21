import 'package:connect_himal/view/viewImage.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

import '../res/barrel_file.dart';

class CachedImage extends StatelessWidget {
  CachedImage(
      {super.key,
      this.fit,
      this.view,
      required this.image,
      this.height,
      this.width,
      this.borderRadius});

  final String? image;
  final double? height;
  final double? width;
  final double? borderRadius;
  final bool? view;
  final BoxFit? fit;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: view == true
          ? () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => ViewImage(
                            image: image,
                          )));
            }
          : null,
      child: ClipRRect(
        borderRadius: BorderRadius.circular(borderRadius ?? 10),
        child: CachedNetworkImage(
          imageUrl: image!,
          height: height ?? 170,
          width: width ?? double.infinity,
          fit: fit ?? BoxFit.cover,
          placeholder: (context, url) => Center(
            child: SpinKitCircle(
              color: greyColor,
            ), // You can use CustomLoadingIndicator if you have it
          ),
          errorWidget: (context, url, error) => Icon(Icons.error),
        ),
      ),
    );
  }

  // toList() {}
}
