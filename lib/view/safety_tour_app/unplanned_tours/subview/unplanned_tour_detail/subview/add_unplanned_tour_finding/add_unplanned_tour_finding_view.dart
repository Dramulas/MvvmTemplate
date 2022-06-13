import 'dart:io';

import 'package:fast_immutable_collections/fast_immutable_collections.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:image_picker/image_picker.dart';

import '../../../../../../../core/base/view/base_view.dart';
import '../../../../../../../core/components/text/auto_locale.text.dart';
import '../../../../../../../core/extensions/context_extension.dart';
import '../../../../../../../core/init/theme/light/color_scheme_light.dart';
import '../../../../../../../product/common/_product/_model/finding_file.dart';
import '../../../../../../../product/common/_product/_widgets/big_little_text_widget.dart';
import '../../../../../../../product/common/_widgets/button/button_widget.dart';
import '../../../../../model/abstract/ITourViewModel.dart';
import '../../../../../model/category_dd_model.dart';
import '../../../../../model/finding_model.dart';
import '../../../../../model/tour_model.dart';
import '../../module/actions_mustbetaken_text_form_field.dart';
import '../../module/actions_taken_in_field_text_form_field.dart';
import '../../module/finding_categories_multi_select_dropdown.dart';
import '../../module/finding_type_dropdown.dart';
import '../../module/observation_text_form_field.dart';
import '../../module/save_tour_finding_fab_button.dart';
import '../../viewmodel/subview_model/add_unplanned_tour_finding_view_model/add_unplanned_tour_finding_view_model.dart';

class AddUnPlannedTourFindingView extends StatefulWidget {
  const AddUnPlannedTourFindingView({Key? key}) : super(key: key);

  @override
  _AddUnPlannedTourFindingViewState createState() =>
      _AddUnPlannedTourFindingViewState();
}

class _AddUnPlannedTourFindingViewState
    extends State<AddUnPlannedTourFindingView> {
  late FindingModel finding;
  List<FindingFile> findingFiles = [];

  List<File>? files = <File>[];

  late List<CategoryDDModel>? findingTypes;
  late List<String>? findingTypeNames;
  late List<String>? findingCategories;

  late final _controllerActionMustBeTaken;
  late final _controllerActionMustBeTakenInField;
  late final _controllerObservations;
  late final _formKey;

  @override
  void initState() {
    super.initState();
    finding = FindingModel();
    findingTypes = <CategoryDDModel>[];
    findingTypeNames = <String>[];
    findingCategories = <String>[];
    _controllerActionMustBeTaken = TextEditingController();
    _controllerActionMustBeTakenInField = TextEditingController();
    _controllerObservations = TextEditingController();
    _formKey = GlobalKey<FormState>();
  }

  @override
  Widget build(BuildContext context) {
    TourModel tour = ModalRoute.of(context)!.settings.arguments as TourModel;

    return BaseView<AddUnPlannedTourFindingViewModel>(
      viewModel: AddUnPlannedTourFindingViewModel(),
      onModelReady: (AddUnPlannedTourFindingViewModel model) async {
        model.setContext(context);
        await model.init();

        findingTypes = (await model.getCategories())?.cast<CategoryDDModel>();

        setState(() {
          findingTypes!.forEach((element) {
            findingTypeNames!.add(element.findingTypeStr!);
            findingTypeNames!.removeDuplicates();
            findingCategories!.add(element.name!);
          });
        });
      },
      onPageBuilder:
          (BuildContext context, AddUnPlannedTourFindingViewModel viewModel) =>
              Scaffold(
        appBar: AppBar(
          centerTitle: false,
          title: AutoLocaleText(
            value: "Bulgu Ekle",
            textAlign: TextAlign.center,
            style: TextStyle(
                fontSize: 18,
                color: ColorSchemeLight.instance!.appBarTitleColor),
          ),
        ),
        body: Container(
          child: viewModel.categoryList.isEmpty
              ? Center(
                  child: CircularProgressIndicator(),
                )
              : Card(
                  elevation: 5,
                  color: context.colors.surface,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20.r),
                  ),
                  margin: context.paddingNormalAll,
                  child: Form(
                    key: _formKey,
                    child: SingleChildScrollView(
                      child: Padding(
                        padding: const EdgeInsets.all(24.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            buildLittleTextWidget("Bulgu Tipi*"),
                            SizedBox(height: context.lowFreeSpace),
                            FindingTypeDropdown(
                                finding: finding, viewModel: viewModel),
                            SizedBox(height: context.highFreeSpace),
                            buildLittleTextWidget("Kategori*"),
                            SizedBox(height: context.lowFreeSpace),
                            FindingCategoriesMultiSelectDropdown<
                                    AddUnPlannedTourFindingViewModel>(
                                finding: finding, viewModel: viewModel),
                            SizedBox(height: context.highFreeSpace),
                            ActionsMustBeTakenTextFormField(
                              controllerActionMustBeTaken:
                                  _controllerActionMustBeTaken,
                              finding: finding,
                            ),
                            SizedBox(height: context.highFreeSpace),
                            ActionsTakenInFieldTextFormField(
                                controllerActionMustBeTakenInField:
                                    _controllerActionMustBeTakenInField,
                                finding: finding),
                            SizedBox(height: context.highFreeSpace),
                            ObservationsTextFormField(
                                controllerObservations: _controllerObservations,
                                finding: finding),
                            SizedBox(height: context.highFreeSpace),
                            SaveTourFindingFabButton<IFabButton>(
                              formKey: _formKey,
                              tour: tour,
                              finding: finding,
                              viewModel: viewModel,
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
        ),
      ),
    );
  }

  BoxDecoration buildFileBoxDecoration() {
    return BoxDecoration(
        border: Border(
          left: BorderSide(
            color: Colors.black12,
            width: 2,
          ),
          right: BorderSide(
            color: Colors.black12,
            width: 2,
          ),
          bottom: BorderSide(
            color: Colors.black12,
            width: 2,
          ),
          top: BorderSide(
            color: Colors.black12,
            width: 2,
          ),
        ),
        borderRadius: BorderRadius.circular(3));
  }

  Column buildButtonWidgets(
      AddUnPlannedTourFindingViewModel viewModel, BuildContext context) {
    return Column(
      children: [
        ButtonWidget(
          text: 'Dosya Seç',
          icon: Icons.attach_file,
          onClicked: selectFile,
        ),
        SizedBox(height: 8),
        ButtonWidget(
          text: 'Resim Çek',
          icon: Icons.photo_camera,
          onClicked: () async {
            File takenPhoto = (await viewModel.pickImage(ImageSource.camera))!;

            setState(() {
              files!.add(takenPhoto);
              findingFiles
                  .add(FindingFile(fileBytes: takenPhoto.readAsBytesSync()));
            });
          },
        ),
        SizedBox(height: 8),
      ],
    );
  }

  Future selectFile() async {
    FilePickerResult? result =
        await FilePicker.platform.pickFiles(allowMultiple: true);

    if (result == null) return;

    for (var i = 0; i < result.files.length; i++) {
      final path = result.files[i].path!;
      // files!.add(File(path));
      final filename = result.files[i].name;
      final fileBytes = await File(path).readAsBytes();
      findingFiles.add(FindingFile(fileBytes: fileBytes, filename: filename));
      print(findingFiles[i].fileBytes);
      print(findingFiles[i].filename);
    }
    setState(() {});
  }
}
