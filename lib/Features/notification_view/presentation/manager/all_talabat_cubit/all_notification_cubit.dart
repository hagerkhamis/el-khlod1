// ignore: depend_on_referenced_packages
import 'package:bloc/bloc.dart';
import '../../../data/models/all_notification_model.dart';

import '../../../domain/use_cases/notification_use_case.dart';

part 'all_notification_state.dart';

class AllNotificationCubit extends Cubit<AllNotificationState> {
  NotificationUseCase talabtUseCase;
  AllNotificationCubit(this.talabtUseCase) : super(MyMessagesInitial());

  Future<void> getAllNotification(String userId) async {
    emit(const FetchLoading());
    final result = await talabtUseCase.fetchAllNotification(userId);

    emit(result.fold(FetchFailed.new, FetchSuccessful.new));
  }
}
