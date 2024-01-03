import 'package:flutter/material.dart';

class MessageBox extends StatelessWidget {
  final Color boxColor;
  final bool isMe;
  final String message;

  const MessageBox({
    super.key,
    required this.boxColor,
    required this.isMe,
    required this.message,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment:
          isMe ? CrossAxisAlignment.end : CrossAxisAlignment.start,
      children: [
        Container(
          decoration: BoxDecoration(
            color: boxColor,
            borderRadius: BorderRadius.circular(20),
          ),
          child: Text(message),
        ),
      ],
    );
  }
}
