import 'dart:convert';

import 'package:agiroapp/classes/botaoText.dart';
import 'package:agiroapp/classes/decricaoMonstros.dart';
import 'package:agiroapp/classes/descricaoPersonagem.dart';
import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:dots_indicator/dots_indicator.dart';
import 'package:flutter/services.dart';

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
  int currentIndexPersonagem = 0;
  int currentIndexCriatura = 0;

  bool showPerson = false;
  bool showCreatures = false;

  List<DescricaoMonstro> listaMonstro = List.empty();
  List<DescricaoPersonagem> listaPersonagem = List.empty();

  Future<void> readJsonMonstro() async {
    final String response = await rootBundle.loadString(
      "assets/Json/Monstros.json",
    );
    Iterable data = await json.decode(response);
    listaMonstro = List<DescricaoMonstro>.from(
      data.map((model) => DescricaoMonstro.fromJson(model)),
    );
    setState(() {
      listaMonstro;
    });
  }

  Future<void> readJsonPersonagem() async {
    final String response = await rootBundle.loadString(
      "assets/Json/Personagens.json",
    );
    Iterable data = await json.decode(response);
    listaPersonagem = List<DescricaoPersonagem>.from(
      data.map((model) => DescricaoPersonagem.fromJson(model)),
    );
    setState(() {
      listaPersonagem;
    });
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    readJsonMonstro();
    readJsonPersonagem();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 31, 30, 34),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Stack(
              alignment: AlignmentDirectional.center,
              children: <Widget>[
                Image.asset("assets/PersonagensBackground2.png"),
                Text(
                  style: TextStyle(
                    fontSize: 35,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                  "PERSONAGENS",
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
            Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: 20.0,
                vertical: 0,
              ),
              child: Column(
                // Coluna do texto (serve para delimitar o espaço que o texto pode correr)
                children: <Widget>[
                  Column(
                    spacing: 10,
                    children: [
                      Botaotext(
                        text: "Personagens",
                        func: () {
                          setState(() {
                            showPerson = !showPerson;
                          });
                        },
                      ),
                      AnimatedSwitcher(
                        duration: Duration(milliseconds: 500),
                        child: showPerson
                            ? Column(
                                children: [
                                  CarouselSlider(
                                    options: CarouselOptions(
                                      height: 750,
                                      viewportFraction: 1,
                                      enlargeCenterPage: true,
                                      enableInfiniteScroll: true,
                                      // autoPlay: true,
                                      onPageChanged: (index, reason) {
                                        setState(() {
                                          currentIndexPersonagem = index;
                                        });
                                      },
                                    ),
                                    items: listaPersonagem
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
                                            child: SingleChildScrollView(
                                              child: Padding(
                                                padding: const EdgeInsets.all(
                                                  15.0,
                                                ),
                                                child: Column(
                                                  children: [
                                                    Text(
                                                      item.nome,
                                                      textAlign:
                                                          TextAlign.start,
                                                      style: TextStyle(
                                                        color: Colors.white,
                                                        fontSize: 20,
                                                      ),
                                                    ),
                                                    SizedBox(height: 25),
                                                    Image.asset(
                                                      width: 250,
                                                      height: 350,
                                                      scale: 2,
                                                      item.imagem,
                                                      fit: BoxFit.fill,
                                                    ),
                                                    SizedBox(height: 25),
                                                    Text(
                                                      textAlign:
                                                          TextAlign.justify,
                                                      item.conteudo,
                                                      style: TextStyle(
                                                        fontSize: 14,
                                                        color: Colors.white,
                                                      ),
                                                    ),
                                                    SizedBox(height: 20),
                                                    Text(
                                                      "Aparencia",
                                                      style: TextStyle(
                                                        fontSize: 20,
                                                        color: Colors.white,
                                                      ),
                                                    ),
                                                    SizedBox(height: 15),
                                                    Text(
                                                      "${item.descAparencia}",
                                                      textAlign:
                                                          TextAlign.justify,
                                                      style: TextStyle(
                                                        fontSize: 14,
                                                        color: Colors.white,
                                                      ),
                                                    ),
                                                    SizedBox(height: 20),
                                                    Text(
                                                      "Personalidade",
                                                      style: TextStyle(
                                                        fontSize: 20,
                                                        color: Colors.white,
                                                      ),
                                                    ),
                                                    SizedBox(height: 15),
                                                    Text(
                                                      "${item.personalidade}",
                                                      textAlign:
                                                          TextAlign.justify,
                                                      style: TextStyle(
                                                        fontSize: 14,
                                                        color: Colors.white,
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                              ),
                                            ),
                                          ),
                                        )
                                        .toList(),
                                  ),
                                  DotsIndicator(
                                    dotsCount: listaPersonagem.length,
                                    position: currentIndexPersonagem.toDouble(),
                                  ),
                                ],
                              )
                            : SizedBox(height: 50),
                      ),
                      Botaotext(
                        text: "Criaturas",
                        func: () {
                          setState(() {
                            showCreatures = !showCreatures;
                          });
                        },
                      ),
                      AnimatedSwitcher(
                        duration: Duration(milliseconds: 500),
                        child: showCreatures
                            ? Column(
                                children: [
                                  CarouselSlider(
                                    options: CarouselOptions(
                                      height: 600,
                                      viewportFraction: 1,
                                      enlargeCenterPage: true,
                                      enableInfiniteScroll: true,
                                      autoPlay: true,
                                      onPageChanged: (index, reason) {
                                        setState(() {
                                          currentIndexCriatura = index;
                                        });
                                      },
                                    ),
                                    items: listaMonstro
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
                                            child: SingleChildScrollView(
                                              child: Padding(
                                                padding: const EdgeInsets.all(
                                                  15.0,
                                                ),
                                                child: Column(
                                                  children: [
                                                    Text(
                                                      item.nome,
                                                      textAlign:
                                                          TextAlign.start,
                                                      style: TextStyle(
                                                        color: Colors.white,
                                                        fontSize: 20,
                                                      ),
                                                    ),
                                                    SizedBox(height: 25),
                                                    Image.asset(
                                                      width: 250,
                                                      height: 350,
                                                      scale: 2,
                                                      item.imagem,
                                                      fit: BoxFit.fill,
                                                    ),
                                                    SizedBox(height: 25),
                                                    Text(
                                                      textAlign:
                                                          TextAlign.justify,
                                                      item.conteudo,
                                                      style: TextStyle(
                                                        fontSize: 12,
                                                        color: Colors.white,
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                              ),
                                            ),
                                          ),
                                        )
                                        .toList(),
                                  ),
                                  DotsIndicator(
                                    dotsCount: listaMonstro.length,
                                    position: currentIndexCriatura.toDouble(),
                                  ),
                                ],
                              )
                            : SizedBox(height: 50),
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
