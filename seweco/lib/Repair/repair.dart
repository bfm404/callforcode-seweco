import 'package:flutter/material.dart';

class RepairOptionsScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('SewEco!'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
          ElevatedButton(
            child: Text('I want to repair this myself'),
            onPressed: null
          ),
          const SizedBox(height: 30),
          ElevatedButton(
            child: Text('I want someone to repair it for me'),
            onPressed: null
          ),
          ]
        )
      ),
    );
  }
}
