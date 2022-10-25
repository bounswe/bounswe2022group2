part of '../home_screen.dart';

class _BottomNavigationBar extends StatelessWidget {
  const _BottomNavigationBar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final HomeViewModel homeModel = context.read<HomeViewModel>();
    final int index = SelectorHelper<int, HomeViewModel>()
        .listenValue((HomeViewModel model) => model.bottomNavBarIndex, context);
    return CurvedNavigationBar(
      key: homeModel.bottomNavigationKey,
      items: List<Widget>.generate(
        HomeScreenConstants.bottomNavBarTexts.length,
        (int i) => _BottomNavItem(index: i, selectedIndex: index),
      ),
      onTap: homeModel.setBottomNavIndex,
      buttonBackgroundColor: context.primary,
      backgroundColor: context.primary,
      color: context.textColor,
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
    _localColor = _isSelected
        ? _themeData.textTheme.bodySmall?.color
        : _themeData.primaryColorDark;
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    _activeColor = context.textColor;
    _inactiveColor = context.primaryDark;
  }

  @override
  void didUpdateWidget(covariant _BottomNavItem oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (widget.selectedIndex != oldWidget.selectedIndex) {
      if (_isSelected) {
        Future<void>.delayed(const Duration(milliseconds: 500), () {
          if (!mounted) return;
          setState(() => _localColor = _activeColor);
        });
      } else if (oldWidget.selectedIndex == widget.index && mounted) {
        setState(() => _localColor = _inactiveColor);
      }
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
