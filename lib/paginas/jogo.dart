import 'dart:convert';

import 'package:agiroapp/classes/botaoText.dart';

import 'package:agiroapp/classes/descricaoJogabilidade.dart';
import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:dots_indicator/dots_indicator.dart';
import 'package:flutter/services.dart';
import 'package:video_player/video_player.dart';

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

  List<DescricaoJogabilidade> listaJogabilidade = List.empty();
  List<DescricaoJogabilidade> listaItens = List.empty();
  List<DescricaoJogabilidade> listaArea = List.empty();

  Future<void> readJsonJogabilidade() async {
    final String response = await rootBundle.loadString(
      "assets/Json/Jogabilidade.json",
    );
    Iterable data = await json.decode(response);
    listaJogabilidade = List<DescricaoJogabilidade>.from(
      data.map((model) => DescricaoJogabilidade.fromJson(model)),
    );
    setState(() {});
  }

  Future<void> readJsonItens() async {
    final String response = await rootBundle.loadString(
      "assets/Json/itens.json",
    );
    Iterable data = await json.decode(response);
    listaItens = List<DescricaoJogabilidade>.from(
      data.map((model) => DescricaoJogabilidade.fromJson(model)),
    );
    setState(() {
      // list;
    });
  }

  Future<void> readJsonArea() async {
    final String response = await rootBundle.loadString(
      "assets/Json/area.json",
    );
    Iterable data = await json.decode(response);
    listaArea = List<DescricaoJogabilidade>.from(
      data.map((model) => DescricaoJogabilidade.fromJson(model)),
    );
    setState(() {});
  }
  final VideoPlayerController _controller =
      VideoPlayerController.networkUrl(
          Uri.parse(
            "https://flutter.github.io/assets-for-api-docs/assets/videos/bee.mp4",
          ),
        );

  @override
  void initState() {
    super.initState();

    readJsonJogabilidade();
    readJsonItens();
    readJsonArea();
  }



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 31, 30, 34),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Column(
              children: <Widget>[
                Stack(
                  alignment: AlignmentDirectional.center,
                  children: <Widget>[
                    Image.asset("assets/JogoBackground2.png"),
                    Text(
                      style: TextStyle(
                        fontSize: 30,
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
                Padding(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 20.0,
                    vertical: 0,
                  ),
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
                                  ? Column(
                                      children: [
                                        CarouselSlider(
                                          options: CarouselOptions(
                                            height: 400,
                                            viewportFraction: 1,
                                            enlargeCenterPage: true,
                                            enableInfiniteScroll: true,
                                            autoPlay: false,
                                            onPageChanged: (index, reason) {
                                              setState(() {
                                                currentIndex = index;
                                              });
                                            },
                                          ),
                                          items: listaJogabilidade
                                              .map(
                                                (item) => Container(
                                                  height: 500,
                                                  width: 800,
                                                  decoration: BoxDecoration(
                                                    border: BoxBorder.all(
                                                      color: Colors.red,
                                                    ),
                                                  ),
                                                  // margin: EdgeInsets.all(0),
                                                  child: Column(
                                                    children: [
                                                      AspectRatio(
                                                        aspectRatio: 150,
                                                        child: VideoPlayer(
                                                          _controller,
                                                        ),
                                                      ),
                                                      Text(
                                                        item.nome,
                                                        textAlign:
                                                            TextAlign.start,
                                                        style: TextStyle(
                                                          fontSize: 16,
                                                          color: Colors.white,
                                                        ),
                                                      ),
                                                      Text(
                                                        textAlign:
                                                            TextAlign.justify,
                                                        item.conteudo,
                                                        style: TextStyle(
                                                          fontSize: 13,
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
                                          dotsCount: listaJogabilidade.length,
                                          position: currentIndex.toDouble(),
                                        ),
                                      ],
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
                                  ? Column(
                                      children: [
                                        SizedBox(height: 10),
                                        CarouselSlider(
                                          options: CarouselOptions(
                                            height: 400,
                                            viewportFraction: 0.85,
                                            enlargeCenterPage: true,
                                            enableInfiniteScroll: true,
                                            autoPlay: false,
                                            onPageChanged: (index, reason) {
                                              setState(() {
                                                currentIndex = index;
                                              });
                                            },
                                          ),
                                          items: listaItens
                                              .map(
                                                (item) => Container(
                                                  height: 500,
                                                  width: 800,
                                                  decoration: BoxDecoration(
                                                    border: BoxBorder.all(
                                                      color: Colors.red,
                                                    ),
                                                  ),
                                                  // margin: EdgeInsets.all(0),
                                                  child: Column(
                                                    children: [
                                                      Image.asset(
                                                        width: 300,
                                                        height: 300,
                                                        // scale: 0.5,
                                                        item.imagem,
                                                      ),
                                                      Text(
                                                        item.nome,
                                                        textAlign:
                                                            TextAlign.start,
                                                        style: TextStyle(
                                                          fontSize: 16,
                                                          color: Colors.white,
                                                        ),
                                                      ),
                                                      Text(
                                                        textAlign:
                                                            TextAlign.justify,
                                                        item.conteudo,
                                                        style: TextStyle(
                                                          fontSize: 13,
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
                                          dotsCount: listaJogabilidade.length,
                                          position: currentIndex.toDouble(),
                                        ),
                                      ],
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
                                        SizedBox(height: 10),
                                        CarouselSlider(
                                          options: CarouselOptions(
                                            height: 400,
                                            viewportFraction: 0.85,
                                            enlargeCenterPage: true,
                                            enableInfiniteScroll: true,
                                            autoPlay: false,
                                            onPageChanged: (index, reason) {
                                              setState(() {
                                                currentIndex = index;
                                              });
                                            },
                                          ),
                                          items: listaArea
                                              .map(
                                                (item) => Container(
                                                  height: 500,
                                                  width: 800,
                                                  decoration: BoxDecoration(
                                                    border: BoxBorder.all(
                                                      color: Colors.red,
                                                    ),
                                                  ),
                                                  // margin: EdgeInsets.all(0),
                                                  child: Column(
                                                    children: [
                                                      Image.asset(
                                                        width: 300,
                                                        height: 300,
                                                        // scale: 0.5,
                                                        item.imagem,
                                                      ),
                                                      Text(
                                                        item.nome,
                                                        textAlign:
                                                            TextAlign.start,
                                                        style: TextStyle(
                                                          fontSize: 16,
                                                          color: Colors.white,
                                                        ),
                                                      ),
                                                      Text(
                                                        textAlign:
                                                            TextAlign.justify,
                                                        item.conteudo,
                                                        style: TextStyle(
                                                          fontSize: 13,
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
                                          dotsCount: listaJogabilidade.length,
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
