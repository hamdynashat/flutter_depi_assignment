class PopularPeopleJson {
  PopularPeopleJson({
      this.page, 
      this.results, 
      this.totalPages, 
      this.totalResults,});

  PopularPeopleJson.fromJson(dynamic json) {
    page = json['page'];
    if (json['results'] != null) {
      results = [];
      json['results'].forEach((v) {
        results?.add(Results.fromJson(v));
      });
    }
    totalPages = json['total_pages'];
    totalResults = json['total_results'];
  }
  num? page;
  List<Results>? results;
  num? totalPages;
  num? totalResults;
PopularPeopleJson copyWith({  num? page,
  List<Results>? results,
  num? totalPages,
  num? totalResults,
}) => PopularPeopleJson(  page: page ?? this.page,
  results: results ?? this.results,
  totalPages: totalPages ?? this.totalPages,
  totalResults: totalResults ?? this.totalResults,
);
  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['page'] = page;
    if (results != null) {
      map['results'] = results?.map((v) => v.toJson()).toList();
    }
    map['total_pages'] = totalPages;
    map['total_results'] = totalResults;
    return map;
  }

}

class Results {
  Results({
      this.adult, 
      this.gender, 
      this.id, 
      this.knownForDepartment, 
      this.name, 
      this.originalName, 
      this.popularity, 
      this.profilePath, 
      this.knownFor,});

  Results.fromJson(dynamic json) {
    adult = json['adult'];
    gender = json['gender'];
    id = json['id'];
    knownForDepartment = json['known_for_department'];
    name = json['name'];
    originalName = json['original_name'];
    popularity = json['popularity'];
    profilePath = json['profile_path'];
    if (json['known_for'] != null) {
      knownFor = [];
      json['known_for'].forEach((v) {
        knownFor?.add(KnownFor.fromJson(v));
      });
    }
  }
  bool? adult;
  num? gender;
  num? id;
  String? knownForDepartment;
  String? name;
  String? originalName;
  num? popularity;
  String? profilePath;
  List<KnownFor>? knownFor;
Results copyWith({  bool? adult,
  num? gender,
  num? id,
  String? knownForDepartment,
  String? name,
  String? originalName,
  num? popularity,
  String? profilePath,
  List<KnownFor>? knownFor,
}) => Results(  adult: adult ?? this.adult,
  gender: gender ?? this.gender,
  id: id ?? this.id,
  knownForDepartment: knownForDepartment ?? this.knownForDepartment,
  name: name ?? this.name,
  originalName: originalName ?? this.originalName,
  popularity: popularity ?? this.popularity,
  profilePath: profilePath ?? this.profilePath,
  knownFor: knownFor ?? this.knownFor,
);
  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['adult'] = adult;
    map['gender'] = gender;
    map['id'] = id;
    map['known_for_department'] = knownForDepartment;
    map['name'] = name;
    map['original_name'] = originalName;
    map['popularity'] = popularity;
    map['profile_path'] = profilePath;
    if (knownFor != null) {
      map['known_for'] = knownFor?.map((v) => v.toJson()).toList();
    }
    return map;
  }

}

class KnownFor {
  KnownFor({
      this.adult, 
      this.backdropPath, 
      this.id, 
      this.title, 
      this.originalTitle, 
      this.overview, 
      this.posterPath, 
      this.mediaType, 
      this.originalLanguage, 
      this.genreIds, 
      this.popularity, 
      this.releaseDate, 
      this.video, 
      this.voteAverage, 
      this.voteCount,});

  KnownFor.fromJson(dynamic json) {
    adult = json['adult'];
    backdropPath = json['backdrop_path'];
    id = json['id'];
    title = json['title'];
    originalTitle = json['original_title'];
    overview = json['overview'];
    posterPath = json['poster_path'];
    mediaType = json['media_type'];
    originalLanguage = json['original_language'];
    genreIds = json['genre_ids'] != null ? json['genre_ids'].cast<num>() : [];
    popularity = json['popularity'];
    releaseDate = json['release_date'];
    video = json['video'];
    voteAverage = json['vote_average'];
    voteCount = json['vote_count'];
  }
  bool? adult;
  String? backdropPath;
  num? id;
  String? title;
  String? originalTitle;
  String? overview;
  String? posterPath;
  String? mediaType;
  String? originalLanguage;
  List<num>? genreIds;
  num? popularity;
  String? releaseDate;
  bool? video;
  num? voteAverage;
  num? voteCount;
KnownFor copyWith({  bool? adult,
  String? backdropPath,
  num? id,
  String? title,
  String? originalTitle,
  String? overview,
  String? posterPath,
  String? mediaType,
  String? originalLanguage,
  List<num>? genreIds,
  num? popularity,
  String? releaseDate,
  bool? video,
  num? voteAverage,
  num? voteCount,
}) => KnownFor(  adult: adult ?? this.adult,
  backdropPath: backdropPath ?? this.backdropPath,
  id: id ?? this.id,
  title: title ?? this.title,
  originalTitle: originalTitle ?? this.originalTitle,
  overview: overview ?? this.overview,
  posterPath: posterPath ?? this.posterPath,
  mediaType: mediaType ?? this.mediaType,
  originalLanguage: originalLanguage ?? this.originalLanguage,
  genreIds: genreIds ?? this.genreIds,
  popularity: popularity ?? this.popularity,
  releaseDate: releaseDate ?? this.releaseDate,
  video: video ?? this.video,
  voteAverage: voteAverage ?? this.voteAverage,
  voteCount: voteCount ?? this.voteCount,
);
  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['adult'] = adult;
    map['backdrop_path'] = backdropPath;
    map['id'] = id;
    map['title'] = title;
    map['original_title'] = originalTitle;
    map['overview'] = overview;
    map['poster_path'] = posterPath;
    map['media_type'] = mediaType;
    map['original_language'] = originalLanguage;
    map['genre_ids'] = genreIds;
    map['popularity'] = popularity;
    map['release_date'] = releaseDate;
    map['video'] = video;
    map['vote_average'] = voteAverage;
    map['vote_count'] = voteCount;
    return map;
  }

}