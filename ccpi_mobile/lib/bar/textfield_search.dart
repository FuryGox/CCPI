import 'package:flutter/material.dart';

import '../Search_page/search_page.dart';

class TextFieldExample extends StatefulWidget {
  const TextFieldExample({super.key});

  @override
  State<TextFieldExample> createState() => _TextFieldExampleState();
}

class _TextFieldExampleState extends State<TextFieldExample> {
  late TextEditingController _controller;

  @override
  void initState() {
    super.initState();
    _controller = TextEditingController();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  void clearText() {
    _controller.clear();
  }

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      body: Center(
        child: TextField(

          decoration: InputDecoration(
              border: InputBorder.none,
              prefixIcon: const Icon(Icons.search),
              suffixIcon: GestureDetector(
                child: Icon(Icons.clear),
                onTap: () {
                  clearText();
                },
              ),
              hintText: "Search here...."
          ),
          controller: _controller,
          onSubmitted: (String value) async {
            await Navigator.push(
                context, MaterialPageRoute(builder: (context) => const search_page())
            );
          },
        ),
      ),
    );
  }
}