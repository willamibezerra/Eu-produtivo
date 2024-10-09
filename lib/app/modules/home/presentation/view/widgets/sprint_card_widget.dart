import 'package:flutter/material.dart';

class SprintCardWidget extends StatelessWidget {
  final String title;
  final List<Widget>? content;
  const SprintCardWidget({
    Key? key,
    required this.title,
    this.content,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      margin: const EdgeInsets.symmetric(horizontal: 5.0),
      decoration: BoxDecoration(
        color: Colors.white,
        boxShadow: const [
          BoxShadow(
            color: Colors.grey,
            offset: Offset(0.0, 1.0),
            blurRadius: 6.0,
          ),
        ],
        borderRadius: BorderRadius.circular(12),
      ),
      child: Align(
        alignment: Alignment.topCenter,
        child: Column(
          children: [
            Text(
              title,
              style:
                  const TextStyle(fontSize: 16.0, fontWeight: FontWeight.bold),
            ),
            Column(
              children: content ?? const [SizedBox()],
            )
          ],
        ),
      ),
    );
  }
}
