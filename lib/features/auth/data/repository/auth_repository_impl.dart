import 'package:blog_app/core/errors/exceptions.dart';
import 'package:blog_app/core/errors/faliure.dart';
import 'package:blog_app/features/auth/data/datasources/auth_remote_data_sources.dart';
import 'package:blog_app/features/auth/domain/repository/auth_repository.dart';
import 'package:fpdart/fpdart.dart';

class AuthRepositoryImpl implements AuthRepository {
  final AuthRemoteDataSources remoteDataSource;
  const AuthRepositoryImpl(this.remoteDataSource);
  @override
  Future<Either<Faliure, String>> loginWithEmailPassword(
      {required String email, required String password}) {
    // TODO: implement loginWithEmailPassword
    throw UnimplementedError();
  }

  @override
  Future<Either<Faliure, String>> signUpWithEmailPassword(
      {required String name,
      required String email,
      required String password}) async {
    try {
      final userId = await remoteDataSource.signUpWithEmailPassword(
          name: name, email: email, password: password);
      return right(userId);
    } on ServerExcpetion catch (e) {
      return left(Faliure(e.message));
    }
  }
}
