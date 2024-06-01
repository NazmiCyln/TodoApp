import 'package:fpdart/fpdart.dart';

abstract class LocaleResourcesService {
  Future<Option<String>> getRefreshToken();
  Future<void> setRefreshToken(String token);
  Future<void> deleteRefreshToken();
  Future<Option<String>> getAccessToken();
  Future<void> setAccessToken(String token);
  Future<void> deleteAccessToken();
  Future<void> setEmail(String email);
  Future<void> setUserId(String userId);
  Future<Option<String>> getUserId();
  Future<Option<String>> getEmail();
  Future<void> deleteEmail();
  bool getRememberMe();
  Future<void> setRememberMe(bool value);
  Future<void> clearSecureStorage();
  Future<void> deleteUserId();
  Future<void> deleteRememberMe();

  Future<Option<String>> getEmployeeId();
}
