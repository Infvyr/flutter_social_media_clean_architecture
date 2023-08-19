import '../../../../shared/domain/index.dart';
import '../../data/data_sources/index.dart';
import '../repositories/index.dart';

class GetAuthStatus implements UseCase<AuthStatus, NoParams> {
  GetAuthStatus(this.authRepository);

  final AuthRepository authRepository;

  @override
  Stream<AuthStatus> call(NoParams params) {
    return authRepository.status;
  }
}
