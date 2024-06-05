import 'package:flutter/material.dart';

class GreenContainer extends StatelessWidget {
  final String titre;
  final String sousTitre;
  final String imageUrl;
  final double imageWidth;
  final double imageHeight;

  GreenContainer({
    required this.titre,
    required this.sousTitre,
    required this.imageUrl,
    required this.imageWidth,
    required this.imageHeight,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(left: 15 ,right: 10),
      child: Container(
        height: 111,
        width: 360,
        decoration: BoxDecoration(
          color: Color(0xFF9DCD5A),
          borderRadius: BorderRadius.circular(10),
        ),
        child: ListView(
          scrollDirection: Axis.horizontal,
          children: [
            Container(
              width: imageWidth,
              height: imageHeight,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                image: DecorationImage(
                  image: AssetImage(imageUrl),
                ),
              ),
            ),

            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Center(
                  child: Text(
                    titre,
                    style: TextStyle(
                      fontSize: 22,
                      fontFamily: 'Poppins',
                      color: Colors.black,
                    ),
                    textAlign: TextAlign.center,
                  ),
                ),
                SizedBox(height: 4),
                Opacity(
                  opacity: 0.5,
                  child: Center(
                    child: Text(
                      sousTitre,
                      style: TextStyle(
                        fontSize: 12,
                        fontFamily: 'Poppins',
                        color: Colors.black,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
