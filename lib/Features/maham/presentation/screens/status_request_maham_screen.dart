import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hive/hive.dart';
import 'package:elkhlod/Features/auth/login/domain/entities/employee_entity.dart';
import 'package:elkhlod/Features/bottom_nav/presentation/manger/cubit/bottom_nav_cubit.dart';
import 'package:elkhlod/Features/maham/presentation/widgets/tap_bar_view_body.dart';
import 'package:elkhlod/Features/personal_account/presentation/manager/cubit/get_profile_cubit.dart';

import '../../../../core/utils/constants.dart';
import '../../../../core/utils/media_query_sizes.dart';
import '../../../../core/widgets/custom_app_bar.dart';

class StatusMahamRequest extends StatefulWidget {
  const StatusMahamRequest({super.key});

  @override
  State<StatusMahamRequest> createState() => _StatusMahamRequestState();
}

class _StatusMahamRequestState extends State<StatusMahamRequest> {
  var box = Hive.box<EmployeeEntity>(kEmployeeDataBox);

  @override
  void initState() {
    _onInit();
    super.initState();
  }

  // @override
  // void dispose() {
  //   BlocProvider.of<GetProfileCubit>(context).close();
  //   super.dispose();
  // }

  void _onInit() async {
    await BlocProvider.of<GetProfileCubit>(context)
        .getProfile(box.get(kEmployeeDataBox)!.userId!);
  }

  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.of(context).size;

    SizeConfig().init(context);
    return Scaffold(
      appBar: PreferredSize(
          preferredSize: screenSize * .1, child: const CustomAppBar()),
      backgroundColor: Colors.white,
      body: FadeIn(child: const TapBarViewBody()),
      floatingActionButton: BlocBuilder<GetProfileCubit, GetProfileState>(
        builder: (context, state) {
          if (state is GetProfileSuccessful) {
            return state.data.data.addMobadra == "yes"
                ? MaterialButton(
                    onPressed: () {
                      BlocProvider.of<BottomNavCubit>(context)
                          .updateBottomNavIndex(kStatusMahamRequest);

                      // Commons.showToast(context, message: "dfgdffffff");
                      BlocProvider.of<BottomNavCubit>(context)
                          .navigationQueue
                          .addLast(BlocProvider.of<BottomNavCubit>(context)
                              .bottomNavIndex);
                    },
                    color: kPrimaryColor,
                    shape: const CircleBorder(),
                    padding: const EdgeInsets.all(20),
                    child: const Icon(
                      Icons.add,
                      color: Colors.white,
                      size: 27,
                    ),
                  )
                : const SizedBox();
          }
          return const SizedBox();
        },
      ),
    );
  }
}
