import 'package:equatable/equatable.dart';

class Lwae7Entity extends Equatable {
  final String? layhaId;
  final String? layhaName;
  final String? layhaPath;
  final dynamic seen;
  final dynamic seenDate;
  final dynamic seenTime;

  const Lwae7Entity({
    this.layhaId,
    this.layhaName,
    this.layhaPath,
    this.seen,
    this.seenDate,
    this.seenTime,
  });

  @override
  List<Object?> get props =>
      [layhaId, layhaName, layhaPath, seen, seenDate, seenTime];
}
