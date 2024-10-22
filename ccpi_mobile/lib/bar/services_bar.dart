import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';



class OService extends StatelessWidget{
  const OService({super.key});

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.center,
      child: Row(
        children: [
          Spacer(),
          GestureDetector(
            onTap: () {

            },
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 20),
              child: const Column(
                children: [
                  Icon(
                    FontAwesomeIcons.chartPie
                  ),
                  Text(
                    "VIX"
                  ),
                ],
              ),
            ),
          ),
          Spacer(),
          GestureDetector(
            onTap: () {

            },
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 20),
              child: const Column(
                children: [
                  Icon(
                      FontAwesomeIcons.arrowTrendUp
                  ),
                  Text(
                      "VIX"
                  ),
                ],
              ),
            ),
          ),
          Spacer(),
          GestureDetector(
            onTap: () {

            },
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 20),
              child: const Column(
                children: [
                  Icon(
                      FontAwesomeIcons.arrowTrendUp
                  ),
                  Text(
                      "VIX"
                  ),
                ],
              ),
            ),
          ),
          Spacer(),
          GestureDetector(
            onTap: () {

            },
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 20),
              child: const Column(
                children: [
                  Icon(
                      FontAwesomeIcons.chartSimple
                  ),
                  Text(
                      "VIX"
                  ),
                ],
              ),
            ),
          ),
          Spacer(),
          GestureDetector(
            onTap: () {

            },
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 20),
              child: const Column(
                children: [
                  Icon(
                      FontAwesomeIcons.chartPie
                  ),
                  Text(
                      "VIX"
                  ),
                ],
              ),
            ),
          ),

          Spacer(),
        ],
      ),
    );
  }
}