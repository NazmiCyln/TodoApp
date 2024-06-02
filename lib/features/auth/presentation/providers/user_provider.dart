import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../domain/models/user_model.dart';

final userProvider = StateProvider<UserModel>((ref) => UserModel.empty());
