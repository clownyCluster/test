import 'package:connect_himal/res/barrel_file.dart';

class CustomGridView extends StatelessWidget {
  final int itemCount;
  final ScrollController? scrollController;
  final EdgeInsetsGeometry? padding;
  final double? childAspectRatio;
  final double? maxCrossAxisExtent;
  final double? crossAxisSpacing;
  final double? mainAxisSpacing;
  final Widget Function(BuildContext, int) itemBuilder;
  final bool? shrinkWrap;
  final ScrollPhysics? physics;

  const CustomGridView({
    super.key,
    required this.itemCount,
    this.shrinkWrap,
    this.scrollController,
    this.padding,
    required this.itemBuilder,
    this.childAspectRatio,
    this.maxCrossAxisExtent,
    this.crossAxisSpacing,
    this.mainAxisSpacing,
    this.physics,
  });

  @override
  Widget build(BuildContext context) {
    // Get the screen width and height
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;
    print(" height : $screenHeight  , width : $screenWidth");

    // Calculate the responsive childAspectRatio based on screen width and height breakpoints
    double responsiveChildAspectRatio;

    if ((screenWidth <= 320 && screenHeight <= 533) ||
        (screenWidth <= 360 && screenHeight <= 640) || // Small phones
        (screenWidth <= 320 && screenHeight <= 568) || // iPhone SE
        (screenWidth <= 375 && screenHeight <= 667)) {
      // iPhone 8
      responsiveChildAspectRatio = 0.55;
    } else if ((screenWidth <= 360 && screenHeight <= 718) || // Medium phones
        (screenWidth <= 360 && screenHeight <= 740) || // Medium phones
        (screenWidth <= 412 && screenHeight <= 690)) {
      // Medium phones
      responsiveChildAspectRatio = 0.58;
    } else if ((screenWidth <= 414 && screenHeight <= 896) || // iPhone 11
        (screenWidth <= 428 && screenHeight <= 926)) {
      // iPhone 13 Pro Max
      responsiveChildAspectRatio = 0.63;
    } else if (screenWidth <= 500 && screenHeight <= 680) {
      // Large phones
      responsiveChildAspectRatio = 0.78;
    } else if (screenWidth <= 600 && screenHeight <= 1024) {
      // Small tablets
      responsiveChildAspectRatio = 0.72;
    } else if ((screenWidth <= 768 && screenHeight <= 1024) || // Medium tablets
        (screenWidth <= 820 && screenHeight <= 1180)) {
      // iPad Air
      responsiveChildAspectRatio = 0.78;
    } else if ((screenWidth <= 800 && screenHeight <= 1280) || // Large tablets
        (screenWidth <= 834 && screenHeight <= 1194)) {
      // iPad Pro 11"
      responsiveChildAspectRatio = 0.83;
    } else if (screenWidth <= 900 && screenHeight <= 1200) {
      // Large tablets
      responsiveChildAspectRatio = 0.78;
    } else if (screenWidth <= 1024 && screenHeight <= 1366) {
      // iPad Pro 12.9"
      responsiveChildAspectRatio = 0.83;
    } else if (screenWidth <= 679 && screenHeight <= 1366) {
      // iPad Pro 12.9"
      responsiveChildAspectRatio = 0.97;
    } else {
      responsiveChildAspectRatio = 0.63;
    }

    print('Screen Width: $screenWidth');
    print('Screen Height: $screenHeight');
    print('Responsive Child Aspect Ratio: $responsiveChildAspectRatio');

    return GridView.builder(
      controller: scrollController,
      physics: physics ?? const BouncingScrollPhysics(),
      shrinkWrap: shrinkWrap ?? false,
      padding: padding ?? EdgeInsets.zero,
      gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
        maxCrossAxisExtent: maxCrossAxisExtent ?? 250,
        childAspectRatio: childAspectRatio ?? responsiveChildAspectRatio,
        crossAxisSpacing: crossAxisSpacing ?? 10,
        mainAxisSpacing: mainAxisSpacing ?? 10,
      ),
      itemCount: itemCount,
      itemBuilder: itemBuilder,
    );
  }
}
