part of 'select_file_mosalat_cubit.dart';

@immutable
abstract class SelectFileMosalatState {}

class RequestVacationInitial extends SelectFileMosalatState {}

class PickFileState extends SelectFileMosalatState {
  final String fileName;
  final File filePath;

  PickFileState(this.fileName, this.filePath);
}

class PickImageState extends SelectFileMosalatState {
  final File imagePath;

  PickImageState(this.imagePath);
}
