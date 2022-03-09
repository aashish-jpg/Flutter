import 'package:flutter/material.dart';
class RegistrationForm extends StatefulWidget {
  const RegistrationForm({ Key? key}) : super(key: key);
  @override
  _RegistrationFormState createState() => _RegistrationFormState();
}
class _RegistrationFormState extends State<RegistrationForm> {
  bool hiddenPassword = true;
  bool hiddenPassword2 = true;
  // string for displaying the error Message
  late String errorMessage;
  // our form key
  final _formKey = GlobalKey<FormState>();
  // editing Controller
  final firstNameEditingController = TextEditingController();
  final secondNameEditingController = TextEditingController();
  final usernameEditingController = TextEditingController();
  final passwordEditingController = TextEditingController();
  final confirmPasswordEditingController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    //first name field
    final firstNameField = TextFormField(
        key: const Key('firstNameKey'),
        autofocus: false,
        controller: firstNameEditingController,
        keyboardType: TextInputType.name,
        cursorColor: Colors.black,
        validator: (value) {
          RegExp regex = RegExp(r'^.{3,}$');
          if (value!.isEmpty) {
            return ("First Name cannot be Empty");
          }
          if (!regex.hasMatch(value)) {
            return ("Enter Valid name(Min. 3 Character)");
          }
          return null;
        },
        onSaved: (value) {
          firstNameEditingController.text = value!;
        },
        textInputAction: TextInputAction.next,
        decoration: InputDecoration(
          prefixIcon: const Icon(Icons.account_circle),
          fillColor: Colors.white,
          filled: true,
          hintStyle: const TextStyle(color: Colors.grey),
          contentPadding: const EdgeInsets.fromLTRB(20, 15, 20, 15),
          hintText: "First Name",
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
          ),
        ));
    //second name field
    final secondNameField = TextFormField(
        key: const Key('lastNameKey'),
        autofocus: false,
        controller: secondNameEditingController,
        keyboardType: TextInputType.name,
        cursorColor: Colors.black,
        validator: (value) {
          if (value!.isEmpty) {
            return ("Last Name cannot be Empty");
          }
          return null;
        },
        onSaved: (value) {
          secondNameEditingController.text = value!;
        },
        textInputAction: TextInputAction.next,
        decoration: InputDecoration(
          prefixIcon: const Icon(Icons.account_circle),
          contentPadding: const EdgeInsets.fromLTRB(20, 15, 20, 15),
          fillColor: Colors.white,
          filled: true,
          hintStyle: const TextStyle(color: Colors.grey),
          hintText: "Last Name",
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
          ),
        ));
    //email field
    final usernameField = TextFormField(
        key: const Key('usernameKey'),
        autofocus: false,
        controller: usernameEditingController,
        keyboardType: TextInputType.emailAddress,
        cursorColor: Colors.black,
        onSaved: (value) {
          firstNameEditingController.text = value!;
        },
        textInputAction: TextInputAction.next,
        decoration: InputDecoration(
          prefixIcon: const Icon(Icons.mail),
          contentPadding: const EdgeInsets.fromLTRB(20, 15, 20, 15),
          hintText: "Email or Username",
          fillColor: Colors.white,
          filled: true,
          hintStyle: const TextStyle(color: Colors.grey),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
          ),
        ));
    //password field
    final passwordField = TextFormField(
        key: const Key('passwordKey'),
        autofocus: false,
        controller: passwordEditingController,
        obscureText: hiddenPassword,
        cursorColor: Colors.black,
        validator: (value) {
          RegExp regex = RegExp(r'^.{6,}$');
          if (value!.isEmpty) {
            return ("Password is required for login");
          }
          if (!regex.hasMatch(value)) {
            return ("Enter Valid Password(Min. 6 Character)");
          }
        },
        onSaved: (value) {
          firstNameEditingController.text = value!;
        },
        textInputAction: TextInputAction.next,
        decoration: InputDecoration(
          prefixIcon: const Icon(Icons.vpn_key),
          fillColor: Colors.white,
          filled: true,
          hintStyle: const TextStyle(color: Colors.grey),
          contentPadding: const EdgeInsets.fromLTRB(20, 15, 20, 15),
          hintText: "Password",
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
    //confirm password field
    final confirmPasswordField = TextFormField(
        key: const Key('confirmPasswordKey'),
        autofocus: false,
        controller: confirmPasswordEditingController,
        obscureText: hiddenPassword2,
        cursorColor: Colors.black,
        validator: (value) {
          if (confirmPasswordEditingController.text !=
              passwordEditingController.text) {
            return "Password don't match";
          }
          return null;
        },
        onSaved: (value) {
          confirmPasswordEditingController.text = value!;
        },
        textInputAction: TextInputAction.done,
        decoration: InputDecoration(
          prefixIcon: const Icon(Icons.vpn_key),
          fillColor: Colors.white,
          filled: true,
          hintStyle: const TextStyle(color: Colors.grey),
          contentPadding: const EdgeInsets.fromLTRB(20, 15, 20, 15),
          hintText: "Confirm Password",
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
          ),
          suffixIcon: IconButton(
            onPressed: () {
              setState(() {
                hiddenPassword2 = !hiddenPassword2;
              });
            },
            color: Colors.grey.withOpacity(0.6),
            icon:
                Icon(hiddenPassword2 ? Icons.visibility_off : Icons.visibility),
          ),
        ));
    //signup button
    final signUpButton = Material(
      elevation: 5,
      borderRadius: BorderRadius.circular(30),
      color: Colors.amber,
      child: MaterialButton(
          key: const Key('regButtonKey'),
          padding: const EdgeInsets.fromLTRB(20, 15, 20, 15),
          minWidth: MediaQuery.of(context).size.width,
          onPressed: () {
            signUp(
                firstNameEditingController.text,
                secondNameEditingController.text,
                usernameEditingController.text,
                passwordEditingController.text);
          },
          child: const Text(
            "SignUp",
            textAlign: TextAlign.center,
            style: TextStyle(
                fontSize: 20, color: Colors.white, fontWeight: FontWeight.bold),
          )),
    );
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.red),
          onPressed: () {
            // passing this to our root
            Navigator.of(context).pop();
          },
        ),
      ),
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
                        height: 180,
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(20),
                          child: Image.asset(
                            "assets/ShoppingAppLogo.png",
                            fit: BoxFit.contain,
                          ),
                        )),
                    const SizedBox(height: 45),
                    firstNameField,
                    const SizedBox(height: 20),
                    secondNameField,
                    const SizedBox(height: 20),
                    usernameField,
                    const SizedBox(height: 20),
                    passwordField,
                    const SizedBox(height: 20),
                    confirmPasswordField,
                    const SizedBox(height: 20),
                    signUpButton,
                    const SizedBox(height: 15),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
  void signUp(String firstName, String lastName, String username,
      String password) async {
    if (_formKey.currentState!.validate()) {
      _formKey.currentState!.save();
    }
  }
}