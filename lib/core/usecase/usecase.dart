import 'package:blog_app/core/errors/faliure.dart';
import 'package:fpdart/fpdart.dart';

abstract interface class Usecase<SuccessTtype, Params >{
  Future<Either<Faliure, SuccessTtype>> call(Params params);
}