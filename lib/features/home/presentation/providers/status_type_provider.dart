import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../domain/models/status_type.dart';

final statusTypeProvider = StateProvider<List<StatusType>>((ref) => []);
