// ignore: depend_on_referenced_packages
import 'package:bloc/bloc.dart';
// ignore: depend_on_referenced_packages
import 'package:meta/meta.dart';

import '../../../domain/entities/seen_lwae7_entity.dart';
import '../../../domain/use_cases/lwae7_use_case.dart';

part 'seen_lwae7_state.dart';

class SeenLwae7Cubit extends Cubit<SeenLwae7State> {
  Lwae7UseCase lwae7UseCase;

  SeenLwae7Cubit(this.lwae7UseCase) : super(SeenLwae7Initial());
  Future<void> deleteMessage(
    String messageId,
    String toUserId,
  ) async {
    emit(const SeenLwae7Loading());
    final result = await lwae7UseCase.seenLwae7(messageId, toUserId);

    emit(
      result.fold(
        SeenLwae7Failed.new,
        SeenLwae7Successful.new,
      ),
    );
  }
}
