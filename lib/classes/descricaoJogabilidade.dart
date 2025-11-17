import 'package:agiroapp/classes/classes.dart';

class DescricaoJogabilidade extends Descricao {

  String? mecanicas;
  String? videos;

  DescricaoJogabilidade(
      nome,
      imagem,
      conteudo, this.mecanicas, this.videos):super(nome, imagem, conteudo);

  DescricaoJogabilidade.fromJson(Map<String, dynamic> json) : super(json['nome'], json['imagem'], json['conteudo']) {
    mecanicas = json['mecanicas'];
    videos = json['videos'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['nome'] = this.nome;
    data['imagem'] = this.imagem;
    data['conteudo'] = this.conteudo;
    data['mecanicas'] = this.mecanicas;
    data['videos'] = this.videos;
    return data;
  }
}
