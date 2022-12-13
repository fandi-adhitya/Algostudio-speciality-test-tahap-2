part of 'service.dart';

class MemesService {

  final String url = Urls.connector;
  final String getMemesPath = Urls.getMemes;

  Future<Memes> findAll() async {
    Memes memes = await MemesRepository(url: url, path: getMemesPath).findAll();
    return memes;
  }

}