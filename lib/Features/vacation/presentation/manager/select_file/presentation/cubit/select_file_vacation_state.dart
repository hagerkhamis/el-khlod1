part of 'select_file_vacation_cubit.dart';

@immutable
abstract class SelectFileVacationState {}

class RequestVacationInitial extends SelectFileVacationState {}

class PickFileState extends SelectFileVacationState {
  final String fileName;
  final File filePath;

  PickFileState(this.fileName, this.filePath);
}

class PickImageState extends SelectFileVacationState {
  final File imagePath;

  PickImageState(this.imagePath);
}
