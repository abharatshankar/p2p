import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:mvvm_app/res/widgets/coloors.dart';
import 'package:mvvm_app/utils/utils.dart';
import 'package:mvvm_app/viewModel/auth_viewmodel.dart';
import 'package:provider/provider.dart';

import 'signup_screen.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final ValueNotifier<bool> _obsecureNotifier = ValueNotifier<bool>(false);
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  final FocusNode _emailFocus = FocusNode();
  final FocusNode _passwordFocus = FocusNode();

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height * 1;
    return Consumer<AuthViewModel>(builder: (context, loginModel, _) {
      return Scaffold(
        appBar: AppBar(
          automaticallyImplyLeading: false,
        ),
        body: SafeArea(
          child: SingleChildScrollView(
            child: Column(
              children: [
                SizedBox(
                  height: height * 0.1,
                ),
                Image.asset(
                  'assets/logo_with_title.png',
                  height: 46,
                  width: 191,
                ),
                SizedBox(
                  height: height * 0.06,
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 30),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Padding(
                        padding: EdgeInsets.symmetric(vertical: 8),
                        child: Text(
                          'Email/Mobile Number',
                          style: TextStyle(
                              color: AppColors.titleLblColor, fontSize: 10),
                        ),
                      ),
                      Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20),
                          color: AppColors.textFieldBackGroundColor,
                        ),
                        child: Padding(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 10, vertical: 8),
                          child: TextFormField(
                            onChanged: (value) => loginModel.setUsername(value),
                            controller: _emailController,
                            focusNode: _emailFocus,
                            keyboardType: TextInputType.emailAddress,
                            onFieldSubmitted: (value) {
                              Utils.changeNodeFocus(context,
                                  current: _emailFocus, next: _passwordFocus);
                            },
                            decoration: const InputDecoration(
                              hintText: "Email",
                              border: InputBorder.none,
                            ),
                          ),
                        ),
                      ),
                      const Padding(
                        padding: EdgeInsets.symmetric(vertical: 8),
                        child: Text(
                          'Password',
                          style: TextStyle(
                              color: AppColors.titleLblColor, fontSize: 10),
                        ),
                      ),
                      Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20),
                          color: AppColors.textFieldBackGroundColor,
                        ),
                        child: Padding(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 10, vertical: 8),
                          child: TextFormField(
                            onChanged: (value) => loginModel.setPassword(value),
                            controller: _passwordController,
                            focusNode: _passwordFocus,
                            obscureText: true,
                            onFieldSubmitted: (value) {
                              Utils.changeNodeFocus(context,
                                  current: _passwordFocus, next: null);
                            },
                            decoration: const InputDecoration(
                              hintText: "Password",
                              border: InputBorder.none,
                            ),
                          ),
                        ),
                      ),
                      // SizedBox(height: 30,),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Row(
                          children: [
                            Container(
                              width: 15,
                              height: 15,
                              color: AppColors.textFieldBackGroundColor,
                            ),
                            const SizedBox(
                              width: 8,
                            ),
                            const Text(
                              'Show Password',
                              style: TextStyle(
                                  fontSize: 11, color: AppColors.textColor),
                            )
                          ],
                        ),
                      ),
                      Container(
                        width: double.infinity,
                        decoration: BoxDecoration(
                            color: loginModel.isValid() ? AppColors.themeBlueColor : AppColors.textFieldBackGroundColor,
                            borderRadius: BorderRadius.circular(20)),
                        child: const Padding(
                          padding: EdgeInsets.symmetric(
                            vertical: 18,
                          ),
                          child: Center(
                              child: Text(
                            "Next",
                            style: TextStyle(fontSize: 17, color: Colors.white,fontWeight: FontWeight.bold),
                          )),
                        ),
                      ),
                      SizedBox(height: MediaQuery.of(context).size.height * 0.1,),
                      const Center(child: Text("Forgot Passowrd",style: TextStyle(fontSize: 14,fontWeight: FontWeight.w500,color: AppColors.themeBlueColor),)),
                      GestureDetector(
                        onTap: () {
                          Navigator.push(context, MaterialPageRoute(builder: (context)=>const SignUpScreen()));
                        },
                        child: const Padding(
                          padding: EdgeInsets.all(8.0),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text("Create an account?",style: TextStyle(fontSize: 14,fontWeight: FontWeight.normal,color: AppColors.themeBlueColor),),
                              SizedBox(width: 8,),
                              Text("Register",style: TextStyle(fontSize: 14,fontWeight: FontWeight.w500,color: AppColors.themeBlueColor),)
                            ],
                          ),
                        ),
                      ),
                      
                    ],
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
              ],
            ),
          ),
        ),
      );
    });
  }

  @override
  void dispose() {
    super.dispose();
    _emailController.dispose();
    _emailFocus.dispose();
    _passwordController.dispose();
    _passwordFocus.dispose();
  }
}

