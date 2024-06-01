import 'package:envied/envied.dart';

part 'env.g.dart';

@Envied(path: '.env')
abstract  class Env {
  @EnviedField(obfuscate: true, varName: 'SECRET_KEY')
  static  String secretKey = _Env.secretKey;
}
