import 'package:flutter/material.dart';

class CircleCard extends StatelessWidget {
  const CircleCard({super.key, required this.photoUrl, required this.isRead});
  final String photoUrl;
  final bool isRead;
  @override
  Widget build(BuildContext context) {
    return Card(
        elevation: 30,
        shadowColor: Colors.transparent,
        shape: CircleBorder(
          side: BorderSide(
            width: isRead ? 1 : 2,
            color: isRead ? Colors.white : Colors.blue,
          ),
        ),
        color: Colors.transparent,
        child: Container(
          height: 60,
          width: 60,
          margin: const EdgeInsets.all(3),
          decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage(photoUrl),
              fit: BoxFit.fill,
            ),
            shape: BoxShape.circle,
          ),
        ));
  }
}
