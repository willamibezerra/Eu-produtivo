import 'package:flutter/material.dart';

class SelectImageButton extends StatelessWidget {
  final VoidCallback onTap;
  const SelectImageButton({
    super.key,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        GestureDetector(
          onTap: onTap,
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 50),
            child: Container(
              padding: const EdgeInsets.all(15),
              height: 50,
              decoration: BoxDecoration(
                  color: Colors.red, borderRadius: BorderRadius.circular(12)),
              child: const Row(
                children: [
                  Text(
                    'Selecionar Imagem',
                    style: TextStyle(
                      fontSize: 16,
                      color: Colors.white,
                    ),
                  ),
                  SizedBox(
                    width: 10,
                  ),
                  Icon(
                    Icons.file_copy,
                    color: Colors.white,
                  ),
                  SizedBox(
                    width: 10,
                  ),
                  Icon(
                    Icons.image,
                    color: Colors.white,
                  )
                ],
              ),
            ),
          ),
        ),
        const Text(
          "Selecione uma imagem. 100 MB tamanho máximo",
          style: TextStyle(fontSize: 12, color: Colors.grey),
        )
      ],
    );
  }
}
