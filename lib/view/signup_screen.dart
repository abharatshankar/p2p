import "package:flutter/material.dart";
import "package:flutter_svg/svg.dart";
import "package:mvvm_app/res/widgets/coloors.dart";
import "package:mvvm_app/utils/utils.dart";
import "package:provider/provider.dart";
import "../viewModel/auth_viewmodel.dart";

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({super.key});

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  final ValueNotifier<bool> _obsecureNotifier = ValueNotifier<bool>(false);
  final TextEditingController _emailController = TextEditingController();
    final TextEditingController _mobileController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _confirmPasswordController = TextEditingController();

  final FocusNode _emailFocus = FocusNode();
  final FocusNode _passwordFocus = FocusNode();
  bool isShowPassword = false;
  bool isMobileNumberValid = false;
  bool isEmailValid = false;
  bool isConfirmPasswordValid = false;
  List<PassValidators> _validationResults = [
    PassValidators("Must be at least 8 characters", false),
    PassValidators("Must contain at least 1 number", false),
    PassValidators("Must contain at least 1in capital case", false),
    PassValidators("Must contain at least 1 Letter in small case", false),
    PassValidators("Must contain at least 1 Special character", false),
  ];

  void _validatePassword(String password) {
    setState(() {
      // Regular expressions for each validation rule
      final hasMinLength = password.length >= 8;
      final hasUppercase = RegExp(r'[A-Z]').hasMatch(password);
      final hasLowercase = RegExp(r'[a-z]').hasMatch(password);
      final hasDigit = RegExp(r'[0-9]').hasMatch(password);
      final hasSpecialChar = RegExp(r'[!@#$%^&*]').hasMatch(password);

      _validationResults[0].isValid = hasMinLength;
      _validationResults[1].isValid = hasDigit;
      _validationResults[2].isValid = hasUppercase;
      _validationResults[3].isValid = hasLowercase;
      _validationResults[4].isValid = hasSpecialChar;
    });
  }

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height * 1;
    final authviewmodel = Provider.of<AuthViewModel>(context);
    return Consumer<AuthViewModel>(builder: (context, loginModel, _) {
      return Scaffold(
        // appBar: AppBar(
        //   title: const Text("Sign up"),
        //   centerTitle: true,
        //   automaticallyImplyLeading: false,
        // ),
        body: SafeArea(
          child: SingleChildScrollView(
            child: Column(
              // mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Image.asset(
                  'assets/logo_with_title.png',
                  height: 50,
                  width: 150,
                ),
                Center(
                  child: Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: Image.asset(
                      'assets/registration.png',
                      height: 200,
                      width: 200,
                    ),
                  ),
                ),
                const Center(
                    child: Text(
                  "Register",
                  style: TextStyle(
                      fontSize: 20,
                      color: AppColors.themeNavBlueColor,
                      fontWeight: FontWeight.bold),
                )),
                const SizedBox(
                  height: 20,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Icon(
                      Icons.person_pin,
                      size: 42,
                    ),
                    const SizedBox(
                      width: 8,
                    ),
                    SizedBox(
                        width: MediaQuery.of(context).size.width * 0.7,
                        child: Container(
                            decoration: BoxDecoration(
                                border: Border.all(color: Colors.grey)),
                            child: TextField(
                              decoration: InputDecoration(
                                  hintText: '   First Name',
                                  border: InputBorder.none),
                            )))
                  ],
                ),
                const SizedBox(
                  height: 8,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const SizedBox(
                      width: 40,
                    ),
                    const SizedBox(
                      width: 8,
                    ),
                    SizedBox(
                        width: MediaQuery.of(context).size.width * 0.7,
                        child: Container(
                            decoration: BoxDecoration(
                                border: Border.all(color: Colors.grey)),
                            child: TextField(
                              decoration: InputDecoration(
                                  hintText: '   Last Name',
                                  border: InputBorder.none),
                            )))
                  ],
                ),
                const SizedBox(
                  height: 8,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Icon(
                      Icons.phone_android_outlined,
                      size: 42,
                    ),
                    SizedBox(
                      width: 8,
                    ),
                    SizedBox(
                        width: MediaQuery.of(context).size.width * 0.7,
                        child: Container(
                            decoration: BoxDecoration(
                                border: Border.all(color: Colors.grey)),
                            child: Padding(
                              padding: const EdgeInsets.symmetric(horizontal: 8),
                              child: TextField(
                                controller: _mobileController,
                                onChanged: (value) {
                                 
                                  isMobileNumberValid = RegExp(r'(^[\+]?[(]?[0-9]{3}[)]?[-\s\.]?[0-9]{3}[-\s\.]?[0-9]{4,6}$)').hasMatch(value ?? '');
                                  setState(() {
                                    
                                  }); 
                                },
                                keyboardType: TextInputType.phone,
                                decoration: InputDecoration(
                                  suffixIcon: Icon(Icons.error,
                                  color: isMobileNumberValid ? Colors.green : Colors.red,),
                                    hintText: '   Enter mobile number',
                                    border: InputBorder.none),
                              ),
                            )))
                  ],
                ),
                const SizedBox(
                  height: 8,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Icon(
                      Icons.mail,
                      size: 42,
                    ),
                    const SizedBox(
                      width: 8,
                    ),
                    SizedBox(
                        width: MediaQuery.of(context).size.width * 0.7,
                        child: Container(
                            decoration: BoxDecoration(
                                border: Border.all(color: Colors.grey)),
                            child: Padding(
                              padding: const EdgeInsets.symmetric(horizontal: 8),
                              child: TextField(
                                controller: _emailController,
                                onChanged: (input) {
                                 isEmailValid = Utils().isValidEmail(input) ;
                                  setState(() {
                                    
                                  });
                                },
                              
                                decoration:  InputDecoration(
                                  suffixIcon: Icon(
                                    color: isEmailValid ? Colors.green : Colors.red,
                                   isEmailValid ? Icons.check_box : Icons.error,),
                                    hintText: ' Enter email *',
                                    border: InputBorder.none),
                              ),
                            ),),)
                  ],
                ),
                const SizedBox(
                  height: 8,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Icon(
                      Icons.lock,
                      size: 42,
                    ),
                    const SizedBox(
                      width: 8,
                    ),
                    SizedBox(
                        width: MediaQuery.of(context).size.width * 0.7,
                        child: Column(
                          children: [
                            Container(
                                decoration: BoxDecoration(
                                    border: Border.all(color: Colors.grey)),
                                child: Padding(
                                  padding: const EdgeInsets.symmetric(horizontal: 8),
                                  child: TextField(
                                    obscureText: isShowPassword,
                                    controller: _passwordController,
                                    onChanged: (password) =>
                                        _validatePassword(password),
                                    decoration: const InputDecoration(
                                        hintText: ' Enter password *',
                                        border: InputBorder.none),
                                  ),
                                ),),
                            const SizedBox(
                              height: 9,
                            ),
                            GestureDetector(
                                onTap: () {
                                  isShowPassword = !isShowPassword;
                                  setState(() {});
                                },
                                child: showPasswordWidget(
                                    showPass: isShowPassword)),
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: ListView.builder(
                                  shrinkWrap: true,
                                  itemCount: _validationResults.length,
                                  itemBuilder: (context, index) {
                                    return Row(
                                      // mainAxisAlignment: MainAxisAlignment.center,
                                      children: [
                                        Container(
                                          decoration: BoxDecoration(
                                              shape: BoxShape.circle,
                                              color: _validationResults[index]
                                                      .isValid
                                                  ? Colors.green
                                                  : Colors.red),
                                          height: 6,
                                          width: 8,
                                        ),
                                        Padding(
                                          padding: const EdgeInsets.symmetric(
                                              horizontal: 8),
                                          child: Text(
                                            _validationResults[index].checkStr,
                                            style: const TextStyle(
                                              fontSize: 10,
                                            ),
                                          ),
                                        ),
                                      ],
                                    );
                                  }),
                            ),
                          ],
                        )),
                  ],
                ),
                const SizedBox(
                  height: 8,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const SizedBox(
                      width: 40,
                    ),
                    const SizedBox(
                      width: 8,
                    ),
                    SizedBox(
                        width: MediaQuery.of(context).size.width * 0.7,
                        child: Container(
                            decoration: BoxDecoration(
                                border: Border.all(color: Colors.grey)),
                            child:  Padding(
                              padding: const EdgeInsets.symmetric(horizontal: 8),
                              child: TextField(
                                controller: _confirmPasswordController,
                                onChanged: (value) {
                                 isConfirmPasswordValid = value == _passwordController.text;
                                 setState(() {
                                   
                                 });
                                },
                                decoration: InputDecoration(
                                  suffixIcon: Icon(
                                    color: isConfirmPasswordValid ? Colors.green : Colors.red,
                                    isConfirmPasswordValid ? Icons.check_box : Icons.error),
                                    hintText: '   Confirm Password',
                                    border: InputBorder.none),
                              ),
                            )))
                  ],
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Wrap(
                    children: [
                      Container(
                        height: 20,
                        width: 20,
                        color: Colors.grey,
                      ),
                      const SizedBox(
                        width: 5,
                      ),
                      Text(
                        "I accept Fynzon's",
                        style: TextStyle(color: Colors.grey.shade400),
                      )
                    ],
                  ),
                )
              ],
            ),
          ),
        ),
      );
    });
  }

  Widget showPasswordWidget({required bool showPass}) {
    return Row(
      children: [
        Container(
          child: showPass
              ? const Icon(Icons.check_box,color: Colors.green,size: 20,)
              : const Icon(Icons.check_box_outline_blank,color: Colors.grey,size: 20,),
        ),
        const Padding(
          padding: EdgeInsets.symmetric(horizontal: 8),
          child: Text(
            "Show password",
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
        )
      ],
    );
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

class PassValidators {
  final String checkStr;
  bool isValid;

  PassValidators(this.checkStr, this.isValid);
}
