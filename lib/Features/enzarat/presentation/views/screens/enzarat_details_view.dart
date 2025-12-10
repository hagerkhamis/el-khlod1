import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hive/hive.dart';
import 'package:elkhlod/Features/auth/login/domain/entities/employee_entity.dart';
import 'package:elkhlod/Features/bottom_nav/presentation/manger/cubit/bottom_nav_cubit.dart';
import 'package:elkhlod/Features/enzarat/data/models/enzarat_model/enzarat.dart';
import 'package:elkhlod/Features/enzarat/presentation/manager/seen_cubit/seen_enzarat_cubit.dart';

import '../../../../../../core/utils/constants.dart';
import '../../../../../../core/utils/gaps.dart';
import '../../../../../../core/utils/network/api/network_api.dart';
import '../../../../../../core/widgets/custom_cached_network_image.dart';
import '../../../../../../core/widgets/custom_simple_app_bar.dart';

class EnzaratDetailsView extends StatelessWidget {
  const EnzaratDetailsView({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    Enzarat enzarat;

    enzarat = BlocProvider.of<BottomNavCubit>(context).details!;
    var box = Hive.box<EmployeeEntity>(kEmployeeDataBox);

    BlocProvider.of<SeenEnzaratCubit>(context)
        .seenEnzarat(enzarat.id!, box.get(kEmployeeDataBox)!.employeeId!);
    return Scaffold(
        backgroundColor: Colors.white,
        appBar: PreferredSize(
          preferredSize: MediaQuery.of(context).size * .08,
          child: CustomSimpleAppBar(
            appBarTitle: "تفاصيل الإنذار",
          ),
        ),
        body: SingleChildScrollView(
          child:
              Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
            Container(
              alignment: Alignment.bottomCenter,
              child: ListTile(
                leading: CircleAvatar(
                  radius: 20,
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(
                      20,
                    ),
                    child: CustomCashedNetworkImage(
                        imageUrl: NewApi.baseUrl + enzarat.empName!),
                  ),
                ),
                trailing: Text(
                  enzarat.enzarTime!,
                  overflow: TextOverflow.ellipsis,
                ),
                title: Text(
                  style: const TextStyle(
                    fontSize: 14,
                  ),
                  "${enzarat.empName}",
                  overflow: TextOverflow.ellipsis,
                  maxLines: 1,
                ),
              ),
            ),
            Gaps.vGap10,
            Gaps.vGap10,
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      Text(
                        "عنوان الإنذار : ",
                        style: TextStyle(color: kPrimaryColor, fontSize: 12),
                      ),
                      Text(enzarat.enzarType!),
                    ],
                  ),
                  Gaps.vGap20,
                  const Divider(
                    color: Colors.black,
                    endIndent: 1,
                    indent: 2,
                  ),
                  Text(
                    "نص الإنذار :",
                    style: TextStyle(color: kPrimaryColor, fontSize: 12),
                  ),
                  Gaps.vGap20,
                  Text(enzarat.details!,
                      textAlign: TextAlign.justify,
                      style: const TextStyle(
                          fontSize: 14.0,
                          height: 1.5 //You can set your custom height here
                          )),
                ],
              ),
            ),
            Gaps.vGap20,
          ]),
        ));
  }
}
