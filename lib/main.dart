import 'package:blog_app/core/secrets/app_secrets.dart';
import 'package:blog_app/core/theme/theme.dart';
import 'package:blog_app/features/auth/data/datasources/auth_remote_data_sources.dart';
import 'package:blog_app/features/auth/data/repository/auth_repository_impl.dart';
import 'package:blog_app/features/auth/domain/usecases/user_sign_up.dart';
import 'package:blog_app/features/auth/presentaion/bloc/auth_bloc.dart';
import 'package:blog_app/features/auth/presentaion/pages/login_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized(); 
  final supabase = Supabase.initialize(
    url: AppSecrets.SupabaseUrl,
    anonKey: AppSecrets.SupabaseAnonKey,
  );
  runApp(MultiBlocProvider(
    providers: [
      BlocProvider(create: (_) => AuthBloc(userSignUp: UserSignUp(AuthRepositoryImpl(AuthRemoteDataSourceImpl(supabase.client)))))
    ], 
    child: const MyApp(),
  ));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Blog App',
      debugShowCheckedModeBanner: false,
      theme: AppTheme.darkThemeMode,
      home: const LoginPage(),
    );
  }
}
