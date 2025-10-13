import 'package:architecture_pattern/core/constants/app_constants.dart';
import 'package:architecture_pattern/core/env/env_config.dart';
import 'package:architecture_pattern/core/env/local_env.dart';
import 'package:architecture_pattern/core/env/prod_env.dart';
import 'package:architecture_pattern/core/env/stag_env.dart';
import 'package:injectable/injectable.dart';

@injectable
class EnvFactory {
  AppEnvConfig getEnv({String defaultEnv = Constant.staging}) {
    switch(defaultEnv){
      case Constant.production:
        return ProdEnvConfig();
      case Constant.local:
        return LocalEnvConfig();
      default:
        return StagEnvConfig();
    }
  }
}