import 'package:flutter/material.dart';
import 'package:first_project/page_answer/answer1.dart';
import 'package:first_project/page_answer/answer2.dart';
import 'package:first_project/page_answer/answer3.dart';
import 'package:first_project/page_answer/answer4.dart';
void main() {
  runApp(const AnswerPortal());
}

class AnswerPortal extends StatelessWidget {
  const AnswerPortal({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
         appBar: AppBar(
        centerTitle: true,
        title: const Text('My Answer', style: TextStyle(color: Colors.black)),
        backgroundColor: Colors.orange,
      ),
      backgroundColor: Colors.white,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [ 
          Row( 
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
          ElevatedButton(
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const Answer1()),
              ); },
              style: ElevatedButton.styleFrom(
                    backgroundColor: Color.fromARGB(255, 255, 255, 255), 
                    foregroundColor: const Color.fromARGB(255, 255, 255, 255),
                    side: BorderSide(color: Color(0xFFE0D7F3)),
                    shape: StadiumBorder()),
            child: const Text('Answer1', style: TextStyle(color: Colors.purple)),
          ),],),
          SizedBox(height: 10),
          
          Row( 
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
          ElevatedButton(
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const Answer2()),
              );
            },
            style: ElevatedButton.styleFrom(
                    backgroundColor: Color.fromARGB(255, 255, 255, 255), 
                    foregroundColor: const Color.fromARGB(255, 255, 255, 255),
                    side: BorderSide(color: Color(0xFFE0D7F3)),
                    shape: StadiumBorder()),
            child: const Text('Answer2', style: TextStyle(color: Colors.purple)),
          ),],),

          SizedBox(height: 10),
          
          Row( 
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
          ElevatedButton(
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const Answer3()),
              );
            },style: ElevatedButton.styleFrom(
                    backgroundColor: Color.fromARGB(255, 255, 255, 255), 
                    foregroundColor: const Color.fromARGB(255, 255, 255, 255),
                    side: BorderSide(color: Color(0xFFE0D7F3)),
                    shape: StadiumBorder()),
            child: const Text('Answer3', style: TextStyle(color: Colors.purple)),
          ),],),
          SizedBox(height: 10),
          
          Row( 
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
          ElevatedButton(
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const Answer4()),
              );
            },style: ElevatedButton.styleFrom(
                     backgroundColor: Color.fromARGB(255, 255, 255, 255), 
                    foregroundColor: const Color.fromARGB(255, 255, 255, 255),
                    side: BorderSide(color: Color(0xFFE0D7F3)),
                    shape: StadiumBorder()),
            child: const Text('Answer4', style: TextStyle(color: Colors.purple)),
          ),],),
        ],
      ),
        
    );
    
  }
}
