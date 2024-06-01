import 'package:fpdart/fpdart.dart';
import 'package:injectable/injectable.dart';
import 'package:todo_app/constants/api_endpoints.dart';
import 'package:todo_app/core/models/failure/failure.dart';
import 'package:todo_app/features/home/domain/models/status_type.dart';

import '../../../../constants/failure_message.dart';
import '../../../../services/network/network_service.dart';
import '../../domain/repositories/home_repository.dart';
import '../DTOs/status_type/status_type_dto.dart';

@LazySingleton(as: HomeRepository)
final class HomeRepositoryImpl implements HomeRepository {
  final NetworkService networkService;

  HomeRepositoryImpl({required this.networkService});

  @override
  Future<Either<Failure, List<StatusType>>> getStatusTypes() async {
    final result = await networkService.get(Endpoints.getStatusType);

    return result.fold(
      left,
      (r) {
        return optionOf(r.data).fold(
          () => left(Failure.unknownError(unknownErrorMessage)),
          (t) => t.extract<List>("status_type").fold(
                () => left(Failure.unknownError(unknownErrorMessage)),
                (t) => right(t.map((e) => StatusTypeDto.fromJson(e as Map<String, dynamic>).toDomain()).toList()),
              ),
        );
      },
    );
  }
}
