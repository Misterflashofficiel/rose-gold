import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:provider/provider.dart';

import '../providers/user_provider.dart';
import '../resources/firestore_methods.dart';
import '../utils/colors.dart';
import '../utils/utils.dart';

class AddPostScreen extends StatefulWidget {
  const AddPostScreen({Key? key}) : super(key: key);

  @override
  _AddPostScreenState createState() => _AddPostScreenState();
}

class _AddPostScreenState extends State<AddPostScreen> {
  Uint8List? _file;
  bool isLoading = false;
  final TextEditingController _descriptionController = TextEditingController();

  _selectImage(BuildContext parentContext) async {
    return showDialog(
      context: parentContext,
      builder: (BuildContext context) {
        return SimpleDialog(
          title: const Text('Créé une publication'),
          children: <Widget>[
            SimpleDialogOption(
                padding: const EdgeInsets.all(20),
                child: const Text('Prendre une photo'),
                onPressed: () async {
                  Navigator.pop(context);
                  Uint8List file = await pickImage(ImageSource.camera);
                  setState(() {
                    _file = file;
                  });
                }),
            SimpleDialogOption(
                padding: const EdgeInsets.all(20),
                child: const Text('Choisir dans la gallerie'),
                onPressed: () async {
                  Navigator.of(context).pop();
                  Uint8List file = await pickImage(ImageSource.gallery);
                  setState(() {
                    _file = file;
                  });
                }),
            SimpleDialogOption(
              padding: const EdgeInsets.all(20),
              child: const Text("Cancel"),
              onPressed: () {
                Navigator.pop(context);
              },
            )
          ],
        );
      },
    );
  }

  void postImage(String uid, String username, String profImage) async {
    setState(() {
      isLoading = true;
    });
    // start the loading
    try {
      // upload to storage and db
      String res = await FireStoreMethods().uploadPost(
        _descriptionController.text,
        _file!,
        uid,
        username,
        profImage,
      );
      if (res == "success") {
        setState(() {
          isLoading = false;
        });
        showSnackBar(
          context,
          'Publication en ligne!',
        );
        clearImage();
      } else {
        showSnackBar(context, res);
      }
    } catch (err) {
      setState(() {
        isLoading = false;
      });
      showSnackBar(
        context,
        err.toString(),
      );
    }
  }

  void clearImage() {
    setState(() {
      _file = null;
    });
  }

  @override
  void dispose() {
    super.dispose();
    _descriptionController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final UserProvider userProvider = Provider.of<UserProvider>(context);

    return _file == null
             ? Scaffold(
      backgroundColor: Colors.white,
        appBar: AppBar(
          backgroundColor: Colors.black,
          title: const Text(
            'Création de contenus',
          ),
          centerTitle: false,
          actions: <Widget>[
          ],
        ),
        // POST FORM
        body: SingleChildScrollView(
          child: Column(
            children: <Widget>[
              isLoading
                  ? const LinearProgressIndicator()
                  : const Padding(padding: EdgeInsets.only(top: 0.0)),
              Padding(
                padding: const EdgeInsets.only(top:30, left: 40),
                child: CircleAvatar(
                  radius: 50,
                  backgroundImage: NetworkImage(
                    userProvider.getUser.photoUrl,
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left:10),
                child: Container(
                  width: 500,
                  height: 100,
                  child: TextField(
                    keyboardType: TextInputType.multiline,
                    maxLines: null,
                    style: TextStyle(color: Colors.black),
                    controller: _descriptionController,
                    decoration: const InputDecoration(
                      enabledBorder: const OutlineInputBorder(
                        borderSide: const BorderSide(color: Colors.black, width: 0.0),
                      ),
                      hintText: "Donner une description...",

                    ),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only( left: 40),
                child: Container(
                  decoration: BoxDecoration(
                    color: Colors.red,
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: FlatButton( onPressed: () => _selectImage(context),
                    child: Text('choisir une photo'),),
                ),
              ),
            ],
          ),
        ))
        :Scaffold(
        backgroundColor: Colors.white ,
        appBar: AppBar(
          backgroundColor: Colors.black,
          leading: IconButton(
            icon: const Icon(Icons.arrow_back),
            onPressed: clearImage,
          ),
          title: const Text(
            'Retour',
          ),
          centerTitle: false,
          actions: <Widget>[
          ],
        ),
        // POST FORM
        body: SingleChildScrollView(
          child: Column(
            children: <Widget>[
              isLoading
                  ? const LinearProgressIndicator()
                  : const Padding(padding: EdgeInsets.only(top: 0.0)),
              const Divider(),
              Padding(
                padding: EdgeInsets.only(bottom:5 ),
                child: CircleAvatar(
                  radius: 50,
                  backgroundImage: NetworkImage(
                    userProvider.getUser.photoUrl,
                  ),
                ),
              ),

              Padding(
                padding: const EdgeInsets.only(left:10),
                child: Container(
                  width: 500,
                  height: 100,
                  child: TextField(
                    keyboardType: TextInputType.multiline,
                    maxLines: null,
                    style: TextStyle(color: Colors.black),
                    controller: _descriptionController,
                    decoration: const InputDecoration(
                      enabledBorder: const OutlineInputBorder(
                        borderSide: const BorderSide(color: Colors.black, width: 0.0),
                      ),
                      hintText: "Donner une description...",

                    ),
                  ),
                ),
              ),
              SizedBox(
                height: 345.0,
                width: 350,
                child: AspectRatio(
                  aspectRatio: 487 / 451,
                  child: Container(
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(30),
                        image: DecorationImage(
                          fit: BoxFit.fill,
                          alignment: FractionalOffset.topCenter,
                          image: MemoryImage(_file!),
                        )),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 10),
                child: Container(
                  decoration: BoxDecoration(
                    color: Colors.red,
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: TextButton(
                    onPressed: () => postImage(
                      userProvider.getUser.uid,
                      userProvider.getUser.username,
                      userProvider.getUser.photoUrl,
                    ),
                    child: const Text(
                      "Publier",
                      style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                          fontSize: 16.0),
                    ),
                  ),
                ),
              )

            ],
          ),
        ));
  }
}
