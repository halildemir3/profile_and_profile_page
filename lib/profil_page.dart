import 'package:flutter/material.dart';
import 'package:profile_page/profile_edit_page.dart';

class ProfilePage extends StatelessWidget {
  final String name;
  final String surName;
  final String imageUrl;

  const ProfilePage(
      {required this.name, required this.surName, required this.imageUrl});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Profile",
          style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
        backgroundColor: Colors.grey[400],
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Container(
            width: MediaQuery.of(context).size.width,
            height: 180,
            decoration: BoxDecoration(
              color: Colors.grey[400],
              borderRadius: BorderRadius.only(
                bottomRight: Radius.circular(50.0),
              ),
            ),
            child: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                Padding(
                  padding: const EdgeInsets.all(15.0),
                  child: Container(
                    width: 150,
                    height: 150,
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(75),
                      child: Image.asset(
                        imageUrl,
                        width: 150,
                        height: 150,
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  width: 30,
                ),
                Container(
                  width: 200,
                  height: 55,
                  child: Stack(
                    children: [
                      Positioned(
                        top: 0,
                        left: 0,
                        child: Text(
                          name,
                          style: TextStyle(
                              fontSize: 25,
                              fontWeight: FontWeight.bold,
                              height: 1),
                        ),
                      ),
                      Positioned(
                        bottom: 0,
                        left: 0,
                        child: Text(
                          surName,
                          style: TextStyle(
                              fontSize: 25,
                              fontWeight: FontWeight.bold,
                              height: 1),
                        ),
                      ),
                    ],
                  ),
                )
              ],
            ),
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
                        onPressed: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => ProfileEditPage()));
                        },
                        child: Text("Edit"),
                      ),
                    ))
              ],
            ),
          )
        ],
      ),
    );
  }
}
