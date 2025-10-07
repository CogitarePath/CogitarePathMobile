import 'package:agiroapp/Classes.dart';
import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:dots_indicator/dots_indicator.dart';
import 'Home.dart'; 
import 'Jogo.dart'; 
import 'Suporte.dart';

void main() {
  runApp(const NPCPAGE());
}

class NPCPAGE extends StatelessWidget {
  const NPCPAGE({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Personagens  ',
      home: const MyHomePage(title: 'Personagens'),
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

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      body: Scrollbar(
        thumbVisibility: true,
        child: Center(
    child: Container(  // Container que serve para criar o backoground
      decoration: BoxDecoration(
      image: DecorationImage(image: AssetImage("assets/PersonagensBackground.png"),
      fit: BoxFit.fill,   
      ),
      ),
      width: 400,
      height: 700,
    child: Column(
      mainAxisAlignment: MainAxisAlignment.end,
      spacing: 20,
      children: [
     Column( // Coluna do texto (serve para delimitar o espaço que o texto pode correr)
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
                 style: TextStyle(
                  fontSize: 25,
                  fontWeight: FontWeight.bold,
                 color: Colors.white,
                 ),
                 "JOGO"),],
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
                 "Jogabilidade"),
                 Text(
                 textAlign: TextAlign.justify,
                 style: TextStyle(
                fontSize: 8,
                color: Colors.white,
                ),
                " " "LOREIMPSUMLOREIMPSUMLOREIMPSUMLOREIMPSUMLOREIMPSUMLOREIMPSUMLOREIMPSUMLOREIMPSUMLOREIMPSUMLOREIMPSUMLOREIMPSUMLOREIMPSUMLOREIMPSUMLOREIMPSUMLOREIMPSUMLOREIMPSUM."
                ),
                                 Text(
                 style: TextStyle(
                fontSize: 25,
                fontWeight: FontWeight.bold,
                 color: Colors.white,
                 ),
                 "Itens"),
                                  Text(
                 textAlign: TextAlign.justify,
                 style: TextStyle(
                fontSize: 8,
                color: Colors.white,
                ),
                " " "LOREIMPSUMLOREIMPSUMLOREIMPSUMLOREIMPSUMLOREIMPSUMLOREIMPSUMLOREIMPSUMLOREIMPSUMLOREIMPSUMLOREIMPSUMLOREIMPSUMLOREIMPSUMLOREIMPSUMLOREIMPSUMLOREIMPSUMLOREIMPSUM."
                ),
                                 Text(
                 style: TextStyle(
                fontSize: 25,
                fontWeight: FontWeight.bold,
                 color: Colors.white,
                 ),
                 "Áreas"),
            CarouselSlider( options: CarouselOptions(
            viewportFraction: 0.6,
            enlargeCenterPage: true,
            enableInfiniteScroll: true,
            autoPlay: true,
            onPageChanged:(index, reason){
              setState((){
               currentIndex = index;
              });
            },
          ),
            items:areas.map((item) => Container(
              height: 800,
              width: 800,
              decoration: BoxDecoration(
              border: BoxBorder.all(color: Colors.red)
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
                  textAlign: TextAlign.justify,
                  item.conteudo,
                  style: TextStyle(
                  fontSize: 10,
                  color: Colors.white,
                  ),),
                )
                  ],
                 ),
                  Text(
                  item.nome,
                  textAlign: TextAlign.start,
                  style: TextStyle(
                  color: Colors.white,
                  ),)
                  
                ],
                )
            )
            ).toList(),
               ),
               DotsIndicator(
              dotsCount: areas.length,
              position: currentIndex.toDouble(),
            ),
                  ],
                ),
          ],
              )
              ),
          ],
        ),


        Column( 
              children: [
              Container( // CONTAINER DOS BOTÕES
              height: 100,
              width: 400,
              decoration: BoxDecoration(
              image: DecorationImage(image: AssetImage("assets/ButtonsBackground.png"),
              fit: BoxFit.fill,   
      ),
      ),

              child: Row( 
              spacing: 8,
              mainAxisAlignment: MainAxisAlignment.center,

              children:[
               SizedBox(
                height: 50,
                width: 75,
                 child: FloatingActionButton(
               onPressed: () {
                Navigator.push(context,
                MaterialPageRoute(builder: (context) => Home()));
            },
            child: Row(
            spacing: 4,
            children: [
               Icon(
               Icons.home,
               ),
                Text(
              "Home",
            )  
            
          ],
          ),
          ),
          ),
          SizedBox(
          width: 75,
          height: 50,
          child: FloatingActionButton(           
               onPressed: () {   
                Navigator.push(context,
                MaterialPageRoute(builder: (context) => Jogo()));
            },
          child: Row(
              spacing: 4,
              children: [
               Icon(
               Icons.gamepad,
               ),
                Text(
              "Jogo",
            )  
            
          ],
          ),
          ),
                              ),

          SizedBox(
          width: 75,
          height: 50,
          child: FloatingActionButton(
               onPressed: () {
                Navigator.push(context,
                MaterialPageRoute(builder: (context) => NPCPAGE ()),
                );
            },
          child: Row(
          spacing: 4,
          children: [
               Icon(
               Icons.people,
               ),
                Text(
              "NPC",
            )  
          ],
          ),
          ),
          ),

          SizedBox(
          width: 75,
          height: 50,
          child:
             FloatingActionButton(
               onPressed: () {
                Navigator.push(context,
                MaterialPageRoute(builder: (context) => Suporte()));
            },
            child: Row(
            children: [
               Icon(
               Icons.email,
               ),
                Text(
              "Suporte",
            )  
          ],
          ),
          ),
         ),
          ],
          ),
          ),
          ] 
          ),
      ],
    ),

      )
      ),
      ),
      
    );
  }
}
