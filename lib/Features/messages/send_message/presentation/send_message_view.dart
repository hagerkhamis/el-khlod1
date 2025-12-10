import 'dart:io';

import 'package:animate_do/animate_do.dart';
import 'package:dropdown_search/dropdown_search.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hive/hive.dart';
import 'package:elkhlod/core/widgets/empty_widget.dart';

import '../../../../core/locale/app_localizations.dart';
import '../../../../core/utils/commons.dart';
import '../../../../core/utils/constants.dart';
import '../../../../core/utils/functions/registration_alert.dart';
import '../../../../core/utils/functions/validation_mixin.dart';
import '../../../../core/utils/gaps.dart';
import '../../../../core/widgets/custom_elevated_container.dart';
import '../../../../core/widgets/custom_login_text_field.dart';
import '../../../../core/widgets/custom_simple_app_bar.dart';
import '../../../auth/login/domain/entities/employee_entity.dart';
import '../../../bottom_nav/presentation/manger/cubit/bottom_nav_cubit.dart';
import '../../../select_file/presentation/cubit/select_file_cubit.dart';
import '../../employees/presentation/manager/cubit/employees_cubit.dart';
import 'check.dart';
import 'manger/send_message_cubit.dart';

class SendMessageView extends StatefulWidget {
  const SendMessageView({super.key});

  @override
  State<SendMessageView> createState() => _SendMessageViewState();
}

class _SendMessageViewState extends State<SendMessageView>
    with ValidationMixin {
  File? selectedFile;
  List<int> selectedEmpId = [];
  final _multiKey = GlobalKey<DropdownSearchState<EmployeeEntity>>();

  late TextEditingController messageTitleController;
  late TextEditingController messageBodyController;

  @override
  void initState() {
    super.initState();
    messageTitleController = TextEditingController();
    messageBodyController = TextEditingController();
  }

  @override
  void dispose() {
    messageTitleController.dispose();
    messageBodyController.dispose();
    super.dispose();
  }


  @override
  Widget build(BuildContext context) {
    var box = Hive.box<EmployeeEntity>(kEmployeeDataBox);
    box.isNotEmpty
        ? BlocProvider.of<EmployeesCubit>(context)
            .getEmployees(box.get(kEmployeeDataBox)!.employeeId!)
        : null;
    // final toEmpIdController = TextEditingController();
    // final messageTitleController = TextEditingController();
    // final messageBodyController = TextEditingController();

    final GlobalKey<FormState> formKey = GlobalKey<FormState>();
    bool? popupBuilderSelection = false;

    // void _handleCheckBoxState({bool updateState = true}) {
    //   var selectedItem = _multiKey.currentState?.popupGetSelectedItems ?? [];
    //   var isAllSelected =
    //       _multiKey.currentState?.popupIsAllItemSelected ?? false;
    //   _popupBuilderSelection =
    //       selectedItem.isEmpty ? false : (isAllSelected ? true : null);

    //   if (updateState) setState(() {});
    // }

    // _handleCheckBoxState(updateState: false);

    late AppLocalizations locale;
    locale = AppLocalizations.of(context)!;
    return FadeInUp(
      child: Scaffold(
        appBar: PreferredSize(
          preferredSize: MediaQuery.of(context).size * .1,
          child: CustomSimpleAppBar(
            appBarTitle: "رسالة جديدة",
            leadingWidget: Builder(builder: (context) {
              return Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  BlocConsumer<SendMessageCubit, SendMessageState>(
                    listener: (context, state) {
                      if (state is SendMessageSuccessful) {
                        Commons.showToast(context,
                            message: state.user.doneMessage);
                        BlocProvider.of<BottomNavCubit>(context)
                            .updateBottomNavIndex(kMessagesView);
                                 BlocProvider.of<BottomNavCubit>(context)
                                .navigationQueue
                                .addLast(
                                    BlocProvider.of<BottomNavCubit>(context)
                                        .bottomNavIndex);
                      } else if (state is SendMessageFailed) {
                        Commons.showToast(context, message: state.message);
                      }
                    },
                    builder: (context, state) {
                      return InkWell(
                        onTap: () {
                          if (box.get(kEmployeeDataBox) != null) {
                            if (formKey.currentState!.validate()) {
                              BlocProvider.of<SendMessageCubit>(context)
                                  .sendData(
                                box.get(kEmployeeDataBox)!.userId!,
                                selectedEmpId,
                                messageTitleController.text,
                                messageBodyController.text,
                                selectedFile,
                              );
                            }
                          } else {
                            AlertDialog alert = alertRegistration(
                                context,
                                AppLocalizations.of(context)!
                                    .translate('you_should_login_first')!, () {
                              Navigator.pushReplacementNamed(
                                  context, kLoginScreenRoute);
                            }, "assets/images/should_login.png");

                            // show the dialog
                            showDialog(
                              context: context,
                              builder: (BuildContext context) {
                                return alert;
                              },
                            );
                          }
                        },
                        child: state is SendMessageLoading
                            ? const SizedBox(
                                height: 15,
                                width: 15,
                                child: CircularProgressIndicator())
                            : Image.asset("assets/icons/send_icon.png",
                                color: kPrimaryColor),
                      );
                    },
                  ),
                  InkWell(
                    onTap: () async {
                      await BlocProvider.of<SelectFileCubit>(context)
                          .pickFileFromDevice();
                    },
                    child: Image.asset(
                      "assets/icons/attachment_icon.png",
                      color: kPrimaryColor,
                    ),
                  ),
                ],
              );
            }),
          ),
        ),
        backgroundColor: Colors.white,
        body: SafeArea(
          child: Padding(
            padding: const EdgeInsets.only(left: 12, right: 12),
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Text(
                  //   locale.translate('to')!,
                  // ),
                  // Gaps.vGap10,
                  // OutPutContainer(
                  //   containerIconPath: "assets/icons/calender_icon.png",
                  //   containerTitle: "",
                  //   containerWidth: double.infinity,
                  //   containerText: "alatheer123@gmail.com",
                  // ),
                  // Gaps.vGap10,
                  Text(
                    locale.translate('to')!,
                  ),
                  Form(
                    key: formKey,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        BlocBuilder<EmployeesCubit, EmployeesState>(
                          builder: (context, state) {
                            if (box.isEmpty) {
                              return Text(
                                locale.translate('you_should_login_first')!,
                              );
                            } else if (state is FetchLoading) {
                              return const Center(
                                  child: CircularProgressIndicator());
                            } else if (state is FetchSuccessful) {
                              EmployeesList employeesList = state.data!;
                              return SizedBox(
                                child: DropdownSearch<
                                    EmployeeEntity>.multiSelection(
                                  dropdownBuilder: (context, selectedItems) {
                                    return ListTile(
                                      contentPadding:
                                          const EdgeInsets.symmetric(
                                              horizontal: 10),
                                      leading: Icon(
                                        selectedItems.isNotEmpty
                                            ? Icons.check_box
                                            : Icons.check_box_outline_blank,
                                        color: kPrimaryColor,
                                      ),
                                      title: Text(
                                        selectedItems.isEmpty
                                            ? "اختار موظف لأرسال رسالتك "
                                            : selectedItems.length ==
                                                    employeesList.length
                                                ? "تم اختيار جميع الموظفين"
                                                : "تم اختيار ${selectedItems.length} موظف",
                                        style: TextStyle(
                                            fontSize: 12, color: kPrimaryColor),
                                      ),
                                    );
                                  },
                                  key: _multiKey,
                                  items: (String? filter, LoadProps? props) async => employeesList,
                                  itemAsString: (EmployeeEntity? item) =>
                                      item!.employeeName!,
                                  //selectedItems: [],
                                  //enabled: false,
                                  popupProps: PopupPropsMultiSelection.menu(
                                      listViewProps: const ListViewProps(
                                          padding: EdgeInsets.symmetric(
                                              horizontal: 20)),
                                      containerBuilder: (ctx, popupWidget) {
                                        return CheckBoxWidget(
                                          isSelected: popupBuilderSelection,
                                          onChanged: (v) {
                                            if (v == true) {
                                              _multiKey.currentState!
                                                  .popupSelectAllItems();
                                            } else if (v == false) {
                                              _multiKey.currentState!
                                                  .popupDeselectAllItems();
                                            }
                                            // _handleCheckBoxState();
                                          },
                                          child: popupWidget,
                                        );
                                      },
                                      //  showSelectedItems: true,
                                      showSearchBox: true,
                                      textDirection: TextDirection.rtl,
                                      constraints: BoxConstraints.tight(
                                          const Size.fromHeight(400)),
                                      searchFieldProps: TextFieldProps(
                                          decoration: InputDecoration(
                                              contentPadding:
                                                  const EdgeInsets.symmetric(
                                                      horizontal: 10),
                                              // alignLabelWithHint: false,
                                              hintText:
                                                  locale.translate('search')!,
                                              suffixIcon: Container(
                                                decoration: BoxDecoration(
                                                    color: kPrimaryColor,
                                                    borderRadius:
                                                        const BorderRadius.only(
                                                            bottomLeft:
                                                                Radius.circular(
                                                                    10),
                                                            topLeft:
                                                                Radius.circular(
                                                                    10))),
                                                child: const Icon(
                                                  Icons.search,
                                                  color: Colors.white,
                                                ),
                                              )))

                                      // disabledItemFn: (String s) => s.startsWith('I'),
                                      ),
                                  validator: (value) {
                                    selectedEmpId.clear();
                                    if (value == null || value.isEmpty) {
                                      return locale
                                          .translate('enter_valid_data')!;
                                    } else {
                                      for (var item in value) {
                                        //     if (selectedEmpId.contains(item)) {}
                                        selectedEmpId
                                            .add(int.parse(item.userId!));
                                      }

                                      return null;
                                    }
                                  },
                                  onChanged: (value) {
                                    if (value.length == employeesList.length) {
                                      popupBuilderSelection = true;
                                    } else {
                                      popupBuilderSelection = false;
                                    }
                                    //
                                  },
                                ),
                              );
                            } else if (state is FetchFailed) {
                              return EmptyWidget(
                                text: state.message,
                              );
                            }
                            return ErrorWidget("Error");
                          },
                        )
                        // CustomLoginTextField(
                        //   validator: validateInputText,
                        //   controller: toEmpIdController,
                        //   stringInTextField: "alatheer123@gmail.com",
                        //   obscureText: false,
                        //   textInputType: TextInputType.text,
                        //   width: double.infinity,
                        // ),
                        ,
                        Gaps.vGap10,
                        Text(
                          locale.translate('title_of_message')!,
                        ),
                        CustomLoginTextField(
                          validator: validateInputText,
                          controller: messageTitleController,
                          stringInTextField:
                              locale.translate('title_of_message')!,
                          obscureText: false,
                          textInputType: TextInputType.text,
                          width: double.infinity,
                        ),
                        Gaps.vGap10,
                        Text(
                          locale.translate('message_text')!,
                        ),
                        CustomLoginTextField(
                          validator: validateInputText,
                          controller: messageBodyController,
                          stringInTextField: locale.translate('message_text')!,
                          textInputType: TextInputType.text,
                          obscureText: false,
                          height: 50,
                          width: double.infinity,
                          multiLine: 10,
                        ),
                      ],
                    ),
                  ),
                  Gaps.vGap30,
                  Text(
                    locale.translate('attachments')!,
                  ),
                  GestureDetector(
                    onTap: () async {
                      await BlocProvider.of<SelectFileCubit>(context)
                          .pickFileFromDevice();
                    },
                    child: CustomElevatedContainer(
                      containerHeight: MediaQuery.of(context).size.height * .12,
                      containerWidth: MediaQuery.of(context).size.width,
                      containerChild:
                          BlocBuilder<SelectFileCubit, SelectFileState>(
                        builder: (context, state) {
                          if (state is PickFileState) {
                            selectedFile = state.filePath;

                            return Center(
                              child: Text(state.fileName),
                            );
                          } else if (state is PickImageState) {
                            selectedFile = state.imagePath;
                            return Image.file(state.imagePath);
                          } else {
                            return Image.asset(
                              "assets/images/upload_cloud.png",
                              alignment: Alignment.center,
                              width: 50,
                              height: 50,
                              //  MediaQuery.of(context).size.width * 1
                            );
                          }
                        },
                      ),
                    ),
                  ),
                  Gaps.vGap30,
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
