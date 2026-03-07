import 'package:flutter/material.dart';
import 'package:first_project/Instagram_Profile_UI/widget/action_buttons.dart';
import 'package:first_project/Instagram_Profile_UI/widget/profile_stats.dart';
import 'package:first_project/Instagram_Profile_UI/widget/post_grid.dart';
import 'package:first_project/Instagram_Profile_UI/widget/profile_header.dart';

class ProfilePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Instagram", style: TextStyle(fontWeight: FontWeight.bold)),
        actions: [IconButton(icon: Icon(Icons.more_horiz), onPressed: () {})],
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      Expanded(child: ProfileHeader()),

                      Expanded(child: ProfileStats()),
                    ],
                  ),
                  ActionButtons(),
                  const Divider(height: 1), 
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 10),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: const [
                        Icon(Icons.grid_on_sharp, size: 26),
                        Icon(
                          Icons.video_library_outlined,
                          color: Colors.grey,
                          size: 26,
                        ),
                        Icon(
                          Icons.assignment_ind_outlined,
                          color: Colors.grey,
                          size: 26,
                        ),
                      ],
                    ),
                  ),
                  const Divider(height: 1),
                  PostGrid(),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
