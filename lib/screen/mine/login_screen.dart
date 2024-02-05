import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_fingersnap/constant/app_color.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  final TextStyle defaultStyle = const TextStyle(color: AppColors.white);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage("assets/images/bg_login.webp"),
            fit: BoxFit.fill,
          ),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(height: 0.22.sh),
            Image.asset("assets/images/ic_launcher.png",
                width: 80.w, height: 80.w),
            SizedBox(height: 9.h),
            Text(
              AppLocalizations.of(context)!.appName,
              style: defaultStyle.copyWith(fontSize: 26.sp),
            ),
            SizedBox(height: 7.h),
            Text(
              AppLocalizations.of(context)!.login_slogan,
              style: defaultStyle.copyWith(fontSize: 18.sp),
            ),
            const Expanded(child: SizedBox.shrink()),
            const AuthLoginBtn(loginType: LoginType.facebook),
            SizedBox(height: 20.h),
            const AuthLoginBtn(loginType: LoginType.google),
            SizedBox(height: 20.h),
            const AuthLoginBtn(loginType: LoginType._apple),
            const PrivacyTermSpan(),
          ],
        ),
      ),
    );
  }
}

enum LoginType { facebook, google, _apple }

class AuthLoginBtn extends StatefulWidget {
  const AuthLoginBtn({
    required this.loginType,
    super.key,
  });

  final LoginType loginType;

  @override
  State<AuthLoginBtn> createState() => _AuthLoginBtnState();
}

class _AuthLoginBtnState extends State<AuthLoginBtn> {
  late String imagePath;
  late String btnHint;

  @override
  Widget build(BuildContext context) {
    switch (widget.loginType) {
      case LoginType.facebook:
        imagePath = "assets/images/ic_facebook.svg";
        btnHint = AppLocalizations.of(context)!.login_facebook;

      case LoginType.google:
        imagePath = "assets/images/ic_google.svg";
        btnHint = AppLocalizations.of(context)!.login_google;

      case LoginType._apple:
        imagePath = "assets/images/ic_apple.svg";
        btnHint = AppLocalizations.of(context)!.login_apple;
    }
    return GestureDetector(
      onTap: () => {},
      child: Container(
        width: double.infinity,
        padding: EdgeInsets.only(left: 17.w, top: 20.h, bottom: 20.h),
        margin: EdgeInsets.symmetric(horizontal: 58.w),
        decoration: BoxDecoration(
            color: AppColors.color_3F3F3F,
            borderRadius: BorderRadius.circular(20.r)),
        child: Stack(
          children: [
            Positioned(
                child: SvgPicture.asset(imagePath, width: 20.w, height: 20.w)),
            Positioned(
              left: 0,
              right: 0,
              child: Text(
                btnHint,
                style: TextStyle(color: AppColors.white, fontSize: 14.sp),
                textAlign: TextAlign.center,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class PrivacyTermSpan extends StatefulWidget {
  const PrivacyTermSpan({super.key});

  @override
  State<PrivacyTermSpan> createState() => _PrivacyTermSpanState();
}

class _PrivacyTermSpanState extends State<PrivacyTermSpan> {
  final TextStyle linkStyle = TextStyle(
    color: AppColors.white,
    decoration: TextDecoration.underline,
    decorationColor: AppColors.white,
    fontSize: 12.sp,
  );

  final TextStyle defaultStyle =
      TextStyle(color: AppColors.color_686868, fontSize: 12.sp);

  late TapGestureRecognizer _tapUserTerm;
  late TapGestureRecognizer _tapPrivacyPolicy;

  @override
  void initState() {
    super.initState();
    _tapUserTerm = TapGestureRecognizer()
      ..onTap = () {
        print('点击 Term Service');
      };

    _tapPrivacyPolicy = TapGestureRecognizer()
      ..onTap = () {
        print('点击 Privacy Policy');
      };
  }

  @override
  void dispose() {
    _tapUserTerm.dispose(); // 销毁对象
    _tapPrivacyPolicy.dispose(); // 销毁对象
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    InlineSpan span = TextSpan(children: [
      TextSpan(
          text: AppLocalizations.of(context)!.login_user_term_hint,
          style: defaultStyle),
      TextSpan(
          text: AppLocalizations.of(context)!.login_user_term,
          style: linkStyle,
          recognizer: _tapUserTerm),
      TextSpan(
        text: AppLocalizations.of(context)!.login_user_term_and,
        style: defaultStyle,
      ),
      TextSpan(
          text: AppLocalizations.of(context)!.login_privacy_policy,
          style: linkStyle,
          recognizer: _tapPrivacyPolicy),
    ]);
    return Container(
      margin: EdgeInsets.only(left: 52.w, right: 52.w, top: 56.h, bottom: 44.h),
      child: Text.rich(span, textAlign: TextAlign.center),
    );
  }
}
