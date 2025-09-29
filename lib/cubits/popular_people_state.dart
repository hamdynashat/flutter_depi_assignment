part of 'popular_people_cubit.dart';

@immutable
sealed class PopularPeopleState {}

final class PopularPeopleInitial extends PopularPeopleState {}
final class PopularPeopleLoading extends PopularPeopleState {}
final class PopularPeopleError extends PopularPeopleState {}
final class PopularPeopleSuccess extends PopularPeopleState {}
