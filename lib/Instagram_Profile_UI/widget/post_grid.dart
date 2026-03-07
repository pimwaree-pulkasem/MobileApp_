import 'package:flutter/material.dart';

class PostGrid extends StatelessWidget {
  final List<String> posts = [
    'https://m.media-amazon.com/images/M/MV5BMmYwMjYzM2ItYmUxZC00OGVmLWFhYjAtNjVlNzdkZGVkNjdlXkEyXkFqcGc@._V1_.jpg',
    'https://static0.moviewebimages.com/wordpress/wp-content/uploads/2023/11/biscoitos_scooby.jpg?q=50&fit=crop&w=825&dpr=1.5',
    'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSPdcqdcC3ku1_vOwvuEBgRuGfptHhPlBUQBQ&s',
    'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRiscUPPCfqMdhaodOKv94dbuATZZ_u3P0G6A&s',
    'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTRbO2CrMOfisEd4GzRqvzPnvKYImrpN2_5tw&s',
    'https://images.mubicdn.net/images/film/82566/cache-121382-1745492552/image-w1280.jpg?size=800x',
    
  ];
  @override
  Widget build(BuildContext context) {
    return GridView.count(
      shrinkWrap: true, 
      physics: NeverScrollableScrollPhysics(), 
      crossAxisCount: 3,
      crossAxisSpacing: 2,
      mainAxisSpacing: 2,
      children: List.generate(6, (index) => Container(
        color: Colors.grey[300],
        child: Image.network(
          posts[index],
          fit: BoxFit.cover,
        ),
    
         
      )),
    );
  }
}