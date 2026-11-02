import 'package:flutter/material.dart';
import 'package:instagram/main.dart';
import 'package:instagram/models/perfil.dart';
import 'package:instagram/theme/app_colors.dart';
import 'package:instagram/widgets/avatar_perfil.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  Future<void> _sair(BuildContext context) async {
    final confirmou = await showDialog<bool>(
      context: context,
      builder: (dialogo) => AlertDialog(
        title: const Text('Sair da conta?'),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(dialogo, false),
            child: const Text('Cancelar'),
          ),
          TextButton(
            onPressed: () => Navigator.pop(dialogo, true),
            child: const Text('Sair'),
          ),
        ],
      ),
    );

    if (confirmou != true || !context.mounted) return;

    Navigator.pushNamedAndRemoveUntil(context, Rotas.inicio, (_) => false);
  }

  @override
  Widget build(BuildContext context) {
    const perfil = Perfil.exemplo;

    return Scaffold(
      appBar: AppBar(
        title: Image.asset('assets/images/logo.png', height: 32),
        actions: [
          IconButton(
            icon: const Icon(Icons.logout),
            onPressed: () => _sair(context),
          ),
        ],
      ),
      body: ListView(
        padding: const EdgeInsets.all(20),
        children: [
          const SizedBox(height: 20),
          Row(
            children: [
              AvatarPerfil(url: perfil.avatarUrl, tamanho: 86),
              const SizedBox(width: 24),
              const Expanded(child: _Contador(valor: '12', rotulo: 'posts')),
              const Expanded(
                child: _Contador(valor: '248', rotulo: 'seguidores'),
              ),
              const Expanded(child: _Contador(valor: '180', rotulo: 'seguindo')),
            ],
          ),
          const SizedBox(height: 16),
          Text(
            perfil.nome,
            style: const TextStyle(fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 4),
          Text(perfil.bio),
          const SizedBox(height: 20),
          OutlinedButton(
            onPressed: () =>
                Navigator.pushNamed(context, Rotas.editarPerfil),
            style: OutlinedButton.styleFrom(
              minimumSize: const Size.fromHeight(34),
              foregroundColor: Colors.black,
              side: BorderSide(color: Colors.grey.shade300),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(6),
              ),
            ),
            child: const Text('Editar perfil'),
          ),
          const SizedBox(height: 24),
          const Divider(),
          const SizedBox(height: 40),
          const Center(
            child: Text(
              'Nenhuma publicação ainda',
              style: TextStyle(color: AppColors.textoApagado),
            ),
          ),
        ],
      ),
    );
  }
}

class _Contador extends StatelessWidget {
  const _Contador({required this.valor, required this.rotulo});

  final String valor;
  final String rotulo;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(
          valor,
          style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
        ),
        Text(rotulo, style: const TextStyle(fontSize: 13)),
      ],
    );
  }
}
