import 'package:flutter/material.dart';
import 'package:super_drag_and_drop/super_drag_and_drop.dart';

class MyDraggableWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // DragItemWidget provides the content for the drag (DragItem).
    return DragItemWidget(
      dragItemProvider: (request) async {
        // DragItem represents the content begin dragged.
        final item = DragItem(
          // This data is only accessible when dropping within same
          // application. (optional)
          localData: {'x': 3, 'y': 4},
        );
        // Add data for this item that other applications can read
        // on drop. (optional)
        item.add(Formats.plainText('Plain Text Data'));
        item.add(
            Formats.htmlText.lazy(() => '<b>HTML generated on demand</b>'));
        return item;
      },
      allowedOperations: () => [DropOperation.copy],
      // DraggableWidget represents the actual draggable area. It looks
      // for parent DragItemWidget in widget hierarchy to provide the DragItem.
      child: const DraggableWidget(
        child: Text('This widget is draggable'),
      ),
    );
  }
}
