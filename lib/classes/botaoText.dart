import 'package:flutter/material.dart';

class Botaotext extends StatefulWidget {
  final String text;
  final VoidCallback func;

  const Botaotext({required this.text, required this.func, super.key});

  @override
  State<Botaotext> createState() => _BotaotextState();
}

class _BotaotextState extends State<Botaotext> {
  
  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: widget.func,
      style: TextButton.styleFrom(
        foregroundColor: Color.fromARGB(255, 31, 30, 34),
        backgroundColor: Color.fromARGB(255, 31, 30, 34),
        elevation: null,
      ),
      child: Text(widget.text, style: TextStyle(fontSize: 30, color: Colors.white)),
    );
  }
}
