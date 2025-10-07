import 'package:flutter/material.dart';
import 'Jogo.dart'; 
import 'NPC.dart'; 
import 'Suporte.dart';

void main() {
  runApp(const Home());
}

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


  @override
  Widget build(BuildContext context) {

   return Scaffold(
  body: Center(
    child: Container(
      decoration: const BoxDecoration(
        image: DecorationImage(
          image: AssetImage("assets/HomeBackground.png"),
          fit: BoxFit.fill,
        ),
      ),
      width: 400,
      height: 700,
      child: Stack(
        children: [
          // ÍCONE CG FIXO NO CANTO SUPERIOR ESQUERDO
          const Positioned(
            top: 20,
            left: 20,
            child: Image(
              width: 50,
              height: 50,
              image: AssetImage("assets/CG_Icon_White.png"),
            ),
          ),

        Align(
        alignment: Alignment.center,
        
        child: Column(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  SizedBox(
                    width: 300,
                    child: Column(
                      spacing: 10,
                      children: [
                        Column(
                          children: [
                            Text(
                              "Projeto A.G.I.R.O.",
                              style: TextStyle(
                                fontSize: 25,
                                fontWeight: FontWeight.bold,
                                color: Colors.white,
                              ),
                            ),
                          ],
                        ),
                        Column(
                          spacing: 2,
                          children: const [
                            Text(
                              textAlign: TextAlign.justify,
                              style: TextStyle(
                                fontSize: 8,
                                color: Colors.white,
                              ),
                              "Luiza Koga viveu seus 22 anos de vida em um bunker, escondida de um perigo desconhecido. Após se tornar a única restante ali, se vê obrigada a sair e se arriscar na superfície, se deparando com um mundo devastado por uma espécie de lodo preto. Fazem 25 anos desde o dia em que essa substância destruiu, deprimiu e transformou o mundo em um cenário de uma tragédia. Este dia, conhecido como “O dia da Queda”, foi resultado de um experimento científico falho, da vontade de entender algo do qual não queria ser compreendido."),
                            Text(
                              textAlign: TextAlign.justify,
                              style: TextStyle(
                                fontSize: 8,
                                color: Colors.white,
                              ),
                              "Presa na cidade de Boa Saudade, local de origem e o centro do problema, Luiza precisa descobrir a verdade por trás disso tudo e fugir com vida. Enfrentando em sua jornada, criaturas originadas a partir do lodo, formadas principalmente pelo medo de suas vítimas."),
                            Text(
                              textAlign: TextAlign.justify,
                              style: TextStyle(
                                fontSize: 8,
                                color: Colors.white,
                              ),
                              "Explore a superfície, descubra o que aconteceu com a cidade de Boa Saudade e encontre uma saída. E o mais importante, não deixe que as ameaças te levem à insanidade."),
                          ],
                        ),
                      ],
                    ),
                  ),
                ],
              ),

              // SEÇÃO DOS BOTÕES (inalterada)
              Column(
                children: [
                  Container(
                    height: 80,
                    width: 350,
                    decoration: const BoxDecoration(
                      image: DecorationImage(
                        image: AssetImage("assets/ButtonsBackground.png"),
                        fit: BoxFit.fill,
                      ),
                    ),
                    child: Row(
                      spacing: 8,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        SizedBox(
                          height: 50,
                          width: 75,
                          child: FloatingActionButton(
                            onPressed: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => const Home()),
                              );
                            },
                            child: Row(
                              spacing: 4,
                              children: const [
                                Icon(Icons.home),
                                Text("Home"),
                              ],
                            ),
                          ),
                        ),
                        SizedBox(
                          width: 75,
                          height: 50,
                          child: FloatingActionButton(
                            onPressed: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => const Jogo()),
                              );
                            },
                            child: Row(
                              spacing: 4,
                              children: const [
                                Icon(Icons.gamepad),
                                Text("Jogo"),
                              ],
                            ),
                          ),
                        ),
                        SizedBox(
                          width: 75,
                          height: 50,
                          child: FloatingActionButton(
                            onPressed: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => const NPCPAGE()),
                              );
                            },
                            child: Row(
                              spacing: 4,
                              children: const [
                                Icon(Icons.people),
                                Text("NPC"),
                              ],
                            ),
                          ),
                        ),
                        SizedBox(
                          width: 80,
                          height: 50,
                          child: FloatingActionButton(
                            onPressed: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => const Suporte()),
                              );
                            },
                            child: Row(
                              spacing: 4,
                              children: const [
                                Icon(Icons.email),
                                Text("Suporte"),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ],
          ),
        )
          
        ],
      ),
    ),
  ),
);
  }
}
