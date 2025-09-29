import 'package:flutter/material.dart';
import 'package:flutter_app/cubits/popular_people_cubit.dart';
import 'package:flutter_app/utils/app_colors.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class PopularPeopleScreen extends StatefulWidget {
  const PopularPeopleScreen({super.key});

  @override
  State<PopularPeopleScreen> createState() => _PopularPeopleScreenState();
}

class _PopularPeopleScreenState extends State<PopularPeopleScreen> {
  @override
  void initState() {
    PopularPeopleCubit.get(context).getPeopleData();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Popular people",
          style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
        backgroundColor: AppColors.mainColor,
      ),
      body: Padding(
        padding: EdgeInsets.all(10),
        child: BlocBuilder<PopularPeopleCubit, PopularPeopleState>(
          builder: (context, state) {
            return state is PopularPeopleLoading
                ? Center(child: CircularProgressIndicator())
                : state is PopularPeopleError
                ? SizedBox()
                : ListView.separated(
                    itemBuilder: (context, index) {
                      return Container(
                        height: 150,
                        decoration: BoxDecoration(
                          color: AppColors.mainColor,
                          borderRadius: BorderRadius.circular(20),
                        ),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              "Name: ${PopularPeopleCubit.get(context).popularModel?.results?[index].name ?? "no name"}",
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 18,
                              ),
                            ),
                            SizedBox(height: 4),
                            Text(
                              "Gender: ${PopularPeopleCubit.get(context).popularModel?.results?[index].gender == 1
                                  ? "Male"
                                  : PopularPeopleCubit.get(context).popularModel?.results?[index].gender == 2
                                  ? "Female"
                                  : "no gender"}",
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 18,
                              ),
                            ),
                            SizedBox(height: 4),
                            Text(
                              "Department ${PopularPeopleCubit.get(context).popularModel?.results?[index].knownForDepartment ?? "No department"}",
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 18,
                              ),
                            ),
                          ],
                        ),
                      );
                    },
                    separatorBuilder: (context, index) {
                      return SizedBox(height: 10);
                    },
                    itemCount: PopularPeopleCubit.get(
                      context,
                    ).popularModel!.results!.length,
                  );
          },
        ),
      ),
    );
  }
}
