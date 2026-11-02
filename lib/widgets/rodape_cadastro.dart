import 'package:flutter/material.dart';
import 'package:instagram/theme/app_colors.dart';

class RodapeCadastro extends StatelessWidget {
  const RodapeCadastro({super.key, this.aoTocar});

  final VoidCallback? aoTocar;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        const Text(
          'Não possui conta? ',
          style: TextStyle(color: AppColors.textoFraco),
        ),
        GestureDetector(
          onTap: aoTocar,
          child: const Text(
            'Cadastre-se',
            style: TextStyle(
              fontWeight: FontWeight.bold,
              color: AppColors.primaria,
            ),
          ),
        ),
      ],
    );
  }
}
