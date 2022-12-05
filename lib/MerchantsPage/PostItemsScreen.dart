import 'dart:io';

import 'package:asbezaye/Screens/HomeScreen.dart';
import 'package:asbezaye/Widgets/textFieldWidget.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:file_picker/file_picker.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:image_picker/image_picker.dart';

import '../Models/createProductModel.dart';
import '../Screens/SignIn.dart';

class PostItemsScreen extends StatefulWidget {
  const PostItemsScreen({Key? key}) : super(key: key);

  @override
  State<PostItemsScreen> createState() => _PostItemsScreenState();
}

class _PostItemsScreenState extends State<PostItemsScreen> {
// this is image selector and upload part of code

  PlatformFile? pickedFile;
  UploadTask? uploadTask;

  Future SelectImage() async {
    final result = await FilePicker.platform.pickFiles();
    if (result == null) return;
    setState(() {
      pickedFile = result.files.first;
    });
  }

  final TextEditingController _ProductNameController = TextEditingController();
  final TextEditingController _ProductDescriptionController =
      TextEditingController();
  final TextEditingController _ProductPriceController = TextEditingController();
  final TextEditingController _ProductPostedby = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: GestureDetector(
            onTap: () {
              Navigator.pushAndRemoveUntil(context, MaterialPageRoute(
                builder: (context) {
                  return HomeScreen();
                },
              ), (route) => false);
            },
            child: Icon(Icons.arrow_back)),
        title: Text("Item Post"),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Container(
          padding: EdgeInsets.symmetric(horizontal: 15),
          margin: EdgeInsets.symmetric(vertical: 15),
          child: Column(
            children: [
              Text(
                "Please fill all things about the item",
                style: GoogleFonts.abel(fontSize: 20),
              ),
              SizedBox(
                height: 30,
              ),
              TextFieldWidget(
                controller: _ProductNameController,
                hintText: "Tomato",
                labelText: "Product Name",
                obscureText: false,
              ),
              SizedBox(
                height: 15,
              ),
              TextField(
                controller: _ProductDescriptionController,
                maxLines: null,
                keyboardType: TextInputType.multiline,
                decoration: InputDecoration(
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                    focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.green)),
                    hintText: "Type Something about the Product",
                    labelText: "Product Description"),
              ),
              SizedBox(
                height: 15,
              ),
              TextFieldWidget(
                controller: _ProductPriceController,
                hintText: "400 birr",
                labelText: "Product Price",
                keyboardtype: TextInputType.number,
                obscureText: false,
              ),
              SizedBox(
                height: 15,
              ),
              TextFieldWidget(
                controller: _ProductPostedby,
                hintText: "abiy teklu",
                labelText: "Posted by",
                obscureText: false,
              ),
              SizedBox(
                height: 15,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Text(
                    "Please Select the product image \n by pressing the camera button!",
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 15),
                  ),
                  IconButton(
                      onPressed: () async {
                        SelectImage();
                      },
                      icon: Icon(
                        Icons.camera_alt,
                        size: 50,
                      )),
                ],
              ),
              SizedBox(
                height: 20,
              ),
              if (pickedFile != null)
                Container(
                  color: Color.fromARGB(54, 0, 0, 0),
                  child: Image.file(
                    File(pickedFile!.path!),
                    width: 200,
                    height: 200,
                    fit: BoxFit.cover,
                  ),
                ),
              SizedBox(
                height: 50,
              ),
              ElevatedButton(
                  onPressed: () async {
                    // this part is image url getter part of code

                    final Path = 'Images/${pickedFile!.name}';
                    final file = File(pickedFile!.path!);

                    final ref = FirebaseStorage.instance.ref().child(Path);
                    uploadTask = ref.putFile(file);
                    final snapshot = await uploadTask!.whenComplete(() {});
                    final ImageURL = await snapshot.ref.getDownloadURL();

                    final ProductName = _ProductNameController.text;
                    final ProductDescription =
                        _ProductDescriptionController.text;
                    final ProductPrice = _ProductPriceController.text;
                    final ProductPostedBy = _ProductPostedby.text;
                    final ProductImage = ImageURL;

                    CreateProduct(
                        ProductName: ProductName,
                        ProductDescription: ProductDescription,
                        ProductPrice: ProductPrice,
                        ProductPostedBy: ProductPostedBy,
                        ProductImage: ProductImage);
                        // clear the text field
                        _ProductNameController.clear();
                        _ProductDescriptionController.clear();
                        _ProductPostedby.clear();
                        _ProductPriceController.clear();    
                        
                  },
                  child: Text(
                    "Post",
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 15),
                  )),
            ],
          ),
        ),
      ),
    );
  }
}
