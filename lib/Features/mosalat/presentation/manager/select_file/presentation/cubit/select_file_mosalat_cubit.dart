import 'dart:io';

// ignore: depend_on_referenced_packages
import 'package:bloc/bloc.dart';
import 'package:file_picker/file_picker.dart';
// ignore: depend_on_referenced_packages
import 'package:meta/meta.dart';

part 'select_file_mosalat_state.dart';

class SelectFileMosalatCubit extends Cubit<SelectFileMosalatState> {
  SelectFileMosalatCubit() : super(RequestVacationInitial());
  File? selectedFile;
  String? fileName;
  File? fileSize;
  Future<void> pickFileFromDevice() async {
    FilePickerResult? result = await FilePicker.platform.pickFiles(
        type: FileType.custom,
        allowedExtensions: [
          'pdf',
          'docx'
        ], //here you can add any of extention what you need to pick
        allowMultiple: false);
    if (result != null) {
      PlatformFile file = result.files.first;

      if (['jpg', 'jpeg', 'png', 'gif', 'jfif', 'pjpeg', 'pjp', 'svg']
          .any(file.extension!.toLowerCase().contains)) {
        selectedFile = File(result.files.single.path!);
        emit(PickImageState(selectedFile!));
      } else {
        selectedFile = File(result.files.single.path!);

        fileName = file.name;
        emit(PickFileState(fileName!, selectedFile!));
      }
    } else {}
  }
}
