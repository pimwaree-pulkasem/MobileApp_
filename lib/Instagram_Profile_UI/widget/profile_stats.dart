import 'package:flutter/material.dart';

class ProfileStats extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        _buildStatColumn("221", "Posts"),
        _buildStatColumn("60,280", "Followers"),
        _buildStatColumn("20", "Following"),
      ],
    );
  }

  Column _buildStatColumn(String count, String label) {
    return Column(
      children: [
        Text(count, style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18)),
        Text(label, style: TextStyle(color: Colors.grey)),
      ],
    );
  }
}