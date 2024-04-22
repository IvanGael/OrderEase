import 'package:flat_3d_button/flat_3d_button.dart';
import 'package:flutter/material.dart';
import 'package:orderease/common/loadings.dart';
import 'package:orderease/constants/colors.dart';
import 'package:orderease/constants/images.dart';
import 'package:orderease/controllers/login_form_controller.dart';
import 'package:orderease/providers/login_state_provider.dart';
import 'package:orderease/widgets/custom_keyboard.dart';
import 'package:provider/provider.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final LoginFormController _loginFormController = LoginFormController();

  bool _isObscure = true;

  late LoginStateProvider loginStateProvider;

  @override
  void initState() {
    super.initState();
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    precacheImage(const AssetImage(AppImages.auth), context);
  }


  @override
  Widget build(BuildContext context) {
    loginStateProvider = Provider.of<LoginStateProvider>(context);

    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: SafeArea(
          child: Stack(
        fit: StackFit.expand,
        children: [
          Positioned(
              top: 0,
              left: 0,
              right: 0,
              child: SizedBox(
                height: MediaQuery.of(context).size.height * 0.32,
                width: MediaQuery.of(context).size.width,
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Image.asset(
                          AppImages.auth,
                          width: 150,
                          height: 150,
                        ),
                      ],
                    ),
                    const SizedBox(
                      height: 5,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(left: 20),
                          child: Text(
                            "Bienvenue !",
                            style: TextStyle(
                                fontSize: 20, fontWeight: FontWeight.w600, color: AppColors.color2),
                          ),
                        )
                      ],
                    ),
                  ],
                ),
              )),
          Positioned(
              bottom: 0,
              child: Container(
                height: MediaQuery.of(context).size.height * 0.68,
                width: MediaQuery.of(context).size.width,
                color: AppColors.color5,
                child: Padding(
                  padding: const EdgeInsets.all(12.0),
                  child: Column(
                    children: [
                      const SizedBox(
                        height: 10,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                              "Veuillez entrer votre code de sécurité pour vous connecter",
                              style: TextStyle(color: AppColors.color7),),
                        ],
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Container(
                            width: 300,
                            height: 60,
                            decoration: BoxDecoration(
                                color: Colors.grey[100],
                                shape: BoxShape.rectangle,
                                border: Border(
                                    top: BorderSide(
                                        color: AppColors.color2, width: 2),
                                    bottom: BorderSide(
                                        color: AppColors.color2, width: 2),
                                    left: BorderSide(
                                        color: AppColors.color2, width: 2),
                                    right: BorderSide(
                                        color: AppColors.color2, width: 2))),
                            child: Padding(
                              padding: const EdgeInsets.all(10),
                              child: Row(
                                children: [
                                  Expanded(
                                    child: TextField(
                                      controller: _loginFormController
                                          .getFieldController(),
                                      readOnly: true,
                                      obscureText: _isObscure,
                                      obscuringCharacter: "*",
                                      decoration: InputDecoration(
                                        border: InputBorder.none,
                                        suffixIcon: IconButton(
                                          icon: Icon(
                                            _isObscure
                                                ? Icons.visibility
                                                : Icons.visibility_off,
                                            color: AppColors.color1,
                                          ),
                                          onPressed: () {
                                            setState(() {
                                              _isObscure = !_isObscure;
                                            });
                                          },
                                        ),
                                      ),
                                      style: const TextStyle(
                                          fontSize: 20,
                                          fontWeight: FontWeight.w600),
                                    ),
                                  ),
                                  const VerticalDivider(
                                    thickness: 2,
                                  ),
                                  IconButton(
                                    onPressed: () {
                                      _loginFormController
                                          .getFieldController()
                                          .clear();
                                    },
                                    icon: const Icon(Icons.clear),
                                    style: ButtonStyle(
                                        elevation:
                                            MaterialStateProperty.all<double?>(
                                                5)),
                                  )
                                ],
                              ),
                            ),
                          )
                        ],
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      CustomKeyboard(
                        onTap: (val) {
                          _loginFormController.setValue(val);
                        },
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          SizedBox(
                            width: MediaQuery.of(context).size.width * 0.8,
                            child: Expanded(
                                child: ElevatedButton(
                              onPressed: loginStateProvider.isLoginProgress
                                  ? () {
                                      _loginFormController
                                          .processLogin(context);
                                    }
                                  : null,
                              style: ButtonStyle(
                                backgroundColor:
                                    MaterialStateProperty.all<Color>(
                                        AppColors.color3),
                                padding: MaterialStateProperty.all<
                                    EdgeInsetsGeometry>(
                                  const EdgeInsets.all(14),
                                ),
                                shape: MaterialStateProperty.all<
                                    RoundedRectangleBorder>(
                                  const RoundedRectangleBorder(
                                    borderRadius: BorderRadius.all(Radius.zero),
                                  ),
                                ),
                              ),
                              child: Text(
                                "Connexion",
                                style: TextStyle(
                                  fontSize: 18,
                                  fontWeight: FontWeight.bold,
                                  color: AppColors.color5,
                                ),
                              ),
                            )),
                          )
                        ],
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          GestureDetector(
                            onTap: () {},
                            child: Text(
                              "Code oublié ? ",
                              style: TextStyle(
                                  color: AppColors.color1,
                                  decoration: TextDecoration.underline,
                                  decorationColor: AppColors.color1,
                                  decorationStyle: TextDecorationStyle.dashed,
                                  fontSize: 15
                              ),
                            ),
                          )
                        ],
                      )
                    ],
                  ),
                ),
              )
              )
        ],
      )
      ),
    );
  }
}
