import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class LearnContainer extends StatelessWidget {
  final double containerWidth;
  final double containerHeight;
  final double barWidth;
  final double barHeight;
  final String title;
  final String link;

  const LearnContainer({
    Key? key,
    required this.containerWidth,
    required this.containerHeight,
    required this.barWidth,
    required this.barHeight,
    required this.title,
    required this.link,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 17),
      child: GestureDetector(
        onTap: () {
          launch(link);
        },
        child: Container(
          width: containerWidth,
          height: containerHeight,
          decoration: BoxDecoration(
            color: Color(0xFFD9D9D9).withOpacity(0.25),
            borderRadius: BorderRadius.circular(15),
          ),
          child: Stack(
            children: [
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
                      Padding(
                        padding: const EdgeInsets.only(left: 40),
                        child: Text(
                          "Cliquez ici pour en savoir plus",
                          style: TextStyle(
                            fontSize: 12,
                            color: Color(0xFF00008B),
                            decoration: TextDecoration.underline,
                          ),
                          textAlign: TextAlign.center,
                        ),
                      ),
                    ],
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
