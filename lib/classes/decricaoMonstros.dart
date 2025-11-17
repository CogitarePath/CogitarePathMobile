import 'package:agiroapp/classes/classes.dart';

class DescricaoMonstro extends Descricao {
  String? descMonstro;
  String? personalidade;

  DescricaoMonstro(
      nome,
      imagem,
      conteudo,
      this.descMonstro,
      this.personalidade) :super(nome, imagem, conteudo);

  DescricaoMonstro.fromJson(Map<String, dynamic> json) : super(json['nome'], json['imagem'], json['conteudo']) {
    descMonstro = json['descMonstro'];
    personalidade = json['personalidade'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['nome'] = nome;
    data['imagem'] = imagem;
    data['conteudo'] = conteudo;
    data['descMonstro'] = descMonstro;
    data['personalidade'] = personalidade;
    return data;
  }
}