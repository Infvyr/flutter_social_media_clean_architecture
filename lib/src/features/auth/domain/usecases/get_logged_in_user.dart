import '../../../../shared/domain/index.dart';
import '../entities/index.dart';
import '../repositories/index.dart';

class GetLoggedInUser implements UseCase<LoggedInUser, NoParams> {
  GetLoggedInUser(this.authRepository);

  final AuthRepository authRepository;

  @override
  Future<LoggedInUser> call(NoParams params) {
    return authRepository.loggedInUser;
  }
}
