import 'package:agiroapp/classes/classes.dart';

class DescricaoPersonagem extends Descricao{
  String? descAparencia;
  String? personalidade;

  DescricaoPersonagem(
      nome,
      imagem,
      conteudo,
      this.descAparencia,
      this.personalidade) : super(nome, imagem, conteudo);

  DescricaoPersonagem.fromJson(Map<String, dynamic> json) : super(json['nome'], json['imagem'], json['conteudo']) {
    descAparencia = json['descAparencia'];
    personalidade = json['personalidade'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['nome'] = this.nome;
    data['imagem'] = this.imagem;
    data['conteudo'] = this.conteudo;
    data['descAparencia'] = this.descAparencia;
    data['personalidade'] = this.personalidade;
    return data;
  }
}