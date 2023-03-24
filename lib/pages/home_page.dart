import 'package:consuming_api_with_bloc/repositories/character_repository.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../bloc/character_bloc.dart';
import '../shared/get_it.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final dio = getIt<Dio>();
    return BlocProvider<CharacterBloc>(
      create: (context) =>
          CharacterBloc(CharacterRepository(dio))..add(LoadCharacterEvent()),
      child: Scaffold(
        appBar: AppBar(
          title: const Text('Consuming API With BloC!'),
        ),
        body: BlocBuilder<CharacterBloc, CharacterState>(
          builder: (context, state) {
            if (state is CharacterInitial || state is CharacterLoadingState) {
              return const Center(
                child: CircularProgressIndicator(),
              );
            }
            if (state is CharacterLoadedState) {
              return ListView.builder(
                itemCount: state.characters.length,
                itemBuilder: (context, index) {
                  return ListTile(
                    leading: CircleAvatar(
                      backgroundImage:
                          NetworkImage(state.characters[index].image),
                    ),
                    title: Text(state.characters[index].name),
                  );
                },
              );
            }
            if (state is CharacterErrorState) {
              const Center(
                child: Text('Algo Deu Errado! Tente Nomamente'),
              );
            }
            return const SizedBox.shrink();
          },
        ),
      ),
    );
  }
}
