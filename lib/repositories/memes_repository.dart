part of 'repositories.dart';

class MemesRepository {

  late final String url;
  late final String path;

  MemesRepository({
    required this.url,
    required this.path,
  });

  Future<Memes> findAll() async {
    var responses = await http.get(
      Uri.https(url, path),
      headers: {
        'Content-Type' : 'application/json'
      }
    );

    final toJson = jsonDecode(responses.body);

    return Memes.fromJson(toJson);
  }

}