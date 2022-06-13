import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/extensions/context_extension.dart';
import '../model/bypass_form_model.dart';

class BuildDetailsColumn extends StatelessWidget {
  final ByPassFormModel model;
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
          child: Column(
            children: [
              Container(
                margin: EdgeInsets.only(bottom: 10.h),
                height: context.height * 0.05,
                child: Center(
                  child: ListTile(
                    leading: Text(
                      "Genel Bilgiler",
                      style:
                          TextStyle(fontWeight: FontWeight.w800, fontSize: 18),
                    ),
                  ),
                ),
              ),
              ListTile(
                leading: Icon(Icons.person),
                horizontalTitleGap: 1.0,
                tileColor: context.colors.onPrimary,
                title: Text(
                  "Formu Oluşturan Kullanıcı",
                  style: TextStyle(fontWeight: FontWeight.w800, fontSize: 12),
                ),
                subtitle: Text(model.userCreatedFormName ?? "",
                    style: context.textTheme.bodyText2!
                        .copyWith(fontWeight: FontWeight.w100, fontSize: 14)),
              ),
              ListTile(
                leading: Icon(Icons.business),
                horizontalTitleGap: 1.0,
                tileColor: context.colors.onSecondary,
                title: Text(
                  "Şirket",
                  style: TextStyle(fontWeight: FontWeight.w800, fontSize: 12),
                ),
                subtitle: Text(model.refineryName ?? "",
                    style: context.textTheme.bodyText2!
                        .copyWith(fontWeight: FontWeight.w100, fontSize: 14)),
              ),
              ListTile(
                leading: Icon(Icons.workspaces_outlined),
                horizontalTitleGap: 1.0,
                tileColor: context.colors.onPrimary,
                title: Text(
                  "Ünite / Fabrika",
                  style: TextStyle(fontWeight: FontWeight.w800, fontSize: 12),
                ),
                subtitle: Text(model.sectionName ?? "",
                    style: context.textTheme.bodyText2!
                        .copyWith(fontWeight: FontWeight.w100, fontSize: 14)),
              ),
              // ListTile(
              //   leading: Icon(Icons.circle_outlined),
              //   tileColor: context.colors.onSecondary,
              //   title: Text(
              //     "Ünite",
              //     style: context.textTheme.headline6!.copyWith(fontSize: 16.sm),
              //   ),
              //   subtitle: Text(model.sectionName ?? "",
              //       style: context.textTheme.bodyText2!
              //           .copyWith(fontWeight: FontWeight.w100, fontSize: 12)),
              // ),
              ListTile(
                leading: Icon(Icons.description_outlined),
                horizontalTitleGap: 1.0,
                tileColor: context.colors.onSecondary,
                title: Text(
                  "By-Pass Tag No",
                  style: TextStyle(fontWeight: FontWeight.w800, fontSize: 12),
                ),
                subtitle: Text(model.tripParameterTagNo ?? "",
                    style: context.textTheme.bodyText2!
                        .copyWith(fontWeight: FontWeight.w100, fontSize: 14)),
              ),
              ListTile(
                leading: Icon(Icons.description_outlined),
                horizontalTitleGap: 1.0,
                tileColor: context.colors.onPrimary,
                title: Text(
                  "By-Pass Tag No Açıklaması",
                  style: TextStyle(fontWeight: FontWeight.w800, fontSize: 12),
                ),
                subtitle: Text(model.safetySystemExplanation ?? "",
                    style: context.textTheme.bodyText2!
                        .copyWith(fontWeight: FontWeight.w100, fontSize: 14)),
              ),
              ListTile(
                leading: Icon(Icons.calendar_today_outlined),
                horizontalTitleGap: 1.0,
                tileColor: context.colors.onSecondary,
                title: Text(
                  "By-Pass'a Alma Tarihi ve Saati",
                  style: TextStyle(fontWeight: FontWeight.w800, fontSize: 12),
                ),
                subtitle: Text(model.byPassStartDate ?? "",
                    style: context.textTheme.bodyText2!
                        .copyWith(fontWeight: FontWeight.w100, fontSize: 14)),
              ),
              ListTile(
                leading: Icon(Icons.timer),
                horizontalTitleGap: 1.0,
                tileColor: context.colors.onPrimary,
                title: Text(
                  "Tahmini By-Pass Süresi",
                  style: TextStyle(fontWeight: FontWeight.w800, fontSize: 12),
                ),
                subtitle: Text(
                  model.estimatedByPassTime != null
                      ? model.estimatedByPassTime.toString() + " Saat"
                      : "-",
                  style: context.textTheme.bodyText2!
                      .copyWith(fontWeight: FontWeight.w100, fontSize: 14),
                ),
              ),
              ListTile(
                leading: Icon(Icons.people_alt_outlined),
                horizontalTitleGap: 1.0,
                tileColor: context.colors.onSecondary,
                title: Text(
                  "By-Pass'a Alan Kişi",
                  style: TextStyle(fontWeight: FontWeight.w800, fontSize: 12),
                ),
                subtitle: Text(model.peopleDoByPassNames ?? "",
                    style: context.textTheme.bodyText2!
                        .copyWith(fontWeight: FontWeight.w100, fontSize: 14)),
              ),
              ListTile(
                leading: Icon(Icons.people_outline),
                horizontalTitleGap: 1.0,
                tileColor: context.colors.onPrimary,
                title: Text(
                  "Sözlü Bilgi Verilen Kişi",
                  style: TextStyle(fontWeight: FontWeight.w800, fontSize: 12),
                ),
                subtitle: Text(model.verballyInformedPeopleNames ?? "",
                    style: context.textTheme.bodyText2!
                        .copyWith(fontWeight: FontWeight.w100, fontSize: 14)),
              ),
              ListTile(
                leading: Icon(Icons.system_security_update_warning_outlined),
                horizontalTitleGap: 1.0,
                tileColor: context.colors.onSecondary,
                title: Text(
                  "Emniyet Sistemi Açıklaması",
                  style: TextStyle(fontWeight: FontWeight.w800, fontSize: 12),
                ),
                subtitle: Text(model.safetySystemExplanation ?? "",
                    style: context.textTheme.bodyText2!
                        .copyWith(fontWeight: FontWeight.w100, fontSize: 14)),
              ),
              ListTile(
                leading: Icon(Icons.pages_sharp),
                horizontalTitleGap: 1.0,
                tileColor: context.colors.onSecondary,
                title: Text(
                  "By-Pass Edilecek Emniyet Sistemi Tipi",
                  style: TextStyle(fontWeight: FontWeight.w800, fontSize: 12),
                ),
                subtitle: Text(model.safetySystemTypeName ?? "",
                    style: context.textTheme.bodyText2!
                        .copyWith(fontWeight: FontWeight.w100, fontSize: 14)),
              ),
              ListTile(
                leading: Icon(Icons.device_hub_outlined),
                horizontalTitleGap: 1.0,
                tileColor: context.colors.onPrimary,
                title: Text(
                  "Bağlı Ekipman",
                  style: TextStyle(fontWeight: FontWeight.w800, fontSize: 12),
                ),
                subtitle: Text(model.boundEquipmentName ?? "",
                    style: context.textTheme.bodyText2!
                        .copyWith(fontWeight: FontWeight.w100, fontSize: 14)),
              ),

              ListTile(
                leading: Icon(Icons.description_outlined),
                horizontalTitleGap: 1.0,
                tileColor: context.colors.onSecondary,
                title: Text(
                  "On-Call Amiri",
                  style: TextStyle(fontWeight: FontWeight.w800, fontSize: 12),
                ),
                subtitle: Text(model.onCallChiefName ?? "",
                    style: context.textTheme.bodyText2!
                        .copyWith(fontWeight: FontWeight.w100, fontSize: 14)),
              ),
              ListTile(
                leading: Icon(Icons.description_outlined),
                horizontalTitleGap: 1.0,
                tileColor: context.colors.onPrimary,
                title: Text(
                  "On-Call Sorumlusu",
                  style: TextStyle(fontWeight: FontWeight.w800, fontSize: 12),
                ),
                subtitle: Text(model.onCallResponsibleName ?? "",
                    style: context.textTheme.bodyText2!
                        .copyWith(fontWeight: FontWeight.w100, fontSize: 14)),
              ),

              ListTile(
                leading: Icon(Icons.label_outlined),
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
            ],
          ),
        ),
      ),
      // SizedBox(height: context.height * 0.02),
      // Card(
      //   elevation: 5,
      //   color: context.colors.surface,
      //   shape: RoundedRectangleBorder(
      //     borderRadius: BorderRadius.circular(20.r),
      //   ),
      //   child: Padding(
      //     padding: context.paddingLowAll,
      //     child: Column(
      //       children: [
      //         Container(
      //           margin: EdgeInsets.only(bottom: 10.h),
      //           height: context.height * 0.05,
      //           child: Center(
      //             child: ListTile(
      //               tileColor: context.colors.onSecondary,
      //               leading: Text(
      //                 "Ekipman Detayları",
      //                 style:
      //                     TextStyle(fontWeight: FontWeight.w800, fontSize: 18),
      //               ),
      //             ),
      //           ),
      //         ),
      //         ListTile(
      //           leading: Icon(Icons.tag),horizontalTitleGap: 1.0,
      //           tileColor: context.colors.onPrimary,
      //           title: Text(
      //             "Trip Parametre Tag No",
      //             style: TextStyle(
      //                 fontWeight: FontWeight.w800,
      //                 fontSize: 12
      //             ),                ),
      //           subtitle: Text(model.tripParameterTagNo ?? "",
      //               style: context.textTheme.bodyText2!
      //                   .copyWith(fontWeight: FontWeight.w100, fontSize: 14)),
      //         ),

      //         ListTile(
      //           leading: Icon(Icons.device_thermostat_outlined),horizontalTitleGap: 1.0,
      //           tileColor: context.colors.onSecondary,
      //           title: Text(
      //             "Ölçüm Elemanı",
      //             style: TextStyle(
      //                 fontWeight: FontWeight.w800,
      //                 fontSize: 12
      //             ),                ),
      //           subtitle: Text(model.measurementToolName ?? "",
      //               style: context.textTheme.bodyText2!
      //                   .copyWith(fontWeight: FontWeight.w100, fontSize: 14)),
      //         ),
      //         ListTile(
      //           leading: Icon(Icons.alarm),horizontalTitleGap: 1.0,
      //           tileColor: context.colors.onPrimary,
      //           title: Text(
      //             "Alarm Seti",
      //             style: TextStyle(
      //                 fontWeight: FontWeight.w800,
      //                 fontSize: 12
      //             ),                ),
      //           subtitle: Text(model.alarmSet ?? "",
      //               style: context.textTheme.bodyText2!
      //                   .copyWith(fontWeight: FontWeight.w100, fontSize: 14)),
      //         ),
      //         ListTile(
      //           leading: Icon(Icons.list),horizontalTitleGap: 1.0,
      //           tileColor: context.colors.onSecondary,
      //           title: Text(
      //             "Trip Seti",
      //             style: TextStyle(
      //                 fontWeight: FontWeight.w800,
      //                 fontSize: 12
      //             ),                ),
      //           subtitle: Text(model.tripSet ?? "",
      //               style: context.textTheme.bodyText2!
      //                   .copyWith(fontWeight: FontWeight.w100, fontSize: 14)),
      //         )
      //       ],
      //     ),
      //   ),
      // ),
      SizedBox(height: context.height * 0.02),
      Card(
        elevation: 5,
        color: context.colors.surface,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20.r),
        ),
        child: Padding(
          padding: context.paddingLowAll,
          child: Column(
            children: [
              Container(
                margin: EdgeInsets.only(bottom: 10.h),
                height: context.height * 0.05,
                child: Center(
                  child: ListTile(
                    tileColor: context.colors.onSecondary,
                    leading: Text(
                      "Ek Bilgiler",
                      style:
                          TextStyle(fontWeight: FontWeight.w800, fontSize: 18),
                    ),
                  ),
                ),
              ),
              ListTile(
                leading: Icon(Icons.description_outlined),
                horizontalTitleGap: 1.0,
                tileColor: context.colors.onPrimary,
                title: Text(
                  "By-Pass Nedeni",
                  style: TextStyle(fontWeight: FontWeight.w800, fontSize: 12),
                ),
                subtitle: Text(model.byPassCause ?? "",
                    style: context.textTheme.bodyText2!
                        .copyWith(fontWeight: FontWeight.w100, fontSize: 14)),
              ),
              ListTile(
                leading: Icon(Icons.warning_amber_outlined),
                horizontalTitleGap: 1.0,
                tileColor: context.colors.onSecondary,
                title: Text(
                  "Potansiyel Tehlike ve Sonuçları",
                  style: TextStyle(fontWeight: FontWeight.w800, fontSize: 12),
                ),
                subtitle: Text(model.potentialDangerAndOutcome ?? "",
                    style: context.textTheme.bodyText2!
                        .copyWith(fontWeight: FontWeight.w100, fontSize: 14)),
              ),
              ListTile(
                leading: Icon(Icons.important_devices_outlined),
                horizontalTitleGap: 1.0,
                tileColor: context.colors.onPrimary,
                title: Text(
                  "Acil Durumda Etkilenecek Üniteler/Koruma/Emniyet Seviyesi Azalacak Ekipmanlar",
                  style: TextStyle(fontWeight: FontWeight.w800, fontSize: 12),
                ),
                subtitle: Text(
                    model.unitsToBeEffectedInUrgentSituationsNames ?? "",
                    style: context.textTheme.bodyText2!
                        .copyWith(fontWeight: FontWeight.w100, fontSize: 14)),
              ),
              ListTile(
                leading: Icon(Icons.important_devices_outlined),
                horizontalTitleGap: 1.0,
                tileColor: context.colors.onSecondary,
                title: Text(
                  "By-pass Süresince Takip Edilecek Alternatif Korumalar",
                  style: TextStyle(fontWeight: FontWeight.w800, fontSize: 12),
                ),
                subtitle: Text(model.parametersToBeFollowed ?? "",
                    style: context.textTheme.bodyText2!
                        .copyWith(fontWeight: FontWeight.w100, fontSize: 14)),
              ),
              ListTile(
                leading: Icon(Icons.playlist_add_check_rounded),
                horizontalTitleGap: 1.0,
                tileColor: context.colors.onPrimary,
                title: Text(
                  "Eylem Planı",
                  style: TextStyle(fontWeight: FontWeight.w800, fontSize: 12),
                ),
                subtitle: Text(model.actionPlan ?? "",
                    style: context.textTheme.bodyText2!
                        .copyWith(fontWeight: FontWeight.w100, fontSize: 14)),
              ),
              // ListTile(
              //   leading: Icon(Icons.handyman_outlined),
              //   horizontalTitleGap: 1.0,
              //   tileColor: context.colors.onPrimary,
              //   title: Text(
              //     "Fonksion",
              //     style: TextStyle(fontWeight: FontWeight.w800, fontSize: 12),
              //   ),
              //   subtitle: Text(model.function ?? "",
              //       style: context.textTheme.bodyText2!
              //           .copyWith(fontWeight: FontWeight.w100, fontSize: 14)),
              // ),
              // ListTile(
              //   leading: Icon(Icons.tag),
              //   horizontalTitleGap: 1.0,
              //   tileColor: context.colors.onSecondary,
              //   title: Text(
              //     "POS ByPass Switch Tag No",
              //     style: TextStyle(fontWeight: FontWeight.w800, fontSize: 12),
              //   ),
              //   subtitle: Text(model.posByPassSwitchTagNo ?? "",
              //       style: context.textTheme.bodyText2!
              //           .copyWith(fontWeight: FontWeight.w100, fontSize: 14)),
              // ),
              // ListTile(
              //   leading: Icon(Icons.tag),
              //   horizontalTitleGap: 1.0,
              //   tileColor: context.colors.onPrimary,
              //   title: Text(
              //     "MOS ByPass Switch Tag No",
              //     style: TextStyle(fontWeight: FontWeight.w800, fontSize: 12),
              //   ),
              //   subtitle: Text(model.mosByPassSwitchTagNo ?? "",
              //       style: context.textTheme.bodyText2!
              //           .copyWith(fontWeight: FontWeight.w100, fontSize: 14)),
              // ),
              // ListTile(
              //   leading: Icon(Icons.description_outlined),
              //   horizontalTitleGap: 1.0,
              //   tileColor: context.colors.onSecondary,
              //   title: Text(
              //     "Açıklamalar/Görüşler",
              //     style: TextStyle(fontWeight: FontWeight.w800, fontSize: 12),
              //   ),
              //   subtitle: Text(model.explanationsOpinions ?? "-",
              //       style: context.textTheme.bodyText2!
              //           .copyWith(fontWeight: FontWeight.w100, fontSize: 14)),
              // ),
              // ListTile(
              //   leading: Icon(Icons.drag_handle),
              //   horizontalTitleGap: 1.0,
              //   tileColor: context.colors.onPrimary,
              //   title: Text(
              //     "Voting",
              //     //style: context.textTheme.headline6!.copyWith(fontSize: 16.sm),
              //     style: TextStyle(fontWeight: FontWeight.w800, fontSize: 12),
              //   ),
              //   subtitle: Text(model.voting ?? "",
              //       style: context.textTheme.bodyText2!
              //           .copyWith(fontWeight: FontWeight.w100, fontSize: 14)),
              // ),
              // model.silLevel != null
              //     ? ListTile(
              //         leading: Icon(Icons.perm_device_information),
              //         horizontalTitleGap: 1.0,
              //         tileColor: context.colors.onSecondary,
              //         title: Text(
              //           "SIL Seviyesi",
              //           style: TextStyle(
              //               fontWeight: FontWeight.w800, fontSize: 12),
              //         ),
              //         subtitle: Text(model.silLevel.toString(),
              //             style: context.textTheme.bodyText2!.copyWith(
              //                 fontWeight: FontWeight.w100, fontSize: 14)),
              //       )
              //     : SizedBox(),
              // ListTile(
              //   leading: Icon(Icons.label_outlined),
              //   tileColor: context.colors.onPrimary,
              //   title: Text(
              //     "MOC No",
              //     style: context.textTheme.headline6!.copyWith(fontSize: 16.sm),
              //   ),
              //   subtitle: Text(model.mocNo ?? "",
              //       style: context.textTheme.bodyText2!
              //           .copyWith(fontWeight: FontWeight.w100, fontSize: 12)),
              // ),
            ],
          ),
        ),
      )
    ]);
  }
}
