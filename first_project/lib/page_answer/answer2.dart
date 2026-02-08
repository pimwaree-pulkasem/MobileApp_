import 'package:flutter/material.dart';

void main() {
  runApp(const Answer2());
}

class Answer2 extends StatelessWidget {
  const Answer2({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text(
          'Social Media Post',
          style: TextStyle(color: Colors.black),
        ),
        backgroundColor: Colors.orange,
      ),
      backgroundColor: Colors.white,

      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  width: 50,
                  height: 50,
                  decoration: BoxDecoration(
                    color: Colors.blue,
                    borderRadius: BorderRadius.circular(25),
                  ),
                ),
                SizedBox(width: 20),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Pimwaree Pulkasem',
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                    ),

                    Text(
                      '5 minutes ago',
                      style: TextStyle(fontSize: 16, color: Colors.grey),
                    ),
                  ],
                ),
              ],
            ),
            SizedBox(height: 20),

            Container(width: double.infinity, height: 200, color: Colors.grey),

            SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                ElevatedButton(
                  onPressed: () {},
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Color.fromARGB(
                      195,
                      241,
                      236,
                      249,
                    ), 
                    foregroundColor: const Color.fromARGB(255, 125, 103, 163),
                    side: BorderSide(color: Color(0xFFE0D7F3)),
                    shape: StadiumBorder(),
                    padding: EdgeInsets.symmetric(horizontal: 24),
                  ),
                  child: Text('Like'),
                ),
                         ElevatedButton(
                  onPressed: () {},
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Color.fromARGB(
                      195,
                      241,
                      236,
                      249,
                    ), 
                    foregroundColor: const Color.fromARGB(255, 125, 103, 163),
                    side: BorderSide(color: Color(0xFFE0D7F3)),
                    shape: StadiumBorder(),
                    padding: EdgeInsets.symmetric(horizontal: 24),
                  ),
                  child: Text('Comment'),
                ),
                        ElevatedButton(
                  onPressed: () {},
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Color.fromARGB(
                      195,
                      241,
                      236,
                      249,
                    ), 
                    foregroundColor: const Color.fromARGB(255, 125, 103, 163),
                    side: BorderSide(color: Color(0xFFE0D7F3)),
                    shape: StadiumBorder(),
                    padding: EdgeInsets.symmetric(horizontal: 24),
                  ),
                  child: Text('Share'),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
