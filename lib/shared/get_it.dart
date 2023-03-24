import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';

final getIt = GetIt.instance;

setupProviders() {
  getIt.registerSingleton<Dio>(
    Dio(
      BaseOptions(
        baseUrl: 'https://bobsburgers-api.herokuapp.com/',
        receiveTimeout: const Duration(milliseconds: 60000),
      ),
    ),
  );
}
