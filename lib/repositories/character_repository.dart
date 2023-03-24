import 'package:consuming_api_with_bloc/models/character_model.dart';
import 'package:dio/dio.dart';

class CharacterRepository {
  final Dio _dio;

  CharacterRepository(this._dio);

  Future<List<CharacterModel>> getCharacters() async {
    final response =
        await _dio.get('characters/', queryParameters: {'limit': 20});

    if (response.statusCode == 200) {
      List<CharacterModel> characters = List.from(
          response.data.map((character) => CharacterModel.fromMap(character)));
      return characters;
    } else {
      throw Exception(response.statusMessage);
    }
  }
}
