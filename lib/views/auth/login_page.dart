import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:management_states/library/blocs/auth/login/login_cubit.dart';
import 'package:management_states/config/constant/icons_app.dart';
import 'package:management_states/library/blocs/auth/login/login_state.dart';
import 'package:management_states/library/constant/colors_app.dart';
import 'package:management_states/localization/generated/l10n.dart';
import 'package:management_states/views/auth/register_page.dart';

class LogInPage extends StatefulWidget {
  const LogInPage({super.key});

  @override
  State<LogInPage> createState() => _LogInPageState();
}

class _LogInPageState extends State<LogInPage> {
  late LoginCubit cubit;

  @override
  void initState() {
    super.initState();
    cubit = LoginCubit();
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
                    _buildTextApp(S.current.nameApp, fontSize: 10),
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
                            image: DecorationImage(
                                image: AssetImage(ImagesApp.login))),
                      ),
                    ],
                  ),
                )),
            BlocBuilder<LoginCubit, LoginState>(
              bloc: cubit,
              builder: (context, state) {
                return Container(
                  width: width,
                  margin: const EdgeInsets.only(left: 15, right: 15),
                  child: Column(
                    children: [
                      SizedBox(height: height / 2.2),
                      _buildTextApp(S.current.login,
                          color: ColorsApp.yellowColor,
                          fontWeight: FontWeight.bold,
                          fontSize: 20),
                      const SizedBox(height: 25),
                      _buildTextField(cubit.emailController,
                          labelText: Text(S.current.email)),
                      const SizedBox(height: 20),
                      _buildTextField(cubit.passwordController,
                          labelText: Text(S.current.password)),
                      const SizedBox(height: 30),
                      _buildButtonLogIn(width),
                      const SizedBox(height: 20),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          _buildRegister(),
                          const SizedBox(width: 5),
                          _buildTextApp(S.current.notHaveAccount,
                              color: ColorsApp.black, fontSize: 16),
                        ],
                      ),
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
      style:
          TextStyle(color: color, fontSize: fontSize, fontWeight: fontWeight),
    );
  }

  Widget _buildTextField(TextEditingController controller,
      {String? hintText, Widget? labelText}) {
    return TextFormField(
      keyboardType: TextInputType.text,
      textAlign: TextAlign.left,
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

  Widget _buildButtonLogIn(width) {
    return AnimatedContainer(
      duration: const Duration(milliseconds: 200),
      curve: Curves.easeInOutCirc,
      width: width / 2,
      height: 50,
      child: MaterialButton(
        onPressed:()async{
          cubit.login(context);
        },
        color: ColorsApp.primaryColor,
        highlightColor: Colors.transparent,
        enableFeedback: false,
        elevation: 3,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20.0),
        ),
        child: Text(
          S.current.login,
          style: const TextStyle(color: Colors.white, fontSize: 18),
        ),
      ),
    );
  }

  Widget _buildRegister(){
    return  GestureDetector(
        onTap: () {
          Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => const Register(),
              ));
        },
        child: _buildTextApp(S.current.logNow,
            color: ColorsApp.primaryColor,
            fontSize: 16,
            fontWeight: FontWeight.w800));
  }
  show(String msg){
    final scaffold = ScaffoldMessenger.of(context);
    scaffold.showSnackBar(
      SnackBar(
        content: Text(msg),
        showCloseIcon: true,
        duration: const Duration(seconds: 2),
        backgroundColor: ColorsApp.primaryColor,
      ),
    );
  }

}
