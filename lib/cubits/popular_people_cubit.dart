import 'package:bloc/bloc.dart';
import 'package:flutter_app/api_models/popular_people.dart';
import 'package:flutter_app/api_models/popular_people_json.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meta/meta.dart';

part 'popular_people_state.dart';

class PopularPeopleCubit extends Cubit<PopularPeopleState> {
  PopularPeopleCubit() : super(PopularPeopleInitial());

  static PopularPeopleCubit get(context) => BlocProvider.of(context);
  PopularPeopleJson? popularModel = PopularPeopleJson();

  getPeopleData() async {
    emit(PopularPeopleLoading());
    popularModel = await PopularPeople.getPeopleData();
    if (popularModel != null) {
      emit(PopularPeopleSuccess());
    } else {
      emit(PopularPeopleError());
    }
  }
}
