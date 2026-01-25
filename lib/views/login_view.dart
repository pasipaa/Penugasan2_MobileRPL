import 'package:flutter/material.dart';
import 'package:semester2_postman/services/user.dart';
import 'package:semester2_postman/widgets/alert.dart';

class LoginView extends StatefulWidget {
  const LoginView({super.key});

  @override
  State<LoginView> createState() => _LoginViewState();
}

class _LoginViewState extends State<LoginView> {
  UserService user = UserService();
  final formKey = GlobalKey<FormState>();
  TextEditingController email = TextEditingController();
  TextEditingController password = TextEditingController();
  bool isLoading = false;
  bool showPass = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [Colors.blue.shade500, Colors.white],
          ),
        ),
        child: SafeArea(
          child: SingleChildScrollView(
            child: Center(
              child: Container(
                constraints: const BoxConstraints(maxWidth: 400),
                margin: const EdgeInsets.all(16),
                child: Card(
                  elevation: 6,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(16),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 20,
                      vertical: 24,
                    ),
                    child: Column(
                      children: [
                        const Text(
                          "LOGIN",
                          style: TextStyle(
                            fontSize: 22,
                            fontWeight: FontWeight.bold,
                            letterSpacing: 1,
                          ),
                        ),
                        const SizedBox(height: 24),
                        Form(
                          key: formKey,
                          child: Column(
                            children: [
                              TextFormField(
                                controller: email,
                                decoration: const InputDecoration(
                                  label: Text("Email"),
                                ),
                                validator: (value) {
                                  if (value!.isEmpty) {
                                    return 'Email harus diisi';
                                  }
                                  return null;
                                },
                              ),
                              const SizedBox(height: 14),
                              TextFormField(
                                controller: password,
                                obscureText: showPass,
                                decoration: InputDecoration(
                                  label: const Text("Password"),
                                  suffix: IconButton(
                                    onPressed: () {
                                      setState(() {
                                        showPass = !showPass;
                                      });
                                    },
                                    icon: Icon(
                                      showPass
                                          ? Icons.visibility
                                          : Icons.visibility_off,
                                    ),
                                  ),
                                ),
                                validator: (value) {
                                  if (value!.isEmpty) {
                                    return 'Password harus diisi';
                                  }
                                  return null;
                                },
                              ),
                              const SizedBox(height: 28),

                              /// BUTTON LOGIN
                              SizedBox(
                                width: double.infinity,
                                child: MaterialButton(
                                  onPressed: () async {
                                    if (formKey.currentState!.validate()) {
                                      setState(() {
                                        isLoading = true;
                                      });

                                      var data = {
                                        "email": email.text,
                                        "password": password.text,
                                      };

                                      var result =
                                          await user.loginUser(data);

                                      setState(() {
                                        isLoading = false;
                                      });

                                      if (result.status == true) {
                                        AlertMessage().showAlert(
                                          context,
                                          result.message,
                                          true,
                                        );
                                        Future.delayed(
                                          const Duration(seconds: 2),
                                          () {
                                            Navigator.pushReplacementNamed(
                                              context,
                                              '/dashboard',
                                            );
                                          },
                                        );
                                      } else {
                                        AlertMessage().showAlert(
                                          context,
                                          result.message,
                                          false,
                                        );
                                      }
                                    }
                                  },
                                  color: Colors.blue.shade600,
                                  textColor: Colors.white,
                                  padding: const EdgeInsets.symmetric(
                                    vertical: 14,
                                  ),
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(10),
                                  ),
                                  child: isLoading
                                      ? const CircularProgressIndicator(
                                          color: Colors.white,
                                        )
                                      : const Text(
                                          "LOGIN",
                                          style: TextStyle(
                                            fontWeight: FontWeight.bold,
                                            letterSpacing: 1,
                                          ),
                                        ),
                                ),
                              ),
                              const SizedBox(height: 14),

                              /// LINK REGISTER ✅
                              TextButton(
                                onPressed: () {
                                  Navigator.pushReplacementNamed(
                                    context,
                                    '/register',
                                  );
                                },
                                child: const Text(
                                  "Belum punya akun? Register disini",
                                  style: TextStyle(
                                    fontSize: 13,
                                    color: Colors.blueGrey,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}