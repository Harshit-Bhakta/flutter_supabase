import 'package:blog_app/core/errors/faliure.dart';
import 'package:blog_app/core/usecase/usecase.dart';
import 'package:blog_app/features/auth/domain/repository/auth_repository.dart';
import 'package:fpdart/fpdart.dart';

class UserSignUp implements Usecase<String, UserSignUpparams> {
  final AuthRepository authRepository;
  const UserSignUp(this.authRepository);
  @override
  Future<Either<Faliure, String>> call(UserSignUpparams params) async {
    return await authRepository.signUpWithEmailPassword(
        name: params.name, email: params.email, password: params.password);
  }
}

class UserSignUpparams {
  final String email;
  final String password;
  final String name;

  UserSignUpparams(this.email, this.password, this.name);
}
