import 'package:equatable/equatable.dart';

class UserModel extends Equatable {
  final String email;
  final String name;
  final String surname;
  final String userId;

  const UserModel({
    required this.email,
    required this.name,
    required this.surname,
    required this.userId,
  });

  @override
  List<dynamic> get props => [email, name, surname, userId];

  factory UserModel.empty() {
    return const UserModel(
      email: '',
      name: '',
      surname: '',
      userId: '',
    );
  }
}
