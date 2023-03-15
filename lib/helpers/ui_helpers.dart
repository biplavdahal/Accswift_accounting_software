import 'package:flutter/material.dart';
import 'package:ionicons/ionicons.dart';

class UISpace {
  static const spaceVrSm = SizedBox(height: 10);
  static const spaceVrMd = SizedBox(height: 24);
  static const spaceVrLg = SizedBox(height: 32);

  static const spaceHrSm = SizedBox(width: 10);
  static const spaceHrMd = SizedBox(width: 24);
  static const spaceHrLg = SizedBox(width: 30);
}

class UIPadding {
  static const small = EdgeInsets.all(8);
  static const medium = EdgeInsets.all(16);
  static const large = EdgeInsets.all(24);
}

class BNVItemData {
  final String title;
  final IconData icon;
  final IconData? activeIcon;

  BNVItemData({required this.title, required this.icon, this.activeIcon});
}

List<BNVItemData> bnvItems = [
  BNVItemData(
    title: 'Stats',
    icon: Ionicons.stats_chart_outline,
    activeIcon: Ionicons.stats_chart,
  ),
  BNVItemData(
    title: 'Invoices',
    icon: Ionicons.document_outline,
    activeIcon: Ionicons.document,
  ),
  BNVItemData(
    title: 'Reports',
    icon: Ionicons.wallet_outline,
    activeIcon: Ionicons.wallet,
  ),
  BNVItemData(
    title: 'More',
    icon: Ionicons.ellipsis_horizontal_circle_outline,
    activeIcon: Ionicons.ellipsis_horizontal_circle,
  )
];
