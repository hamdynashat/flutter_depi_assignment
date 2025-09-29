import 'dart:math' as math;

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class NewPost extends StatelessWidget {
  String imagePath;

  NewPost({required this.imagePath});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          height: 60,
          width: double.infinity,
          decoration: BoxDecoration(
            color: Colors.white,
            border: Border(bottom: BorderSide(color: Colors.black, width: .5)),
          ),
          child: Row(
            children: [
              SizedBox(width: 10),
              Container(
                height: 40,
                width: 40,
                decoration: BoxDecoration(
                  color: Colors.grey.withOpacity(.35),
                  borderRadius: BorderRadius.circular(100),
                ),
                child: Icon(Icons.person_rounded),
              ),
              SizedBox(width: 8),
              Text(
                "user_name",
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
              ),
              SizedBox(width: 115),
              Container(
                height: 35,
                width: 85,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(12),
                  color: Colors.grey.withOpacity(.35),
                ),
                child: Center(
                  child: Text(
                    "Follow",
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                  ),
                ),
              ),
              SizedBox(width: 8),
              Icon(Icons.more_vert, size: 32),
            ],
          ),
        ),
        Container(
          height: 400,
          width: double.maxFinite,
          child: Image.asset(imagePath, fit: BoxFit.fill),
        ),
        Container(
          height: 50,
          width: double.infinity,
          decoration: BoxDecoration(
            color: Colors.white,
            border: Border(top: BorderSide(color: Colors.black, width: .5)),
          ),
          child: Row(
            children: [
              SizedBox(width: 15),
              Icon(FontAwesomeIcons.heart, size: 30),
              SizedBox(width: 11),
              Transform(
                alignment: Alignment.center,
                transform: Matrix4.rotationY(math.pi),
                child: Icon(FontAwesomeIcons.comment, size: 30),
              ),
              SizedBox(width: 11),
              Icon(Icons.share, size: 30),
              SizedBox(width: 220),
              Icon(FontAwesomeIcons.bookmark, size: 28),
            ],
          ),
        ),
        Row(
          children: [
            Padding(
              padding: const EdgeInsets.only(left: 12.0),
              child: Align(
                alignment: Alignment.topLeft,
                child: Text(
                  "user_name",
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 15),
                ),
              ),
            ),
            SizedBox(width: 4),
            Text(
              "caption...............................................................",
              style: TextStyle(fontSize: 14),
            ),
          ],
        ),
        SizedBox(height: 10),
      ],
    );
  }
}
