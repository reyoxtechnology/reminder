import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:leadership_nuggets/Constants/AppTheme.dart';
import 'package:leadership_nuggets/Controllers/create_account_controller.dart';
import 'package:leadership_nuggets/Views/login.dart';
import 'package:leadership_nuggets/Widgets/custom_form_field.dart';

class CreateAccount extends StatefulWidget {
  const CreateAccount({Key? key}) : super(key: key);

  @override
  _CreateAccountState createState() => _CreateAccountState();
}

class _CreateAccountState extends State<CreateAccount> {

  TextEditingController _userName = TextEditingController();
  TextEditingController _password = TextEditingController();
  TextEditingController _phoneNumber = TextEditingController();
  TextEditingController _email = TextEditingController();

  //final _passwordValidator = RegExp(r'^(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[0-9])(?=.*?[!@#\$&*~]).{8,}$');
  final _emailValidator = RegExp(r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+");
  final _phoneValidator = RegExp(r'(^(?:[+0]9)?[0-9]{11,14}$)');

  final _formKey = GlobalKey<FormState>();
  final scaffoldKey = GlobalKey<ScaffoldState>();


  @override
  void dispose() {
    _userName.dispose();
    _password.dispose();
    _phoneNumber.dispose();
    _email.dispose();
    super.dispose();
  }

  final _controller = Get.find<CreateAccountController>();
  @override
  Widget build(BuildContext context) {
    return SafeArea(top: false, bottom: false,
        child: Scaffold(resizeToAvoidBottomInset: false, key: scaffoldKey,
          appBar: AppBar(leading: IconButton(icon: Icon(Icons.arrow_back_ios,),onPressed: (){Get.back();},), backgroundColor: AppTheme.primary, elevation: 0.0,),
          body: Stack(children: [
              Container(child: Container(height: MediaQuery.of(context).size.height * 0.3, width: MediaQuery.of(context).size.width,
                decoration: BoxDecoration(image: DecorationImage(image: AssetImage("assets/container_clip.png"), fit: BoxFit.fill),
                    borderRadius: BorderRadius.vertical(bottom: Radius.circular(10),)),
                child: Align(alignment: Alignment.centerLeft,child: Padding(
                  padding:  const EdgeInsets.only(left: 38.0, right: 38.0, top: 30.0, bottom: 0.0),
                  child: Column(crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(height: 30,),
                      Text("Create \nAccount", style: TextStyle(fontSize: 50, fontFamily: "DMSans", color: AppTheme.white, fontWeight: FontWeight.w800),),
                    ],
                  ),
                )),
              ),
              ),
              Form(key: _formKey,
                child: Column(mainAxisAlignment: MainAxisAlignment.end,
                  children: [Container(padding: const EdgeInsets.symmetric(horizontal: 40),
                      child: Column(
                        children: [SizedBox(height: 250,),
                          CustomFormField(
                            onChanged: (value){
                              setState(() {_controller.name = value;});},
                            controller: _userName,
                              hintText: "Name",
                              backgroundColor: AppTheme.grey.withOpacity(0.15),
                              elevation: 0,
                              enabledBorderColor: Colors.transparent,
                              focusedBorderColor: Colors.transparent,
                              height: 60,
                              validator: (value){
                                if (value!.isEmpty){
                                  return 'Name form cannot be empty';
                                }else {
                                  return null;}
                              },
                          ),
                          SizedBox(height: 10,),
                          CustomFormField(
                            onChanged: (value){
                              setState(() {_controller.email = value;});},
                            controller: _email,
                              hintText: "Email",
                              backgroundColor: AppTheme.grey.withOpacity(0.15),
                              elevation: 0,
                              enabledBorderColor: Colors.transparent,
                              focusedBorderColor: Colors.transparent,
                              height: 60,
                              validator: (value){
                                if (value!.isEmpty){
                                  return 'Email form cannot be empty';}
                                else if (!_emailValidator.hasMatch(value)){
                                  return 'Please, provide a valid email';}
                                else {
                                  return null;}
                              },
                          ),
                          SizedBox(height: 10,),
                          CustomFormField(
                            onChanged: (value){setState(() {_controller.phoneNumber = value;});},
                            controller: _phoneNumber,
                              hintText: "Phone Number",
                              backgroundColor: AppTheme.grey.withOpacity(0.15),
                              elevation: 0,
                              enabledBorderColor: Colors.transparent,
                              focusedBorderColor: Colors.transparent,
                              height: 60,
                              validator: (value){
                                if (value!.isEmpty){
                                  return 'Phone number form cannot be empty';}
                                else if (!_phoneValidator.hasMatch(value)){
                                  return "Please, provide a valid PhoneNumber";
                                } else {
                                  return null;}
                              },
                          ),
                          SizedBox(height: 10,),
                          CustomPasswordFormField(
                            keyboardType: TextInputType.visiblePassword,
                            onChanged: (value){setState(() {_controller.password = value;});},
                            controller: _password,
                              hintText: "Password",
                              backgroundColor: AppTheme.grey.withOpacity(0.15),
                              elevation: 0,
                              enabledBorderColor: Colors.transparent,
                              focusedBorderColor: Colors.transparent,
                              height: 60,
                              validator: (value){
                                if (value!.isEmpty){
                                  return 'Password form cannot be empty';}
                                else if (value.length < 4){
                                  return 'Please, provide a strong password';}
                                else {
                                  return null;}
                              },
                          ),
                          SizedBox(height: 10,),
                          Row(mainAxisAlignment: MainAxisAlignment.end,
                            children: [
                              Text("Referral Code?", style: TextStyle(fontFamily: "DMSans", fontWeight: FontWeight.w600, fontSize: 18, color: AppTheme.green),)
                            ],
                          ),
                          SizedBox(height: 20,),
                          Row(mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Text("Sign Up", style: TextStyle(fontSize: 32, fontFamily: "DMSans", fontWeight: FontWeight.bold, color: AppTheme.black),),
                              Spacer(),
                              GestureDetector(onTap: (){
                                if (_formKey.currentState!.validate()){
                                  _formKey.currentState!.save();
                                  FocusScope.of(context).unfocus();
                                  _controller.checkSignUpConnectivity();}
                              },
                                child: Container(
                                  height: 70, width: 70,
                                  decoration: BoxDecoration(shape: BoxShape.circle,color: AppTheme.secondary),
                                  child: Icon(
                                    Icons.arrow_forward, color: AppTheme.white, size: 35,
                                  ),
                                ),
                              ),
                            ],
                          ),
                          SizedBox(height: 30,),
                          Row(mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text("Already have an account?", style: TextStyle(fontFamily: "DMSans", fontWeight: FontWeight.bold, color: AppTheme.black, fontSize: 18),),
                              GestureDetector( onTap: (){Get.to(()=>Login());},child: Text(" Sign In", style: TextStyle(fontFamily: "DMSans", fontWeight: FontWeight.bold, color: AppTheme.green, fontSize: 18),)),
                            ],
                          ),
                          SizedBox(height: 50,),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        )
    );
  }
}
