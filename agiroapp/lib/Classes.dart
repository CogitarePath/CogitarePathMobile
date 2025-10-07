import 'package:url_launcher/url_launcher.dart';

class PaginaHome{
final List<String> imagens;
PaginaHome(
this.imagens
);
}

// CLASSE DESCRICAO - PASSA ATRIBUTOS EM COMUM PARA OUTRAS CLASSES
class Descricao{
final String nome;
final String imagem;
final String conteudo;
 Descricao(
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
 nome,
 imagem,
 conteudo,
 this.descAparencia,
 this.personalidade,
 ) : super (nome, imagem, conteudo);
}


List <DescricaoPersonagem> personagens = [
DescricaoPersonagem("Luiza Koga", "CG_LOGO.png", "Éh", "Dois", "Sim"),
DescricaoPersonagem("Luiza ASAADSSA", "CG_LOGO.png", "GDSA", "FA", "SiASDm"),
];

// CLASSE DESCRICAOMONSTRO - HERDA DE DESCRICAO
class DescricaoMonstro extends Descricao{
  
final String descAparencia;
final String personalidade;

DescricaoMonstro(
nome,
imagem,
conteudo,
this.descAparencia,
this.personalidade,
) : super (nome, imagem, conteudo);
}


// CLASSE DESCRICAOJOGABILIDADE - HERDA DE DESCRICAO

class DescricaoJogabilidade extends Descricao{
  
final String mecanicas;
final String videos;

DescricaoJogabilidade(
nome,
imagem,
conteudo,
this.mecanicas,
this.videos,
) : super (nome, imagem, conteudo);
}

List <DescricaoJogabilidade> areas = [
DescricaoJogabilidade("Área Residencial", "CG_LOGO.png", "Uma área residencial", "", ""),
DescricaoJogabilidade("Área S", "CG_Icon_White.png", "Uma área residencial", "", ""),
];

// CLASSE DESCRICAONARRATIVA - HERDA DE DESCRICAO

class DescricaoNarrativa extends Descricao{
final String historia;

DescricaoNarrativa(
nome,
imagem,
conteudo,
this.historia,
) : super (nome, imagem, conteudo);
}

// CLASSE SUPORTE - NÃO HERDA DE DESCRICAO
class PaginaSuporte {
final String email;
final String mensagem;
PaginaSuporte( 
this.email,
this.mensagem,
);

// MÉTODO PARA LIMPAR A CAIXA DE TEXTO E RETORNAR UMA MENSAGEM QUANDO CLICADO UM BOTÃO ESPECÍFICO
String enviar(String mensagem) {
  if (mensagem.isNotEmpty) {
    return "Mensagem enviada. Aguarde pelo retorno.";
  } else {
    return "Digite uma mensagem antes de enviar.";
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
