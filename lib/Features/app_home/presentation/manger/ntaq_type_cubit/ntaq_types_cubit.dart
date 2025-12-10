// ignore: depend_on_referenced_packages
import 'package:bloc/bloc.dart';
import 'package:elkhlod/Features/app_home/data/models/ntaq_type_model.dart';
import 'package:elkhlod/Features/app_home/domain/use_cases/finger_print_use_case.dart';

part 'ntaq_type_state.dart';

class NtaqTypesCubit extends Cubit<NtaqTypesState> {
  FingerPrintUseCase servicesUseCase;
  NtaqTypesCubit(this.servicesUseCase) : super(NtaqTypesInitial());

  Future<void> ntaqTypes() async {
    emit(const NtaqTypesLoading());
    final result = await servicesUseCase.fetchNtaqTypes();

    emit(result.fold(FetchNtaqTypesFailed.new, FetchNtaqTypesSuccessful.new));
  }
}
