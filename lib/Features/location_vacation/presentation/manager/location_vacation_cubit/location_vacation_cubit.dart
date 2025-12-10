import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:elkhlod/Features/location_vacation/domain/use_cases/location_vacation_use_case.dart';
import 'location_vacation_state.dart';

class LocationVacationCubit extends Cubit<LocationVacationState> {
  final LocationVacationUseCase useCase;

  LocationVacationCubit(this.useCase) : super(LocationVacationInitial());

  Future sendVacation({
    required String moderEmpId,
    required String empPhoneNum,
    required String empName,
    required String no3AgazaId,
    required String fromDate,
    required String toDate,
    required String reason,
  }) async {
    emit(LocationVacationLoading());
    try {
      final message = await useCase.sendVacation(
        moderEmpId: moderEmpId,
        empPhoneNum: empPhoneNum,
        empName: empName,
        no3AgazaId: no3AgazaId,
        fromDate: fromDate,
        toDate: toDate,
        reason: reason,
      );
      if (!isClosed) emit(LocationVacationSuccess(message));
    } catch (e) {
      if (!isClosed) emit(LocationVacationError(e.toString()));
    }
  }

Future fetchVacationTypes() async {
  print("📢 تم استدعاء fetchVacationTypes");
  emit(LocationVacationLoading());
  try {
    final typesList = await useCase.getVacationTypes();
    print("📦 تم استرجاع البيانات من useCase: $typesList");
    final list = typesList
        .map((e) => Map<String, dynamic>.from(e))
        .where((element) => element['vacation_id'] != null)
        .toList();
    if (list.isEmpty) {
      emit(LocationVacationError("لم يتم العثور على أنواع إجازة."));
    } else {
      emit(LocationVacationTypesLoaded(list));
    }
  } catch (e) {
    print("❌ حدث خطأ: $e");
    if (!isClosed) emit(LocationVacationError("خطأ في جلب أنواع الإجازات: $e"));
  }
}


}
