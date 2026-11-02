class Perfil {
  const Perfil({
    required this.usuario,
    required this.nome,
    required this.avatarUrl,
    this.website = '',
    this.bio = '',
    this.email = '',
    this.telefone = '',
    this.genero = '',
  });

  final String usuario;
  final String nome;
  final String avatarUrl;
  final String website;
  final String bio;
  final String email;
  final String telefone;
  final String genero;

  static const exemplo = Perfil(
    usuario: 'netobjj',
    nome: 'Neto',
    avatarUrl: 'https://avatars.githubusercontent.com/netobjj',
    website: '',
    bio: 'Dev lindo.',
    email: 'teste@gmail.com',
    telefone: '+55 45 98888-8888',
    genero: 'Macho',
  );
}
