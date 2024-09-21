import 'package:connect_himal/res/barrel_file.dart';

class SeconderyButton extends StatelessWidget {
  final String? name;
  final Function() onTap;
  final double? width;
  final IconData? icon;
  const SeconderyButton(
      {super.key, this.name, required this.onTap, this.width, this.icon});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        width: width ?? 100,
        padding: kPadding(),
        decoration: BoxDecoration(
          color: AppConstants().appTheme ? Color(0xffEDEDED) : Colors.grey[600],
          borderRadius: BorderRadius.circular(20),
        ),
        child: Center(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                name!,
                style: kBoldTextStyle(),
              ),
              Utils.mediumWidthBox(context),
              Icon(
                icon ?? Icons.arrow_forward_ios,
                size: 15,
              )
            ],
          ),
        ),
      ),
    );
  }
}
