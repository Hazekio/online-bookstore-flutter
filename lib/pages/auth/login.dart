import 'package:flutter/material.dart';
import '../../services/auth_service.dart';
import 'signup.dart';

class LoginPage extends StatefulWidget{
  final bool redirectToCheckout;
  const LoginPage({
    super.key,
    this.redirectToCheckout = false,
    });

  @override
  State<LoginPage> createState() => _LoginPageState();
}

 class _LoginPageState extends State<LoginPage> {
    
    final emailController = TextEditingController();
    final passwordController = TextEditingController();
    final formKey = GlobalKey<FormState>();
    final authService = AuthService.instance;
    bool isLoading = false;

    //useful in Flutter to clean up any resources no longer needed such as TextEditingController
  @override
  void dispose() {
    emailController.dispose();
    passwordController.dispose();
    super.dispose(); // clean up uptree
  }

  void login() {
    if (!formKey.currentState!.validate()) return;
    setState(() {
      isLoading = true;
    });

    Future.delayed(const Duration(milliseconds: 500), () {
      final user = authService.login(
        emailController.text.trim(),
        passwordController.text.trim(),
      );

      setState(() {
        isLoading = false;
      });

      if (user != null) {
        Navigator.pop(
          context
        );
      } else {

        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(
            content: Text("Invalid email or password"),
          ),
        );
      }
    });
  }

    @override
    Widget build(BuildContext context) {

      return Scaffold(
        body: SafeArea(
          child: Center(
          child: SingleChildScrollView(
            padding: const EdgeInsets.all(24),
            child: Form(
              key: formKey,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  const Icon( Icons.menu_book, size: 80, color: Colors.indigo, ),
                  const SizedBox(height: 20),
                  const Text(
                    "The Book Nook",
                    textAlign: TextAlign.center,
                    style: TextStyle( fontSize: 32, fontWeight: FontWeight.bold ),
                  ),

                  const SizedBox(height: 10),
                  const Text( "Welcome Back!", textAlign: TextAlign.center, ),
                  const SizedBox(height: 40),

                  TextFormField(
                    controller: emailController,
                    decoration: const InputDecoration( labelText: "Email", border: OutlineInputBorder() ),
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return "Enter your email";
                      }
                      return null;
                    },
                  ),

                  const SizedBox(height: 20),
                  TextFormField(
                    controller: passwordController,
                    obscureText: true,
                    decoration: const InputDecoration( labelText: "Password", border: OutlineInputBorder() ),
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return "Enter your password";
                      }
                      return null;
                    },
                  ),

                  const SizedBox(height: 15),
                  Align(

                    alignment: Alignment.centerRight,
                    child: TextButton(
                      onPressed: () {},
                      child: const Text("Forgot Password?"),
                    ),
                  ),

                  const SizedBox(height: 10),
                  SizedBox(
                    height: 50,
                    child: ElevatedButton(
                      onPressed: isLoading ? null : login,
                      child: isLoading
                          ? const CircularProgressIndicator()
                          : const Text("Login"),
                    ),
                  ),

                  const SizedBox(height: 20),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Text("Don't have an account?"),
                      TextButton(
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (_) => const SignupPage(),
                            ),
                          );
                        },
                        child: const Text("Register"),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ),
      
        )
      );
    }

  }