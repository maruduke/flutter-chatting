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
      mainAxisAlignment: isMe ? MainAxisAlignment.end : MainAxisAlignment.start,
      children: [
        Container(
          padding: const EdgeInsets.all(10),
          constraints: const BoxConstraints(maxWidth: 500),
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
