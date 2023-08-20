import '../../../../shared/domain/index.dart';
import '../repository/index.dart';

class GetUser implements UseCase<User, GetUserParams> {
  final UserRepository repository;

  GetUser(this.repository);

  @override
  Future<User> call(GetUserParams params) async {
    return await repository.getUser(params.userId);
  }
}

class GetUserParams extends Params {
  GetUserParams({required this.userId});

  final String userId;

  @override
  List<Object?> get props => [userId];
}
