import 'package:flutter/material.dart';

class Home extends StatelessWidget {
  const Home({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Home',
      home: const MyHomePage(title: 'Home'),
      debugShowCheckedModeBanner: false,
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  late bool mostrarSinopse = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 31, 30, 34),
      body: SingleChildScrollView(
        child: Column(
          children: [
            // ÍCONE CG FIXO NO CANTO SUPERIOR ESQUERDO E IMAGEM
            Stack(
              children: <Widget>[
                Image.asset("assets/HomeBackground2.png"),
                Positioned(
                  top: 20,
                  left: 20,
                  child: Image(
                    width: 50,
                    height: 50,
                    image: AssetImage("assets/CG_Icon_White.png"),
                  ),
                ),
              ],
            ),
            Align(
              alignment: Alignment.center,

              child: Column(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Padding(
                    padding: const EdgeInsets.all(20.0),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        SizedBox(
                          width: 300,
                          child: Column(
                            spacing: 10,
                            children: [
                              Text(
                                "Projeto A.G.I.R.O.",
                                style: TextStyle(
                                  fontSize: 35,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.white,
                                ),
                              ),
                              SizedBox(height: 35),
                              TextButton(
                                onPressed: () {
                                  setState(() {
                                    mostrarSinopse = !mostrarSinopse;
                                  });
                                },
                                style: TextButton.styleFrom(
                                  foregroundColor: Color.fromARGB(
                                    255,
                                    31,
                                    30,
                                    34,
                                  ),
                                  backgroundColor: Color.fromARGB(
                                    255,
                                    31,
                                    30,
                                    34,
                                  ),
                                  elevation: null,
                                ),
                                child: Text(
                                  "Sinopse",
                                  style: TextStyle(
                                    fontSize: 35,
                                    color: Colors.white,
                                  ),
                                ),
                              ),
                              AnimatedSwitcher(
                                duration: Duration(milliseconds: 500),
                                child: mostrarSinopse
                                    ? Text(
                                        textAlign: TextAlign.justify,
                                        style: TextStyle(
                                          fontSize: 16,
                                          color: Colors.white,
                                        ),
                                        "Luiza Koga viveu seus 22 anos de vida em um bunker, escondida de um perigo desconhecido. Após se tornar a única restante ali, se vê obrigada a sair e se arriscar na superfície, se deparando com um mundo devastado por uma espécie de lodo preto. Fazem 25 anos desde o dia em que essa substância destruiu, deprimiu e transformou o mundo em um cenário de uma tragédia. Este dia, conhecido como “O dia da Queda”, foi resultado de um experimento científico falho, da vontade de entender algo do qual não queria ser compreendido.\n"
                                        "Presa na cidade de Boa Saudade, local de origem e o centro do problema, Luiza precisa descobrir a verdade por trás disso tudo e fugir com vida. Enfrentando em sua jornada, criaturas originadas a partir do lodo, formadas principalmente pelo medo de suas vítimas.\n"
                                        "Explore a superfície, descubra o que aconteceu com a cidade de Boa Saudade e encontre uma saída. E o mais importante, não deixe que as ameaças te levem à insanidade.",
                                      )
                                    : SizedBox.shrink(),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
