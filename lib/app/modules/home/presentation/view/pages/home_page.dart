import 'package:flutter/material.dart';
import 'package:image_convert/app/modules/home/presentation/view/widgets/body_home_widget.dart';

import '../widgets/select_image_widget.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BodyHomeWidget(
        selectImageButton: SelectImageButton(
          onTap: () {},
        ),
        size: MediaQuery.of(context).size,
      ),
    );
  }
}
