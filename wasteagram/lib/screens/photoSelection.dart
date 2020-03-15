import 'dart:io';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class PhotoSelection extends StatefulWidget {
  PhotoSelection({Key key}) : super(key: key);

  final String title = 'Wasteagram';
  static const routeName = 'photoSelection';

  @override
  _PhotoSelectionState createState() => _PhotoSelectionState();
}

class _PhotoSelectionState extends State<PhotoSelection> {

  final formKey = GlobalKey<FormState>();
  File image;

  void getImage() async {
    image = await ImagePicker.pickImage(source: ImageSource.camera);
    setState(() {});
  }

  Widget photoSelectionScaffoldBody(File image){
    if (image == null) {
      return Center(
        child: RaisedButton(
          child: Text('Select Photo'),
          onPressed: (){
            getImage();
          },
        ),
      );
    } else {
      return Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget> [
            Flexible(
              child: Image.file(image)
            ),
            Padding(padding: const EdgeInsets.all(10)),
            Text('Number of Items'),
            Padding(padding: const EdgeInsets.all(10)),
            Form(
              key: formKey,
              child: TextField(
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                ),
                keyboardType: TextInputType.number,
              ),
            ),
            Stack(
              children: <Widget>[
                Container(
                  color: Colors.red,
                  width: MediaQuery.of(context).size.width,
                  height: .20 * MediaQuery.of(context).size.height,
                ),
                Align(
                  alignment: Alignment.center,
                  child: RaisedButton(
                    child: Icon(
                      Icons.cloud_upload,
                      size: .2 * MediaQuery.of(context).size.height,
                      color: Colors.black,
                    ),
                    onPressed: (){},
                  )
                ),
              ]
            )
          ]
        )
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(widget.title)
      ),
      body: photoSelectionScaffoldBody(image),
    );
  }
}