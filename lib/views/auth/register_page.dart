import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:management_states/config/constant/icons_app.dart';
import 'package:management_states/library/blocs/auth/register/register_cubit.dart';
import 'package:management_states/library/blocs/auth/register/register_state.dart';
import 'package:management_states/library/constant/colors_app.dart';
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
    cubit.lastController.clear();
    cubit.matherNameController.clear();
    cubit.fatherNameController.clear();
    cubit.passwordController.clear();
    cubit.emailController.clear();
    cubit.nameController.clear();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    return Scaffold(
      body: SingleChildScrollView(
        child: BlocBuilder<RegisterCubit, RegisterState>(
          bloc: cubit,
          builder: (context, RegisterState state) {
            return Container(
              width: width,
              margin: const EdgeInsets.only(left: 15, right: 15),
              child: Column(
                children: [
                  const SizedBox(height: 50),
                  _buildTextApp(
                      S.current.createAccount,
                      color: ColorsApp.yellowColor,
                      fontWeight: FontWeight.bold,
                      fontSize: 20,),
                  const SizedBox(height: 15),
                  Row(
                    children: [
                      Expanded(
                          child: _buildTextField(cubit.lastController,hintText : S.current.lastName),
                      ),
                      const SizedBox(width:20),
                      Expanded(
                        child: _buildTextField(cubit.nameController,hintText:S.current.name),
                      ),
                    ],
                  ),
                  const SizedBox(height: 15),
                  Row(
                    children: [
                      Expanded(
                        child: _buildTextField(cubit.fatherNameController,hintText : S.current.nameMather),
                      ),
                      const SizedBox(width:20),
                      Expanded(
                        child: _buildTextField(cubit.matherNameController,hintText:S.current.nameFather),
                      ),
                    ],
                  ),
                  const SizedBox(height: 15),
                  _buildTextField(cubit.emailController,hintText: S.current.email),
                  const SizedBox(height: 15),
                  _buildTextField(cubit.passwordController,hintText: S.current.password),
                  const SizedBox(height: 15),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      ElevatedButton(
                        onPressed: () => cubit.selectDate(context),
                        child: Text( cubit.selectedDate == null ? 'اختيار المواليد' : "${cubit.selectedDate!.year} / ${cubit.selectedDate!.month} / ${cubit.selectedDate!.day}"),
                      ),
                    ],
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
                      _buildTextApp(S.current.notHaveAccount, color: ColorsApp.black, fontSize: 16),
                    ],
                  ),
                  const SizedBox(height: 15),
                ],
              ),
            );
          },
        ),
      ));
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

  Widget _buildTextField(TextEditingController controller,{String? hintText}) {
    return TextFormField(
      keyboardType: TextInputType.text,
      textAlign: TextAlign.right,
      controller: controller,
      style: const TextStyle(
        fontSize: 10
      ),
      decoration: InputDecoration(
        fillColor: ColorsApp.primaryColor,
        hintText: hintText,
        alignLabelWithHint: true,
        hintStyle: TextStyle(color: ColorsApp.gry),
        border: OutlineInputBorder(
          borderSide: BorderSide(color: ColorsApp.primaryColor, width: 1),
          borderRadius: BorderRadius.circular(20.0),
        ),
        enabledBorder: OutlineInputBorder(
          borderSide: BorderSide(color: ColorsApp.primaryColor, width: 1),
          borderRadius: BorderRadius.circular(20.0),
        ),
        focusedBorder: OutlineInputBorder(
          borderSide: BorderSide(color: ColorsApp.primaryColor, width: 1),
          borderRadius: BorderRadius.circular(20.0),
        ),
        prefixIconColor: ColorsApp.gry.withOpacity(0.2),
      ),
    );
  }

  Widget _buildButtonLogIn(RegisterState state,width) {
    return AnimatedContainer(
      duration: const Duration(milliseconds: 500),
      curve: Curves.linear,
      width: state.login ? width * 0.2 : width * 0.3,
      height: 40,
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
