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
            headers: <String, dynamic>{
              'User-Agent': 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) '
                  'AppleWebKit/537.36 (KHTML, like Gecko) '
                  'Chrome/120.0.0.0 Safari/537.36',
              'Accept': 'application/json',
              'Accept-Language': 'en-US,en;q=0.9',
            },
          ),
        ),
      ),
    );
  }
}
