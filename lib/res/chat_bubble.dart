import 'package:connect_himal/res/app_color.dart';
import 'package:connect_himal/res/app_fonts.dart';
import 'package:flutter/material.dart';

class ChatBubble extends StatelessWidget {
  final bool isCurrentUser;
  final String message;
  final String? time;
  final String status;

  const ChatBubble({
    super.key,
    required this.isCurrentUser,
    required this.message,
    this.time,
    required this.status,
  });

  @override
  Widget build(BuildContext context) {
    return message == ''
        ? Container()
        : Container(
            margin: isCurrentUser
                ? EdgeInsets.fromLTRB(10, 5, 10, 5)
                : EdgeInsets.fromLTRB(10, 5, 60, 5),
            padding: EdgeInsets.symmetric(horizontal: 10, vertical: 8),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(10),
                bottomLeft:
                    isCurrentUser ? Radius.circular(10) : Radius.circular(0),
                bottomRight:
                    isCurrentUser ? Radius.circular(0) : Radius.circular(10),
                topRight: Radius.circular(10),
              ),
              color: message == ''
                  ? null
                  : isCurrentUser
                      ? primaryButtonColor
                      : Colors.grey[500],
            ),
            child: Column(
              children: [
                message == ''
                    ? Container()
                    : Row(
                        crossAxisAlignment: CrossAxisAlignment.end,
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Flexible(
                            child: Text(
                              message,
                              style: kTextStyle().copyWith(color: whiteColor),
                            ),
                          ),
                          SizedBox(
                              width:
                                  8), // Add some spacing between the message and the time
                          if (status == "sending")
                            Icon(Icons.access_time, color: whiteColor, size: 14,),
                          if (status == "sent")
                            Icon(Icons.check, color: whiteColor, size: 14,),
                          if (status == "error")
                            Icon(Icons.error, color: Colors.red),
                          Text(
                            time!,
                            style: sTextStyle().copyWith(
                                fontStyle: FontStyle.italic, color: whiteColor),
                            textAlign: TextAlign.end,
                          ),
                        ],
                      ),
              ],
            ),
          );
  }
}
// import 'package:connect_himal/res/app_color.dart';
// import 'package:connect_himal/res/app_fonts.dart';
// import 'package:flutter/material.dart';

// class ChatBubble extends StatelessWidget {
//   final bool isCurrentUser;
//   final String message;
//   final String? time;
//   final String status;

//   const ChatBubble({
//     super.key,
//     required this.isCurrentUser,
//     required this.message,
//     this.time,
//     required this.status,
//   });

//   @override
//   Widget build(BuildContext context) {
//     return message == ''
//         ? Container()
//         : LayoutBuilder(
//             builder: (context, constraints) {
//               final textSpan = TextSpan(
//                 text: message,
//                 style: kTextStyle().copyWith(color: whiteColor),
//               );

//               final textPainter = TextPainter(
//                 text: textSpan,
//                 maxLines: null,
//                 textDirection: TextDirection.ltr,
//               );

//               textPainter.layout(maxWidth: constraints.maxWidth);

//               final lineCount = textPainter.computeLineMetrics().length;

//               return Container(
//                 margin: isCurrentUser
//                     ? EdgeInsets.fromLTRB(10, 5, 10, 5)
//                     : EdgeInsets.fromLTRB(10, 5, 60, 5),
//                 padding: EdgeInsets.symmetric(horizontal: 10, vertical: 8),
//                 decoration: BoxDecoration(
//                   borderRadius: BorderRadius.only(
//                     topLeft: Radius.circular(10),
//                     bottomLeft: isCurrentUser
//                         ? Radius.circular(10)
//                         : Radius.circular(0),
//                     bottomRight: isCurrentUser
//                         ? Radius.circular(0)
//                         : Radius.circular(10),
//                     topRight: Radius.circular(10),
//                   ),
//                   color: isCurrentUser ? primaryButtonColor : Colors.grey[500],
//                 ),
//                 child: Column(
//                   crossAxisAlignment: CrossAxisAlignment.start,
//                   children: [
//                     Text(
//                       message,
//                       style: kTextStyle().copyWith(color: whiteColor),
//                     ),
//                     SizedBox(height: 4),
//                     if (lineCount < 2)
//                       Row(
//                         mainAxisAlignment: MainAxisAlignment.end,
//                         children: [
//                           if (status == "sending")
//                             Icon(
//                               Icons.access_time,
//                               color: whiteColor,
//                               size: 14,
//                             ),
//                           if (status == "sent")
//                             Icon(
//                               Icons.check,
//                               color: whiteColor,
//                               size: 14,
//                             ),
//                           if (status == "error")
//                             Icon(
//                               Icons.error,
//                               color: Colors.red,
//                               size: 14,
//                             ),
//                           SizedBox(width: 4),
//                           Text(
//                             time ?? '',
//                             style: sTextStyle().copyWith(
//                                 fontStyle: FontStyle.italic, color: whiteColor),
//                             textAlign: TextAlign.end,
//                           ),
//                         ],
//                       ),
//                     if (lineCount >= 2)
//                       Align(
//                         alignment: Alignment.bottomRight,
//                         child: Row(
//                           mainAxisSize: MainAxisSize.min,
//                           children: [
//                             if (status == "sending")
//                               Icon(
//                                 Icons.access_time,
//                                 color: whiteColor,
//                                 size: 14,
//                               ),
//                             if (status == "sent")
//                               Icon(
//                                 Icons.check,
//                                 color: whiteColor,
//                                 size: 14,
//                               ),
//                             if (status == "error")
//                               Icon(
//                                 Icons.error,
//                                 color: Colors.red,
//                                 size: 14,
//                               ),
//                             SizedBox(width: 4),
//                             Text(
//                               time ?? '',
//                               style: sTextStyle().copyWith(
//                                   fontStyle: FontStyle.italic,
//                                   color: whiteColor),
//                               textAlign: TextAlign.end,
//                             ),
//                           ],
//                         ),
//                       ),
//                   ],
//                 ),
//               );
//             },
//           );
//   }
// }
