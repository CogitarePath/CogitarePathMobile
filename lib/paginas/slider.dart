import 'package:agiroapp/paginas/Jogo.dart';
import 'package:agiroapp/paginas/Suporte.dart';
import 'package:agiroapp/paginas/home.dart';
import 'package:agiroapp/paginas/npc.dart';
import 'package:flutter/material.dart';

class SliderPage extends StatefulWidget {
  const SliderPage({super.key});

  @override
  State<SliderPage> createState() => _SliderPageState();
}

class _SliderPageState extends State<SliderPage> {
  int pgAtual = 0;
  late PageController pc;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    pc = PageController(initialPage: pgAtual);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        backgroundColor: Color.fromARGB(255, 34, 33, 36),
        selectedItemColor: const Color.fromARGB(255, 131, 33, 243),
        unselectedItemColor: Colors.grey,
        currentIndex: pgAtual,
        items: [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: "Home"),
          BottomNavigationBarItem(icon: Icon(Icons.gamepad), label: "Jogo"),
          BottomNavigationBarItem(icon: Icon(Icons.people), label: "NPC"),
          BottomNavigationBarItem(icon: Icon(Icons.email), label: "Suporte"),
        ],
        onTap: (pagina){
          pc.animateToPage(pagina, duration: Duration(microseconds: 450), curve: Curves.bounceInOut);
        },

      ),
      body: PageView(
        controller: pc,
        onPageChanged: SetPaginaAtual,
        children: [Home(), Jogo(), NPCPAGE(), Suporte()],
      ),
    );
  }
  
  SetPaginaAtual(pagina) {
    setState(() {
      pgAtual = pagina;
    });
  }
}
