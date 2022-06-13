import 'dart:io';

import '../../../../components/finding_detail_future_builder.dart';
import '../../../../components/single_file_view.dart';
import '../../../../model/finding_model.dart';
import '../../viewmodel/planned_tour_detail_view_model.dart';
import '../../../../unplanned_tours/subview/unplanned_tour_detail/viewmodel/unplanned_tour_finding_detail_view_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:image_picker/image_picker.dart';

import '../../../../../../../core/base/view/base_view.dart';
import '../../../../../../../core/components/button/action_button.dart';
import '../../../../../../../core/components/button/expandable_fab.dart';
import '../../../../../../../core/components/list_tile/custom_list_tile.dart';
import '../../../../../../../core/extensions/context_extension.dart';
import '../../../../../../../product/common/_product/_model/finding_file.dart';

class PlannedTourFindingDetailView extends StatefulWidget {
  PlannedTourFindingDetailView({Key? key}) : super(key: key);

  @override
  _FindingDetailViewState createState() => _FindingDetailViewState();
}

class _FindingDetailViewState extends State<PlannedTourFindingDetailView> {
  PlannedTourDetailViewModel unPlannedTourDetailViewModel =
      PlannedTourDetailViewModel();

  @override
  Widget build(BuildContext context) {
    FindingModel finding =
        ModalRoute.of(context)!.settings.arguments as FindingModel;
    return BaseView<FindingDetailViewModel>(
      viewModel: FindingDetailViewModel(),
      onModelReady: (FindingDetailViewModel model) async {
        model.setContext(context);
        model.init();
      },
      onPageBuilder: (BuildContext context, FindingDetailViewModel viewModel) =>
          Scaffold(
        floatingActionButtonLocation: FloatingActionButtonLocation.endDocked,
        floatingActionButton: ExpandableFab(
          distance: 102.0,
          children: [
            ActionButton(
              icon: const Icon(Icons.upload_file_outlined),
              onPressed: () async {
                final inputFiles = await viewModel.selectFile();
                if (inputFiles != null && inputFiles.isNotEmpty) {
                  viewModel.changeIsFileLoading();
                  await viewModel.uploadFindingFiles(
                    inputFiles,
                    finding.id!,
                    finding.tourId!,
                  );
                }
                setState(() {});
                viewModel.changeIsFileLoading();
                final snackBar = SnackBar(
                  content: Text('Dosya başarıyla yüklendi.'),
                  duration: const Duration(seconds: 2),
                );
                ScaffoldMessenger.of(context).showSnackBar(snackBar);
              },
            ),
            ActionButton(
              icon: const Icon(Icons.camera_alt_outlined),
              onPressed: () async {
                File takenPhoto =
                    (await viewModel.pickImage(ImageSource.camera))!;
                await viewModel.uploadFindingFiles(
                    [takenPhoto], finding.id!, finding.tourId!);
                setState(() {});
                if (takenPhoto.path.isNotEmpty) {
                  final snackBar = SnackBar(
                    content: Text('Dosya başarıyla yüklendi.'),
                    duration: const Duration(seconds: 2),
                  );
                  ScaffoldMessenger.of(context).showSnackBar(snackBar);
                }
              },
            ),
          ],
        ),
        appBar: AppBar(
          elevation: 0,
          title: Text(
            "Bulgu Detayı",
            style: context.textTheme.headline6,
          ),
          actions: [
            IconButton(
              icon: Icon(Icons.delete_forever_rounded),
              onPressed: () =>
                  viewModel.showDeleteDialog(finding.id!, finding.tourId!),
            )
          ],
        ),
        body: buildExpandedFindingDetails(finding, viewModel),
      ),
    );
  }

  List<Widget> initFileWidgets(List<FindingFile>? findingFiles) {
    List<Widget> textWidgets = <Widget>[];
    if (findingFiles?.isNotEmpty ?? false) {
      findingFiles!.forEach((element) {
        textWidgets.add(TextButton.icon(
            onPressed: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => Observer(builder: (_) {
                            return SingleFileView(
                              fileBytes: element.fileBytes!,
                              filename: element.filename!,
                              contentType: element.contentType!,
                            );
                          })));
            },
            icon: Icon(Icons.document_scanner),
            label: Text("Dosya")));
      });

      return textWidgets;
    }
    return textWidgets;
  }

  Card buildExpandedFindingDetails(
      FindingModel finding, FindingDetailViewModel viewModel) {
    return Card(
      elevation: 5,
      color: context.colors.surface,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(20.r),
      ),
      margin: context.paddingNormalAll,
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: ListView(
          shrinkWrap: true,
          children: [
            SingleChildScrollView(
              child: Column(
                mainAxisSize: MainAxisSize.max,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  ListTile(
                    leading: Text("Bulgu bilgileri",
                        style: TextStyle(
                            fontSize: 18, fontWeight: FontWeight.w600)),
                    tileColor: context.colors.onSecondary,
                  ),
                  CustomListTile(
                      leadingIcon: Icons.tag,
                      title: "Bulgu ID",
                      subtitle: finding.id.toString(),
                      tileColor: context.colors.onPrimary,
                      titleStyle:
                          context.textTheme.headline6!.copyWith(fontSize: 16),
                      subtitleStyle: context.textTheme.bodyText2!
                          .copyWith(fontWeight: FontWeight.w100, fontSize: 12),
                      context: context),
                  CustomListTile(
                      leadingIcon: Icons.category_outlined,
                      title: "Kategori",
                      subtitle: finding.categoryNames ?? "",
                      tileColor: context.colors.onSecondary,
                      titleStyle:
                          context.textTheme.headline6!.copyWith(fontSize: 16),
                      subtitleStyle: context.textTheme.bodyText2!
                          .copyWith(fontWeight: FontWeight.w100, fontSize: 12),
                      context: context),
                  CustomListTile(
                      leadingIcon: Icons.find_in_page_outlined,
                      title: "Bulgu Türü",
                      subtitle: finding.findingTypeStr ?? "",
                      tileColor: context.colors.onPrimary,
                      titleStyle:
                          context.textTheme.headline6!.copyWith(fontSize: 16),
                      subtitleStyle: context.textTheme.bodyText2!
                          .copyWith(fontWeight: FontWeight.w100, fontSize: 12),
                      context: context),
                  CustomListTile(
                      leadingIcon: Icons.call_to_action_outlined,
                      title: "Alınması Gereken Aksiyonlar",
                      subtitle: finding.actionsShouldBeTaken ?? "",
                      tileColor: context.colors.onSecondary,
                      titleStyle:
                          context.textTheme.headline6!.copyWith(fontSize: 16),
                      subtitleStyle: context.textTheme.bodyText2!
                          .copyWith(fontWeight: FontWeight.w100, fontSize: 12),
                      context: context),
                  CustomListTile(
                      leadingIcon: Icons.note_add_outlined,
                      title: "Sahada Alınan Aksiyonlar",
                      subtitle: finding.actionsTakenRightInTheField ?? "",
                      tileColor: context.colors.onPrimary,
                      titleStyle:
                          context.textTheme.headline6!.copyWith(fontSize: 16),
                      subtitleStyle: context.textTheme.bodyText2!
                          .copyWith(fontWeight: FontWeight.w100, fontSize: 12),
                      context: context),
                  CustomListTile(
                      leadingIcon: Icons.description_outlined,
                      title: "Gözlemler",
                      subtitle: finding.observations ?? "",
                      tileColor: context.colors.onSecondary,
                      titleStyle:
                          context.textTheme.headline6!.copyWith(fontSize: 16),
                      subtitleStyle: context.textTheme.bodyText2!
                          .copyWith(fontWeight: FontWeight.w100, fontSize: 12),
                      context: context),
                  ListTile(
                    leading: Icon(Icons.attachment),
                    title: Text("Dosya"),
                    subtitle: FindingDetailFutureBuilder(
                        finding: finding,
                        viewModel: viewModel,
                        context: context),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
