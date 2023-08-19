import 'package:equatable/equatable.dart';

abstract class UseCase<Type, Params> {
  call(Params params);
}

abstract class Params extends Equatable {}

class GetPostsByUserParams extends Equatable {
  const GetPostsByUserParams();

  @override
  List<Object?> get props => [];
}
