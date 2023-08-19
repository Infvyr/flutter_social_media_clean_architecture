import '../../../../shared/domain/index.dart';
import '../entities/index.dart';
import '../repositories/index.dart';

class GetLoggedInUser implements UseCase<LoggedInUser, GetPostsByUserParams> {
  GetLoggedInUser(this.authRepository);

  final AuthRepository authRepository;

  @override
  Future<LoggedInUser> call(GetPostsByUserParams params) {
    return authRepository.loggedInUser;
  }
}
