import 'package:animate_do/animate_do.dart';
import 'package:flutter/services.dart';
import '../widget/table_view_body.dart';
import '../../../../core/widgets/custom_simple_app_bar.dart';
import 'package:flutter/material.dart';

class EhsaeyatTableView extends StatefulWidget {
  const EhsaeyatTableView({super.key});

  @override
  State<EhsaeyatTableView> createState() => _EhsaeyatTableViewState();
}

class _EhsaeyatTableViewState extends State<EhsaeyatTableView> {
  @override
  void initState() {
    super.initState();
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.landscapeRight,
      DeviceOrientation.landscapeLeft,
    ]);
  }

  @override
  dispose() {
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
      DeviceOrientation.portraitDown,
    ]);
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    // late AppLocalizations locale;
    // locale = AppLocalizations.of(context)!;
    Size screenSize = MediaQuery.of(context).size;
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.white,
        appBar: PreferredSize(
          preferredSize: screenSize * .1,
          child: CustomSimpleAppBar(
            backHandler: () {
              Navigator.of(context).pop();
            },
            appBarTitle: "احصائيات هامة",
            // leadingWidget: const TablePageAppBarActions(),
          ),
        ),
        body: FadeIn(
          child: const Padding(
            padding: EdgeInsets.all(8.0),
            child: TableViewBody(),
          ),
        ),
      ),
    );
  }
}
