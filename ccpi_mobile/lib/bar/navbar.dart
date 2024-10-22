import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../Search_page/search_page.dart';


class AppBarWidget extends StatelessWidget implements PreferredSizeWidget {
  const AppBarWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return AppBar(

      // Left
      leading: GestureDetector(
        onTap: () => {
          //
        },
        child: Container(
          padding: EdgeInsets.fromLTRB(15, 0, 0, 0),
          child: CircleAvatar(
            backgroundColor: Colors.white,
            child: Image.asset(
              "assets/icon/u1.png",
              height: 50,
            ),
          ),
        ),
      ),

      // Mid
      title: Container(
          alignment: Alignment.centerLeft,
          height: 50,
          width: 250,
          padding: const EdgeInsets.fromLTRB(15, 5, 5, 0),
          child: Column(
            children: [
              Container(
                alignment: Alignment.centerLeft,
                child: const Text(
                  "Name",
                  textAlign: TextAlign.start,
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 18,
                  ),
                ),
              ),

              Container(
                alignment: Alignment.centerLeft,
                child: const Text(
                  "ID",
                  textAlign: TextAlign.start,
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 10,
                  ),
                ),
              ),

            ],
          )
      ),

      // Right
      actions: [
        GestureDetector(
            onTap: () => {
              Navigator.push(
                  context, MaterialPageRoute(builder: (context) => const search_page())
              )
            },
            child: SvgPicture.asset("assets/icon/search.svg",height: 25,color: Colors.white,)
        ),
        const SizedBox(
          width: 15,
        ),
        GestureDetector(
          onTap: () => {

          },
          child: Padding(
              padding: const EdgeInsets.only(right: 20),
              child: SvgPicture.asset("assets/icon/bell.svg", height: 25, color: Colors.white,)
          ),
        ),
      ],
      titleSpacing: 00.0,
      toolbarOpacity: 0.9,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.only(
            bottomRight: Radius.circular(15),
            bottomLeft: Radius.circular(15)),
      ),
      elevation: 0.00,
      backgroundColor: const Color.fromRGBO(54, 48, 98, 1),
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(60);
  
}