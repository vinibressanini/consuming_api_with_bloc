part of 'character_bloc.dart';

abstract class CharacterState extends Equatable {
  const CharacterState();
  @override
  List<Object> get props => [];
}

class CharacterInitial extends CharacterState {}

class CharacterLoadingState extends CharacterState {}

class CharacterLoadedState extends CharacterState {
  final List<CharacterModel> characters;
  const CharacterLoadedState(this.characters);
  @override
  List<Object> get props => [characters];
}

class CharacterErrorState extends CharacterState {
  final String errorMessage;
  const CharacterErrorState(this.errorMessage);
  @override
  List<Object> get props => [errorMessage];
}
