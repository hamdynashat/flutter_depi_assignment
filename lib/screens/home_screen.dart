import 'package:encrypt_shared_preferences/provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app/cubits/popular_people_cubit.dart';
import 'package:flutter_app/custom_widgets/home_card.dart';
import 'package:flutter_app/screens/login_screen.dart';
import 'package:flutter_app/screens/profile_screen.dart';
import 'package:flutter_app/utils/app_images.dart';
import 'package:flutter_app/utils/app_colors.dart';
import 'package:flutter_app/screens/popular_people_screen.dart';
import 'package:flutter_app/api_models/popular_people.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        actions: [
          IconButton(
            onPressed: () async {
              try {
                final peopleData = await PopularPeopleCubit.get(context).getPeopleData();

                if (peopleData.response.statusCode == 401) {
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(content: Text("Your Session has expired")),
                  );
                  var prefs = await EncryptedSharedPreferences.getInstance();
                  await prefs.remove("username");
                  await prefs.remove("email");
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (builder) => const LoginScreen()),
                  );
                } else {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (builder) => const PopularPeopleScreen()),
                  );
                }
              } catch (e) {
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(content: Text("Error loading data: $e")),
                );
              }
            },
            icon: const Icon(Icons.groups, color: Colors.white, size: 35),
          ),
        ],
        leading: IconButton(
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (builder) => const ProfileScreen()),
            );
          },
          icon: const Icon(Icons.account_circle, color: Colors.white),
          iconSize: 35,
        ),
        backgroundColor: AppColors.mainColor,
        title: const Text(
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
