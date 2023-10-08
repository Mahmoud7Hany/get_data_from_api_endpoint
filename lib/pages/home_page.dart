import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  Map receivedData = {"timezone": "Egypt..."};

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Center(
            child: Text(
              receivedData['timezone'],
              style: const TextStyle(
                fontSize: 25,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () async {
          try {
            Response response = await get(Uri.parse(
                'http://worldtimeapi.org/api/timezone/Africa/Cairo')); // الخاص بيا اللي عوز اجيب البيانات منه api هنا بكتب
            setState(() {
              receivedData = jsonDecode(response
                  .body); // علشان اقدر استخدمه في اي مكان map بيحول الداتا لي
            });
          } catch (e) {
            print(e);
          }
        },
        child: const Icon(
          Icons.add,
        ),
      ),
    );
  }
}
