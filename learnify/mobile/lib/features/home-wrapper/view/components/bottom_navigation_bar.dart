part of '../home_wrapper_screen.dart';

class _BottomNavigationBar extends StatelessWidget {
  const _BottomNavigationBar({this.initialIndex, Key? key}) : super(key: key);
  final int? initialIndex;

  @override
  Widget build(BuildContext context) {
    final HomeWrapperViewModel homeModel = context.read<HomeWrapperViewModel>();
    if (initialIndex != null) {
      homeModel.setBottomNavIndex(initialIndex!, notify: false);
    }
    final int index = SelectorHelper<int, HomeWrapperViewModel>().listenValue(
        (HomeWrapperViewModel model) => model.bottomNavBarIndex, context);
    return CurvedNavigationBar(
      key: homeModel.bottomNavigationKey,
      items: List<Widget>.generate(
        HomeScreenConstants.bottomNavBarTexts.length,
        (int i) => _BottomNavItem(index: i, selectedIndex: index),
      ),
      onTap: homeModel.setBottomNavIndex,
      buttonBackgroundColor: context.primary,
      backgroundColor: context.primary,
      color: context.lightActiveColor,
      height: min(context.responsiveSize * 18, 75),
    );
  }
}

class _BottomNavItem extends StatefulWidget {
  const _BottomNavItem(
      {required this.index, required this.selectedIndex, Key? key})
      : super(key: key);
  final int index;
  final int selectedIndex;

  @override
  State<_BottomNavItem> createState() => _BottomNavItemState();
}

class _BottomNavItemState extends State<_BottomNavItem> {
  late Color? _localColor;
  late Color? _activeColor;
  late Color? _inactiveColor;
  late final ThemeData _themeData;

  @override
  void initState() {
    super.initState();
    _themeData =
        Provider.of<ThemeProvider>(context, listen: false).currentTheme;
    _localColor =
        _isSelected ? LightAppTheme.lightActiveColor : _themeData.primaryColor;
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    _activeColor = context.lightActiveColor;
    _inactiveColor = context.primary;
  }

  @override
  void didUpdateWidget(covariant _BottomNavItem oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (widget.selectedIndex != oldWidget.selectedIndex) {
      if (_isSelected) {
        _localColor = _activeColor;
      } else if (oldWidget.selectedIndex == widget.index && mounted) {
        _localColor = _inactiveColor;
      } else {
        return;
      }
      if (mounted) setState(() {});
    }
  }

  @override
  Widget build(BuildContext context) => Column(
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          BaseIcon(context, HomeScreenConstants.icons[widget.index],
              color: _localColor),
          context.sizedH(.25),
          BaseText(HomeScreenConstants.bottomNavBarTexts[widget.index],
              style: context.labelSmall, color: _localColor),
        ],
      );

  bool get _isSelected => widget.selectedIndex == widget.index;
}
