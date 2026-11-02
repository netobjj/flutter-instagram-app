import 'package:flutter/material.dart';
import 'package:instagram/screens/editar_perfil.dart';
import 'package:instagram/screens/home.dart';
import 'package:instagram/screens/login.dart';
import 'package:instagram/screens/welcome.dart';
import 'package:instagram/theme/app_theme.dart';

void main() => runApp(const MyApp());

abstract final class Rotas {
  static const inicio = '/';
  static const login = '/login';
  static const home = '/home';
  static const editarPerfil = '/editar-perfil';
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Instagram',
      theme: AppTheme.construir(),
      initialRoute: Rotas.inicio,
      onGenerateRoute: _gerarRota,
    );
  }

  Route<dynamic> _gerarRota(RouteSettings config) {
    final construtores = <String, WidgetBuilder>{
      Rotas.inicio: (_) => const WelcomeScreen(),
      Rotas.login: (_) => const LoginScreen(),
      Rotas.home: (_) => const HomeScreen(),
      Rotas.editarPerfil: (_) => const EditarPerfilScreen(),
    };

    final construtor = construtores[config.name];

    if (construtor == null) {
      return MaterialPageRoute(
        builder: (_) => const _RotaDesconhecida(),
        settings: config,
      );
    }

    return MaterialPageRoute(builder: construtor, settings: config);
  }
}

class _RotaDesconhecida extends StatelessWidget {
  const _RotaDesconhecida();

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(child: Text('Página não encontrada')),
    );
  }
}
