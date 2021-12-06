import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:leadership_nuggets/Constants/AppTheme.dart';
import 'package:leadership_nuggets/Controllers/login_account_controller.dart';
import 'package:leadership_nuggets/Views/create_account.dart';
import 'package:leadership_nuggets/Views/forgot_password.dart';
import 'package:leadership_nuggets/Widgets/custom_form_field.dart';


class Login extends StatefulWidget {
  const Login({Key? key}) : super(key: key);

  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Login> {

  TextEditingController _password = TextEditingController();
  TextEditingController _email = TextEditingController();

  final _controller = Get.find<LoginController>();

  final _formKey = GlobalKey<FormState>();
  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void dispose() {
    _password.dispose();
    _email.dispose();
    super.dispose();
  }

  //final _passwordValidator = RegExp(r'^(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[0-9])(?=.*?[!@#\$&*~]).{8,}$');
  final _emailValidator = RegExp(r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+");

  @override
  Widget build(BuildContext context) {
    return SafeArea(top: false, bottom: false,
        child: Scaffold(resizeToAvoidBottomInset: false, key: scaffoldKey,
          appBar: AppBar(leading: IconButton(icon: Icon(Icons.arrow_back_ios),onPressed: (){Get.back();},),elevation: 0.0, backgroundColor: AppTheme.primary,),
          body: Stack(
            children: [
              Container(height: MediaQuery.of(context).size.height * 0.3, width: MediaQuery.of(context).size.width,
                decoration: BoxDecoration(image: DecorationImage(image: AssetImage("assets/container_clip.png"), fit: BoxFit.fill),borderRadius: BorderRadius.vertical(bottom: Radius.circular(10),), ),
                child: Align(alignment: Alignment.centerLeft,child: Padding(
                  padding: const EdgeInsets.only(left: 38.0, right: 38.0, top: 60.0, bottom: 0.0),
                  child: Column(crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(height: 30,),
                      Text("Welcome \nBack", style: TextStyle(fontSize: 50, fontFamily: "DMSans", color: AppTheme.white, fontWeight: FontWeight.w800),),
                    ],
                  ),
                )),
              ),
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 40),
                child: SingleChildScrollView(physics: BouncingScrollPhysics(),
                  child: Form(key: _formKey,
                    child: Column(mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        SizedBox(height: 300,),
                        CustomFormField(
                          controller: _email,
                          onChanged: (value){
                            setState(() {_controller.email = value;});},
                          hintText: "Your Email", backgroundColor: AppTheme.grey.withOpacity(0.15), elevation: 0, enabledBorderColor: Colors.transparent, focusedBorderColor: Colors.transparent,height: 60,
                          validator: (value){
                            if (value!.isEmpty){
                              return 'Email form cannot be empty';}
                            else if (!_emailValidator.hasMatch(value)){
                              return 'Please, provide a valid email';}
                            else {
                              return null;}
                          },
                        ),
                        SizedBox(height: 25,),
                        CustomPasswordFormField(
                          controller: _password,
                          onChanged: (value){
                            setState(() {_controller.password = value;});},
                          hintText: "Password", backgroundColor: AppTheme.grey.withOpacity(0.15), elevation: 0, enabledBorderColor: Colors.transparent, focusedBorderColor: Colors.transparent, height: 60,
                          validator: (value){
                            if (value!.isEmpty){
                              return 'Password form cannot be empty';}
                            else if (value.length < 4){
                              return 'Password is weak';}
                            else {
                              return null;}
                          },
                          keyboardType: TextInputType.visiblePassword,
                        ),
                        SizedBox(height: 25,),
                        Row(mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            GestureDetector(
                              onTap: (){Get.to(()=>ForgotPassword());},
                                child: Text("Forgot Password?", style: TextStyle(fontFamily: "DMSans", fontWeight: FontWeight.w600, fontSize: 18, color: AppTheme.black),))],
                        ),
                        SizedBox(height: 20,),
                        Row(mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Text("Sign in", style: TextStyle(fontSize: 32, fontFamily: "DMSans", fontWeight: FontWeight.bold, color: AppTheme.black),),
                            Spacer(),
                            GestureDetector(onTap: (){
                              if (_formKey.currentState!.validate()){
                                _formKey.currentState!.save();
                                FocusScope.of(context).unfocus();
                                _controller.checkLoginConnectivity();
                              }
                            },
                              child: Container(
                                height: 70, width: 70,
                                decoration: BoxDecoration(shape: BoxShape.circle,color: AppTheme.secondary),
                                child: Icon(Icons.arrow_forward, color: AppTheme.white, size: 35,),),),
                          ],
                        ),
                        SizedBox(height: 30,),
                        Row(mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text("New user?", style: TextStyle(fontFamily: "DMSans", fontWeight: FontWeight.bold, color: AppTheme.black, fontSize: 18),),
                            GestureDetector(onTap: (){Get.to(()=>CreateAccount());}, child: Text(" Sign Up", style: TextStyle(fontFamily: "DMSans", fontWeight: FontWeight.bold, color: AppTheme.green, fontSize: 18),)),
                          ],
                        ),
                        SizedBox(height: 100,),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
        )
    );
  }
}
