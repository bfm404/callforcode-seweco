import 'package:flutter/material.dart';

class ResellScreen extends StatelessWidget {
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
            child: Text('TO DO'),
            onPressed: null
          ),

          ]
        )
      ),
    );
  }
}
