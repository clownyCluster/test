import 'barrel_file.dart';

class ThemeContainer extends StatelessWidget {
  final double? height;
  final double? width;

  final double? borderWidth;
  final EdgeInsetsGeometry? padding;
  final EdgeInsetsGeometry? margin;

  final BorderRadiusGeometry? borderRadius;
  final double? blurRadius;
  final double? spreadRadius;
  final Widget? child;
  final Color? boxShadowLightColor;
  final Color? boxShadowDarkColor;
  final Color? borderColor;

  final List<BoxShadow>? boxShadow;
  final Color? color;
  final BorderStyle? borderStyle;
  const ThemeContainer(
      {super.key,
      this.width,
      this.borderStyle,
      this.height,
      this.padding,
      this.blurRadius,
      this.child,
      this.borderWidth,
      this.borderRadius,
      this.boxShadowLightColor,
      this.color,
      this.boxShadowDarkColor,
      this.borderColor,
      this.spreadRadius,
      this.boxShadow,
      this.margin});

  @override
  Widget build(BuildContext context) {
    final isDarkTheme = AppConstants().appTheme;
    final themeColor = isDarkTheme ? whiteColor : darkGrey;

    return Container(
      padding: padding ?? sPadding,
      margin: margin ?? EdgeInsets.all(0),
      height: height,
      width: width,
      decoration: BoxDecoration(
          color: color ?? themeColor,
          borderRadius: borderRadius ?? BorderRadius.circular(10),
          border: Border.all(
              style: borderStyle ?? BorderStyle.none,
              color:  borderColor ?? greyColor),
          boxShadow: boxShadow ??
              [
                BoxShadow(
                    blurRadius: blurRadius ?? 0,
                    color: isDarkTheme
                        ? boxShadowLightColor ?? whiteColor.withOpacity(0.2)
                        : boxShadowDarkColor ?? blackColor.withOpacity(0.2),
                    // offset: const Offset(2, 2),
                    spreadRadius: spreadRadius ?? 0),
              ]),
      child: child ?? Container(),
    );
  }
}
