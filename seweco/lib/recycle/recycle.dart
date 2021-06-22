import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:flutter_linkify/flutter_linkify.dart';

class RecycleScreen extends StatelessWidget {
  final List<String> articles = <String>[
    'https://www.salvationarmy.org.uk/clothing-bank',
    'https://www.recyclenow.com/what-to-do-with/clothing-textiles-0',
    'https://www.recyclingsolutions.org.uk/clothing-banks/'
  ];

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
            Padding(
                padding: EdgeInsets.all(24.0),
                child: Text(
                  'I want to recycle an item',
                  textAlign: TextAlign.center,
                  overflow: TextOverflow.ellipsis,
                  style: const TextStyle(fontWeight: FontWeight.bold),
                )),
            Padding(
                padding: EdgeInsets.all(24.0),
                child: Text(
                  'Links to local charities/clothes banks accepting donations in your area:',
                  textAlign: TextAlign.center,
                  overflow: TextOverflow.ellipsis,
                  style: const TextStyle(fontWeight: FontWeight.bold),
                )),
            // Would be ideal to add a Google Maps widget instead of a list but need to configure an API key to use
            // Could query websites to find the locations of recyling centres and put pins on a map (using the user's location from the phone)
            Container(
              height: 300.0,
              width: 600.0,
              child: ListView.builder(
                shrinkWrap: true,
                itemCount: articles.length,
                itemBuilder: (BuildContext context, int index) {
                  return Padding(
                      padding: EdgeInsets.all(16.0),
                      child: Linkify(
                        onOpen: (link) async {
                          if (await canLaunch(link.url)) {
                            await launch(link.url);
                          } else {
                            throw 'Could not launch $link';
                          }
                        },
                        text: "${articles[index]}",
                        textAlign: TextAlign.center,
                        style: TextStyle(color: Colors.black),
                        linkStyle: TextStyle(color: Colors.blue),
                      ));
                },
              ),
            )
          ])),
    );
  }
}
