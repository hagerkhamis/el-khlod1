// ignore: depend_on_referenced_packages
import 'package:bloc/bloc.dart';
import 'package:elkhlod/Features/app_home/domain/entities/ntaq_model_entity.dart';
import 'package:elkhlod/Features/app_home/domain/use_cases/finger_print_use_case.dart';

part 'ntaq_state.dart';

class NtaqCubit extends Cubit<NtaqState> {
  FingerPrintUseCase servicesUseCase;
  NtaqCubit(this.servicesUseCase) : super(NtaqInitial());

  Future<void> getNtaq(String empId) async {
    emit(const NtaqLoading());
    final result = await servicesUseCase.fetchNtaq(empId);

    emit(result.fold(FetchNtaqFailed.new, FetchNtaqSuccessful.new));
  }
}
