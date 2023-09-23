import 'package:beamer/beamer.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:ser_manos/design_system/atoms/icons/logo.dart';
import 'package:ser_manos/design_system/molecules/StatusBar.dart';
import 'package:ser_manos/design_system/tokens/colours/colours.dart';
import 'package:ser_manos/design_system/tokens/font/font.dart';
import 'package:ser_manos/screens/Home/HomeScreen.dart';
import 'package:ser_manos/screens/MyProfile/ProfileInformationScreen.dart';
import 'package:ser_manos/screens/News/NewsScreen.dart';

class MainScreen extends HookWidget {
  const MainScreen({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    BeamState state = context.currentBeamLocation.state as BeamState;

    final currentIndex = _getCurrentTabIndex(state.uri.pathSegments.first);

    final tabController = useTabController(
      initialLength: 3,
      initialIndex: currentIndex,
    );

    useBeamerTabNavigationListener(tabController, currentIndex);

    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        systemOverlayStyle: const SermanosStatusBar.secondary(),
        backgroundColor: SermanosColors.secondary90,
        title: const Padding(
            padding: EdgeInsets.only(left: 16, top: 8, bottom: 8),
            child: SermanosLogos.rectangular(
                logoUrl: "assets/images/rectangularLogo.png")),
      ),
      body: Column(
        children: [
          Container(
            color: SermanosColors.secondary100,
            child: TabBar(
              onTap: (int idx) =>
                  _onTap(context, currentIndex, tabController.index),
              controller: tabController,
              unselectedLabelColor: SermanosColors.neutral25,
              labelColor: SermanosColors.neutral0,
              labelStyle: const SermanosTypography.button(),
              indicatorSize: TabBarIndicatorSize.tab,
              indicator: const BoxDecoration(
                color: SermanosColors.secondary200,
                border: Border(
                  bottom: BorderSide(color: SermanosColors.neutral0, width: 3),
                ),
              ),
              tabs: const [
                Tab(
                  height: 52,
                  text: "Postularse",
                ),
                Tab(
                  height: 52,
                  text: "Mi perfil",
                ),
                Tab(
                  height: 52,
                  text: "Novedades",
                ),
              ],
            ),
          ),
          Expanded(
            child: TabBarView(
              controller: tabController,
              physics: const NeverScrollableScrollPhysics(),
              children: const <Widget>[
                VolunteeringScreen(),
                ProfileScreen(),
                NewsScreen(),
              ],
            ),
          ),
        ],
      ),
    );
  }

  void _onTap(
    BuildContext context,
    int currentIndex,
    int newIndex,
  ) {
    if (currentIndex != newIndex) {
      Beamer.of(context).update(
        configuration: RouteInformation(
          location: _getCurrentLocationPath(newIndex),
        ),
        rebuild: false,
      );
    }
  }

  String _getCurrentLocationPath(int idx) {
    switch (idx) {
      case 0:
        return "/volunteering";
      case 1:
        return "/profile";
      case 2:
        return "/news";
    }

    return "/volunteering";
  }

  int _getCurrentTabIndex(String? tab) {
    Map<String, int> map = {"volunteering": 0, "profile": 1, "news": 2};
    if (tab == null || !map.containsKey(tab)) return -1;
    return map[tab]!;
  }

  void useBeamerTabNavigationListener(
    TabController tabController,
    int currentIndex,
  ) {
    final context = useContext();
    final beamerDelegate = Beamer.of(context);

    useEffect(() {
      listener() {
        BeamState state = context.currentBeamLocation.state as BeamState;
        final List<String> pathSegmentList = state.uri.pathSegments;
        if (pathSegmentList.length == 1) {
          final newPathIndex = _getCurrentTabIndex(pathSegmentList.first);
          if (newPathIndex != -1 && newPathIndex != currentIndex) {
            tabController.animateTo(newPathIndex);
          }
        }
      }

      beamerDelegate.addListener(listener);
      return () => beamerDelegate.removeListener(listener);
    }, []);
  }
}
