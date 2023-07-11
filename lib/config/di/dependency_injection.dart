import 'package:get_it/get_it.dart';

import '../../network/network.dart';

final getIt = GetIt.instance;

void configureDependencyInjection() async {
  getIt.registerSingleton<DioClient>(DioClient.instance);
}
