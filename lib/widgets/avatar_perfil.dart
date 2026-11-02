import 'package:flutter/material.dart';

class AvatarPerfil extends StatelessWidget {
  const AvatarPerfil({super.key, required this.url, this.tamanho = 100});

  final String url;
  final double tamanho;

  @override
  Widget build(BuildContext context) {
    return ClipOval(
      child: Image.network(
        url,
        height: tamanho,
        width: tamanho,
        fit: BoxFit.cover,
        loadingBuilder: (context, filho, progresso) {
          if (progresso == null) return filho;
          return SizedBox(
            height: tamanho,
            width: tamanho,
            child: const Center(
              child: CircularProgressIndicator(strokeWidth: 2),
            ),
          );
        },
        errorBuilder: (context, erro, pilha) => Container(
          height: tamanho,
          width: tamanho,
          color: Colors.grey.shade300,
          child: Icon(Icons.person, size: tamanho * 0.6, color: Colors.white),
        ),
      ),
    );
  }
}
