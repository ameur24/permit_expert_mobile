import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class VContainer extends StatelessWidget {
  final double containerWidth;
  final double containerHeight;
  final double barWidth;
  final double barHeight;
  final String title;
  final List<String> imagePaths;
  final List<String> imageUrls;
  final List<double> imageWidths;
  final List<double> imageHeights;

  const VContainer({
    Key? key,
    required this.containerWidth,
    required this.containerHeight,
    required this.barWidth,
    required this.barHeight,
    required this.title,
    required this.imagePaths,
    required this.imageUrls,
    required this.imageWidths,
    required this.imageHeights,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 17),
      child: GestureDetector(
        child: Container(
          width: containerWidth,
          height: containerHeight,
          decoration: BoxDecoration(
            color: Color(0xFFD9D9D9).withOpacity(0.25),
            borderRadius: BorderRadius.circular(15),
          ),
          child: Stack(
            children: [
              // Titre
              Positioned(
                top: 20,
                left: 5,
                right: 0,
                child: Container(
                  padding: EdgeInsets.symmetric(vertical: 10),
                  alignment: Alignment.center,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(left: 10),
                        child: Center(
                          child: Padding(
                            padding: const EdgeInsets.only(left: 30),
                            child: Text(
                              title,
                              style: TextStyle(
                                fontSize: 14,
                                fontFamily: 'Poppins',
                              ),
                            ),
                          ),
                        ),
                      ),
                      SizedBox(height: 10),
                    ],
                  ),
                ),
              ),
              Positioned(
                top: 80,
                left: 20,
                right: 0,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: List.generate(
                    imagePaths.length ~/ 2,
                        (index) => GestureDetector(
                      onTap: () {
                        launch(imageUrls[index]);
                      },
                      child: Image.asset(
                        imagePaths[index],
                        width: imageWidths[index],
                        height: imageHeights[index],
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                ),
              ),

              Positioned(
                top: 160,
                left: 20,
                right: 0,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: List.generate(
                    imagePaths.length ~/ 2,
                        (index) => GestureDetector(
                      onTap: () {
                        launch(imageUrls[index + imagePaths.length ~/ 2]);
                      },
                      child: Image.asset(
                        imagePaths[index + imagePaths.length ~/ 2],
                        width: imageWidths[index + imagePaths.length ~/ 2],
                        height: imageHeights[index + imagePaths.length ~/ 2],
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                ),
              ),
              // Barre orange
              Positioned(
                top: 20,
                left: 20,
                child: Center(
                  child: Container(
                    width: barWidth,
                    height: barHeight,
                    color: Color(0xFFFA6A55),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
