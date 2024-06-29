import 'package:blog_app/core/theme/app_pallet.dart';
import 'package:blog_app/features/auth/presentaion/pages/signup_page.dart';
import 'package:blog_app/features/auth/presentaion/widgets/auth_field.dart';
import 'package:blog_app/features/auth/presentaion/widgets/auth_gradient_button.dart';
import 'package:flutter/material.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _SignUpPageState();
}

class _SignUpPageState extends State<LoginPage> {
  final formKey = GlobalKey<FormState>();
  final emailController = TextEditingController();
  final passwordController = TextEditingController();

  @override
  void dispose() {
    emailController.dispose();
    passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(15.0),
        child: Form(
          key: formKey,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                'Sign in',
                style: TextStyle(
                    color: Colors.white,
                    fontSize: 50,
                    fontWeight: FontWeight.bold),
              ),
              const SizedBox(
                height: 30,
              ),
              AuthField(hintText: 'Email', controller: emailController,),
              const SizedBox(
                height: 15,
              ),
              AuthField(hintText: 'Password', controller: passwordController,
              isObscureText: true,),
              const SizedBox(
                height: 20,
              ),
              AuthGradientButton(buttonText: 'Sign in',),
              const SizedBox(
                height: 20,
              ),
              GestureDetector(
                onTap: (){
                  Navigator.push(context, MaterialPageRoute(builder: (context)=> SignUpPage()));
                },
                child: RichText(
                    text: TextSpan(
                        text: "Don't have an account? ",
                        style: Theme.of(context).textTheme.titleMedium,
                        children: [
                      TextSpan(
                        text: "Sign up",
                        style: Theme.of(context).textTheme.titleMedium?.copyWith(
                            color: AppPallete.gradient2,
                            fontWeight: FontWeight.bold),
                      )
                    ])),
              )
            ],
          ),
        ),
      ),
    );
  }
}
