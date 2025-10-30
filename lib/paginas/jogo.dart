import 'package:agiroapp/classes/botaoText.dart';
import 'package:agiroapp/classes/classes.dart';
import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:dots_indicator/dots_indicator.dart';

class Jogo extends StatelessWidget {
  const Jogo({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Jogo  ',
      home: const MyHomePage(title: 'Jogo'),
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
  int currentIndex = 0;

  bool showJogabilidade = false;
  bool showItens = false;
  bool showAreas = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 31, 30, 34),
      body: SingleChildScrollView(
        child: Column(
          spacing: 20,
          children: [
            Column(
              children: <Widget>[
                Stack(
                  alignment: AlignmentDirectional.center,
                  children: <Widget>[
                    Image.asset("assets/JogoBackground2.png"),
                    Text(
                      style: TextStyle(
                        fontSize: 35,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      ),
                      "JOGO",
                    ),
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
                SizedBox(height: 50),
                Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: SizedBox(
                    child: Column(
                      children: [
                        Column(
                          spacing: 2,
                          children: [
                            Botaotext(
                              text: "Jogabilidade",
                              func: () {
                                setState(() {
                                  showJogabilidade = !showJogabilidade;
                                });
                              },
                            ),
                            AnimatedSwitcher(
                              duration: Duration(milliseconds: 500),
                              child: showJogabilidade
                                  ? Text(
                                      textAlign: TextAlign.justify,
                                      style: TextStyle(
                                        fontSize: 16,
                                        color: Colors.white,
                                      ),
                                      " "
                                      "LOREIMPSUMLOREIMPSUMLOREIMPSUMLOREIMPSUMLOREIMPSUMLOREIMPSUMLOREIMPSUMLOREIMPSUMLOREIMPSUMLOREIMPSUMLOREIMPSUMLOREIMPSUMLOREIMPSUMLOREIMPSUMLOREIMPSUMLOREIMPSUM.",
                                    )
                                  : SizedBox(height: 20),
                            ),
                            Botaotext(
                              text: "Itens",
                              func: () {
                                setState(() {
                                  showItens = !showItens;
                                });
                              },
                            ),
                            AnimatedSwitcher(
                              duration: Duration(milliseconds: 500),
                              child: showItens
                                  ? Text(
                                      textAlign: TextAlign.justify,
                                      style: TextStyle(
                                        fontSize: 16,
                                        color: Colors.white,
                                      ),
                                      " "
                                      "LOREIMPSUMLOREIMPSUMLOREIMPSUMLOREIMPSUMLOREIMPSUMLOREIMPSUMLOREIMPSUMLOREIMPSUMLOREIMPSUMLOREIMPSUMLOREIMPSUMLOREIMPSUMLOREIMPSUMLOREIMPSUMLOREIMPSUMLOREIMPSUM.",
                                    )
                                  : SizedBox(height: 20),
                            ),
                            Botaotext(
                              text: "Áreas",
                              func: () {
                                setState(() {
                                  showAreas = !showAreas;
                                });
                              },
                            ),

                            AnimatedSwitcher(
                              duration: Duration(milliseconds: 500),
                              child: showAreas
                                  ? Column(
                                      children: [
                                        CarouselSlider(
                                          options: CarouselOptions(
                                            viewportFraction: 0.6,
                                            enlargeCenterPage: true,
                                            enableInfiniteScroll: true,
                                            autoPlay: true,
                                            onPageChanged: (index, reason) {
                                              setState(() {
                                                currentIndex = index;
                                              });
                                            },
                                          ),
                                          items: areas
                                              .map(
                                                (item) => Container(
                                                  height: 800,
                                                  width: 800,
                                                  decoration: BoxDecoration(
                                                    border: BoxBorder.all(
                                                      color: Colors.red,
                                                    ),
                                                  ),
                                                  margin: EdgeInsets.all(8.0),
                                                  child: Column(
                                                    children: [
                                                      Row(
                                                        children: [
                                                          Image.asset(
                                                            width: 100,
                                                            height: 100,
                                                            scale: 2,
                                                            item.imagem,
                                                          ),
                                                          SizedBox(
                                                            width: 60,
                                                            height: 100,
                                                            child: Text(
                                                              textAlign:
                                                                  TextAlign
                                                                      .justify,
                                                              item.conteudo,
                                                              style: TextStyle(
                                                                fontSize: 10,
                                                                color: Colors
                                                                    .white,
                                                              ),
                                                            ),
                                                          ),
                                                        ],
                                                      ),
                                                      Text(
                                                        item.nome,
                                                        textAlign:
                                                            TextAlign.start,
                                                        style: TextStyle(
                                                          color: Colors.white,
                                                        ),
                                                      ),
                                                    ],
                                                  ),
                                                ),
                                              )
                                              .toList(),
                                        ),
                                        DotsIndicator(
                                          dotsCount: areas.length,
                                          position: currentIndex.toDouble(),
                                        ),
                                      ],
                                    )
                                  : Text(""),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
