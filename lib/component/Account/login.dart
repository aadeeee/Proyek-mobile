import 'package:flutter/material.dart';
import 'package:mobile/Provider/regisProvider.dart';
import 'package:mobile/component/Account/daftar.dart';
import 'package:mobile/component/app.dart';
import 'package:provider/provider.dart';

class MyLogin extends StatefulWidget {
  const MyLogin({super.key});

  @override
  State<MyLogin> createState() => _MyLoginState();
}

class _MyLoginState extends State<MyLogin> {
  @override
  Widget build(BuildContext context) {
    // var prov = Provider.of<MyLoginProvider>(context);
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
                    color: const Color(0xffFD61876E)),
              )),
          Positioned(
              top: 100,
              right: -50,
              child: Container(
                width: 100,
                height: 100,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(50),
                    color: Color(0xffFD61876E)),
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
                            obscureText: prov.getObsecureTextPasswword,
                            controller: prov.passwordController,
                            decoration: InputDecoration(
                                prefixIcon: const Icon(
                                  Icons.lock,
                                  color: Colors.black,
                                ),
                                suffixIcon: IconButton(
                                    icon: Icon(prov.getObsecureTextPasswword
                                        ? Icons.visibility_off
                                        : Icons.visibility),
                                    onPressed: () {
                                      setState(() {
                                        prov.setObsecureTextPassword =
                                            !prov.getObsecureTextPasswword;
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
                          child: ElevatedButton(
                            onPressed: () {
                              prov.userNameEmpty =
                                  prov.usernameController.text.isEmpty;
                              prov.passwordEmpty =
                                  prov.passwordController.text.isEmpty;

                              if (!prov.isUserNameEmpty &&
                                  !prov.isPasswordEmpty) {
                                prov.Login = {
                                  "userName": prov.usernameController.text,
                                  "password": prov.passwordController.text
                                };
                                if (prov.getAuth) {
                                  Navigator.pushReplacement(
                                      context,
                                      MaterialPageRoute(
                                          builder: (_) => const MyMain()));
                                }
                                else {
                                  showDialog(
                                    context: context,
                                    builder: (BuildContext context) {
                                      return AlertDialog(
                                        
                                        content: Text('Nama dan kata sandi Anda tidak sesuai atau belum terdaftar, cek kembali data Anda'),
                                        actions: [
                                          TextButton(
                                            onPressed: () {
                                              Navigator.of(context).pop();
                                            },
                                            child: Text('OK'),
                                          ),
                                        ],
                                      );
                                    },
                                  );
                                }
                              }

                            },
                            style: ElevatedButton.styleFrom(
                                backgroundColor: Color(0xffFD61876E),
                                minimumSize: const Size.fromHeight(60),
                                shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(15))),
                            child: const Text(
                              "MASUK",
                              style: TextStyle(fontSize: 20),
                            ),
                          ),
                        ),
                        Align(
                          alignment: Alignment.bottomCenter,
                          child: TextButton(
                              onPressed: () {
                                prov.usernameController.clear();
                                prov.passwordController.clear();
                                Navigator.pushReplacement(
                                    context,
                                    MaterialPageRoute(
                                        builder: (_) => const MyRegister()));
                              },
                              child: Column(
                                children: [
                                  const Text(
                                    "Belum punya akun? daftar disini",
                                    style: TextStyle(
                                        color: Color(0xffFD61876E),
                                        fontSize: 16),
                                  ),
                                ],
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
