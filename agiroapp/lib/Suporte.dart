import 'package:flutter/material.dart';
import 'Home.dart';
import 'Jogo.dart';
import 'NPC.dart';

void main() {
  runApp(const Suporte());
}

class Suporte extends StatelessWidget {
  const Suporte({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
      ),
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  // This widget is the home page of your application. It is stateful, meaning

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {

  @override
  Widget build(BuildContext context) {
    Suporte suporte = Suporte();
    return Scaffold(
      appBar: AppBar(

        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
 
        title: Text(widget.title),
      ),
       body: Center(
    child: Container(  // Container que serve para criar o backoground
      decoration: BoxDecoration(
      image: DecorationImage(image: AssetImage("assets/SuporteBackground.png"),
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
                spacing: 150,
                children: [

               Column(
                children: [                 
                Text(
                 style: TextStyle(
                  fontSize: 25,
                  fontWeight: FontWeight.bold,
                 color: Colors.white,
                 ),
                 "SUPORTE"),],
                ),
                Column(
                children: [ 
                  Text(
                 style: TextStyle(
                  fontSize: 15,
                 color: Colors.white,
                 ),
                    "Envie uma mensagem ao nosso suporte."
                  ) ,
                  Column(children: [

                     Text(
                 textAlign: TextAlign.left,
                 style: TextStyle(
                  fontSize: 15,
                  fontWeight: FontWeight.bold,
                 color: Colors.white,
                 ),
                 
                 "Nome"),
                 Container(
                  height: 40,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: Colors.black
                  ),
                  child:TextField(
                    style: TextStyle(color: Colors.white, fontSize: 15), // Fonte branca
                    decoration: InputDecoration(
                      hintText: "Digite seu nome...",
                      hintStyle: TextStyle(  
                      fontSize: 15,
                      color: Colors.white),
                      border: InputBorder.none,
                    ),

                 ),
                 ),
                 
                 ],
                ),

                Column(
                  spacing: 2,
                  children: [
                Text(
                textAlign: TextAlign.left,
                style: TextStyle(
                fontSize: 15,
                fontWeight: FontWeight.bold,
                 color: Colors.white,
                 ),
                 "Email"),
                 Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    color: Colors.black
                  ),
                  child:TextField(
                    style: TextStyle(color: Colors.white, fontSize: 15), // Fonte branca
                    decoration: InputDecoration(
                      hintText: "Digite seu email...",
                      hintStyle: TextStyle(  
                      fontSize: 15,
                      color: Colors.white),
                      border: InputBorder.none,
                    ),

                 ),
                 ),
                 

                Text(
                textAlign: TextAlign.left,
                style: TextStyle(
                fontSize: 15,
                fontWeight: FontWeight.bold,
                 color: Colors.white,
                 ),
                 "Mensagem"),
                                 Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    color: Colors.black
                  ),
                  child:TextField(
                    style: TextStyle(color: Colors.white, fontSize: 15), // Fonte branca
                    decoration: InputDecoration(
                      hintText: "Digite sua mensagem...",
                      hintStyle: TextStyle(  
                      fontSize: 15,
                      color: Colors.white),
                      border: InputBorder.none,
                    ),
                 ),
                 ),
                  ],
                  ),

               
                  ],

                ),
          ],
              )
  ),
          ],
        ),

        /* SizedBox(
          width: 75,
          height: 50,
          child: FloatingActionButton(           

               onPressed: suporte.enviar(),
            child: Row(
              children: [
                Icon(Icons.send),
                Text("Enviar")
              ],
            ),
          )
          ),*/

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
                MaterialPageRoute(builder: (context) => NPC()));
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
    );
  }
}
