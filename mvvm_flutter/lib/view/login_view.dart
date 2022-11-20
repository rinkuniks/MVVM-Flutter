import 'package:flutter/material.dart';
import 'package:mvvm_flutter/res/components/round_button.dart';
import 'package:mvvm_flutter/utils/utils.dart';

class LoginView extends StatefulWidget {
  const LoginView({Key? key}) : super(key: key);

  @override
  State<LoginView> createState() => _LoginViewState();
}

class _LoginViewState extends State<LoginView> {

  TextEditingController _emailController = TextEditingController();
  TextEditingController _passwordController = TextEditingController();
  FocusNode emailFN = FocusNode();
  FocusNode passFN = FocusNode();
  ValueNotifier<bool> _obsecurePassword = ValueNotifier<bool>(true);

  @override
  void dispose() {
    super.dispose();
    _emailController.dispose();
    _passwordController.dispose();
    passFN.dispose();
    emailFN.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height * 1;
    return Scaffold(
      appBar: AppBar(
        title: const Text('Login'),
        centerTitle: true,
      ),
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextFormField(
              controller: _emailController,
              focusNode: emailFN,
              keyboardType: TextInputType.emailAddress,
              decoration: const InputDecoration(
                hintText: "Enter Email",
                label: Text('Email'),
                prefixIcon: Icon(Icons.alternate_email),
              ),
              onFieldSubmitted: (value) {
                Utils.fieldFocusChange(context, emailFN, passFN);
              },
            ),
            ValueListenableBuilder(
                valueListenable: _obsecurePassword,
                builder: (context, value, child) {
                  return TextFormField(
                    controller: _passwordController,
                    obscureText: _obsecurePassword.value,
                    focusNode: passFN,
                    obscuringCharacter: "*",
                    decoration:  InputDecoration(
                      hintText: "Enter Password",
                      label: Text('Password'),
                      prefixIcon: Icon(Icons.lock),
                      suffixIcon: InkWell(
                          onTap:(){
                            _obsecurePassword.value = !_obsecurePassword.value ;
                          },
                          child: _obsecurePassword.value ? Icon(Icons.visibility_off):
                          Icon(Icons.visibility)
                      ),
                    ),
                  );
                }),
              SizedBox(
                height: height * 0.085,
              ),
              RoundButton(
                title: "Login",
                onPress: (){
                  if(_emailController.text.isEmpty){
                    Utils.flushBarErrorMessage("Please enter your email", context);
                  }else if(_passwordController.text.isEmpty){
                    Utils.flushBarErrorMessage("Please enter your password", context);
                  }else if(_passwordController.text.length < 6){
                    Utils.flushBarErrorMessage("Please enter minimum 6 digit password", context);
                  }else{
                   //Hit Api
                  }
                },
              ),

            //Different Toast Messages to display
            // Center(
            //   child: InkWell(
            //       onTap: (){
            //         //Simple toast Message
            //         // Utils.toastMessage("No Internet Connection");
            //
            //         //Show SnackBar
            //         // Utils.snackBar('Internet not working...', context);
            //
            //         //Navigate to New page
            //         // Navigator.pushNamed(context, RoutesNames.home);
            //       },
            //       child: const Text("Click Me")),
            // )
          ],
        ),
      ),
    );
  }
}