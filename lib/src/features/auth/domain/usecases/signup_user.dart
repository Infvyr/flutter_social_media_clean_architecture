import '../../../../shared/domain/index.dart';
import '../entities/index.dart';
import '../repositories/index.dart';

class SignupUser implements UseCase<void, SignupUserParams> {
  SignupUser(this.authRepository);

  final AuthRepository authRepository;

  @override
  Future<void> call(SignupUserParams params) {
    // TODO: Save user to database
    return authRepository.signup(user: params.user);
  }
}

class SignupUserParams extends Params {
  SignupUserParams({required this.user});

  final LoggedInUser user;

  @override
  List<Object?> get props => [user];
}
