import 'barrel_file.dart';

AppBar defaultAppBar({
  required BuildContext context,
  String? title,
  List<Widget>? actions,
  Color? fontColor,
  bool? center,
}) {
  title ??= ""; // Default to empty string if title is null
  return AppBar(
    leading: InkWell(
        onTap: () {
          navigatorKey.currentState!.pop();
        },
        child: Icon(Icons.arrow_back)),
    centerTitle: center ?? true,
    elevation: 0,
    // leadingWidth: 70,
    actions: actions ?? [], // Default to empty list if actions is null
    title: Text(
      title,
      style: kkBoldTextStyle().copyWith(fontSize: 20, color: fontColor),
    ),
  );
}
