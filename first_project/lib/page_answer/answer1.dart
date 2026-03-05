import 'package:flutter/material.dart';

void main() {
  runApp(const Answer1());
}

class Answer1 extends StatelessWidget {
  const Answer1({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text('Grid Layout', style: TextStyle(color: Colors.black)),
        backgroundColor: Colors.orange,
      ),
      backgroundColor: Colors.white,

      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          SizedBox(height: 20),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox(width: 20),
              Container(width: 100, height: 100, color: Colors.red),
              SizedBox(width: 20),
              Container(width: 100, height: 100, color: Colors.green),
              SizedBox(width: 20),
              Container(width: 100, height: 100, color: Colors.blue),
            ],
          ),
          SizedBox(height: 20),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox(width: 20),
              Container(width: 100, height: 100, color: Colors.orange),
              SizedBox(width: 20),
              Container(width: 100, height: 100, color: Colors.purple),
              SizedBox(width: 20),
              Container(
                width: 100,
                height: 100,
                color: const Color.fromARGB(255, 255, 247, 0),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
