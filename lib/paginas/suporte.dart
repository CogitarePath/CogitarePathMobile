import 'package:flutter/material.dart';
import 'package:agiroapp/classes/classes.dart';

class Suporte extends StatelessWidget {
  const Suporte({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Suporte',
      home: const MyHomePage(title: 'Suporte'),
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
  final PaginaSuporte suporteClass = PaginaSuporte("", "");
  final TextEditingController mensagemcontroller = TextEditingController();

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
                Image.asset("assets/SuporteBackground.png"),
                Text(
                  style: TextStyle(
                    fontSize: 35,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                  "SUPORTE",
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
            Align(
              alignment: Alignment.center,
              child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 0),
                    child: Column(
                      children: <Widget>[
                        Text(
                          style: TextStyle(
                            fontSize: 25,
                            fontWeight: FontWeight.bold,
                            color: Colors.white,
                          ),
                          "SUPORTE",
                        ),
                        SizedBox(height: 30),
                        Text(
                          style: TextStyle(fontSize: 20, color: Colors.white),
                          "Envie uma mensagem ao nosso suporte.",
                        ),
                        SizedBox(height: 70),
                        Text(
                          textAlign: TextAlign.left,
                          style: TextStyle(
                            fontSize: 15,
                            fontWeight: FontWeight.bold,
                            color: Colors.white,
                          ),

                          "Nome",
                        ),
                        SizedBox(height: 10),
                        TextField(
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 15,
                          ), // Fonte branca
                          decoration: InputDecoration(
                            hintText: "Digite seu nome...",
                            hintStyle: TextStyle(
                              fontSize: 15,
                              color: Colors.white,
                            ),
                            filled: true,
                            fillColor: Color.fromARGB(255, 128, 128, 128),
                            enabledBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10),
                              borderSide: BorderSide(
                                color: Color.fromARGB(255, 114, 255, 248),
                                width: 2,
                              ),
                            ),
                          ),
                        ),
                        SizedBox(height: 30),
                        Text(
                          textAlign: TextAlign.left,
                          style: TextStyle(
                            fontSize: 15,
                            fontWeight: FontWeight.bold,
                            color: Colors.white,
                          ),
                          "Email",
                        ),
                        SizedBox(height: 10),
                        TextField(
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 15,
                          ), // Fonte branca
                          decoration: InputDecoration(
                            hintText: "Digite seu email...",
                            hintStyle: TextStyle(
                              fontSize: 15,
                              color: Colors.white,
                            ),
                            filled: true,
                            fillColor: Color.fromARGB(255, 128, 128, 128),
                            enabledBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10),
                              borderSide: BorderSide(
                                color: Color.fromARGB(255, 114, 255, 248),
                                width: 2,
                              ),
                            ),
                          ),
                        ),
                        SizedBox(height: 30),
                        Text(
                          textAlign: TextAlign.left,
                          style: TextStyle(
                            fontSize: 15,
                            fontWeight: FontWeight.bold,
                            color: Colors.white,
                          ),
                          "Mensagem",
                        ),
                        SizedBox(height: 10),
                        TextField(
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 15,
                          ), // Fonte branca
                          controller: mensagemcontroller,
                          decoration: InputDecoration(
                            hintText: "Digite sua mensagem...",
                            hintStyle: TextStyle(
                              fontSize: 15,
                              color: Colors.white,
                            ),
                            filled: true,
                            fillColor: Color.fromARGB(255, 128, 128, 128),
                            enabledBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10),
                              borderSide: BorderSide(
                                color: Color.fromARGB(255, 114, 255, 248),
                                width: 2,
                              ),
                            ),
                          ),
                          maxLines: null,
                          minLines: 1,
                        ),
                        IconButton(
                          icon: Icon(Icons.send),
                          onPressed: () {
                            String mensagem = mensagemcontroller.text;

                            suporteClass.enviar(mensagem);
                          },
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
