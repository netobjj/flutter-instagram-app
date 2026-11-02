import 'package:flutter/material.dart';
import 'package:instagram/models/perfil.dart';
import 'package:instagram/theme/app_colors.dart';
import 'package:instagram/widgets/avatar_perfil.dart';

class _CampoPerfil {
  const _CampoPerfil(this.rotulo, this.valorInicial, {this.multilinha = false});

  final String rotulo;
  final String valorInicial;
  final bool multilinha;
}

class EditarPerfilScreen extends StatefulWidget {
  const EditarPerfilScreen({super.key});

  @override
  State<EditarPerfilScreen> createState() => _EditarPerfilScreenState();
}

class _EditarPerfilScreenState extends State<EditarPerfilScreen> {
  final _chaveFormulario = GlobalKey<FormState>();
  bool _temAlteracaoPendente = false;

  late final List<_CampoPerfil> _publicos;
  late final List<_CampoPerfil> _privados;

  @override
  void initState() {
    super.initState();
    const perfil = Perfil.exemplo;

    _publicos = [
      _CampoPerfil('Nome', perfil.nome),
      _CampoPerfil('Username', perfil.usuario),
      _CampoPerfil('Website', perfil.website),
      _CampoPerfil('Bio', perfil.bio, multilinha: true),
    ];

    _privados = [
      _CampoPerfil('Email', perfil.email),
      _CampoPerfil('Fone', perfil.telefone),
      _CampoPerfil('Gênero', perfil.genero),
    ];
  }

  void _registrarEdicao(String _) {
    if (!_temAlteracaoPendente) {
      setState(() => _temAlteracaoPendente = true);
    }
  }

  void _salvarAlteracoes() {
    if (!_chaveFormulario.currentState!.validate()) return;

    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(content: Text('Perfil atualizado')),
    );
    Navigator.pop(context);
  }

  Future<void> _cancelar() async {
    if (!_temAlteracaoPendente) {
      Navigator.pop(context);
      return;
    }

    final descartar = await showDialog<bool>(
      context: context,
      builder: (dialogo) => AlertDialog(
        title: const Text('Descartar alterações?'),
        content: const Text('As edições feitas serão perdidas.'),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(dialogo, false),
            child: const Text('Continuar editando'),
          ),
          TextButton(
            onPressed: () => Navigator.pop(dialogo, true),
            child: const Text('Descartar'),
          ),
        ],
      ),
    );

    if (descartar == true && mounted) Navigator.pop(context);
  }

  @override
  Widget build(BuildContext context) {
    const perfil = Perfil.exemplo;

    return Scaffold(
      appBar: AppBar(
        leadingWidth: 90,
        leading: TextButton(
          onPressed: _cancelar,
          child: const Text(
            'Cancelar',
            style: TextStyle(color: Colors.black),
          ),
        ),
        title: const Text(
          'Editar Perfil',
          style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
        ),
        actions: [
          TextButton(
            onPressed: _temAlteracaoPendente ? _salvarAlteracoes : null,
            child: Text(
              'Concluir',
              style: TextStyle(
                fontWeight: FontWeight.bold,
                color: _temAlteracaoPendente
                    ? AppColors.primaria
                    : AppColors.inativo,
              ),
            ),
          ),
        ],
      ),
      body: Form(
        key: _chaveFormulario,
        child: ListView(
          padding: const EdgeInsets.only(bottom: 32),
          children: [
            const SizedBox(height: 16),
            Center(child: AvatarPerfil(url: perfil.avatarUrl)),
            const SizedBox(height: 12),
            Center(
              child: TextButton(
                onPressed: () {},
                child: const Text(
                  'Troque sua foto de perfil',
                  style: TextStyle(color: AppColors.primaria),
                ),
              ),
            ),
            const SizedBox(height: 8),
            const Divider(),

            ..._publicos.map(_construirLinha),

            const SizedBox(height: 15),
            const Divider(),
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 20, vertical: 12),
              child: Text(
                'Mudar para conta profissional',
                style: TextStyle(color: AppColors.primaria),
              ),
            ),
            const Padding(
              padding: EdgeInsets.fromLTRB(20, 0, 20, 10),
              child: Text(
                'Informações privadas',
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
            ),
            ..._privados.map(_construirLinha),
          ],
        ),
      ),
    );
  }

  Widget _construirLinha(_CampoPerfil campo) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            width: 80,
            child: Padding(
              padding: const EdgeInsets.only(top: 15),
              child: Text(campo.rotulo),
            ),
          ),
          Expanded(
            child: TextFormField(
              initialValue: campo.valorInicial,
              onChanged: _registrarEdicao,
              maxLines: campo.multilinha ? null : 1,
              keyboardType: campo.multilinha
                  ? TextInputType.multiline
                  : TextInputType.text,
              validator: (valor) {
                if (campo.rotulo == 'Username' &&
                    (valor == null || valor.trim().isEmpty)) {
                  return 'O username não pode ficar vazio';
                }
                return null;
              },
              decoration: InputDecoration(
                hintText: campo.rotulo,
                filled: false,
                border: const UnderlineInputBorder(),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
