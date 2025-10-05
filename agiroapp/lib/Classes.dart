import 'package:url_launcher/url_launcher.dart';

class PaginaHome{
final List<String> imagens;
PaginaHome(
this.imagens
);
}

// CLASSE DESCRICAO - PASSA ATRIBUTOS EM COMUM PARA OUTRAS CLASSES
class Descricao{
final String titulo;
final String nome;
final String imagem;
final String conteudo;
 Descricao(
  this.titulo,
  this.nome,
  this.imagem,
  this.conteudo,
 );
}  

// CLASSE DESCRICAOPERSONAGEM - HERDA DE DESCRICAO
class DescricaoPersonagem extends Descricao{
final String descAparencia;
final String personalidade;
 DescricaoPersonagem(
 titulo, 
 nome,
 imagem,
 conteudo,
 this.descAparencia,
 this.personalidade,
 ) : super (titulo, nome, imagem, conteudo);
}

// CLASSE DESCRICAOMONSTRO - HERDA DE DESCRICAO
class DescricaoMonstro extends Descricao{
  
final String descAparencia;
final String personalidade;
DescricaoMonstro(
titulo, 
nome,
imagem,
conteudo,
this.descAparencia,
this.personalidade,
) : super (titulo, nome, imagem, conteudo);
}

// CLASSE DESCRICAOJOGABILIDADE - HERDA DE DESCRICAO

class DescricaoJogabilidade extends Descricao{
  
final List<String> mecanicas;
final String videos;

DescricaoJogabilidade(
titulo, 
nome,
imagem,
conteudo,
this.mecanicas,
this.videos,
) : super (titulo, nome, imagem, conteudo);
}


// CLASSE DESCRICAONARRATIVA - HERDA DE DESCRICAO

class DescricaoNarrativa extends Descricao{
final String historia;

DescricaoNarrativa(
titulo, 
nome,
imagem,
conteudo,
this.historia,
) : super (titulo, nome, imagem, conteudo);
}

// CLASSE SUPORTE - HERDA DE DESCRICAO
class Suporte extends Descricao{
final String email;
final String mensagem;
Suporte(
 titulo, 
 nome,
 imagem,
 historia,
this.email,
this.mensagem,
)  : super (titulo, nome, imagem, historia);

// MÉTODO PARA LIMPAR A CAIXA DE TEXTO E RETORNAR UMA MENSAGEM QUANDO CLICADO UM BOTÃO ESPECÍFICO
enviar(String Mensagem) {
if(Mensagem.isNotEmpty){
Mensagem = "";
return "Mensagem enviada. Aguarde pelo retorno.";
 }
 }
} 


// MÉTODO PARA ABRIR PAGINAS FORA DO APP - TALVEZ TENHA DE SER RETIRADO
Future <void> AbrirPagina(String url) async{
   final Uri uri = Uri.parse(url);  // Usando Uri.parse ao invés de Uri.Parse
  if (await canLaunchUrl(uri)) {  // Verifique se o URL pode ser aberto
    await launchUrl(uri);  // Usando o await para garantir que o método seja completado
  } else {
    throw 'Não foi possível abrir o URL $url';
  }
}