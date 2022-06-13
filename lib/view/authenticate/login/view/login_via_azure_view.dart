import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/base/view/base_view.dart';
import '../../../../core/components/button/custom_primary_button.dart';
import '../../../../core/components/container/logo_container.dart';
import '../../../../core/extensions/context_extension.dart';
import '../viewmodel/login_via_azure_view_model.dart';

class LoginViaAzureView extends StatefulWidget {
  const LoginViaAzureView({Key? key}) : super(key: key);

  @override
  _LoginViaAzureViewState createState() => _LoginViaAzureViewState();
}

final _formKey = GlobalKey<FormState>();

class _LoginViaAzureViewState extends State<LoginViaAzureView> with RouteAware {
  void didPopNext() {
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return BaseView<LoginViaAzureViewModel>(
        viewModel: LoginViaAzureViewModel(),
        onModelReady: (LoginViaAzureViewModel model) {
          model.setContext(context);
          model.init();
        },
        onPageBuilder: (BuildContext context,
                LoginViaAzureViewModel viewModel) =>
            Scaffold(
              body: SafeArea(
                child: Padding(
                  padding: EdgeInsets.fromLTRB(24.0.w, 60.0.h, 24.0.w, 0),
                  child: Observer(builder: (_) {
                    return viewModel.isLoading
                        ? Center(child: CircularProgressIndicator())
                        : SingleChildScrollView(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    TemplateLogo(
                                      horizontalPadding: 42.0.w,
                                      heroTag: "templateLogo",
                                      imageName: "logo",
                                    ),
                                    SizedBox(
                                      height:
                                          MediaQuery.of(context).size.height /
                                              20.0.h,
                                    ),
                                    Text(
                                      'Microsoft hesabınız ile \ngiriş yapın',
                                      style:
                                          _heading2.copyWith(color: _textBlack),
                                    ),
                                    SizedBox(
                                      height: 20.h,
                                    ),
                                    Image.asset(
                                      'assets/image/accent.png',
                                      width: 99.w,
                                      height: 4.h,
                                    ),
                                  ],
                                ),
                                SizedBox(
                                  height: 32.h,
                                ),
                                Form(
                                  key: _formKey,
                                  child: Column(
                                    children: [
                                      TextFormField(
                                        validator: (value) {
                                          bool emailValid = RegExp(
                                                  r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
                                              .hasMatch(value ?? "");
                                          if (value!.isEmpty) {
                                            return 'Lütfen bu alanı doldurun';
                                          } else if (!emailValid) {
                                            return "Lütfen geçerli bir mail adresi giriniz";
                                          }
                                          return null;
                                        },
                                        controller: viewModel.emailController,
                                        keyboardType:
                                            TextInputType.emailAddress,
                                        decoration: InputDecoration(
                                          labelText: 'E-posta',
                                          labelStyle: context
                                              .textTheme.headline6!
                                              .copyWith(fontSize: 14.sp),
                                          floatingLabelBehavior:
                                              FloatingLabelBehavior.always,
                                          hintText: 'isim.soyisim@sirket.com',
                                          hintStyle: _heading6.copyWith(
                                              color: _textGrey),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                                SizedBox(
                                  height: 24.h,
                                ),
                                CustomPrimaryButton(
                                  buttonColor: _primaryBlue,
                                  textValue: 'Giriş yap',
                                  textColor: Colors.white,
                                  onPressed: () async {
                                    _formKey.currentState!.save();
                                    final isValid =
                                        _formKey.currentState!.validate();
                                    print(isValid);
                                    if (isValid) {
                                      await viewModel.signIn(
                                        viewModel.emailController.text,
                                      );
                                    } else {
                                      final snackBar = SnackBar(
                                        content: Text(
                                            "Lütfen geçerli bir e-posta adresi giriniz"),
                                        backgroundColor: Colors.red,
                                      );
                                      ScaffoldMessenger.of(context)
                                          .showSnackBar(snackBar);
                                    }
                                  },
                                ),
                              ],
                            ),
                          );
                  }),
                ),
              ),
            ));
  }
}

Color _primaryBlue = Color(0xff2972ff);
Color _textBlack = Color(0xff222222);
Color _textGrey = Color(0xff94959b);
Color _textWhiteGrey = Color(0xfff1f1f5);

TextStyle _heading2 = TextStyle(
  fontSize: 24,
  fontWeight: FontWeight.w700,
);

TextStyle _heading5 = TextStyle(
  fontSize: 18,
  fontWeight: FontWeight.w600,
);

TextStyle _heading6 = TextStyle(
  fontSize: 16,
  fontWeight: FontWeight.w600,
);

TextStyle regular16pt = TextStyle(
  fontSize: 16,
  fontWeight: FontWeight.w400,
);
