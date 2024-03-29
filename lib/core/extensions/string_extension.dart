import 'package:easy_localization/easy_localization.dart';
import '../constants/app/app_contansts.dart';

extension StringLocalization on String? {
  String? get locale => this?.tr();

  String? get isValidEmail =>
      this!.contains(RegExp(ApplicationConstants.EMAIL_REGEX))
          ? null
          : "E-posta geçerli değil.";
}

extension ImagePathExtension on String {
  String get toSVG => "assets/svg/$this.svg";
}
