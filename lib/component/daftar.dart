import 'package:flutter/material.dart';
import 'package:mobile/component/email.dart';
import 'package:mobile/component/login.dart';
import 'package:mobile/Provider/regisProvider.dart';
import 'package:provider/provider.dart';

class MyRegister extends StatefulWidget {
  const MyRegister({super.key});

  @override
  State<MyRegister> createState() => _MyRegisterState();
}

class _MyRegisterState extends State<MyRegister> {
  bool _obsecureText = true;
  @override
  Widget build(BuildContext context) {
    var prov = Provider.of<MyRegisProvider>(context);
    return Scaffold(
      body: Stack(
        children: [
          Positioned(
              top: -20,
              left: -50,
              child: Container(
                width: 170,
                height: 170,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(150),
                    color: Colors.purple),
              )),
          Positioned(
              top: 100,
              right: -50,
              child: Container(
                width: 100,
                height: 100,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(50),
                    color: Colors.purple),
              )),
          Align(
            alignment: Alignment.center,
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(bottom: 20),
                    child: Image.asset(
                      'assets/images/my_user.png',
                      height: 130,
                      width: 130,
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 20, right: 20),
                    child: SizedBox(
                      child: Column(children: [
                        Padding(
                          padding: const EdgeInsets.all(10),
                          child: TextField(
                            controller: prov.usernameController,
                            cursorColor: Colors.black,
                            decoration: InputDecoration(
                                prefixIcon: const Icon(
                                  Icons.account_circle,
                                  color: Colors.black,
                                ),
                                border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(15),
                                    borderSide:
                                        const BorderSide(color: Colors.black)),
                                focusedBorder: const OutlineInputBorder(
                                    borderSide:
                                        BorderSide(color: Colors.black)),
                                fillColor: Colors.black,
                                hintText: "Nama Lengkap",
                                errorText: prov.isUserNameEmpty == true
                                    ? "wajib diisi"
                                    : null),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(10),
                          child: TextField(
                            controller: prov.nohandphoneController,
                            decoration: InputDecoration(
                                prefixIcon: const Icon(
                                  Icons.phone,
                                  color: Colors.black,
                                ),
                                border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(15),
                                    borderSide:
                                        const BorderSide(color: Colors.black)),
                                focusedBorder: const OutlineInputBorder(
                                    borderSide:
                                        BorderSide(color: Colors.black)),
                                fillColor: Colors.black,
                                hintText: "No.Telepon",
                                errorText: prov.isNoHandphoneEmpty == true
                                    ? "wajib diisi"
                                    : null),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(10),
                          child: TextField(
                            controller: prov.emailController,
                            decoration: InputDecoration(
                                prefixIcon: const Icon(
                                  Icons.mail,
                                  color: Colors.black,
                                ),
                                border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(15),
                                    borderSide:
                                        const BorderSide(color: Colors.black)),
                                focusedBorder: const OutlineInputBorder(
                                    borderSide:
                                        BorderSide(color: Colors.black)),
                                fillColor: Colors.black,
                                hintText: "Email",
                                errorText: prov.isEmailEmpty == true
                                    ? "wajib diisi"
                                    : null),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(10),
                          child: TextField(
                            obscureText: _obsecureText,
                            controller: prov.passwordController,
                            decoration: InputDecoration(
                                prefixIcon: const Icon(
                                  Icons.lock,
                                  color: Colors.black,
                                ),
                                suffixIcon: IconButton(icon: Icon(
                                  _obsecureText ? Icons.visibility_off :  Icons.visibility
                                ), onPressed: () { 
                                  setState(() {
                                    _obsecureText = !_obsecureText;
                                  });
                                 }),
                                border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(15),
                                    borderSide:
                                        const BorderSide(color: Colors.black)),
                                focusedBorder: const OutlineInputBorder(
                                    borderSide:
                                        BorderSide(color: Colors.black)),
                                fillColor: Colors.black,
                                hintText: "Kata Sandi",
                                errorText: prov.isPasswordEmpty == true
                                    ? "wajib diisi"
                                    : null),
                            
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(10),
                          child: TextField(
                            obscureText: _obsecureText,
                            controller: prov.repasswordController,
                            decoration: InputDecoration(
                                prefixIcon: const Icon(
                                  Icons.lock,
                                  color: Colors.black,
                                ),
                                suffixIcon: IconButton(icon: Icon(
                                  _obsecureText ? Icons.visibility_off :  Icons.visibility
                                ), onPressed: () { 
                                  setState(() {
                                    _obsecureText = !_obsecureText;
                                  });
                                 }),
                                border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(15),
                                    borderSide:
                                        const BorderSide(color: Colors.black)),
                                focusedBorder: const OutlineInputBorder(
                                    borderSide:
                                        BorderSide(color: Colors.black)),
                                fillColor: Colors.black,
                                hintText: "Ulangi Kata Sandi",
                                errorText: prov.isPasswordEmpty == true
                                    ? "wajib diisi"
                                    : null),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(10),
                          child: ElevatedButton(
                            onPressed: () {
                              prov.userNameEmpty =
                                  prov.usernameController.text.isEmpty;
                              prov.noHandPhoneEmpty =
                                  prov.nohandphoneController.text.isEmpty;
                              prov.emailEmpty =
                                  prov.emailController.text.isEmpty;
                              prov.passwordEmpty =
                                  prov.passwordController.text.isEmpty;
                              prov.repasswordEmpty =
                                  prov.repasswordController.text.isEmpty;
                              prov.usernameController.clear();
                              prov.nohandphoneController.clear();
                              prov.emailController.clear();
                              prov.passwordController.clear();
                              prov.repasswordController.clear();

                              if (!prov.isUserNameEmpty &&
                                  !prov.isNoHandphoneEmpty &&
                                  !prov.isEmailEmpty &&
                                  !prov.isPasswordEmpty &&
                                  !prov.isRePasswordEmpty) {
                                Navigator.pushReplacement(
                                    context,
                                    MaterialPageRoute(
                                        builder: (_) => const MyEmail()));
                              }
                            },
                            style: ElevatedButton.styleFrom(
                                backgroundColor: Colors.purple,
                                minimumSize: const Size.fromHeight(60),
                                shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(15))),
                            child: const Text(
                              "DAFTAR",
                              style: TextStyle(fontSize: 20),
                            ),
                          ),
                        ),
                        Align(
                          alignment: Alignment.bottomCenter,
                          child: TextButton(
                              onPressed: () {
                                Navigator.pushReplacement(
                                    context,
                                    MaterialPageRoute(
                                        builder: (_) => const MyLogin()));
                              },
                              child: const Text(
                                "Sudah punya akun? Masuk disini",
                                style: TextStyle(
                                    color: Colors.purple, fontSize: 16),
                              )),
                        )
                      ]),
                    ),
                  )
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
