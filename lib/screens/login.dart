import 'package:flutter/material.dart';
import 'package:instagram/main.dart';
import 'package:instagram/theme/app_colors.dart';
import 'package:instagram/widgets/rodape_cadastro.dart';
import 'package:instagram/widgets/separador_ou.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final _usuario = TextEditingController();
  final _senha = TextEditingController();

  late final Listenable _camposAlterados =
      Listenable.merge([_usuario, _senha]);

  @override
  void dispose() {
    _usuario.dispose();
    _senha.dispose();
    super.dispose();
  }

  bool get _formularioValido =>
      _usuario.text.trim().isNotEmpty && _senha.text.trim().isNotEmpty;

  void _autenticar() {
    Navigator.pushReplacementNamed(context, Rotas.home);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios),
          onPressed: () => Navigator.pop(context),
        ),
      ),
      body: SafeArea(
        child: ListView(
          padding: const EdgeInsets.fromLTRB(16, 24, 16, 24),
          children: [
            Image.asset('assets/images/logo.png', height: 70),
            const SizedBox(height: 52),
            TextField(
              controller: _usuario,
              keyboardType: TextInputType.emailAddress,
              textInputAction: TextInputAction.next,
              decoration: const InputDecoration(
                hintText: 'Telefone, nome de usuário ou email',
              ),
            ),
            const SizedBox(height: 12),
            TextField(
              controller: _senha,
              obscureText: true,
              textInputAction: TextInputAction.done,
              onSubmitted: (_) {
                if (_formularioValido) _autenticar();
              },
              decoration: const InputDecoration(hintText: 'Senha'),
            ),
            const SizedBox(height: 19),
            Align(
              alignment: Alignment.centerLeft,
              child: GestureDetector(
                onTap: () {},
                child: const Text(
                  'Esqueceu sua senha?',
                  style: TextStyle(color: AppColors.primaria),
                ),
              ),
            ),
            const SizedBox(height: 30),

            ListenableBuilder(
              listenable: _camposAlterados,
              builder: (context, _) {
                return FilledButton(
                  onPressed: _formularioValido ? _autenticar : null,
                  child: const Text('Conecte-se'),
                );
              },
            ),

            const SizedBox(height: 37),
            TextButton.icon(
              onPressed: () {},
              icon: const Icon(Icons.facebook, color: AppColors.primaria),
              label: const Text(
                'Logar com Facebook',
                style: TextStyle(color: AppColors.primaria),
              ),
            ),
            const SizedBox(height: 41),
            const SeparadorTexto(),
            const SizedBox(height: 42),
            const RodapeCadastro(),
            const SizedBox(height: 60),
            const Divider(),
            const SizedBox(height: 20),
            const Center(
              child: Text(
                'Instagram from Facebook',
                style: TextStyle(color: AppColors.textoApagado),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
