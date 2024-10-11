import 'package:flutter/material.dart';

import 'package:image_convert/app/modules/home/presentation/view/pages/home_page.dart';

class SprintCardWidget extends StatefulWidget {
  final void Function(DraggableDetails, int index)? onDragEnd;
  final String title;
  final List<String>? content;
  const SprintCardWidget({
    Key? key,
    this.onDragEnd,
    required this.title,
    this.content,
  }) : super(key: key);

  @override
  State<SprintCardWidget> createState() => _SprintCardWidgetState();
}

class _SprintCardWidgetState extends State<SprintCardWidget> {
  bool startDrag = false;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      margin: const EdgeInsets.symmetric(horizontal: 5.0),
      decoration: BoxDecoration(
        color: const Color.fromARGB(255, 255, 255, 255),
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
              widget.title,
              style:
                  const TextStyle(fontSize: 16.0, fontWeight: FontWeight.bold),
            ),
            if (widget.content != null)
              Expanded(
                child: ListView.builder(
                  itemCount: widget.content!.length,
                  itemBuilder: (context, index) {
                    return Draggable(
                      onDragStarted: () {
                        setState(() {
                          startDrag = true;
                        });
                      },
                      onDragEnd: (details) {
                        if (widget.onDragEnd != null) {
                          widget.onDragEnd!(details, index);
                        }
                      },
                      data: 'Flutter',
                      feedback: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: cardWidget(startDrag, null),
                      ),
                      childWhenDragging: Container(),
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: cardWidget(startDrag, widget.content![index]),
                      ),
                    );
                  },
                ),
              ),
          ],
        ),
      ),
    );
  }
}
