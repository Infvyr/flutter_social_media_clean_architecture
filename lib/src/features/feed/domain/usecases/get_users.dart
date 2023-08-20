import '../../../../shared/domain/index.dart';
import '../repository/index.dart';

class GetUsers implements UseCase<List<User>, NoParams> {
  final UserRepository repository;

  GetUsers(this.repository);

  @override
  Future<List<User>> call(NoParams params) async {
    return await repository.getUsers();
  }
}
