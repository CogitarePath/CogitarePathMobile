import 'package:agiroapp/classes/classes.dart';
import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:dots_indicator/dots_indicator.dart';

class NPCPAGE extends StatelessWidget {
  const NPCPAGE({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Personagens  ',
      home: const NPCPage(title: 'Personagens'),
      debugShowCheckedModeBanner: false,
    );
  }
}

class NPCPage extends StatefulWidget {
  const NPCPage({super.key, required this.title});

  final String title;

  @override
  State<NPCPage> createState() => _NPCPageState();
}

class _NPCPageState extends State<NPCPage> {
  int currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 31, 30, 34),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Image.asset("assets/PersonagensBackground2.png"),
            Padding(
              padding: const EdgeInsets.all(20.0),
              child: Column(
                // Coluna do texto (serve para delimitar o espaço que o texto pode correr)
                children: <Widget>[
                  Column(
                    spacing: 10,
                    children: [
                      Column(
                        children: [
                          Text(
                            style: TextStyle(
                              fontSize: 25,
                              fontWeight: FontWeight.bold,
                              color: Colors.white,
                            ),
                            "JOGO",
                          ),
                        ],
                      ),
                      Column(
                        spacing: 2,
                        children: [
                          Text(
                            style: TextStyle(
                              fontSize: 25,
                              fontWeight: FontWeight.bold,
                              color: Colors.white,
                            ),
                            "Jogabilidade",
                          ),
                          Text(
                            textAlign: TextAlign.justify,
                            style: TextStyle(
                              fontSize: 16,
                              color: Colors.white,
                            ),
                            " "
                            "LOREIMPSUMLOREIMPSUMLOREIMPSUMLOREIMPSUMLOREIMPSUMLOREIMPSUMLOREIMPSUMLOREIMPSUMLOREIMPSUMLOREIMPSUMLOREIMPSUMLOREIMPSUMLOREIMPSUMLOREIMPSUMLOREIMPSUMLOREIMPSUM.",
                          ),
                          Text(
                            style: TextStyle(
                              fontSize: 25,
                              fontWeight: FontWeight.bold,
                              color: Colors.white,
                            ),
                            "Itens",
                          ),
                          Text(
                            textAlign: TextAlign.justify,
                            style: TextStyle(
                              fontSize: 16,
                              color: Colors.white,
                            ),
                            " "
                            "LOREIMPSUMLOREIMPSUMLOREIMPSUMLOREIMPSUMLOREIMPSUMLOREIMPSUMLOREIMPSUMLOREIMPSUMLOREIMPSUMLOREIMPSUMLOREIMPSUMLOREIMPSUMLOREIMPSUMLOREIMPSUMLOREIMPSUMLOREIMPSUM.",
                          ),
                          Text(
                            style: TextStyle(
                              fontSize: 25,
                              fontWeight: FontWeight.bold,
                              color: Colors.white,
                            ),
                            "Áreas",
                          ),
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
                                                    TextAlign.justify,
                                                item.conteudo,
                                                style: TextStyle(
                                                  fontSize: 10,
                                                  color: Colors.white,
                                                ),
                                              ),
                                            ),
                                          ],
                                        ),
                                        Text(
                                          item.nome,
                                          textAlign: TextAlign.start,
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
                      ),
                    ],
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
