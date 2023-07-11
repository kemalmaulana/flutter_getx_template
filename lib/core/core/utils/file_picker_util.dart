// import 'package:file_picker/file_picker.dart';

// class FilePickerUtil {
//   static FutureOr<List<File>?> filePicker() async {
//     try {
//       FilePickerResult? result = await FilePicker.platform.pickFiles(
//           type: FileType.custom,
//           allowedExtensions: ['pdf', 'doc', 'docx'],
//           allowMultiple: true);
//       if (result != null) {
//         List<File> files = result.paths.map((path) => File(path!)).toList();
//         return files;
//       }
//     } catch (e) {
//       return null;
//     }
//     return null;
//   }
// }
