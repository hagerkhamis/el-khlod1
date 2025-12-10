// ignore: depend_on_referenced_packages
import 'package:bloc/bloc.dart';
import 'package:elkhlod/Features/maham/data/models/maham_model.dart';
import 'package:elkhlod/Features/maham/domain/use_cases/type_maham_use_case.dart';

part 'all_maham_state.dart';

class AllMahamCubit extends Cubit<AllMahamState> {
  MahamUseCase mahamUseCase;
  AllMahamCubit(this.mahamUseCase) : super(MahamInitial());

  Future<void> getAllMaham(String userId, String status) async {
    emit(const FetchMahamLoading());
    final result = await mahamUseCase.fetchAllMaham(userId, status);

    emit(result.fold(FetchMahamFailed.new, FetchMahamSuccessful.new));
  }
}
