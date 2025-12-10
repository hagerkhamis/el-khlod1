part of 'select_multi_file_cubit.dart';

@immutable
abstract class SelectMultiFileState {}

class RequestVacationInitial extends SelectMultiFileState {}

class PickFileState extends SelectMultiFileState {
  final List<String>? fileName;
  final List<File>? filePath;

  PickFileState(this.fileName, this.filePath);
}

class PickImageState extends SelectMultiFileState {
  final List<File>? imagePath;

  PickImageState(this.imagePath);
}
