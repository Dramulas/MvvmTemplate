import 'package:easy_localization/easy_localization.dart';
import '../../../model/finding_model.dart';
import '../../../model/tour_model.dart';
import '../service/planned_tour_detail_service.dart';
import '../viewmodel/planned_tour_detail_view_model.dart';
import 'package:flutter/material.dart';
// ignore: unnecessary_import
import 'package:flutter/rendering.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../../core/base/view/base_view.dart';
import '../../../../../../core/components/list_tile/custom_list_tile.dart';
import '../../../../../../core/constants/navigation/navigation_constants.dart';
import '../../../../../../core/extensions/context_extension.dart';
import '../../../../../../core/init/lang/locale_keys.g.dart';
import '../../../../../../core/init/navigation/navigation_service.dart';

class PlannedTourDetailView extends StatefulWidget {
  PlannedTourDetailView({Key? key}) : super(key: key);

  @override
  _PlannedTourDetailViewState createState() => _PlannedTourDetailViewState();
}

class _PlannedTourDetailViewState extends State<PlannedTourDetailView>
    with RouteAware {
  late List<FindingModel> findings;

  void didPopNext() {
    setState(() {});
  }

  @override
  void initState() {
    super.initState();
    findings = <FindingModel>[];
  }

  Future<List<FindingModel>?> fetchFindings(int id) async {
    return await PlannedTourDetailService.instance!.getFindings(id);
  }

  @override
  Widget build(BuildContext context) {
    TourModel tour = ModalRoute.of(context)!.settings.arguments as TourModel;

    fetchFindings(tour.id!).then((value) => {
          if (this.mounted)
            {
              setState(() {
                findings = value!;
              })
            }
        });

    return BaseView<PlannedTourDetailViewModel>(
      viewModel: PlannedTourDetailViewModel(),
      onModelReady: (PlannedTourDetailViewModel model) {
        model.setContext(context);
        model.init();
      },
      onPageBuilder:
          (BuildContext context, PlannedTourDetailViewModel viewModel) =>
              Scaffold(
        floatingActionButton: FloatingActionButton.extended(
          icon: Icon(Icons.add_outlined),
          elevation: 5,
          onPressed: () async =>
              await viewModel.navigateToAddPlannedTourFinding(tour),
          label: Text("Bulgu Ekle"),
        ),
        floatingActionButtonLocation: FloatingActionButtonLocation.endFloat,
        appBar: AppBar(
          elevation: 0,
          leading: NavigationService.instance.navigatorKey.currentState!
                  .canPop()
              ? IconButton(
                  icon: Icon(Icons.arrow_back_ios),
                  onPressed: () => NavigationService.instance
                      .navigateToPageClear(NavigationConstants.TOURS_HOME_VIEW,
                          data: 0))
              : null,
          title: Text(
            "Tur Detay",
            style: context.textTheme.headline6,
          ),
          actions: [
            IconButton(
              onPressed: findings.length != 0
                  ? () async => await viewModel.showDialogFinalizeTourCreation(
                      context, tour.id!)
                  : null,
              icon: Icon(Icons.save_outlined),
            ),
            IconButton(
                icon: Icon(Icons.edit),
                onPressed: tour.tourTeamMemberUsers != null
                    ? () async =>
                        await viewModel.navigateToEditPlannedTour(tour)
                    : null),
            IconButton(
              onPressed: () async =>
                  await viewModel.showDialogDeleteTour(context, tour.id!),
              icon: Icon(Icons.delete_forever_rounded),
            ),
          ],
        ),
        body: RefreshIndicator(
          onRefresh: () async {
            setState(() {});
          },
          child: Card(
            elevation: 5,
            color: context.colors.surface,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(20.r),
            ),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              mainAxisAlignment: MainAxisAlignment.start,
              children: <Widget>[
                Expanded(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Expanded(
                        child: FutureBuilder(
                            future: PlannedTourDetailService.instance!
                                .getFindings(tour.id!),
                            builder: (context,
                                AsyncSnapshot<List<FindingModel>> snapshot) {
                              if (!snapshot.hasData) {
                                return Center(
                                  child: CircularProgressIndicator.adaptive(
                                    strokeWidth: 2,
                                  ),
                                );
                              } else if (snapshot.hasError) {
                                return Center(
                                  child: Text(snapshot.error.toString()),
                                );
                              } else {
                                return buildHorizontalChips(
                                    snapshot.data, viewModel, tour.id!);
                              }
                            }),
                      ),
                    ],
                  ),
                ),
                Expanded(
                  flex: 12,
                  child: buildExpandedTourDetails(tour, context),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget buildHorizontalChips(List<FindingModel>? findings,
      PlannedTourDetailViewModel viewModel, int tourId) {
    if (findings == null || findings.isEmpty) {
      return Center(
          child: Text(
        LocaleKeys.planned_tours_finding_noFinding.tr(),
        style: TextStyle(
            fontFamily: "Poppins", fontSize: 14, fontWeight: FontWeight.w400),
      ));
    }

    return ListView.builder(
      shrinkWrap: true,
      scrollDirection: Axis.horizontal,
      itemCount: findings.length,
      padding: EdgeInsets.symmetric(horizontal: 10.w),
      itemBuilder: (BuildContext context, int index) {
        findings[index].tourId = tourId;
        if (findings[index].id == null)
          return Text(LocaleKeys.planned_tours_finding_noFinding.tr());
        return Padding(
          padding: EdgeInsets.symmetric(horizontal: 4.w),
          child: InkWell(
              onTap: () async {
                await viewModel.navigateToFindingDetail(findings[index]);
              },
              child: Chip(
                  avatar: Icon(
                    Icons.pin_drop_outlined,
                    color: Colors.black45,
                    size: 16.w,
                  ),
                  labelPadding:
                      EdgeInsets.symmetric(horizontal: context.lowFreeSpace),
                  label: Text(
                    "Bulgu $index",
                    style: TextStyle(
                        color: Colors.black87,
                        fontWeight: FontWeight.w500,
                        fontFamily: "Poppins",
                        fontSize: 15),
                  ),
                  backgroundColor: context.colors.surface,
                  elevation: 3,
                  padding: context.paddingLowAll)),
        );
      },
    );
  }
}

Card buildExpandedTourDetails(TourModel? tour, BuildContext context) {
  return Card(
    elevation: 5,
    color: context.colors.surface,
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(20.r),
    ),
    margin: context.paddingNormalAll,
    child: Padding(
      padding: context.paddingNormalAll,
      child: ListView(
        shrinkWrap: true,
        children: [
          Column(
            mainAxisSize: MainAxisSize.max,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              ListTile(
                leading: Text("Tur bilgileri",
                    style:
                        TextStyle(fontSize: 18, fontWeight: FontWeight.w600)),
                tileColor: context.colors.onSecondary,
              ),
              CustomListTile(
                  context: context,
                  title: "Tur ID",
                  subtitle: tour!.id.toString(),
                  titleStyle:
                      context.textTheme.headline6!.copyWith(fontSize: 16),
                  leadingIcon: Icons.tag,
                  subtitleStyle: context.textTheme.bodyText2!
                      .copyWith(fontWeight: FontWeight.w100, fontSize: 12),
                  tileColor: context.colors.onPrimary),
              CustomListTile(
                  context: context,
                  title: "Lokasyon",
                  subtitle: tour.locationName ?? "",
                  titleStyle:
                      context.textTheme.headline6!.copyWith(fontSize: 16),
                  leadingIcon: Icons.location_city_outlined,
                  subtitleStyle: context.textTheme.bodyText2!
                      .copyWith(fontWeight: FontWeight.w100, fontSize: 12),
                  tileColor: context.colors.onSecondary),
              CustomListTile(
                  context: context,
                  title: "Saha",
                  subtitle: tour.fieldName ?? "",
                  titleStyle:
                      context.textTheme.headline6!.copyWith(fontSize: 16),
                  leadingIcon: Icons.place,
                  subtitleStyle: context.textTheme.bodyText2!
                      .copyWith(fontWeight: FontWeight.w100, fontSize: 12),
                  tileColor: context.colors.onPrimary),
              CustomListTile(
                  context: context,
                  title: "Ekip Üyeleri",
                  subtitle: tour.tourTeamMembers ?? "",
                  titleStyle:
                      context.textTheme.headline6!.copyWith(fontSize: 16),
                  leadingIcon: Icons.people_outlined,
                  subtitleStyle: context.textTheme.bodyText2!
                      .copyWith(fontWeight: FontWeight.w100, fontSize: 12),
                  tileColor: context.colors.onSecondary),
              CustomListTile(
                  context: context,
                  title: "Tura Eşlik Edenler",
                  subtitle: tour.tourAccompaniers ?? "",
                  titleStyle:
                      context.textTheme.headline6!.copyWith(fontSize: 16),
                  leadingIcon: Icons.people_outline,
                  subtitleStyle: context.textTheme.bodyText2!
                      .copyWith(fontWeight: FontWeight.w100, fontSize: 12),
                  tileColor: context.colors.onPrimary),
              CustomListTile(
                  context: context,
                  title: "Tur Tarihi",
                  subtitle: DateFormat.yMMMMEEEEd("tr").format(tour.tourDate!),
                  titleStyle:
                      context.textTheme.headline6!.copyWith(fontSize: 16),
                  leadingIcon: Icons.calendar_today_outlined,
                  subtitleStyle: context.textTheme.bodyText2!
                      .copyWith(fontWeight: FontWeight.w100, fontSize: 12),
                  tileColor: context.colors.onSecondary),
              ListTile(
                title: Text("Saha Organizasyon Skoru"),
                subtitle: Slider(
                  divisions: 10,
                  label: "${tour.fieldOrganizationOrderScore}",
                  activeColor: context.colors.onSurface,
                  min: 0,
                  max: 10,
                  value: tour.fieldOrganizationOrderScore?.toDouble() ?? 0,
                  onChanged: (double value) {},
                ),
                leading: Icon(Icons.score_outlined),
                tileColor: context.colors.onPrimary,
              ),
              CustomListTile(
                  context: context,
                  title: "Gözlenen Pozitif Bulgular",
                  subtitle: tour.observatedSecureCasesPositiveFindings ?? "",
                  titleStyle:
                      context.textTheme.headline6!.copyWith(fontSize: 16),
                  leadingIcon: Icons.notes_outlined,
                  subtitleStyle: context.textTheme.bodyText2!
                      .copyWith(fontWeight: FontWeight.w100, fontSize: 12),
                  tileColor: context.colors.onSecondary),
            ],
          ),
        ],
      ),
    ),
  );
}
