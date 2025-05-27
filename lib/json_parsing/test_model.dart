import 'package:http/http.dart' as http;

import 'dart:convert';

class CatImageModel {
  final String id;
  final String url;
  final int width;
  final int height;
  final List<Breed> breeds;

  CatImageModel({
    required this.id,
    required this.url,
    required this.width,
    required this.height,
    required this.breeds,
  });

  factory CatImageModel.fromJson(Map<String, dynamic> json) {
    return CatImageModel(
      id: json['id'],
      url: json['url'],
      width: json['width'],
      height: json['height'],
      breeds: (json['breeds'] as List)
          .map((breed) => Breed.fromJson(breed))
          .toList(),
    );
  }
}

class Breed {
  final String id;
  final String name;
  final String description;
  final String temperament;
  final String origin;
  final String countryCode;
  final String countryCodes;
  final String lifeSpan;
  final String? cfaUrl;
  final String? vetstreetUrl;
  final String? vcahospitalsUrl;
  final String? wikipediaUrl;
  final int indoor;
  final int lap;
  final int adaptability;
  final int affectionLevel;
  final int childFriendly;
  final int catFriendly;
  final int dogFriendly;
  final int energyLevel;
  final int grooming;
  final int healthIssues;
  final int intelligence;
  final int sheddingLevel;
  final int socialNeeds;
  final int strangerFriendly;
  final int vocalisation;
  final int bidability;
  final int experimental;
  final int hairless;
  final int natural;
  final int rare;
  final int rex;
  final int suppressedTail;
  final int shortLegs;
  final int hypoallergenic;
  final String referenceImageId;
  final Weight weight;

  Breed({
    required this.id,
    required this.name,
    required this.description,
    required this.temperament,
    required this.origin,
    required this.countryCode,
    required this.countryCodes,
    required this.lifeSpan,
    this.cfaUrl,
    this.vetstreetUrl,
    this.vcahospitalsUrl,
    this.wikipediaUrl,
    required this.indoor,
    required this.lap,
    required this.adaptability,
    required this.affectionLevel,
    required this.childFriendly,
    required this.catFriendly,
    required this.dogFriendly,
    required this.energyLevel,
    required this.grooming,
    required this.healthIssues,
    required this.intelligence,
    required this.sheddingLevel,
    required this.socialNeeds,
    required this.strangerFriendly,
    required this.vocalisation,
    required this.bidability,
    required this.experimental,
    required this.hairless,
    required this.natural,
    required this.rare,
    required this.rex,
    required this.suppressedTail,
    required this.shortLegs,
    required this.hypoallergenic,
    required this.referenceImageId,
    required this.weight,
  });

  factory Breed.fromJson(Map<String, dynamic> json) {
    return Breed(
      id: json['id'],
      name: json['name'],
      description: json['description'],
      temperament: json['temperament'],
      origin: json['origin'],
      countryCode: json['country_code'],
      countryCodes: json['country_codes'],
      lifeSpan: json['life_span'],
      cfaUrl: json['cfa_url'],
      vetstreetUrl: json['vetstreet_url'],
      vcahospitalsUrl: json['vcahospitals_url'],
      wikipediaUrl: json['wikipedia_url'],
      indoor: json['indoor'],
      lap: json['lap'],
      adaptability: json['adaptability'],
      affectionLevel: json['affection_level'],
      childFriendly: json['child_friendly'],
      catFriendly: json['cat_friendly'],
      dogFriendly: json['dog_friendly'],
      energyLevel: json['energy_level'],
      grooming: json['grooming'],
      healthIssues: json['health_issues'],
      intelligence: json['intelligence'],
      sheddingLevel: json['shedding_level'],
      socialNeeds: json['social_needs'],
      strangerFriendly: json['stranger_friendly'],
      vocalisation: json['vocalisation'],
      bidability: json['bidability'],
      experimental: json['experimental'],
      hairless: json['hairless'],
      natural: json['natural'],
      rare: json['rare'],
      rex: json['rex'],
      suppressedTail: json['suppressed_tail'],
      shortLegs: json['short_legs'],
      hypoallergenic: json['hypoallergenic'],
      referenceImageId: json['reference_image_id'],
      weight: Weight.fromJson(json['weight']),
    );
  }
}

class Weight {
  final String imperial;
  final String metric;

  Weight({required this.imperial, required this.metric});

  factory Weight.fromJson(Map<String, dynamic> json) {
    return Weight(
      imperial: json['imperial'],
      metric: json['metric'],
    );
  }
}

testFunction() async {
  final response = await http.get(Uri.parse(
      'https://api.thecatapi.com/v1/images/search?limit=10&breed_ids=beng&api_key=0000000000000000000000000000000000000'));
  List<dynamic> jsonData = jsonDecode(response.body);
  List<CatImageModel> catImages =
      jsonData.map((item) => CatImageModel.fromJson(item)).toList();

  print(catImages[0].url);
}
