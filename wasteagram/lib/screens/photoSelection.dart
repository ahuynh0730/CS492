import 'dart:io';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:image_picker/image_picker.dart';
import 'package:path/path.dart' as Path;
import '../models/foodWastePost.dart';


class PhotoSelection extends StatefulWidget {
  PhotoSelection({Key key}) : super(key: key);

  final String title = 'Wasteagram';
  

  @override
  _PhotoSelectionState createState() => _PhotoSelectionState();
}

class _PhotoSelectionState extends State<PhotoSelection> {

  final formKey = GlobalKey<FormState>();
  File image;
  final foodWastePoste = FoodWastePoste();

  void getImage() async {
    image = await ImagePicker.pickImage(source: ImageSource.camera);
    setState(() {});
  }

  void uploadImage() async {
    StorageReference storageReference = FirebaseStorage.instance.ref().child(Path.basename(image.path));
    StorageUploadTask uploadTask = storageReference.putFile(image);
    await uploadTask.onComplete;
    foodWastePoste.imageURL = await storageReference.getDownloadURL();
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
              child: TextFormField(
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                ),
                keyboardType: TextInputType.number,
                inputFormatters: <TextInputFormatter>[WhitelistingTextInputFormatter.digitsOnly],
                validator: (value) {
                  if (value.isEmpty){
                    return 'Field cannot be empty';
                  } else return null;
                },
                onSaved: (value) {
                  foodWastePoste.quantity = int.parse(value);
                },
              ),
            ),
            Padding(padding: const EdgeInsets.all(10)),
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
                    onPressed: () async {
                      if (formKey.currentState.validate()){
                        formKey.currentState.save();
                        await uploadImage();
                        foodWastePoste.addDateToPost();
                        Firestore.instance.collection('posts').add({
                          'wasteAmount': foodWastePoste.quantity,
                          'date': foodWastePoste.date,
                          'imageURL': foodWastePoste.imageURL,
                        });
                      }
                    },
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