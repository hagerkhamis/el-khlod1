// ignore: depend_on_referenced_packages
import 'package:bloc/bloc.dart';
import 'package:elkhlod/Features/ehsaeyat_table/data/models/table_header_model/ehsaeyat_table.dart';

import '../../../domain/use_case/table_use_case.dart';

part 'ehsaeyat_table_state.dart';

class EhsaeyatTableCubit extends Cubit<EhsaeyatTableState> {
  EhsaeyatTableUseCase tableUseCase;
  EhsaeyatTableCubit(this.tableUseCase) : super(FetchInitial());

  Future<void> getTableData(

  ) async {
    emit(const FetchLoading());
    final result = await tableUseCase.call();

    emit(result.fold(FetchFailed.new, FetchSuccessful.new));
  }
}

// import 'package:bloc/bloc.dart';

// import '../../domain/entities/employee_entity.dart';
// import '../../domain/use_cases/login_use_case.dart';

// part 'login_state.dart';

// class LoginCubit extends Cubit<LoginState> {
//   final LoginUseCase loginRequest;
//   bool isLoading = false;

//   LoginCubit(this.loginRequest) : super(LoginInitial());

//   Future<void> getUserData(String phone) async {
//     emit(const LoginLoading());
//     final result = await loginRequest.call(phone);
//     result.fold((failure) {
//       emit(LoginFailed(failure.message));
//        
//     }, (loginEntity) {
//       emit(LoginSuccessful(loginEntity));
//        
//     });
//   }
// }
