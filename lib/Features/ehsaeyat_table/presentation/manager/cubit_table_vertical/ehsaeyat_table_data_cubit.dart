// ignore: depend_on_referenced_packages
import 'package:bloc/bloc.dart';

import '../../../data/models/table_data_model/ehsaeyat_table_data.dart';
import '../../../domain/use_case/table_use_case.dart';

part 'ehsaeyat_table_data_state.dart';

class EhsaeyatTableDataCubit extends Cubit<EhsaeyatTableDataState> {
  EhsaeyatTableUseCase tableUseCase;
  EhsaeyatTableDataCubit(this.tableUseCase) : super(FetchDataVerticalInitial());

  Future<void> getTableData() async {
    emit(const FetchDataVerticalLoading());
    final result = await tableUseCase.callData();

    emit(result.fold(
        FetchDataVerticalFailed.new, FetchDataVerticalSuccessful.new));
  }
}
