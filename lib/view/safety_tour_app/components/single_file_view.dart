import 'dart:typed_data';

import '../../../core/extensions/context_extension.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class SingleFileView extends StatelessWidget {
  final Uint8List fileBytes;
  final String filename;
  final String contentType;
  const SingleFileView(
      {Key? key,
      required this.fileBytes,
      required this.filename,
      required this.contentType})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Dosya")),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              "Dosya Adı: \n" + filename,
            ),
            SizedBox(height: context.normalFreeSpace.h),
            Container(
              padding: EdgeInsets.only(left: 31.5.w),
              alignment: Alignment.centerLeft,
              child: Text(
                "Dosya Türü: " + contentType,
              ),
            ),
            SizedBox(height: 50.w),
            Container(
              height: context.height * 0.6,
              child: Image.memory(
                fileBytes,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
