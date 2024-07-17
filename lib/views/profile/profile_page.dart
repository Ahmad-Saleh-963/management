import 'package:flutter/material.dart';
import 'package:management_states/config/constant/icons_app.dart';
import 'package:management_states/library/constant/colors_app.dart';
import 'package:management_states/library/utils/static_resources.dart';
import 'package:management_states/localization/generated/l10n.dart';
import 'package:management_states/views/auth/login_page.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({super.key});

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            Stack(
              children: [
                Container(
                  height: height / 1.2,
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
                        SizedBox(height: height * 0.05),
                        _buildLogoImage(),
                        _buildTextApp("أحمد صالح",
                            color: ColorsApp.yellowColor, fontSize: 23),
                        const SizedBox(height: 20),
                        Padding(
                          padding: const EdgeInsets.only(
                              left: 20, right: 20, top: 5, bottom: 5),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: [
                              _buildTextApp(": الاسم الكامل ",
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 18),
                            ],
                          ),
                        ),
                        const SizedBox(height: 5),
                        _buildTextField(),
                        Padding(
                          padding: const EdgeInsets.only(
                              left: 20, right: 20, top: 5, bottom: 5),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: [
                              _buildTextApp(": البريد الإلكتروني",
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 18),
                            ],
                          ),
                        ),
                        const SizedBox(height: 5),
                        _buildTextField(),
                        Padding(
                          padding: const EdgeInsets.only(
                              left: 20, right: 20, top: 5, bottom: 5),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: [
                              _buildTextApp(": رقم الهاتف",
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 18),
                            ],
                          ),
                        ),
                        const SizedBox(height: 5),
                        _buildTextField(),
                        Padding(
                          padding: const EdgeInsets.only(
                              left: 20, right: 20, top: 5, bottom: 5),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: [
                              _buildTextApp(": العنوان التفصيلي",
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 18),
                            ],
                          ),
                        ),
                        const SizedBox(height: 5),
                        _buildTextField(),
                      ],
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 20),
            SizedBox(
              width: width,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                mainAxisSize: MainAxisSize.max,
                children: [
                  _buildButtonLogIn(width),
                ],
              ),
            ),
            const SizedBox(height: 20),
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
      child: GestureDetector(
        onTap: (){
          _showDialog();
        },
        child: CircleAvatar(
          child: Image.asset(ImagesApp.profile),
        ),
      ),
    );
  }

  Widget _buildTextApp(String txt,
      {Color color = Colors.white,
      FontWeight fontWeight = FontWeight.normal,
      double fontSize = 18,
      TextAlign textAlign = TextAlign.center}) {
    return Text(
      txt,
      textAlign: textAlign,
      style: TextStyle(
        color: color,
        fontSize: fontSize,
        fontWeight: fontWeight,
      ),
    );
  }

  Widget _buildTextField({String? hintText, Widget? labelText}) {
    return Padding(
      padding: const EdgeInsets.only(left: 20, right: 20),
      child: TextFormField(
        keyboardType: TextInputType.text,
        textAlign: TextAlign.left,
        decoration: InputDecoration(
          fillColor: ColorsApp.yellowColor,
          hintText: hintText,
          label: labelText,
          alignLabelWithHint: true,
          hintStyle: TextStyle(color: ColorsApp.gry.withOpacity(0.2)),
          border: OutlineInputBorder(
            borderSide: BorderSide(color: ColorsApp.yellowColor, width: 1.5),
            borderRadius: BorderRadius.circular(10.0),
          ),
          enabledBorder: OutlineInputBorder(
            borderSide: BorderSide(color: ColorsApp.yellowColor, width: 1.5),
            borderRadius: BorderRadius.circular(10.0),
          ),
          focusedBorder: OutlineInputBorder(
            borderSide: BorderSide(color: ColorsApp.yellowColor, width: 1.5),
            borderRadius: BorderRadius.circular(10.0),
          ),
          prefixIconColor: ColorsApp.gry.withOpacity(0.2),
        ),
      ),
    );
  }

  Widget _buildButtonLogIn(width) {
    return Container(
      width: width * 0.8,
      height: 50,
      decoration: BoxDecoration(
          color: ColorsApp.primaryColor,
          borderRadius: BorderRadius.circular(5)),
      child: MaterialButton(
        onPressed: () async {
          Navigator.push(context, MaterialPageRoute(builder: (context) => const LogInPage()));
        },
        color: ColorsApp.primaryColor,
        highlightColor: Colors.transparent,
        enableFeedback: false,
        elevation: 3,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20.0),
        ),
        child: false
            ? const CircularProgressIndicator(color: Colors.white)
            : Text(
                S.current.logOut,
                style: const TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                    fontSize: 18),
              ),
      ),
    );
  }

  _showDialog(){
    TextEditingController c = TextEditingController(
      text: StaticResources.hostConnect.toString()
    );
    return   showDialog(
      context: context,
      builder: (BuildContext context) {
        // Return the dialog widget
        return AlertDialog(
          title: const Text('IP Local Host'),
          content: SizedBox(
            height: 100,
            child: TextFormField(
              controller: c,
              onChanged: (e){
                StaticResources.hostConnect = e.toString();
              },
            ),
          ),
          actions: <Widget>[
            TextButton(
              onPressed: () {
                // Close the dialog
                Navigator.of(context).pop();
              },
              child: const Text('تم'),
            ),
          ],
        );
      },
    );
  }

}
