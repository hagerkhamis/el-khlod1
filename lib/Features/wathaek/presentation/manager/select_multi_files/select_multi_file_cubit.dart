import 'dart:io';

// ignore: depend_on_referenced_packages
import 'package:bloc/bloc.dart';
import 'package:file_picker/file_picker.dart';
// ignore: depend_on_referenced_packages
import 'package:meta/meta.dart';

part 'select_multi_file_state.dart';

class SelectMultiFileCubit extends Cubit<SelectMultiFileState> {
  SelectMultiFileCubit() : super(RequestVacationInitial());
  List<File>? selectedFile;
  List<String>? fileName;
  File? fileSize;
  Future<void> pickFileFromDevice() async {
    FilePickerResult? result = await FilePicker.platform
        .pickFiles(type: FileType.image, allowMultiple: true);
    if (result != null) {
      PlatformFile file = result.files.first;

      if (['jpg', 'jpeg', 'png', 'gif', 'jfif', 'pjpeg', 'pjp', 'svg']
          .any(file.extension!.toLowerCase().contains)) {
        selectedFile = result.paths.map((path) => File(path!)).toList();
        emit(PickImageState(selectedFile!));
      } else {
        selectedFile = result.paths.map((path) => File(path!)).toList();

        fileName =   selectedFile!.map((e) => e.path).toList();
        emit(PickFileState(fileName!, selectedFile!));
      }
    } else {}
  }
}
