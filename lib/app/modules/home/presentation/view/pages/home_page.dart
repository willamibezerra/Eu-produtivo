import 'package:flutter/material.dart';
import 'package:image_convert/app/modules/home/presentation/view/widgets/body_home_widget.dart';

import '../widgets/select_image_widget.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  // void checkPermission() async {
  //   PermissionStatus status = await Permission.storage.status;
  //   if (status.isDenied) {
  //     status = await Permission.storage.request();
  //   }

  //   if (status.isGranted) {
  //   } else if (status.isDenied) {
  //   } else if (status.isPermanentlyDenied) {}
  // }

  // XFile? image;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body:
            // image == null?
            BodyHomeWidget(
      selectImageButton: SelectImageButton(
        onTap: () async {
          //   image = await picker.pickImage(source: ImageSource.gallery);
          setState(() {});
        },
      ),
      size: MediaQuery.of(context).size,
    )
        // : BackgroundLogin(
        //     rightPadding: 0,
        //     leftPadding: 0,
        //     size: MediaQuery.of(context).size,
        //     child: Column(
        //       children: [
        //         Padding(
        //           padding: EdgeInsets.all(8.0),
        //           child: Image.file(File(image!.path)),
        //         ),
        //         SizedBox(
        //             width: 200,
        //             height: 100,
        //             child: ElevatedButton(
        //                 onPressed: () async {
        //                   // final result = await ImageToPdf.imageList(
        //                   //     listOfFiles: [File(image!.path)]);
        //                 },
        //                 child: Text('Confirmar')))
        //       ],
        //     ),
        //   ),
        );
  }
}
