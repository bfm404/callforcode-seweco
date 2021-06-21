// import 'dart:async';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:flutter_linkify/flutter_linkify.dart';
// import 'package:google_maps_flutter/google_maps_flutter.dart';

//  AIzaSyDOKsGoATFKR4VszW6bxwU054UHhVtgHU4

class RepairOptionsScreen extends StatelessWidget {
  final List<String> articles = <String>[
    'https://www.google.com/search?q=how+to+repair+clothing',
    'https://lifehacker.com/how-to-repair-clothes-1843419199',
    'https://remake.world/stories/style/how-to-mend-your-clothes-during-quarantine-5-easy-stitch-fixes/',
    'https://www.loveyourclothes.org.uk/care-repair',
    'https://www.wikihow.com/Fix-Clothes'
  ];

  // Completer<GoogleMapController> _controller = Completer();

  // static final CameraPosition _kGooglePlex = CameraPosition(
  //   target: LatLng(37.42796133580664, -122.085749655962),
  //   zoom: 14.4746,
  // );

  // static final CameraPosition _kLake = CameraPosition(
  //     bearing: 192.8334901395799,
  //     target: LatLng(37.43296265331129, -122.08832357078792),
  //     tilt: 59.440717697143555,
  //     zoom: 19.151926040649414);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('SewEco!'),
      ),
      body: Center(
          child: Column(mainAxisAlignment: MainAxisAlignment.center, children: <
              Widget>[
        Padding(
            padding: EdgeInsets.all(24.0),
            child: Text(
              'I want to repair an item',
              textAlign: TextAlign.center,
              overflow: TextOverflow.ellipsis,
              style: const TextStyle(fontWeight: FontWeight.bold),
            )),
        ElevatedButton(
            child: Text('I want to repair this myself'),
            onPressed: () {
              showDialog(
                  context: context,
                  builder: (BuildContext context) {
                    return SimpleDialog(
                      title: const Text('Useful Articles'),
                      children: <Widget>[
                        Container(
                          height: 300.0,
                          width: 300.0,
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
                                    style: TextStyle(color: Colors.black),
                                    linkStyle: TextStyle(color: Colors.blue),
                                  ));
                            },
                          ),
                        )
                      ],
                    );
                  });
            }),
        const SizedBox(height: 30),
        ElevatedButton(
            child: Text('I want to find someone who can repair this for me'),
            onPressed: () {
              showDialog(
                  context: context,
                  builder: (BuildContext context) {
                    return SimpleDialog(
                      title: Linkify(
                        onOpen: (link) async {
                          if (await canLaunch(link.url)) {
                            await launch(link.url);
                          } else {
                            throw 'Could not launch $link';
                          }
                        },
                        text:
                            "https://www.google.com/maps/search/clothing+repair/@50.8675778,-1.5116562,10.63z",
                        style: TextStyle(color: Colors.black),
                        linkStyle: TextStyle(color: Colors.blue),
                      ),
                      children: <Widget>[
                        // Would be ideal to add a Google Maps widget but need to configure an API key to use
                        // GoogleMap(
                        //   mapType: MapType.hybrid,
                        //   initialCameraPosition: _kGooglePlex,
                        //   onMapCreated: (GoogleMapController controller) {
                        //     _controller.complete(controller);
                        //   },
                        // ),
                      ],
                    );
                  });
            }),
      ])),
    );
  }
}
