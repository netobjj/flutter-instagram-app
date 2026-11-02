import 'package:flutter/material.dart';
import 'package:instagram/theme/app_colors.dart';

class SeparadorTexto extends StatelessWidget {
  const SeparadorTexto({super.key, this.texto = 'OU'});

  final String texto;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        const Expanded(child: Divider()),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 12),
          child: Text(
            texto,
            style: const TextStyle(
              fontWeight: FontWeight.bold,
              color: AppColors.textoApagado,
            ),
          ),
        ),
        const Expanded(child: Divider()),
      ],
    );
  }
}
