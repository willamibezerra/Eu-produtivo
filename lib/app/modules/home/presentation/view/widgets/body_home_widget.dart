import 'package:flutter/material.dart';

import '../../../../authentication/presentation/view/components/background_login.dart';

class BodyHomeWidget extends StatelessWidget {
  final Size size;
  final Widget selectImageButton;
  const BodyHomeWidget({
    super.key,
    required this.size,
    required this.selectImageButton,
  });

  @override
  Widget build(BuildContext context) {
    return BackgroundLogin(
      leftPadding: 0,
      rightPadding: 0,
      size: size,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SizedBox(
            height: size.height * 0.25,
          ),
          const Text(
            'Conversor de Imagens para pdf',
            style: TextStyle(
                fontSize: 20, color: Colors.red, fontWeight: FontWeight.bold),
          ),
          const SizedBox(
            height: 25,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 4),
            child: Container(
                alignment: Alignment.center,
                decoration: BoxDecoration(
                  color: const Color.fromARGB(173, 0, 0, 0),
                  borderRadius: BorderRadius.circular(12),
                ),
                height: 150,
                width: size.width,
                child: selectImageButton),
          ),
          const SizedBox(
            height: 30,
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                IconSelectWidget(
                  title: 'Escanear documento',
                  icon: Icons.document_scanner_outlined,
                  onTap: () {},
                ),
                IconSelectWidget(
                  title: 'Tirar foto',
                  icon: Icons.camera,
                  onTap: () {},
                ),
                IconSelectWidget(
                  title: 'Converter de pdf para png',
                  icon: Icons.picture_as_pdf,
                  onTap: () {},
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}

class IconSelectWidget extends StatelessWidget {
  final IconData icon;
  final VoidCallback onTap;
  final String title;
  const IconSelectWidget({
    super.key,
    required this.onTap,
    required this.icon,
    required this.title,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Icon(
            icon,
            size: 70,
          ),
          SizedBox(width: 100, child: Text(title))
        ],
      ),
    );
  }
}
