import 'package:url_launcher/url_launcher.dart';

class PaginaHome {
  final List<String> imagens;
  PaginaHome(this.imagens);
}

// CLASSE DESCRICAO - PASSA ATRIBUTOS EM COMUM PARA OUTRAS CLASSES
class Descricao {
  final String nome;
  final String imagem;
  final String conteudo;
  Descricao(this.nome, this.imagem, this.conteudo);
}

class DescricaoNarrativa extends Descricao {
  final String historia;

  DescricaoNarrativa(nome, imagem, conteudo, this.historia)
    : super(nome, imagem, conteudo);
}

// CLASSE SUPORTE - NÃO HERDA DE DESCRICAO
class PaginaSuporte {
  final String email;
  final String mensagem;
  PaginaSuporte(this.email, this.mensagem);

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
Future<void> AbrirPagina(String url) async {
  final Uri uri = Uri.parse(url); // Usando Uri.parse ao invés de Uri.Parse
  if (await canLaunchUrl(uri)) {
    // Verifique se o URL pode ser aberto
    await launchUrl(
      uri,
    ); // Usando o await para garantir que o método seja completado
  } else {
    throw 'Não foi possível abrir o URL $url';
  }
}
