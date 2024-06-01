import 'package:fpdart/fpdart.dart';

import '../../../../core/models/failure/failure.dart';
import '../models/status_type.dart';

abstract interface class HomeRepository {
  Future<Either<Failure, List<StatusType>>> getStatusTypes();
}
