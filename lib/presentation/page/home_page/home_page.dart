import 'package:aplikasi_suara_ilahi/core/constant.dart';
import 'package:aplikasi_suara_ilahi/presentation/page/asmaul_husna_page/asmaul_husna_page.dart';
import 'package:aplikasi_suara_ilahi/presentation/page/doa_page/doa_page.dart';
import 'package:aplikasi_suara_ilahi/presentation/page/surat_page/surat_page.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _selectedIndex = 0;

  static const List<Widget> _widgetOptions = <Widget>[
    SuratPage(),
    AsmaulHusnaPage(),
    DoaPage(),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: _widgetOptions.elementAt(_selectedIndex),
      ),
      bottomNavigationBar: BottomNavigationBar(
          items: const <BottomNavigationBarItem>[
            BottomNavigationBarItem(
              icon: SizedBox.shrink(),
              label: 'Al-Quran',
            ),
            BottomNavigationBarItem(
              icon: SizedBox.shrink(),
              label: 'Asmaul Husna',
            ),
            BottomNavigationBarItem(
              icon: SizedBox.shrink(),
              label: 'Kumpulan Doa',
            ),
          ],
          currentIndex: _selectedIndex,
          selectedItemColor: fifthColor,
          onTap: _onItemTapped,
          unselectedItemColor: thirdColor,
          selectedLabelStyle: TextStyle(fontWeight: FontWeight.bold)),
    );
  }
}
