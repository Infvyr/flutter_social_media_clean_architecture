import '../../../../shared/domain/index.dart';
import '../../data/data_sources/index.dart';
import '../repositories/index.dart';

class GetAuthStatus implements UseCase<AuthStatus, GetPostsByUserParams> {
  GetAuthStatus(this.authRepository);

  final AuthRepository authRepository;

  @override
  Stream<AuthStatus> call(GetPostsByUserParams params) {
    return authRepository.status;
  }
}
