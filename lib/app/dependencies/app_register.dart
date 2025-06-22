import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:pagination_service/pagination_service.dart';

final getIt = GetIt.instance;

class AppRegister {
  static void registerDependencies() {
    getIt.registerSingleton(
      PaginationService(
        dio: Dio(
          BaseOptions(
            // ignore: avoid_redundant_argument_values
            baseUrl: const String.fromEnvironment('BASE_API_URL'),
          ),
        ),
      ),
    );
  }
}
