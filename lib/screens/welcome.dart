import 'package:flutter/material.dart';
import 'package:instagram/main.dart';
import 'package:instagram/models/perfil.dart';
import 'package:instagram/theme/app_colors.dart';
import 'package:instagram/widgets/avatar_perfil.dart';
import 'package:instagram/widgets/rodape_cadastro.dart';

class WelcomeScreen extends StatelessWidget {
  const WelcomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    const perfil = Perfil.exemplo;

    return Scaffold(
      body: SafeArea(
        child: LayoutBuilder(
          builder: (context, limites) {
            return SingleChildScrollView(
              child: ConstrainedBox(
                constraints: BoxConstraints(minHeight: limites.maxHeight),
                child: IntrinsicHeight(
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 16),
                    child: Column(
                      children: [
                        const Spacer(flex: 3),
                        Image.asset('assets/images/logo.png', height: 70),
                        const Spacer(flex: 2),
                        AvatarPerfil(url: perfil.avatarUrl),
                        const SizedBox(height: 13),
                        Text(perfil.usuario),
                        const SizedBox(height: 20),
                        SizedBox(
                          width: 307,
                          child: FilledButton(
                            onPressed: () =>
                                Navigator.pushNamed(context, Rotas.login),
                            child: const Text('Conecte-se'),
                          ),
                        ),
                        const SizedBox(height: 30),
                        TextButton(
                          onPressed: () =>
                              Navigator.pushNamed(context, Rotas.login),
                          child: const Text(
                            'Trocar de contas',
                            style: TextStyle(color: AppColors.primaria),
                          ),
                        ),
                        const Spacer(flex: 4),
                        const Divider(),
                        const SizedBox(height: 18),
                        const RodapeCadastro(),
                        const SizedBox(height: 16),
                      ],
                    ),
                  ),
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
