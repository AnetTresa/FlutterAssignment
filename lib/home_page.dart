import 'package:assignment/dialogue_frame.dart';
import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 241, 247, 255),
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 1.5,
        title: const Center(
          child: Text(
            'Add Comments',
            style: TextStyle(color: Colors.black),
          ),
        ),
      ),
      body: Column(
        children: [
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 10.0),
            child: Card(
              elevation: 10,
              child: Image.asset(
                'assets/card.png',
                width: 500,
                height: 220,
              ),
            ),
          ),
          const SizedBox(
            height: 30,
          ),
          Container(
            width: 380,
            decoration: BoxDecoration(
              color: const Color.fromARGB(134, 198, 208, 220),
              borderRadius: BorderRadius.circular(30),
            ),
            child: TextField(
              onChanged: (value) {},
              decoration: const InputDecoration(
                  hintText: 'Search',
                  prefixIcon: Icon(
                    Icons.search,
                  ),
                  prefixIconConstraints: BoxConstraints(
                    maxHeight: 20,
                    minWidth: 40,
                  ),
                  border: InputBorder.none),
            ),
          ),
          const SizedBox(
            height: 30,
          ),
          const DialogueFrame(),
        ],
      ),
    );
  }
}
