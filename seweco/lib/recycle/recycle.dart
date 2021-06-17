import 'package:flutter/material.dart';

class RecycleScreen extends StatelessWidget {
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
            child: Text('Recycle'),
            onPressed: null
          ),
          const SizedBox(height: 30),
          ElevatedButton(
            child: Text('Donate'),
            onPressed: null
          ),
          ]
        )
      ),
    );
  }
}
