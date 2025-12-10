import 'package:cached_network_image/cached_network_image.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:confetti/confetti.dart';
import 'package:custom_rating_bar/custom_rating_bar.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hive/hive.dart';
import 'package:elkhlod/Features/app_home/presentation/manger/ads_cubit/ads_cubit.dart';
import 'package:elkhlod/Features/app_home/presentation/manger/ntaq_cubit/ntaq_cubit.dart';
import 'package:elkhlod/Features/app_home/presentation/manger/ntaq_type_cubit/ntaq_types_cubit.dart';
import 'package:elkhlod/Features/app_home/presentation/manger/services_cubit/services_cubit.dart';
import 'package:elkhlod/Features/app_home/presentation/views/widgets/list_kadamat.dart';
import 'package:elkhlod/Features/app_home/presentation/views/widgets/round_clipper.dart';
import 'package:elkhlod/Features/app_home/presentation/views/widgets/stack_purple_container.dart';
import 'package:elkhlod/Features/auth/fire_base_token/presentation/manger/token_cubit.dart';
import 'package:elkhlod/Features/auth/login/data/models/login_model/login_model/employee.dart';
import 'package:elkhlod/Features/auth/login/domain/entities/employee_entity.dart';
import 'package:elkhlod/Features/personal_account/presentation/manager/cubit/get_profile_cubit.dart';
import 'package:elkhlod/core/utils/functions/firebase_fcm/fierbase_notification.dart';
import 'package:elkhlod/core/utils/functions/setup_service_locator.dart';
import 'package:elkhlod/core/utils/hex_color.dart';
import 'package:elkhlod/core/widgets/error_text.dart';

import '../../../../../core/locale/app_localizations.dart';
import '../../../../../core/utils/constants.dart';
import '../../../../../core/utils/gaps.dart';
import '../../../../../core/utils/media_query_sizes.dart';
import 'app_home_screen_app_bar.dart';
import 'details_snack_bar.dart';

// ignore: must_be_immutable
class HomeScreenBody extends StatefulWidget {
  const HomeScreenBody({super.key});

  @override
  State<HomeScreenBody> createState() => _HomeScreenBodyState();
}

class _HomeScreenBodyState extends State<HomeScreenBody> {
  late ConfettiController _controllerCenter;

  late AppLocalizations locale;
  var box = Hive.box<EmployeeEntity>(kEmployeeDataBox);

  void updateToken(context) async {
    String? token = await FirebaseMessaging.instance.getToken();

    BlocProvider.of<TokenCubit>(context).getTokenData(token!);
  }

  @override
  void dispose() {
    BlocProvider.of<GetProfileCubit>(context).close();
    _controllerCenter.dispose();

    super.dispose();
  }

  void _onInit() async {
    await BlocProvider.of<GetProfileCubit>(context)
        .getProfile(box.get(kEmployeeDataBox)!.userId!);

    await BlocProvider.of<NtaqCubit>(context)
        .getNtaq(box.get(kEmployeeDataBox)!.employeeId!);
  }

  @override
  void initState() {
    super.initState();
    _onInit();

    updateToken(context);
    FCMSettings fcmSettings = FCMSettings(context: context);
    fcmSettings.registerNotification();
    fcmSettings.initialize();

    _controllerCenter =
        ConfettiController(duration: const Duration(seconds: 10));
    _controllerCenter.play();
  }

  @override
  Widget build(BuildContext context) {
    locale = AppLocalizations.of(context)!;

    SizeConfig().init(context);

    return SingleChildScrollView(
      child: Stack(
        children: [
          ClipPath(
            clipper: RoundedClipperHome(),
            child: Container(
              color: kPrimaryColor,
              height: SizeConfig.screenHeight! * 0.60,
            ),
          ),
          columItem(controllerCenter: _controllerCenter, locale: locale),
        ],
      ),
    );
  }
}

class columItem extends StatelessWidget {
  const columItem({
    super.key,
    required ConfettiController controllerCenter,
    required this.locale,
  }) : _controllerCenter = controllerCenter;

  final ConfettiController _controllerCenter;
  final AppLocalizations locale;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const HomeScreenAppBar(),
        Gaps.vGap10,
        item(controllerCenter: _controllerCenter),
        BlocBuilder<GetProfileCubit, GetProfileState>(
          builder: (context, state) {
            if (state is GetProfileSuccessful) {
              return state.data.data.showNetaq == "yes"
                  ? BlocBuilder<NtaqCubit, NtaqState>(
                      builder: (context, state) {
                        if (state is NtaqLoading) {
                          return const CircularProgressIndicator();
                        } else if (state is FetchNtaqSuccessful) {
                          return Container(
                            padding: EdgeInsets.symmetric(
                                vertical: SizeConfig.screenHeight! * 0.01),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(15),
                              color: HexColor(state.data!.fontColor!),
                            ),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Container(
                                  padding: const EdgeInsets.all(10),
                                  margin: EdgeInsets.symmetric(
                                    horizontal: SizeConfig.screenWidth! * 0.02,
                                  ),
                                  height: 100,
                                  width: SizeConfig.screenWidth!,
                                  alignment: Alignment.topRight,
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(15),
                                      color: HexColor(state.data!.netaqColor!),
                                      gradient: LinearGradient(
                                        colors: [
                                          HexColor(state.data!.netaqColor1!),
                                          HexColor(state.data!.netaqColor2!),
                                          HexColor(state.data!.netaqColor3!),
                                        ],
                                        stops: const [0, 0.4560239911079407, 1],
                                        begin: const Alignment(-0.73, -0.68),
                                        end: const Alignment(0.73, 0.68),
                                      ),
                                      boxShadow: const [
                                        BoxShadow(
                                          color: Color(0x29000000),
                                          offset: Offset(0, 3),
                                        )
                                      ]),
                                  child: Column(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          Text(
                                            state.data!.title!,
                                            textAlign: TextAlign.center,
                                            style: TextStyle(
                                              color: HexColor(
                                                  state.data!.fontColor!),
                                              fontSize: 12.sp,
                                            ),
                                          ),
                                          Text(
                                            " ${state.data!.point}  نقطة ",
                                            textAlign: TextAlign.center,
                                            style: TextStyle(
                                              color: HexColor(
                                                  state.data!.fontColor!),
                                              fontSize: 15.sp,
                                            ),
                                          ),
                                        ],
                                      ),
                                      Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          Text(
                                            state.data!.netaqMsg!,
                                            textAlign: TextAlign.center,
                                            style: TextStyle(
                                                color: Colors.white,
                                                fontSize: 12.sp,
                                                decoration:
                                                    TextDecoration.underline,
                                                decorationColor: HexColor(
                                                    state.data!.fontColor!),
                                                decorationThickness: 2.0),
                                          ),
                                          RatingBar.readOnly(
                                            filledIcon: Icons.star,
                                            emptyIcon: Icons.star_border,
                                            emptyColor:
                                                Colors.black.withOpacity(.2),
                                            size: 25.0,
                                            initialRating: state
                                                .data!.netaqStars!
                                                .toDouble(),
                                            maxRating: 5,
                                          ),
                                          CachedNetworkImage(
                                            errorWidget:
                                                (context, url, error) => Icon(
                                              Icons.person,
                                              color: kPrimaryColor,
                                            ),
                                            progressIndicatorBuilder:
                                                (context, url, progress) =>
                                                    Center(
                                              child: CircularProgressIndicator(
                                                  value: progress.progress,
                                                  color: kPrimaryColor),
                                            ),
                                            imageUrl: state.data!.netaqImg!,
                                            height: 50,
                                            fit: BoxFit.fill,
                                            width: 50,
                                          ),
                                        ],
                                      )
                                    ],
                                  ),
                                ),
                                Gaps.vGap10,
                                BlocProvider(
                                  create: (context) =>
                                      getIt<NtaqTypesCubit>()..ntaqTypes(),
                                  child: BlocBuilder<NtaqTypesCubit,
                                      NtaqTypesState>(
                                    builder: (context, state) {
                                      if (state is NtaqTypesLoading) {
                                        return const CircularProgressIndicator();
                                      } else if (state
                                          is FetchNtaqTypesSuccessful) {
                                        return Padding(
                                          padding: const EdgeInsets.symmetric(
                                              horizontal: 10.0),
                                          child: SizedBox(
                                            width: SizeConfig.screenWidth!,
                                            height: 20,
                                            child: ListView.builder(
                                                scrollDirection:
                                                    Axis.horizontal,
                                                physics:
                                                    const NeverScrollableScrollPhysics(),
                                                shrinkWrap: true,
                                                itemCount: state.data!.length,
                                                itemBuilder: (context, index) {
                                                  return Container(
                                                    height: 20,
                                                    width: SizeConfig
                                                            .screenWidth! /
                                                        5.5,
                                                    alignment: Alignment.center,
                                                    decoration: BoxDecoration(
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(15),
                                                        color: HexColor(state
                                                            .data![index]
                                                            .color!)),
                                                  );
                                                }),
                                          ),
                                        );
                                      } else {
                                        return const SizedBox();
                                      }
                                    },
                                  ),
                                )
                              ],
                            ),
                          );
                        }
                        return const SizedBox();
                      },
                    )
                  : const SizedBox();
            }
            return const SizedBox();
          },
        ),
        Gaps.vGap5,
        BlocProvider(
          create: (context) => getIt<ServicesCubit>()..getAllServicesList(),
          child: ListKhadamt(locale: locale),
        ),
        Gaps.vGap30
      ],
    );
  }
}

class item extends StatelessWidget {
  const item({
    super.key,
    required ConfettiController controllerCenter,
  }) : _controllerCenter = controllerCenter;

  final ConfettiController _controllerCenter;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<GetProfileCubit, GetProfileState>(
      builder: (context, state) {
        if (state is getProfileLoading) {
          return const CircularProgressIndicator();
        } else if (state is GetProfileFailed) {
          return const ErrorText(text: "حدث خطاء ما");
        } else if (state is GetProfileSuccessful) {
          EmployeeEntity employee = state.data.data! as Employee;
          return employee.withAds == "yes"
              ? Column(children: [
                  BlocBuilder<AdsCubit, AdsState>(
                    builder: (context, state) {
                      if (state is FetchAdsLoading) {
                        return const Center(
                          child: CircularProgressIndicator(),
                        );
                      } else if (state is FetchAdsFailed) {
                        return const SizedBox();
                      } else if (state is FetchAdsSuccessful) {
                        List<String> data = [];

                        for (int i = 0; i < state.data!.length; i++) {
                          data.add(state.data![i].imagePath!);
                        }
                        return Column(
                          children: [
                            ConfettiWidget(
                              confettiController: _controllerCenter,
                              blastDirectionality:
                                  BlastDirectionality.explosive,
                              particleDrag: 0.05,
                              emissionFrequency: 0.05,
                              numberOfParticles: 50,
                              gravity: 0.05,
                              //    shouldLoop: true,
                              colors: const [
                                Colors.green,
                                Colors.blue,
                                Colors.pink,
                                Colors.orange,
                                Colors.purple
                              ], // manually specify the colors to be used
                            ),
                            CarouselSlider(
                              items: data.map((offer) {
                                return Builder(
                                  builder: (BuildContext context) {
                                    return Container(
                                      decoration: BoxDecoration(
                                        color: kPrimaryColor,
                                        image: DecorationImage(
                                          image: NetworkImage(offer),
                                          fit: BoxFit.cover,
                                        ),
                                        borderRadius: const BorderRadius.all(
                                            Radius.circular(20)),
                                      ),
                                    );
                                  },
                                );
                              }).toList(),
                              options: CarouselOptions(
                                // Decrease the viewport fraction to show part of the next and previous slides
                                viewportFraction: 0.84,
                                autoPlay: true,
                                height: 130.h,
                                autoPlayInterval: const Duration(seconds: 4),
                                autoPlayAnimationDuration:
                                    const Duration(milliseconds: 800),
                                enlargeCenterPage:
                                    true, // This will enlarge the current slide
                                onPageChanged: (val, _) {
                                  // index = val;
                                },
                              ),
                            ),
                          ],
                        );
                      }
                      return const SizedBox();
                    },
                  ),
                  Gaps.vGap10,
                  const DetailsSnackBar(
                    withAdd: true,
                  ),
                  Gaps.vGap5,
                ])
              : const Column(children: [
                  Column(
                    children: [
                      Stack(
                        alignment: Alignment.topCenter,
                        children: [
                          Padding(
                            padding: EdgeInsets.only(top: 15.0),
                            child: StackPurpleContainer(
                              withAdd: false,
                            ),
                          ),
                        ],
                      ),
                      DetailsSnackBar(
                        withAdd: false,
                      ),
                    ],
                  ),
                  Gaps.vGap5,
                ]);
        }
        return const SizedBox();
      },
    );
  }
}
