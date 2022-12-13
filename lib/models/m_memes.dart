part of 'models.dart';

class Memes {
  bool? success;
  Data? data;

  Memes({this.success, this.data});

  Memes.fromJson(Map<String, dynamic> json) {
    success = json['success'];
    data = json['data'] != null ? Data.fromJson(json['data']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['success'] = success;
    if (this.data != null) {
      data['data'] = this.data!.toJson();
    }
    return data;
  }
}

class Data {
  late List<MemesData> memes;

  Data({required this.memes});

  Data.fromJson(Map<String, dynamic> json) {
    if (json['memes'] != null) {
      memes = <MemesData>[];
      json['memes'].forEach((v) {
        memes.add(MemesData.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    if (memes != null) {
      data['memes'] = memes.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class MemesData{
  late String id;
  late String name;
  late String url;
  late int width;
  late int height;
  late int boxCount;

  MemesData({
    required this.id,
    required this.name,
    required this.url,
    required this.width,
    required this.height,
    required this.boxCount
  });


  MemesData.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    url = json['url'];
    width = json['width'];
    height = json['height'];
    boxCount = json['box_count'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['name'] = name;
    data['url'] = url;
    data['width'] = width;
    data['height'] = height;
    data['box_count'] = boxCount;
    return data;
  }
}