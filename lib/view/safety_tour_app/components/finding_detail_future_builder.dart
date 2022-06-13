import '../model/finding_model.dart';
import '../unplanned_tours/subview/unplanned_tour_detail/service/unplanned_tour_detail_service.dart';
import '../unplanned_tours/subview/unplanned_tour_detail/viewmodel/unplanned_tour_finding_detail_view_model.dart';
import 'package:flutter/material.dart';

import '../../../../../../product/common/_product/_model/finding_file.dart';
import 'single_file_view.dart';

class FindingDetailFutureBuilder extends StatefulWidget {
  final BuildContext context;
  final FindingModel finding;
  final FindingDetailViewModel viewModel;
  const FindingDetailFutureBuilder({
    Key? key,
    required this.finding,
    required this.viewModel,
    required this.context,
  }) : super(key: key);

  @override
  State<FindingDetailFutureBuilder> createState() =>
      _FindingDetailFutureBuilderState();
}

class _FindingDetailFutureBuilderState
    extends State<FindingDetailFutureBuilder> {
  @override
  Widget build(BuildContext context) {
    return FutureBuilder<List<FindingFile>?>(
      future: UnPlannedTourDetailService.instance!
          .getFindingFiles(widget.finding.id ?? 0),
      builder: (_, snapshot) {
        switch (snapshot.connectionState) {
          case ConnectionState.waiting:
            print(snapshot.error);
            return Center(
              child: CircularProgressIndicator(
                color: Colors.black54,
                strokeWidth: 2,
              ),
            );
          case ConnectionState.done:
            if (snapshot.data?.isEmpty ?? true) {
              return Center(
                child: Text(
                  "Henüz eklenmiş bir dosya bulunmamaktadır.",
                  style: TextStyle(fontSize: 13),
                ),
              );
            }
            if (snapshot.hasData) {
              return ListView.builder(
                shrinkWrap: true,
                itemCount: snapshot.data!.length,
                itemBuilder: (context, index) {
                  return Column(
                    children: [
                      InkWell(
                        onTap: () async => await Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => SingleFileView(
                              fileBytes: snapshot.data![index].fileBytes!,
                              filename: snapshot.data![index].filename!,
                              contentType: snapshot.data![index].contentType!,
                            ),
                          ),
                        ),
                        child: InputChip(
                          label: Text("${snapshot.data![index].filename}",
                              style: TextStyle(fontSize: 12)),
                          deleteIcon: Icon(Icons.delete_outline),
                          avatar: Icon(Icons.insert_drive_file_outlined),
                          deleteButtonTooltipMessage: "Dosya Sil",
                          useDeleteButtonTooltip: true,
                          deleteIconColor: Colors.red,
                          onDeleted: () async {
                            showDialog(
                              context: context,
                              builder: (_) => AlertDialog(
                                title: Text("Dosya Sil"),
                                content: Text(
                                    "Dosyayı silmek istediğinize emin misiniz?"),
                                actions: [
                                  TextButton(
                                      child: Text("Evet"),
                                      onPressed: () async {
                                        widget.viewModel.changeIsFileLoading();
                                        final isSuccess = await widget.viewModel
                                            .deleteFindingFile(
                                                widget.finding.id!,
                                                snapshot
                                                    .data![index].filename!);
                                        Navigator.pop(widget.context);
                                        if (isSuccess) {
                                          widget.viewModel
                                              .changeIsFileLoading();
                                          final snackBar = SnackBar(
                                            content:
                                                Text("Dosya başarıyla silindi"),
                                            duration: Duration(seconds: 1),
                                          );
                                          ScaffoldMessenger.of(widget.context)
                                              .showSnackBar(snackBar);
                                          setState(() {});
                                        } else {
                                          final snackBar = SnackBar(
                                            content: Text(
                                                "Dosya Silinirken bir hata oluştu"),
                                            duration: Duration(seconds: 1),
                                          );
                                          ScaffoldMessenger.of(widget.context)
                                              .showSnackBar(snackBar);
                                        }
                                      }),
                                  TextButton(
                                      child: Text("Hayır"),
                                      onPressed: () {
                                        Navigator.pop(widget.context);
                                      }),
                                ],
                              ),
                            );
                          },
                        ),
                      )
                    ],
                  );
                },
              );
            }
            if (ConnectionState.waiting == snapshot.connectionState) {
              return Center(
                child: CircularProgressIndicator(
                  color: Colors.black54,
                  strokeWidth: 2,
                ),
              );
            }
            return Center(
              child: CircularProgressIndicator(),
            );
          default:
            return Container(
              child: Text("Bir hata oluştu"),
            );
        }
      },
    );
  }
}
