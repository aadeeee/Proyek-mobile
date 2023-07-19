import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:mobile/component/Email/email.dart';
import 'package:mobile/component/Account/login.dart';
import 'package:mobile/Provider/regisProvider.dart';
import 'package:provider/provider.dart';

import '../../Variabel/global.dart';

class MyRegister extends StatefulWidget {
  const MyRegister({super.key});

  @override
  State<MyRegister> createState() => _MyRegisterState();
}

class _MyRegisterState extends State<MyRegister> {
  @override
  Widget build(BuildContext context) {
    var prov = Provider.of<MyRegisProvider>(context);
    return WillPopScope(
      onWillPop: () async {
        return false;
      },
      child: Scaffold(
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
                    color: primaryColor,
                  )),
            ),
            Positioned(
                top: 100,
                right: -50,
                child: Container(
                  width: 100,
                  height: 100,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(50),
                      color: primaryColor),
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
                                      borderSide: const BorderSide(
                                          color: Colors.black)),
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
                              cursorColor: Colors.black,
                              decoration: InputDecoration(
                              
                                  prefixIcon: const Icon(
                                    Icons.phone,
                                    color: Colors.black,
                                  ),
                                  border: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(15),
                                      borderSide: const BorderSide(
                                          color: Colors.black)),
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
                              cursorColor: Colors.black,
                              decoration: InputDecoration(
                                  prefixIcon: const Icon(
                                    Icons.mail,
                                    color: Colors.black,
                                  ),
                                  border: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(15),
                                      borderSide: const BorderSide(
                                          color: Colors.black)),
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
                              obscureText: prov.getObsecureTextPasswword,
                              controller: prov.passwordController,
                              cursorColor: Colors.black,
                              decoration: InputDecoration(
                                  prefixIcon: const Icon(
                                    Icons.lock,
                                    color: Colors.black,
                                  ),
                                  suffixIcon: IconButton(
                                      icon: Icon(prov.getObsecureTextPasswword
                                          ? Icons.visibility
                                          : Icons.visibility_off,color: Colors.black,),
                                      onPressed: () {
                                        setState(() {
                                          prov.setObsecureTextPassword =
                                              !prov.getObsecureTextPasswword;
                                        });
                                      }),
                                  border: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(15),
                                      borderSide: const BorderSide(
                                          color: Colors.black)),
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
                              obscureText: prov.getObsecureTextRePasswword,
                              controller: prov.repasswordController,
                              cursorColor: Colors.black,
                              decoration: InputDecoration(
                                  prefixIcon: const Icon(
                                    Icons.lock,
                                    color: Colors.black,
                                  ),
                                  suffixIcon: IconButton(
                                      icon: Icon(prov.getObsecureTextRePasswword
                                          ? Icons.visibility_off
                                          : Icons.visibility,color: Colors.black,),
                                      onPressed: () {
                                        setState(() {
                                          prov.setObsecureTextRePassword =
                                              !prov.getObsecureTextRePasswword;
                                        });
                                      }),
                                  border: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(15),
                                      borderSide: const BorderSide(
                                          color: Colors.black)),
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

                                if (!prov.isUserNameEmpty &&
                                    !prov.isNoHandphoneEmpty &&
                                    !prov.isEmailEmpty &&
                                    !prov.isPasswordEmpty &&
                                    !prov.isRePasswordEmpty) {
                                  if (prov.passwordController.text ==
                                      prov.repasswordController.text) {
                                    prov.ADDUSER = {
                                      "userName": prov.usernameController.text,
                                      "password": prov.passwordController.text,
                                      "email": prov.emailController.text,
                                      "handphone": prov.nohandphoneController
                                    };
                                    prov.usernameController.clear();
                                    prov.nohandphoneController.clear();
                                    prov.emailController.clear();
                                    prov.passwordController.clear();
                                    prov.repasswordController.clear();
                                    Navigator.pushReplacement(
                                        context,
                                        MaterialPageRoute(
                                            builder: (_) => const MyEmail()));
                                  } else {
                                    showDialog(
                                      context: context,
                                      builder: (BuildContext context) {
                                        return AlertDialog(
                                          content: Text(
                                              'Data yang Anda masukkan tidak sesuai, cek kembali data Anda.',
                                              style: GoogleFonts.inter()),
                                          actions: [
                                            TextButton(
                                              onPressed: () {
                                                Navigator.of(context).pop();
                                              },
                                              child: Text('OK',
                                                  style: GoogleFonts.inter()),
                                            ),
                                          ],
                                        );
                                      },
                                    );
                                  }
                                }
                              },
                              style: ElevatedButton.styleFrom(
                                  backgroundColor: primaryColor,
                                  minimumSize: const Size.fromHeight(60),
                                  shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(15))),
                              child: Text(
                                "DAFTAR",
                                style: GoogleFonts.inter(fontSize: 20),
                              ),
                            ),
                          ),
                          Container(
                            margin: const EdgeInsets.symmetric(horizontal: 10),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text("Sudah Punya Akun ?",
                                    style: GoogleFonts.inter(
                                        color: primaryColor, fontSize: 16)),
                                TextButton(
                                    onPressed: () {
                                      Navigator.pushReplacement(
                                          context,
                                          MaterialPageRoute(
                                              builder: (_) => const MyLogin()));
                                    },
                                    child: Text("Masuk disini",
                                        style: GoogleFonts.inter(
                                            textStyle: const TextStyle(
                                                decoration:
                                                    TextDecoration.underline),
                                            color: primaryColor,
                                            fontSize: 16))),
                              ],
                            ),
                          ),
                        ]),
                      ),
                    )
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
