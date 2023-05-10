import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';

class NewsCard extends StatelessWidget {
  const NewsCard({super.key, required this.photoUrl, required this.isRead});
  final String photoUrl;
  final bool isRead;
  @override
  Widget build(BuildContext context) {
    return Card(
        elevation: 20,
        shadowColor: Colors.transparent,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
        color: Colors.white,
        child: SizedBox(
          height: 120,
          width: 200,
          child: Column(
            children: [
              Container(
                height: 120,
                width: 200,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(16),
                  image: DecorationImage(
                    image: AssetImage(photoUrl),
                    fit: BoxFit.fill,
                  ),
                  shape: BoxShape.rectangle,
                ),
              ),
              const Flexible(
                child: Padding(
                  padding: EdgeInsets.all(8.0),
                  child: AutoSizeText(
                    "Дарим подарки каждую неделю + 2 путеществие",
                    maxLines: 2,
                    style: TextStyle(
                        fontSize: 14,
                        fontFamily: "Gilroy",
                        fontWeight: FontWeight.w400,
                      height: 16/14),
                  ),
                ),
              )
            ],
          ),
        ));
  }
}
