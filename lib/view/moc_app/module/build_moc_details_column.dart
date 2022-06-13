import 'package:template_mobile/view/moc_app/model/moc_form_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/extensions/context_extension.dart';
import '../model/moc_form_model.dart';

class BuildDetailsColumn extends StatelessWidget {
  final MocFormModel model;
  BuildDetailsColumn({
    Key? key,
    required this.model,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(children: [
      Card(
          elevation: 5,
          color: context.colors.surface,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20.r),
          ),
          child: Padding(
              padding: context.paddingLowAll,
              child: Column(children: [
                Container(
                  margin: EdgeInsets.only(bottom: 10.h),
                  height: context.height * 0.05,
                  child: Center(
                    child: ListTile(
                      leading: Text(
                        "Genel Bilgiler",
                        style: TextStyle(
                            fontWeight: FontWeight.w800, fontSize: 18),
                      ),
                    ),
                  ),
                ),
                ListTile(
                  leading: Icon(Icons.person),
                  horizontalTitleGap: 1.0,
                  tileColor: context.colors.onPrimary,
                  title: Text(
                    "Şirket",
                    style: TextStyle(fontWeight: FontWeight.w800, fontSize: 12),
                  ),
                  subtitle: Text(model.companyName ?? "Şirket",
                      style: context.textTheme.bodyText2!
                          .copyWith(fontWeight: FontWeight.w100, fontSize: 14)),
                ),
                ListTile(
                  leading: Icon(Icons.business),
                  horizontalTitleGap: 1.0,
                  tileColor: context.colors.onSecondary,
                  title: Text(
                    "Ünite/Fabrika",
                    style: TextStyle(fontWeight: FontWeight.w800, fontSize: 12),
                  ),
                  subtitle: Text(model.unitName ?? "Ünite",
                      style: context.textTheme.bodyText2!
                          .copyWith(fontWeight: FontWeight.w100, fontSize: 14)),
                ),
                ListTile(
                  leading: Icon(Icons.workspaces_outlined),
                  horizontalTitleGap: 1.0,
                  tileColor: context.colors.onPrimary,
                  title: Text(
                    "Kategori ",
                    style: TextStyle(fontWeight: FontWeight.w800, fontSize: 12),
                  ),
                  subtitle: Text(model.categories ?? "Kategori",
                      style: context.textTheme.bodyText2!
                          .copyWith(fontWeight: FontWeight.w100, fontSize: 14)),
                ),
                ListTile(
                  leading: Icon(Icons.description_outlined),
                  horizontalTitleGap: 1.0,
                  tileColor: context.colors.onSecondary,
                  title: Text(
                    "Değişikliğin İhtiyaca Yönelik Olduğunu Destekleyen Dokümanlar/Görüşler",
                    style: TextStyle(fontWeight: FontWeight.w800, fontSize: 12),
                  ),
                  subtitle: Text(model.standPoint ?? "",
                      style: context.textTheme.bodyText2!
                          .copyWith(fontWeight: FontWeight.w100, fontSize: 14)),
                ),
                ListTile(
                  leading: Icon(Icons.description_outlined),
                  horizontalTitleGap: 1.0,
                  tileColor: context.colors.onPrimary,
                  title: Text(
                    "Değişikliğin Ne Olduğu ve Nasıl Yapılacağı",
                    style: TextStyle(fontWeight: FontWeight.w800, fontSize: 12),
                  ),
                  subtitle: Text(model.changeRequestExplanation ?? "",
                      style: context.textTheme.bodyText2!
                          .copyWith(fontWeight: FontWeight.w100, fontSize: 14)),
                ),
                ListTile(
                  leading: Icon(Icons.description_outlined),
                  horizontalTitleGap: 1.0,
                  tileColor: context.colors.onSecondary,
                  title: Text(
                    "Değişikliğin Yapılmasının Emniyet Açısından Risk Oluşturup Oluşturmadığı ve Nedeni",
                    style: TextStyle(fontWeight: FontWeight.w800, fontSize: 12),
                  ),
                  subtitle: Text(model.riskExplanation ?? "",
                      style: context.textTheme.bodyText2!
                          .copyWith(fontWeight: FontWeight.w100, fontSize: 14)),
                ),
                ListTile(
                  leading: Icon(Icons.calendar_today_outlined),
                  horizontalTitleGap: 1.0,
                  tileColor: context.colors.onPrimary,
                  title: Text(
                    "Uygulama Detayları",
                    style: TextStyle(fontWeight: FontWeight.w800, fontSize: 12),
                  ),
                  subtitle: Text(model.operationDetails ?? '',
                      style: context.textTheme.bodyText2!
                          .copyWith(fontWeight: FontWeight.w100, fontSize: 14)),
                ),
                ListTile(
                  leading: Icon(Icons.calendar_today_outlined),
                  horizontalTitleGap: 1.0,
                  tileColor: context.colors.onSecondary,
                  title: Text(
                    "BİİF No",
                    style: TextStyle(fontWeight: FontWeight.w800, fontSize: 12),
                  ),
                  subtitle: Text(model.biifNo ?? "",
                      style: context.textTheme.bodyText2!
                          .copyWith(fontWeight: FontWeight.w100, fontSize: 14)),
                ),
                ListTile(
                  leading: Icon(Icons.timer),
                  horizontalTitleGap: 1.0,
                  tileColor: context.colors.onPrimary,
                  title: Text(
                    "ER No",
                    style: TextStyle(fontWeight: FontWeight.w800, fontSize: 12),
                  ),
                  subtitle: Text(
                    model.erNo ?? "",
                    style: context.textTheme.bodyText2!
                        .copyWith(fontWeight: FontWeight.w100, fontSize: 14),
                  ),
                ),
              ]))),
      // Card(
      //     elevation: 5,
      //     color: context.colors.surface,
      //     shape: RoundedRectangleBorder(
      //       borderRadius: BorderRadius.circular(20.r),
      //     ),
      //     child: Padding(
      //         padding: context.paddingLowAll,
      //         child: Column(children: [
      //           if (model.isChangeRequestUrgent != false)
      //             ListTile(
      //               leading: Icon(Icons.dataset),
      //               horizontalTitleGap: 1.0,
      //               tileColor: context.colors.onSecondary,
      //               title: Text(
      //                 "Teknik Görüş/Teknik Onay Tablosu",
      //                 style:
      //                     TextStyle(fontWeight: FontWeight.w800, fontSize: 12),
      //               ),
      //             ),
      //           ListTile(
      //             leading: Icon(Icons.description_outlined),
      //             horizontalTitleGap: 1.0,
      //             tileColor: context.colors.onPrimary,
      //             subtitle: Text(
      //                 model.technicalOpinionAndAcceptanceUsersByDisciplineList
      //                     .toString(),
      //                 style: context.textTheme.bodyText2!
      //                     .copyWith(fontWeight: FontWeight.w100, fontSize: 14)),
      //           ),
      //         ]))),
      Card(
          elevation: 5,
          color: context.colors.surface,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20.r),
          ),
          child: Padding(
              padding: context.paddingLowAll,
              child: Column(children: [
                if (model.isChangeRequestTemporary == true)
                  ListTile(
                    leading: Icon(Icons.check_box),
                    horizontalTitleGap: 1.0,
                    tileColor: context.colors.onSecondary,
                    title: Text(
                      "Değişiklik Talebi Geçici",
                      style:
                          TextStyle(fontWeight: FontWeight.w800, fontSize: 12),
                    ),
                  ),
                if (model.monthParameter != null)
                  ListTile(
                    leading: Icon(Icons.timer_sharp),
                    horizontalTitleGap: 1.0,
                    tileColor: context.colors.onPrimary,
                    title: Text(
                      "Değişiklik Süresi",
                      style:
                          TextStyle(fontWeight: FontWeight.w800, fontSize: 12),
                    ),
                    subtitle: Text(model.monthParameter.toString(),
                        style: context.textTheme.bodyText2!.copyWith(
                            fontWeight: FontWeight.w100, fontSize: 14)),
                  ),
              ]))),
      Card(
          elevation: 5,
          color: context.colors.surface,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20.r),
          ),
          child: Padding(
              padding: context.paddingLowAll,
              child: Column(children: [
                if (model.isChangeRequestUrgent != false)
                  ListTile(
                    leading: Icon(Icons.check_box),
                    horizontalTitleGap: 1.0,
                    tileColor: context.colors.onSecondary,
                    title: Text(
                      "Değişiklik Acil",
                      style:
                          TextStyle(fontWeight: FontWeight.w800, fontSize: 12),
                    ),
                  ),
                if (model.productionDirectorName != null)
                  ListTile(
                    leading: Icon(Icons.description_outlined),
                    horizontalTitleGap: 1.0,
                    tileColor: context.colors.onPrimary,
                    title: Text(
                      "Üretim Birim Başkan Yardımcısı",
                      style:
                          TextStyle(fontWeight: FontWeight.w800, fontSize: 12),
                    ),
                    subtitle: Text(model.companyVicePresidentName ?? "",
                        style: context.textTheme.bodyText2!.copyWith(
                            fontWeight: FontWeight.w100, fontSize: 14)),
                  ),
                if (model.productionDirectorName != null)
                  ListTile(
                    leading: Icon(Icons.description_outlined),
                    horizontalTitleGap: 1.0,
                    tileColor: context.colors.onPrimary,
                    title: Text(
                      "Üretim Yönetici Direktörü",
                      style:
                          TextStyle(fontWeight: FontWeight.w800, fontSize: 12),
                    ),
                    subtitle: Text(model.productionDirectorName ?? '',
                        style: context.textTheme.bodyText2!.copyWith(
                            fontWeight: FontWeight.w100, fontSize: 14)),
                  ),
                if (model.onCallChiefs == null)
                  ListTile(
                    leading: Icon(Icons.description_outlined),
                    horizontalTitleGap: 1.0,
                    tileColor: context.colors.onPrimary,
                    title: Text(
                      "On-Call Amiri",
                      style:
                          TextStyle(fontWeight: FontWeight.w800, fontSize: 12),
                    ),
                    subtitle: Text(model.onCallChiefs.toString(),
                        style: context.textTheme.bodyText2!.copyWith(
                            fontWeight: FontWeight.w100, fontSize: 14)),
                  ),
              ]))),
      // Card(
      //     elevation: 5,
      //     color: context.colors.surface,
      //     shape: RoundedRectangleBorder(
      //       borderRadius: BorderRadius.circular(20.r),
      //     ),
      //     child: Padding(
      //         padding: context.paddingLowAll,
      //         child: Column(children: [
      //           ListTile(
      //             leading: Icon(Icons.description_outlined),
      //             horizontalTitleGap: 1.0,
      //             tileColor: context.colors.onSecondary,
      //             title: Text(
      //               "Görüş Dosyaları",
      //               style: TextStyle(fontWeight: FontWeight.w800, fontSize: 12),
      //             ),
      //           ),
      //           ListTile(
      //             leading: Icon(Icons.description_outlined),
      //             horizontalTitleGap: 1.0,
      //             tileColor: context.colors.onPrimary,
      //             subtitle: Text(model.attachments.toList(),
      //                 style: context.textTheme.bodyText2!
      //                     .copyWith(fontWeight: FontWeight.w100, fontSize: 14)),
      //           ),
      //         ]))),
      // Card(
      //     elevation: 5,
      //     color: context.colors.surface,
      //     shape: RoundedRectangleBorder(
      //       borderRadius: BorderRadius.circular(20.r),
      //     ),
      //     child: Padding(
      //         padding: context.paddingLowAll,
      //         child: Column(children: [
      //           ListTile(
      //             leading: Icon(Icons.description_outlined),
      //             horizontalTitleGap: 1.0,
      //             tileColor: context.colors.onSecondary,
      //             title: Text(
      //               "MOC Form Dosyaları",
      //               style: TextStyle(fontWeight: FontWeight.w800, fontSize: 12),
      //             ),
      //           ),
      //           ListTile(
      //             horizontalTitleGap: 1.0,
      //             tileColor: context.colors.onPrimary,
      //             subtitle: Text(model.standPointFiles.toString(),
      //                 style: context.textTheme.bodyText2!
      //                     .copyWith(fontWeight: FontWeight.w100, fontSize: 14)),
      //           ),
      //         ]))),
    ]);
  }
}
