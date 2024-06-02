import 'package:fpdart/fpdart.dart';

import '../../../../core/models/failure/failure.dart';
import '../models/status_type.dart';
import '../models/task.dart';

abstract interface class HomeRepository {
  Future<Either<Failure, List<StatusType>>> getStatusTypes();

  Future<Either<Failure, List<Tasks>>> getTasksList({required int statusId});
}
