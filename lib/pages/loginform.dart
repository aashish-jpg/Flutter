// ignore_for_file: unnecessary_const

import "package:flutter/material.dart";
class PasswordFieldValidator {
  static String? validate(String value) {
    RegExp regex = RegExp(r'^.{6,}$');
    if (value.isEmpty) {
      return ("Password is required for login");
    }
    if (!regex.hasMatch(value)) {
      return ("Enter Valid Password(Min. 6 Character)");
    }
    return null;
  }
}
class LoginForm extends StatefulWidget {
  const LoginForm({Key? key}) : super(key: key);
  @override
  _LoginFormState createState() => _LoginFormState();
}
class _LoginFormState extends State<LoginForm> {
  bool hiddenPassword = true;
  // form key
  final _formKey = GlobalKey<FormState>();
  // editing controller
  final TextEditingController usernameController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  // string for displaying the error Message
  late String errorMessage;
  @override
  Widget build(BuildContext context) {
    //email field
    final emailField = TextFormField(
        key: const Key('emailFieldKey'),
        autofocus: false,
        style: const TextStyle(color: Colors.black),
        controller: usernameController,
        keyboardType: TextInputType.emailAddress,
        validator: (value) {
          if (value!.isEmpty) {
            return ("Please Enter Your Email or Username");
          }
          return null;
        },
        onSaved: (value) {
          usernameController.text = value!;
        },
        cursorColor: Colors.black,
        textInputAction: TextInputAction.next,
        decoration: InputDecoration(
          fillColor: Colors.white,
          filled: true,
          prefixIcon: const Icon(Icons.mail),
          contentPadding: const EdgeInsets.fromLTRB(20, 15, 20, 15),
          hintText: "Email or Username",
          hintStyle: const TextStyle(color: Colors.grey),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
          ),
        ));
    //password field
    final passwordField = TextFormField(
        key: const Key('passwordFieldKey'),
        style: const TextStyle(
          color: Colors.black,
        ),
        autofocus: false,
        controller: passwordController,
        cursorColor: Colors.black,
        obscureText: hiddenPassword,
        validator: (value) => PasswordFieldValidator.validate(value!),
        onSaved: (value) {
          passwordController.text = value!;
        },
        textInputAction: TextInputAction.done,
        decoration: InputDecoration(
          fillColor: Colors.white,
          filled: true,
          prefixIcon: const Icon(Icons.vpn_key),
          contentPadding: const EdgeInsets.fromLTRB(20, 15, 20, 15),
          hintText: "Password",
          hintStyle: const TextStyle(color: Colors.grey),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
          ),
          suffixIcon: IconButton(
            onPressed: () {
              setState(() {
                hiddenPassword = !hiddenPassword;
              });
            },
            color: Colors.grey.withOpacity(0.6),
            icon:
                Icon(hiddenPassword ? Icons.visibility_off : Icons.visibility),
          ),
        ));
    final loginButton = Material(
      key: const Key('loginButtonKey'),
      elevation: 5,
      borderRadius: BorderRadius.circular(30),
      color: Colors.amber,
      child: MaterialButton(
          padding: const EdgeInsets.fromLTRB(20, 15, 20, 15),
          minWidth: MediaQuery.of(context).size.width,
          onPressed: () {
            signIn(usernameController.text, passwordController.text);
          },
          child: const Text(
            "Login",
            textAlign: TextAlign.center,
            style: TextStyle(
                fontSize: 20, color: Colors.white, fontWeight: FontWeight.bold),
          )),
    );
    return Scaffold(
      backgroundColor: Colors.black,
      body: Center(
        child: SingleChildScrollView(
          child: Container(
            color: Colors.black,
            child: Padding(
              padding: const EdgeInsets.all(36.0),
              child: Form(
                key: _formKey,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: <Widget>[
                    SizedBox(
                        height: 200,
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(50),
                          child: Image.asset(
                            "assets/ShoppingAppLogo.png",
                            fit: BoxFit.contain,
                          ),
                        )),
                    const SizedBox(height: 45),
                    emailField,
                    const SizedBox(height: 25),
                    passwordField,
                    const SizedBox(height: 35),
                    loginButton,
                    const SizedBox(height: 15),
                    Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          const Padding(
                            padding: EdgeInsets.only(right: 8.0),
                            child: const Text(
                              "Don't have an account? ",
                              style: const TextStyle(
                                color: Colors.white,
                              ),
                            ),
                          ),
                          GestureDetector(
                            onTap: () {},
                            child: const Text(
                              "SignUp",
                              style: const TextStyle(
                                  color: Colors.redAccent,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 15),
                            ),
                          )
                        ])
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
  // login function
  void signIn(String email, String password) async {
    if (_formKey.currentState!.validate()) {}
  }
}