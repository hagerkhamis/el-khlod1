import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hive/hive.dart';
import 'package:elkhlod/Features/rates/presentation/cubit/all_emp_taqeem_cubit/all_emp_taqeem_cubit.dart';
import 'package:elkhlod/Features/rates/presentation/widgets/all_emp_taqeem_list_item.dart';
import 'package:elkhlod/core/utils/gaps.dart';
import 'package:elkhlod/core/utils/hex_color.dart';
import 'package:elkhlod/core/widgets/custom_login_text_field.dart';

import '../../../../../../core/locale/app_localizations.dart';
import '../../../../../../core/utils/constants.dart';
import '../../../../../../core/widgets/custom_loading_widget.dart';
import '../../../../../../core/widgets/error_text.dart';
import '../../../auth/login/domain/entities/employee_entity.dart';

// ignore: must_be_immutable
class AllEmpTaqeemViewBody extends StatefulWidget {
  final String idType;
  const AllEmpTaqeemViewBody({super.key, required this.idType});

  @override
  State<AllEmpTaqeemViewBody> createState() => _AllEmpTaqeemViewBodyState();
}

class _AllEmpTaqeemViewBodyState extends State<AllEmpTaqeemViewBody> {
  var box = Hive.box<EmployeeEntity>(kEmployeeDataBox);

  @override
  void initState() {
    _onInit();
    super.initState();
  }

  void _onInit() async {
    if (box.get(kEmployeeDataBox) != null) {
      await BlocProvider.of<AllEmpTaqeemCubit>(context).getAllEmployeesList(
          box.get(kEmployeeDataBox)!.employeeId!, "", widget.idType);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 10, right: 10),
      child: BlocBuilder<AllEmpTaqeemCubit, AllEmpTaqeemState>(
        builder: (context, state) {
          if (state is FetchSuccessful) {
            EmployeesList list = state.data!;

            return Column(
              children: [
                CustomLoginTextField(
                    isSuffix: true,
                    imagePath: "assets/icons/search.png",
                    controller: TextEditingController(),
                    textInputType: TextInputType.text,
                    obscureText: false,
                    fillColor: HexColor("F6F6F6"),
                    onChanged: (value) {
                      getAllMessages(context, value, widget.idType);
                    },
                    stringInTextField: "بحث بالأسم  ... "),
                Gaps.vGap20,
                Expanded(
                  child: ListView.builder(
                    physics: const BouncingScrollPhysics(),
                    itemCount: state.data!.length,
                    itemBuilder: (context, index) {
                      return AllEmpTaqeemItem(
                          employee: list[index],
                          itemIndex: index,
                          typeId: widget.idType);
                    },
                  ),
                ),
              ],
            );
          } else if (state is FetchLoading) {
            return const Center(
              child: CustomLoadingWidget(
                loadingText: "جاري تحميل  ",
              ),
            );
          } else if (state is FetchFailed) {
            return const ErrorText(
                image: "assets/images/should_login.png",
                text: "ليس لديك صلاحية للأمر");
          } else if (box.get(kEmployeeDataBox) == null) {
            return ErrorText(
                image: "assets/images/should_login.png",
                text: AppLocalizations.of(context)!
                    .translate('you_should_login_first')!);
          } else {
            return const ErrorText(text: "حدث خطأ ما");
          }
        },
      ),
    );
  }

  Future<void> getAllMessages(context, search, idType) async {
    if (box.get(kEmployeeDataBox) != null) {
      await BlocProvider.of<AllEmpTaqeemCubit>(context).getAllEmployeesList(
          box.get(kEmployeeDataBox)!.employeeId!, search, idType);
    }
  }
}
