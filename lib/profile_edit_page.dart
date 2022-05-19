import 'dart:io';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

late File? _secilenDosya;

class ProfileEditPage extends StatelessWidget {
  TextEditingController name = TextEditingController();
  TextEditingController surName = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Profile Edit",
          style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
        backgroundColor: Colors.grey[400],
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Container(
                  width: 160,
                  height: 180,
                  child: Stack(
                    children: [
                      Positioned(
                        bottom: 0,
                        child: GestureDetector(
                          onTap: () {
                            _secimGoster(context);
                          },
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(75),
                            child: Image.asset(
                              'assets/1997.jpg',
                              width: 150,
                              height: 150,
                            ),
                          ),
                        ),
                      ),
                      Positioned(
                          bottom: 5,
                          right: 20,
                          child: Icon(
                            Icons.add_a_photo_outlined,
                            size: 30,
                            color: Colors.blue[600],
                          )),
                    ],
                  ),
                ),
                SizedBox(
                  height: 30,
                ),
                Container(
                    width: 250,
                    child: TextFormField(
                      controller: name,
                      maxLines: 1,
                    )),
                SizedBox(
                  height: 30,
                ),
                Container(
                  width: 250,
                  child: TextFormField(
                    controller: surName,
                    maxLines: 1,
                  ),
                ),
              ],
            ),
            Container(
              width: MediaQuery.of(context).size.width,
              height: 50,
              child: Stack(
                children: [
                  Positioned(
                      right: 10,
                      child: Container(
                        alignment: Alignment.bottomCenter,
                        width: 100,
                        height: 40,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(8),
                          color: Colors.grey[400],
                        ),
                        child: TextButton(
                          onPressed: () {},
                          child: Text("Save"),
                        ),
                      ))
                ],
              ),
            )
          ],
        ),
      ),
    );
  }

  void _secimGoster(BuildContext context) {
    showDialog(
        context: context,
        builder: (context) => AlertDialog(
              content: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  ListTile(
                    title: Text("Camera"),
                    onTap: () {
                      _yukle(ImageSource.camera);
                    },
                  ),
                  ListTile(
                    title: Text("Galery"),
                    onTap: () {
                      _yukle(ImageSource.gallery);
                    },
                  ),
                ],
              ),
            ));
  }
}

void _yukle(ImageSource source) async {
  final picker = ImagePicker();
  final secilen = await picker.getImage(source: source);
  _secilenDosya = File(secilen!.path);
}
