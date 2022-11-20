// import 'package:badges/badges.dart';
// import 'package:easy_sidemenu/easy_sidemenu.dart';
// import 'package:flutter/material.dart';
// import 'package:easy_sidemenu/src/side_menu_display_mode.dart';
// import 'package:sidp_masters/components/layout_controller.dart';
//
//
// typedef SideMenuItemBuilder = Widget Function(
//     BuildContext context, SideMenuDisplayMode displayMode);
//
// class CustomSideMenuItem extends SideMenuItem {
//   /// #### Side Menu Item
//   ///
//   /// This is a widget as [SideMenu] items with text and icon
//   const CustomSideMenuItem({
//     Key? key,
//     super.onTap,
//     super.title,
//     super.icon,
//     required super.priority,
//     super.badgeContent,
//     super.badgeColor,
//     super.tooltipContent,
//     super.trailing,
//     super.builder,
//     required this.layoutController
//   })  : assert(title != null || icon != null,
//   'Title and icon should not be empty at the same time'),
//         super(key: key);
//
//   final LayoutController layoutController;
//
//   @override
//   _CustomSideMenuItemState createState() => _CustomSideMenuItemState();
// }
//
// class _CustomSideMenuItemState extends State<CustomSideMenuItem> {
//   double currentPage = 0;
//   bool isHovered = false;
//
//   void _handleChange() {
//     setState(() {
//       currentPage = widget.layoutController.getCurrentPage();
//     });
//   }
//
//   @override
//   void initState() {
//     super.initState();
//     _nonNullableWrap(WidgetsBinding.instance)!
//         .addPostFrameCallback((timeStamp) {
//       // set initialPage
//       setState(() {
//         currentPage = widget.layoutController.getInitialPage();
//       });
//       if (mounted) {
//         // set controller SideMenuItem page controller callback
//         Global.controller.addListener(_handleChange);
//       }
//     });
//     Global.itemsUpdate.add(update);
//   }
//
//   void update() {
//     if (mounted) {
//       setState(() {});
//     }
//   }
//
//   @override
//   void dispose() {
//     Global.controller.removeListener(_handleChange);
//     super.dispose();
//   }
//
//   /// This allows a value of type T or T?
//   /// to be treated as a value of type T?.
//   ///
//   /// We use this so that APIs that have become
//   /// non-nullable can still be used with `!` and `?`
//   /// to support older versions of the API as well.
//   /// https://docs.flutter.dev/development/tools/sdk/release-notes/release-notes-3.0.0#your-code
//   T? _nonNullableWrap<T>(T? value) => value;
//
//   /// Set background color of [SideMenuItem]
//   Color _setColor() {
//     if (widget.priority == currentPage) {
//       return Global.style.selectedColor ?? Theme.of(context).highlightColor;
//     } else if (isHovered) {
//       return Global.style.hoverColor ?? Colors.transparent;
//     } else {
//       return Colors.transparent;
//     }
//   }
//
//   /// Set icon for of [SideMenuItem]
//   Widget _generateIcon(Icon? mainIcon) {
//     if (mainIcon == null) return const SizedBox();
//     Icon icon = Icon(
//       mainIcon.icon,
//       color: widget.priority == currentPage.ceil()
//           ? Global.style.selectedIconColor ?? Colors.black
//           : Global.style.unselectedIconColor ?? Colors.black54,
//       size: Global.style.iconSize ?? 24,
//     );
//     if (widget.badgeContent == null) {
//       return icon;
//     } else {
//       return Badge(
//         badgeContent: widget.badgeContent!,
//         badgeColor: widget.badgeColor ?? Colors.red,
//         alignment: Alignment.bottomRight,
//         position: const BadgePosition(top: -13, end: -7),
//         child: icon,
//       );
//     }
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return InkWell(
//       child: Padding(
//         padding: Global.style.itemOuterPadding,
//         child: Container(
//           height: Global.style.itemHeight,
//           width: double.infinity,
//           decoration: BoxDecoration(
//             color: _setColor(),
//             borderRadius: Global.style.itemBorderRadius,
//           ),
//           child: ValueListenableBuilder(
//             valueListenable: Global.displayModeState,
//             builder: (context, value, child) {
//               if (widget.builder == null) {
//                 return Tooltip(
//                   message: (value == SideMenuDisplayMode.compact &&
//                       Global.style.showTooltip)
//                       ? widget.tooltipContent ?? widget.title ?? ""
//                       : "",
//                   child: Padding(
//                     padding: EdgeInsets.symmetric(
//                         vertical: value == SideMenuDisplayMode.compact ? 0 : 8),
//                     child: Row(
//                       crossAxisAlignment: CrossAxisAlignment.center,
//                       children: [
//                         SizedBox(
//                           width: Global.style.itemInnerSpacing,
//                         ),
//                         _generateIcon(widget.icon),
//                         SizedBox(
//                           width: Global.style.itemInnerSpacing,
//                         ),
//                         if (value == SideMenuDisplayMode.open) ...[
//                           Expanded(
//                             child: Text(
//                               widget.title ?? '',
//                               style: widget.priority == currentPage.ceil()
//                                   ? const TextStyle(
//                                   fontSize: 17, color: Colors.black)
//                                   .merge(
//                                   Global.style.selectedTitleTextStyle)
//                                   : const TextStyle(
//                                   fontSize: 17, color: Colors.black54)
//                                   .merge(Global
//                                   .style.unselectedTitleTextStyle),
//                             ),
//                           ),
//                           if (widget.trailing != null &&
//                               Global.showTrailing) ...[
//                             widget.trailing!,
//                             SizedBox(
//                               width: Global.style.itemInnerSpacing,
//                             ),
//                           ],
//                         ],
//                       ],
//                     ),
//                   ),
//                 );
//               } else {
//                 return widget.builder!(context, value as SideMenuDisplayMode);
//               }
//             },
//           ),
//         ),
//       ),
//       onTap: () {
//         if (widget.onTap != null) {
//           widget.onTap!();
//         }
//       },
//       onHover: (value) {
//         setState(() {
//           isHovered = value;
//         });
//       },
//       highlightColor: Colors.transparent,
//       focusColor: Colors.transparent,
//       hoverColor: Colors.transparent,
//       splashColor: Colors.transparent,
//     );
//   }
// }
