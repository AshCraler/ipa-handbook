export 'package:envied/envied.dart';
import 'app_env.dart';

part 'app_env.g.dart';

enum Env { test, live }

@Envied(path: '.env', obfuscate: true)
abstract class AppEnv {
  static Env get environment {
    final currentEnv = _AppEnv.APP_HOST;
    for (var env in Env.values) {
      if (env.name == currentEnv) return env;
    }
    return Env.test;
  }

  @EnviedField(varName: 'APP_FLAVOR', obfuscate: true)
  static final APP_FLAVOR = _AppEnv.APP_FLAVOR;
  @EnviedField(varName: 'APP_HOST', obfuscate: true)
  static final APP_HOST = _AppEnv.APP_HOST;
  @EnviedField(varName: 'HOST_URL', obfuscate: true)
  static final HOST_URL = _AppEnv.HOST_URL;
}
