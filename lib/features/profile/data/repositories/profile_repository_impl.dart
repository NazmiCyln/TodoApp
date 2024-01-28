import 'package:injectable/injectable.dart';

import '../../../../services/locale/locale_resources_service.dart';
import '../../domain/repositories/profile_repository.dart';

@LazySingleton(as: ProfileRepository)
final class ProfileRepositoryImpl implements ProfileRepository {
  final LocaleResourcesService localeResourcesService;

  ProfileRepositoryImpl({required this.localeResourcesService});

  @override
  Future<void> logOut() async {
    await localeResourcesService.clearSecureStorage();
  }
}
