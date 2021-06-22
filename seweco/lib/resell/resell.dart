import 'package:flutter/material.dart';

// Define a custom Form widget.
class ClothingForm extends StatefulWidget {
  @override
  ClothingFormState createState() {
    return ClothingFormState();
  }
}

// Define a corresponding State class.
// This class holds data related to the form.
class ClothingFormState extends State<ClothingForm> {
  String colourResult = '';
  String sizeResult = '';
  String materialResult = '';

  // Create a global key that uniquely identifies the Form widget
  // and allows validation of the form.
  //
  // Note: This is a `GlobalKey<FormState>`,
  // not a GlobalKey<MyCustomFormState>.
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    // Build a Form widget using the _formKey created above.
    return Form(
      key: _formKey,
      child: Column(
        children: <Widget>[
          // Add TextFormFields and ElevatedButton here.
          Container(
            width: 400,
            child: TextFormField(
              decoration: const InputDecoration(
                labelText: 'Size *',
              ),
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Please enter some text';
                }
                sizeResult = value;
                return null;
              },
            )
          ),
          const SizedBox(height: 30),
          Container(
            width: 400,
            child: TextFormField(
              decoration: const InputDecoration(
                labelText: 'Colour *',
              ),
            // The validator receives the text that the user has entered.
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Please enter some text';
                }
                colourResult = value;
                return null;
              },
            ),
          ),
          const SizedBox(height: 30),
          Container(
            width: 400,
            
            child: TextFormField(
              decoration: const InputDecoration(
                labelText: 'Material *',
              ),
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Please enter some text';
                }
                materialResult = value;
                return null;
              },
            ),
          ),
          const SizedBox(height: 30),
          ElevatedButton(
            onPressed: () {
              if (_formKey.currentState!.validate()) {
                showDialog(
                  context: context,
                  builder: (context) {
                    return Dialog(
                      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(40)),
                      elevation: 16,
                      child: Container(
                      height: 200.0,
                      width: 300.0,                        
                      child: ListView(
                          children: <Widget>[
                            SizedBox(height: 20),
                            Center(
                              child: Text(
                                "Size: $sizeResult"
                              )
                            ),
                            const SizedBox(height: 30),
                            Center(
                              child: Text(
                                "Colour: $colourResult"
                              )
                            ),
                            const SizedBox(height: 30),
                            Center(
                              child: Text(
                                "Material: $materialResult"
                              )
                            )
                          ]
                        )
                      )
                    );
                  }
                );
              }
            }, 

                // you'd often call a server or save the information in a database.
                
                  // }
            //     );
            // },
            child: Text('Submit'),
          ),
        ],
      ),
    );
  }
}


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
          ClothingForm()
          ]
        )
      ),
    );
  }
}
