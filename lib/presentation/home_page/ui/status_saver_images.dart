import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:whatsapp_status_saver/application/providers/file_manager_provider.dart';

class StatusSaverImages extends StatelessWidget {
  const StatusSaverImages({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
        stream: fileManagerProvider.getFilesImages(),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            final data = snapshot.data as List<FileSystemEntity>;
            return StaggeredGrid.count(
              crossAxisCount: 2,
              axisDirection: AxisDirection.down,
              crossAxisSpacing: 8.0,
              mainAxisSpacing: 8.0,
              children: data.map((e) => Image.file(e as File)).toList(),
            );
            // return GridView.builder(
            //   itemCount: data.length,
            //   padding: const EdgeInsets.all(8.0),
            //   gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            //     crossAxisCount: 2,
            //     mainAxisSpacing: 8.0,
            //     crossAxisSpacing: 8.0,
            //   ),
            //   itemBuilder: (context, index) {
            //     final file = data[index];
            //     return DecoratedBox(
            //       decoration: BoxDecoration(
            //         color: Colors.white,
            //         borderRadius: BorderRadius.circular(8.0),
            //         image: DecorationImage(
            //           image: FileImage(file as File),
            //           fit: BoxFit.scaleDown,
            //         ),
            //       ),
            //     );
            //   },
            // );
          } else {
            return const Center(child: CircularProgressIndicator());
          }
        });
  }
}
