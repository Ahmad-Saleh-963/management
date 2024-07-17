import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:management_states/config/constant/icons_app.dart';
import 'package:management_states/library/blocs/auth/register/register_cubit.dart';
import 'package:management_states/library/blocs/auth/register/register_state.dart';
import 'package:management_states/library/constant/colors_app.dart';
import 'package:management_states/library/data_structure/user/user.dart';
import 'package:management_states/library/utils/shared_preferences_helper.dart';
import 'package:management_states/localization/generated/l10n.dart';

class Register extends StatefulWidget {
  const Register({super.key});

  @override
  State<Register> createState() => _RegisterState();
}

class _RegisterState extends State<Register> {
  late RegisterCubit cubit;
  @override
  void initState() {
    super.initState();
    cubit = RegisterCubit();
  }

  @override
  void dispose() {
    cubit.close();
    super.dispose();
  }


  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    return Scaffold(
      body: SingleChildScrollView(
        child: Stack(
          children: [
            Container(
              height: height / 2.8,
              decoration: BoxDecoration(
                borderRadius: const BorderRadius.only(
                    bottomLeft: Radius.circular(20),
                    bottomRight: Radius.circular(20)),
                color: ColorsApp.primaryColor,
              ),
              child: Center(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    SizedBox(height: height * 0.06),
                    _buildLogoImage(),
                    _buildTextApp(S.current.nameApp),
                  ],
                ),
              ),
            ),
            Positioned(
                top: height / 3.4,
                child: SizedBox(
                  width: width,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisSize: MainAxisSize.max,
                    children: [
                      Container(
                        height: 100,
                        width: 100,
                        alignment: AlignmentDirectional.center,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(50),
                            color: Colors.white,
                            image: DecorationImage(image: AssetImage(ImagesApp.login))),
                      ),
                    ],
                  ),
                )),
            BlocBuilder<RegisterCubit, RegisterState>(
                 bloc: cubit,
                 builder: (context, RegisterState state) {
                  return Container(
                    width: width,
                    margin: const EdgeInsets.only(left: 15, right: 15),
                    child: Column(
                      children: [
                        SizedBox(height: height / 2.4),
                        _buildTextApp(S.current.createAccount,
                            color: ColorsApp.yellowColor,
                            fontWeight: FontWeight.bold,
                            fontSize: 20),
                        const SizedBox(height: 15),
                        _buildTextField(cubit.nameController,labelText: Text(S.current.fullName)),
                        const SizedBox(height: 15),
                        _buildTextField(cubit.emailController,labelText: Text(S.current.email)),
                        const SizedBox(height: 15),
                        _buildTextField(cubit.passwordController,labelText: Text(S.current.password)),
                        const SizedBox(height: 15),
                        _buildTextField(cubit.phoneController,labelText: Text(S.current.numberPhone)),
                        const SizedBox(height: 15),
                        if(SharedPreferencesHelper.getUser() != null && SharedPreferencesHelper.getUser()!.roleUser == RoleUser.admin)
                        DropdownButton<String>(
                          hint: const Text('إختر الصلاحية'),
                          value: cubit.roleUser,
                          onChanged: (String? newValue) {
                            setState(() {
                              cubit.roleUser = newValue;
                            });
                          },
                          items: <String>['user', 'admin' , 'adminCenter']
                              .map<DropdownMenuItem<String>>((String value) {
                            return DropdownMenuItem<String>(
                              value: value,
                              child: Text(value),
                            );
                          }).toList(),
                        ),
                        const SizedBox(height: 15),
                        _buildButtonLogIn(state,width),
                        const SizedBox(height: 15),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            GestureDetector(
                                onTap: () {Navigator.pop(context);},
                                child: _buildTextApp(S.current.logIn,
                                    color: ColorsApp.primaryColor,
                                    fontSize: 16,
                                    fontWeight: FontWeight.w800)),
                            const SizedBox(width: 5),
                            _buildTextApp(S.current.notHaveAccount,
                                color: ColorsApp.black, fontSize: 16),
                          ],
                        ),
                        const SizedBox(height: 15),
                      ],
                    ),
                  );
                },
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildLogoImage() {
    return Container(
      height: 140,
      width: 140,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(70), color: Colors.white),
      child: CircleAvatar(
        child: Image.asset(ImagesApp.logo),
      ),
    );
  }

  Widget _buildTextApp(String txt,
      {Color color = Colors.white,
      FontWeight fontWeight = FontWeight.normal,
      double fontSize = 18}) {
    return Text(
      txt,
      style: TextStyle(color: color, fontSize: fontSize, fontWeight: fontWeight),
    );
  }

  Widget _buildTextField(TextEditingController controller,{String? hintText, Widget? labelText}) {
    return TextFormField(
      keyboardType: TextInputType.text,
      textAlign: TextAlign.right,
      controller: controller,
      decoration: InputDecoration(
        fillColor: ColorsApp.primaryColor,
        hintText: hintText,
        label: labelText,
        alignLabelWithHint: true,
        hintStyle: TextStyle(color: ColorsApp.gry.withOpacity(0.2)),
        border: OutlineInputBorder(
          borderSide: BorderSide(color: ColorsApp.primaryColor, width: 1.5),
          borderRadius: BorderRadius.circular(10.0),
        ),
        enabledBorder: OutlineInputBorder(
          borderSide: BorderSide(color: ColorsApp.primaryColor, width: 1.5),
          borderRadius: BorderRadius.circular(10.0),
        ),
        focusedBorder: OutlineInputBorder(
          borderSide: BorderSide(color: ColorsApp.primaryColor, width: 1.5),
          borderRadius: BorderRadius.circular(10.0),
        ),
        prefixIconColor: ColorsApp.gry.withOpacity(0.2),
      ),
    );
  }

  Widget _buildButtonLogIn(RegisterState state,width) {
    return AnimatedContainer(
      duration: const Duration(milliseconds: 500),
      curve: Curves.linear,
      width: state.login ? width / 5 : width / 2,
      height: 50,
      child: MaterialButton(
        onPressed: () async {
          if(state.login)return;
          await cubit.register(context);
        },
        color: ColorsApp.primaryColor,
        highlightColor: Colors.transparent,
        enableFeedback: false,
        elevation: 3,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20.0),
        ),
        child: state.login ? const Center(child: CircularProgressIndicator(color: Colors.white))
                :
           Text(
          S.current.log,
          style: const TextStyle(
              color: Colors.white, fontSize: 18, fontFamily: "Al-Jazeera"),
        ),
      ),
    );
  }

  void showToast(String message) {
    final scaffold = ScaffoldMessenger.of(context);
    scaffold.showSnackBar(
      SnackBar(
        content: Text(message),
        backgroundColor: ColorsApp.primaryColor.withOpacity(0.9),
        elevation: 3,
        duration: const Duration(seconds: 2), // Adjust as needed
      ),
    );
  }

}
