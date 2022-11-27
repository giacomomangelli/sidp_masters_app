// const _folderType = "application/vnd.google-apps.folder";
//
// Future<void> _showList(List<File> files) {
//   return showDialog(
//     context: context,
//     builder: (BuildContext context) {
//       return AlertDialog(
//         title: Text("List"),
//         content: Container(
//           width: MediaQuery.of(context).size.height - 50,
//           height: MediaQuery.of(context).size.height,
//           child: ListView.builder(
//             itemCount: files.length,
//             itemBuilder: (context, index) {
//               final isFolder = files[index].mimeType == _folderType;
//
//               return ListTile(
//                 leading: Icon(
//                     isFolder ? Icons.folder : Icons.insert_drive_file_outlined),
//                 title: Text(files[index].name ?? "no-name"),
//               );
//             },
//           ),
//         ),
//       );
//     },
//   );
// }
