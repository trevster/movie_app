import 'dart:convert';

import 'package:movie_app/network/movie_network.dart';
/// page : 1
/// results : [{"backdrop_path":"/n6vVs6z8obNbExdD3QHTr4Utu1Z.jpg","first_air_date":"2019-07-25","genre_ids":[10765,10759],"id":76479,"name":"The Boys","origin_country":["US"],"original_language":"en","original_name":"The Boys","overview":"A group of vigilantes known informally as “The Boys” set out to take down corrupt superheroes with no more than blue-collar grit and a willingness to fight dirty.","popularity":5005.008,"poster_path":"/stTEycfG9928HYGEISBFaG1ngjM.jpg","vote_average":8.4,"vote_count":6380},{"backdrop_path":"/rlCRM7U5g2hcU1O8ylGcqsMYHIP.jpg","first_air_date":"2022-06-08","genre_ids":[10765,10759,35],"id":92782,"name":"Ms. Marvel","origin_country":["US"],"original_language":"en","original_name":"Ms. Marvel","overview":"A great student, avid gamer, and voracious fan-fic scribe, Kamala Khan has a special affinity for superheroes, particularly Captain Marvel. However, she struggles to fit in at home and at school — that is, until she gets superpowers like the heroes she’s always looked up to. Life is easier with superpowers, right?","popularity":1790.649,"poster_path":"/cdkyMYdu8ao26XOBvilNzLneUg1.jpg","vote_average":7.7,"vote_count":220},{"backdrop_path":"/AnfXhKJwb9rBa8cvPBV54XgJxMF.jpg","first_air_date":"2022-03-28","genre_ids":[18,10766],"id":158415,"name":"Pantanal","origin_country":["BR"],"original_language":"pt","original_name":"Pantanal","overview":"After the mysterious disappearance of his father, Joventino, the cowboy José Leôncio becomes a wealthy farm owner in Pantanal. Over twenty years have passed and, bitter-hearted because of his father vanishing and the escape of his wife to Rio de Janeiro with his baby, José Leôncio has the chance to make amends with the boy, now a young man raised in the big city with very different values and habits than his own.","popularity":855.296,"poster_path":"/4Ru1BwcAKWtpM345dWe8YgHf35V.jpg","vote_average":5.1,"vote_count":26},{"backdrop_path":"/1WX8kxIIECPNAqbieVurqfpjxoo.jpg","first_air_date":"2022-05-30","genre_ids":[35,10759,10766],"id":197189,"name":"Cara e Coragem","origin_country":["BR"],"original_language":"pt","original_name":"Cara e Coragem","overview":"","popularity":835.22,"poster_path":"/8CXbCCGiJxi4AXPBQ1QPrehMIGG.jpg","vote_average":5.8,"vote_count":4},{"backdrop_path":"/5y2sHlCndnEZC6MjkJ4w40WFzo5.jpg","first_air_date":"2022-02-07","genre_ids":[18,10766],"id":154911,"name":"Além da Ilusão","origin_country":["BR"],"original_language":"pt","original_name":"Além da Ilusão","overview":"","popularity":601.075,"poster_path":"/8BzuwDAMamf5TX4TepbDDEq7ima.jpg","vote_average":6.3,"vote_count":12},{"backdrop_path":null,"first_air_date":"2022-05-30","genre_ids":[35,10765],"id":152296,"name":"Love in 40 Days","origin_country":["PH"],"original_language":"tl","original_name":"Love in 40 Days","overview":"After getting involved in a fatal car crash, a competitive career woman arrives in an uncanny purgatory. While settling her unfinished businesses as a lingering spirit, she meets and finds her soulmate in a rebellious scion with a third eye.","popularity":538.25,"poster_path":"/7cdnr3Bu728ukVBDMcOZ8zLrwOt.jpg","vote_average":2,"vote_count":1},{"backdrop_path":"/ey7d70Jqf17SsIsE8fZM0YasZmZ.jpg","first_air_date":"2022-05-16","genre_ids":[35,18],"id":135647,"name":"2 Good 2 Be True","origin_country":["PH"],"original_language":"tl","original_name":"2 Good 2 Be True","overview":"Car mechanic Eloy makes a terrible first impression on Ali, who works for a real estate magnate. But both of them are hiding their true personas.","popularity":529.153,"poster_path":"/2Wf5ySCPcnp8lRhbSD7jt0YLz5A.jpg","vote_average":7.8,"vote_count":45},{"backdrop_path":"/ggkYRGptz8eKTYnDefEjsX7fazd.jpg","first_air_date":"2022-05-26","genre_ids":[16,10762],"id":158691,"name":"My Little Pony: Make Your Mark","origin_country":["US"],"original_language":"en","original_name":"My Little Pony: Make Your Mark","overview":"The series will center on the adventures of Sunny Starscout and her friends after the events depicted in the film.","popularity":474.686,"poster_path":"/jfmQPOHnuARC7YxGYC1vMMph3vp.jpg","vote_average":8,"vote_count":41},{"backdrop_path":"/9tStcyCEBqsvW7qtvooDRlTfil2.jpg","first_air_date":"2022-06-15","genre_ids":[18,35],"id":204147,"name":"Hello, My Shining Love","origin_country":["CN"],"original_language":"zh","original_name":"遇见璀璨的你","overview":"A story about two exemplary individuals who are aces in their respective fields. Bearing emotional scars from the past, they start on a journey of healing to discover their brightest selves.\n\nThe once seasoned powerhouse Dugu Ruonan hits rock bottom after being betrayed by her own artist, Song Zihao and other staff members. Unwilling to accept defeat, Ruonan vows to make a comeback one day. She pours her efforts into building up Sida and gets a second shot in the business. Along the way, she encounters Ji Mo, the sharp-tongued president of a company and their unexpected meeting paves the way for a romance.","popularity":426.947,"poster_path":"/peJthw3XxpWdJPnuG6I0AXMOFB2.jpg","vote_average":0,"vote_count":0},{"backdrop_path":"/rpB9xThPAHPpBHwNe5g7th6WsAW.jpg","first_air_date":"2017-01-26","genre_ids":[80,18,9648],"id":69050,"name":"Riverdale","origin_country":["US"],"original_language":"en","original_name":"Riverdale","overview":"Set in the present, the series offers a bold, subversive take on Archie, Betty, Veronica and their friends, exploring the surreality of small-town life, the darkness and weirdness bubbling beneath Riverdale’s wholesome facade. Season 7 will be the final season and we are all thankful","popularity":423.523,"poster_path":"/kzZUa05wZOEiC2UVuJA2T8VrETU.jpg","vote_average":8.5,"vote_count":12676},{"backdrop_path":"/rzAzvWJoZSwVSswvWsKx1lqT63m.jpg","first_air_date":"2022-05-05","genre_ids":[10765],"id":103516,"name":"Star Trek: Strange New Worlds","origin_country":["US"],"original_language":"en","original_name":"Star Trek: Strange New Worlds","overview":"Follow Christopher Pike, Spock and Number One in the years before Captain Kirk boarded the U.S.S. Enterprise, as they explore new worlds around the galaxy. This show is a prequel to the original series and Star Trek: Discovery.","popularity":423.059,"poster_path":"/iwIdajr5Y4zq2ibvq75VnDAJBr.jpg","vote_average":8.1,"vote_count":101},{"backdrop_path":"/xio3AqrtsEERoVghgl8WWG0mXMu.jpg","first_air_date":"2022-04-24","genre_ids":[10765],"id":118663,"name":"The Man Who Fell to Earth","origin_country":["US"],"original_language":"en","original_name":"The Man Who Fell to Earth","overview":"An extraterrestrial alien arrives on Earth at a turning point in human evolution and must confront his own past to determine our future.","popularity":422.129,"poster_path":"/p1aBjGkyG25ADy4xu69joNMV3eQ.jpg","vote_average":7.7,"vote_count":47},{"backdrop_path":"/uvtMBoNqaEfDy257oZ7SRlC9VYR.jpg","first_air_date":"2015-06-07","genre_ids":[10764],"id":66636,"name":"Love Island","origin_country":["GB"],"original_language":"en","original_name":"Love Island","overview":"A stunning cast engages in the ultimate game of love, as they land in a sunshine paradise in search of passion and romance. Each of the glamorous members of the public will live like celebrities in a luxury villa, but in order to stay there, they will not only have to win over the hearts of each other, but also the hearts of the public.","popularity":368.18,"poster_path":"/xcvfGvsEyKm01dIHLh2gxnhM14A.jpg","vote_average":6,"vote_count":85},{"backdrop_path":"/mkIKdkBWcUZkjGl2ktzMlT28XL.jpg","first_air_date":"2022-04-02","genre_ids":[18,10759],"id":117067,"name":"KinnPorsche The Series","origin_country":["TH"],"original_language":"th","original_name":"รักโคตรร้าย สุดท้ายโคตรรัก","overview":"Porsche, a down and about waiter who carries the hopes and dreams of his brother on his shoulders is thrust into the feuding world of the mafia. He reluctantly becomes a bodyguard for the major clan, which only brings more problems to his life. The main source of his strife is with Kinn, but the more obstacles and trials that they get through together the closer they become. The feelings of passion start to form between them and they soon fall in love with one another. Porsche has to encounter many mysteries that are too coincidental not to be connected. It all revolves around the death of his parents and the events of the will be a key variable in the transformation.","popularity":352.397,"poster_path":"/tWVVAptzKrCx2GEae8uH1RqMv8d.jpg","vote_average":8.7,"vote_count":18},{"backdrop_path":"/vHTuFN4uN1jD1xQWHnOft5dLvL5.jpg","first_air_date":"2016-10-02","genre_ids":[10765,37],"id":63247,"name":"Westworld","origin_country":["US"],"original_language":"en","original_name":"Westworld","overview":"A dark odyssey about the dawn of artificial consciousness and the evolution of sin. Set at the intersection of the near future and the reimagined past, it explores a world in which every human appetite, no matter how noble or depraved, can be indulged.","popularity":316.541,"poster_path":"/8MfgyFHf7XEboZJPZXCIDqqiz6e.jpg","vote_average":8.1,"vote_count":4170},{"backdrop_path":"/hRSpi95EYtnxqGDbm5kPxmieTex.jpg","first_air_date":"2022-05-25","genre_ids":[9648,18],"id":202796,"name":"My Romance From Far Away","origin_country":["TH"],"original_language":"th","original_name":"อ้อมฟ้าโอบดิน","overview":"On a long drive from the mountains to the city of Chiang Mai, Captain Phasut's car turns over in an accident that kills him and his wife Namping. Their six-year-old son Tawan was fortunate not to be travelling with them that day.","popularity":295.221,"poster_path":"/yRhv68kRcBWWna2uCd7DIYUFSnP.jpg","vote_average":0,"vote_count":0},{"backdrop_path":null,"first_air_date":"2021-03-29","genre_ids":[10763],"id":119903,"name":"Noovo Le Fil 17","origin_country":["CA"],"original_language":"fr","original_name":"Noovo Le Fil 17","overview":"","popularity":284.305,"poster_path":"/ppPQS4XAUTguEVKWl4HRye4H7BU.jpg","vote_average":2.2,"vote_count":5},{"backdrop_path":null,"first_air_date":"2021-03-29","genre_ids":[10763],"id":122151,"name":"Noovo Le Fil 22","origin_country":["CA"],"original_language":"fr","original_name":"Noovo Le Fil 22","overview":"","popularity":245.128,"poster_path":"/x70JHANtSvS8IiTadaDrXY1PQBB.jpg","vote_average":1.5,"vote_count":2},{"backdrop_path":null,"first_air_date":"2021-03-29","genre_ids":[10763],"id":122152,"name":"Noovo Le Fil Québec","origin_country":["CA"],"original_language":"fr","original_name":"Noovo Le Fil Québec","overview":"","popularity":244.873,"poster_path":"/kdpM5Iz37EWi6hRMWZvrQRxTpEF.jpg","vote_average":6,"vote_count":3},{"backdrop_path":"/yoFgLaM1GCRMouDwYnGydISgFlB.jpg","first_air_date":"2022-06-16","genre_ids":[10759,18],"id":111800,"name":"The Old Man","origin_country":["US"],"original_language":"en","original_name":"The Old Man","overview":"Dan Chase absconded from the CIA decades ago and now lives off the grid. When an assassin arrives and tries to take Chase out, the old operative learns that to ensure his future he now must reconcile his past.","popularity":224.389,"poster_path":"/euYz4adiSHH0GE3YnTeh3uLfBvL.jpg","vote_average":8.3,"vote_count":26}]
/// total_pages : 41
/// total_results : 814

TvOnAirModel tvOnAirModelFromJson(String str) => TvOnAirModel.fromJson(json.decode(str));
String tvOnAirModelToJson(TvOnAirModel data) => json.encode(data.toJson());
class TvOnAirModel {
  TvOnAirModel({
      int? page, 
      List<Results>? results, 
      int? totalPages, 
      int? totalResults,}){
    _page = page;
    _results = results;
    _totalPages = totalPages;
    _totalResults = totalResults;
}

  TvOnAirModel.fromJson(dynamic json) {
    _page = json['page'];
    if (json['results'] != null) {
      _results = [];
      json['results'].forEach((v) {
        _results?.add(Results.fromJson(v));
      });
    }
    _totalPages = json['total_pages'];
    _totalResults = json['total_results'];
  }
  int? _page;
  List<Results>? _results;
  int? _totalPages;
  int? _totalResults;
TvOnAirModel copyWith({  int? page,
  List<Results>? results,
  int? totalPages,
  int? totalResults,
}) => TvOnAirModel(  page: page ?? _page,
  results: results ?? _results,
  totalPages: totalPages ?? _totalPages,
  totalResults: totalResults ?? _totalResults,
);
  int? get page => _page;
  List<Results>? get results => _results;
  int? get totalPages => _totalPages;
  int? get totalResults => _totalResults;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['page'] = _page;
    if (_results != null) {
      map['results'] = _results?.map((v) => v.toJson()).toList();
    }
    map['total_pages'] = _totalPages;
    map['total_results'] = _totalResults;
    return map;
  }

}

/// backdrop_path : "/n6vVs6z8obNbExdD3QHTr4Utu1Z.jpg"
/// first_air_date : "2019-07-25"
/// genre_ids : [10765,10759]
/// id : 76479
/// name : "The Boys"
/// origin_country : ["US"]
/// original_language : "en"
/// original_name : "The Boys"
/// overview : "A group of vigilantes known informally as “The Boys” set out to take down corrupt superheroes with no more than blue-collar grit and a willingness to fight dirty."
/// popularity : 5005.008
/// poster_path : "/stTEycfG9928HYGEISBFaG1ngjM.jpg"
/// vote_average : 8.4
/// vote_count : 6380

Results resultsFromJson(String str) => Results.fromJson(json.decode(str));
String resultsToJson(Results data) => json.encode(data.toJson());
class Results {
  Results({
      String? backdropPath, 
      String? firstAirDate, 
      List<int>? genreIds, 
      int? id, 
      String? name, 
      List<String>? originCountry, 
      String? originalLanguage, 
      String? originalName, 
      String? overview, 
      double? popularity, 
      String? posterPath, 
      double? voteAverage, 
      int? voteCount,}){
    _backdropPath = backdropPath;
    _firstAirDate = firstAirDate;
    _genreIds = genreIds;
    _id = id;
    _name = name;
    _originCountry = originCountry;
    _originalLanguage = originalLanguage;
    _originalName = originalName;
    _overview = overview;
    _popularity = popularity;
    _posterPath = posterPath;
    _voteAverage = voteAverage;
    _voteCount = voteCount;
}

  Results.fromJson(dynamic json) {
    _backdropPath = json['backdrop_path'];
    _firstAirDate = json['first_air_date'];
    _genreIds = json['genre_ids'] != null ? json['genre_ids'].cast<int>() : [];
    _id = json['id'];
    _name = json['name'];
    _originCountry = json['origin_country'] != null ? json['origin_country'].cast<String>() : [];
    _originalLanguage = json['original_language'];
    _originalName = json['original_name'];
    _overview = json['overview'];
    _popularity = json['popularity'];
    _posterPath = json['poster_path'];
    _voteAverage = double.tryParse(json['vote_average'].toString());
    _voteCount = json['vote_count'];
  }
  String? _backdropPath;
  String? _firstAirDate;
  List<int>? _genreIds;
  int? _id;
  String? _name;
  List<String>? _originCountry;
  String? _originalLanguage;
  String? _originalName;
  String? _overview;
  double? _popularity;
  String? _posterPath;
  double? _voteAverage;
  int? _voteCount;
Results copyWith({  String? backdropPath,
  String? firstAirDate,
  List<int>? genreIds,
  int? id,
  String? name,
  List<String>? originCountry,
  String? originalLanguage,
  String? originalName,
  String? overview,
  double? popularity,
  String? posterPath,
  double? voteAverage,
  int? voteCount,
}) => Results(  backdropPath: backdropPath ?? _backdropPath,
  firstAirDate: firstAirDate ?? _firstAirDate,
  genreIds: genreIds ?? _genreIds,
  id: id ?? _id,
  name: name ?? _name,
  originCountry: originCountry ?? _originCountry,
  originalLanguage: originalLanguage ?? _originalLanguage,
  originalName: originalName ?? _originalName,
  overview: overview ?? _overview,
  popularity: popularity ?? _popularity,
  posterPath: posterPath ?? _posterPath,
  voteAverage: voteAverage ?? _voteAverage,
  voteCount: voteCount ?? _voteCount,
);
  String? get backdropPath => _backdropPath;
  String? get firstAirDate => _firstAirDate;
  List<int>? get genreIds => _genreIds;
  int? get id => _id;
  String? get name => _name;
  List<String>? get originCountry => _originCountry;
  String? get originalLanguage => _originalLanguage;
  String? get originalName => _originalName;
  String? get overview => _overview;
  double? get popularity => _popularity;
  String? get posterPath {
    return Uri(
      scheme: MovieNetwork.https,
      host: MovieNetwork.imageHost,
      pathSegments: ['t','p','w500',_posterPath!],
    ).toString();
  }
  double? get voteAverage => _voteAverage;
  int? get voteCount => _voteCount;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['backdrop_path'] = _backdropPath;
    map['first_air_date'] = _firstAirDate;
    map['genre_ids'] = _genreIds;
    map['id'] = _id;
    map['name'] = _name;
    map['origin_country'] = _originCountry;
    map['original_language'] = _originalLanguage;
    map['original_name'] = _originalName;
    map['overview'] = _overview;
    map['popularity'] = _popularity;
    map['poster_path'] = _posterPath;
    map['vote_average'] = _voteAverage;
    map['vote_count'] = _voteCount;
    return map;
  }

}