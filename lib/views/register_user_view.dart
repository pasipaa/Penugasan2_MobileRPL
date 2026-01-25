import 'package:flutter/material.dart';
import 'package:semester2_postman/services/user.dart';
import 'package:semester2_postman/widgets/alert.dart';

class RegisterUserView extends StatefulWidget {
  const RegisterUserView({super.key});

  @override
  State<RegisterUserView> createState() => _RegisterUserViewState();
}

class _RegisterUserViewState extends State<RegisterUserView> {
  UserService user = UserService();
  final formKey = GlobalKey<FormState>();
  TextEditingController name = TextEditingController();
  TextEditingController email = TextEditingController();
  TextEditingController password = TextEditingController();
  TextEditingController address = TextEditingController();
  TextEditingController birthday = TextEditingController();
  List roleChoice = ["admin", "kasir"];
  String? role;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [
              Colors.blue.shade500,
              Colors.white,
            ],
          ),
        ),
        child: SafeArea(
          child: SingleChildScrollView(
            child: Center(
              child: Container(
                constraints: const BoxConstraints(maxWidth: 500),
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
                          "REGISTER USER",
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
                                controller: name,
                                decoration: const InputDecoration(
                                  label: Text("Name"),
                                ),
                                validator: (value) {
                                  if (value!.isEmpty) {
                                    return 'Nama harus diisi';
                                  }
                                  return null;
                                },
                              ),
                              const SizedBox(height: 14),
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
                              DropdownButtonFormField(
                                isExpanded: true,
                                value: role,
                                items: roleChoice.map((r) {
                                  return DropdownMenuItem(
                                    value: r,
                                    child: Text(r),
                                  );
                                }).toList(),
                                onChanged: (value) {
                                  setState(() {
                                    role = value.toString();
                                  });
                                },
                                hint: const Text("Pilih role"),
                                validator: (value) {
                                  if (value == null ||
                                      value.toString().isEmpty) {
                                    return 'Role harus dipilih';
                                  }
                                  return null;
                                },
                              ),
                              const SizedBox(height: 14),
                              TextFormField(
                                controller: password,
                                decoration: const InputDecoration(
                                  label: Text("Password"),
                                ),
                                validator: (value) {
                                  if (value!.isEmpty) {
                                    return 'Password harus diisi';
                                  }
                                  return null;
                                },
                              ),
                              const SizedBox(height: 14),
                              TextFormField(
                                controller: address,
                                decoration: const InputDecoration(
                                  label: Text("Address"),
                                ),
                                validator: (value) {
                                  if (value!.isEmpty) {
                                    return 'Address harus diisi';
                                  }
                                  return null;
                                },
                              ),
                              const SizedBox(height: 14),
                              TextFormField(
                                controller: birthday,
                                decoration: const InputDecoration(
                                  label: Text("Birthday"),
                                ),
                                validator: (value) {
                                  if (value!.isEmpty) {
                                    return 'Birthday harus diisi';
                                  }
                                  return null;
                                },
                              ),
                              const SizedBox(height: 28),

                              /// BUTTON REGISTER
                              SizedBox(
                                width: double.infinity,
                                child: MaterialButton(
                                  onPressed: () async {
                                    if (formKey.currentState!.validate()) {
                                      var data = {
                                        "name": name.text,
                                        "email": email.text,
                                        "role": role,
                                        "password": password.text,
                                        "address": address.text,
                                        "birthday": birthday.text,
                                      };
                                      var result =
                                          await user.registerUser(data);
                                      if (result.status == true) {
                                        name.clear();
                                        email.clear();
                                        password.clear();
                                        address.clear();
                                        birthday.clear();
                                        setState(() {
                                          role = null;
                                        });
                                        AlertMessage().showAlert(
                                          context,
                                          result.message,
                                          true,
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
                                  child: const Text(
                                    "REGISTER",
                                    style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      letterSpacing: 1,
                                    ),
                                  ),
                                ),
                              ),
                              const SizedBox(height: 14),

                              /// LINK LOGIN ✅ INI YANG KAMU MAU
                              TextButton(
                                onPressed: () {
                                  Navigator.pushReplacementNamed(
                                    context,
                                    '/login',
                                  );
                                },
                                child: const Text(
                                  "Sudah punya akun? Log in disini",
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