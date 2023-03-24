import 'package:consuming_api_with_bloc/repositories/character_repository.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../models/character_model.dart';

part 'character_event.dart';
part 'character_state.dart';

class CharacterBloc extends Bloc<CharacterEvent, CharacterState> {
  final CharacterRepository _repo;
  CharacterBloc(this._repo) : super(CharacterInitial()) {
    on<LoadCharacterEvent>((event, emit) async {
      emit(CharacterLoadingState());
      try {
        final characters = await _repo.getCharacters();
        emit(CharacterLoadedState(characters));
      } catch (e) {
        emit(CharacterErrorState(e.toString()));
      }
    });
  }
}
