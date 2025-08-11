import 'package:flutter/material.dart';

class YourTripPage extends StatefulWidget {
  const YourTripPage({super.key});

  @override
  State<YourTripPage> createState() => _YourTripState();
}

class _YourTripState extends State<YourTripPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text('Your Trip', style: TextStyle(fontWeight: FontWeight.bold)),
      ),
      body: Column(children: [Text('Rental Dates ')]),
    );
  }
}
