import 'package:flutter/material.dart';
import 'package:flutter_app/custom_widgets/home_card.dart';
import 'package:flutter_app/screens/profile_screen.dart';
import 'package:flutter_app/utils/app_images.dart';
import 'package:flutter_app/utils/app_colors.dart';
import 'package:flutter_app/screens/popular_people_screen.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        actions: [
          IconButton(
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (builder) => PopularPeopleScreen()),
              );
            },
            icon: Icon(Icons.groups,color: Colors.white,size: 35,),
          ),
        ],
        leading: IconButton(
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (builder) => ProfileScreen()),
            );
          },
          icon: Icon(Icons.account_circle, color: Colors.white),
          iconSize: 35,
        ),
        backgroundColor: AppColors.mainColor,
        title: Text(
          "Home",
          style: TextStyle(fontWeight: FontWeight.bold, color: Colors.white),
        ),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            NewPost(imagePath: AppImages.postOne),
            NewPost(imagePath: AppImages.postFour),
            NewPost(imagePath: AppImages.postTwo),
            NewPost(imagePath: AppImages.postThree),
          ],
        ),
      ),
    );
  }
}
