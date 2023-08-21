import 'package:flutter/material.dart';


class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        automaticallyImplyLeading: false,
        actions: [
          // Search Bar
          Container(
            width: 200,
            margin: EdgeInsets.only(right: 16),
            child: TextField(
              decoration: InputDecoration(
                hintText: 'Cari...',
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(6),
                ),
                contentPadding: EdgeInsets.symmetric(vertical: 3, horizontal: 8),
                suffixIcon: Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.all(Radius.circular(6)),
                    color: Colors.blue, // Ganti dengan warna yang diinginkan
                  ),
                  height: 24,
                  width: 24,
                  child: Icon(Icons.search, color: Colors.white),
                ),
              ),
              onChanged: (value) {
                // Handle onChanged event here
              },
            ),
          ),
          SizedBox(width: 16),
          // Dropdown Profil
          DropdownButton<String>(
            items: ['Logout']
                .map((String value) => DropdownMenuItem<String>(
                      value: value,
                      child: Text(value),
                    ))
                .toList(),
            onChanged: (String? newValue) {
              // Handle onChanged event here
            },
          ),
          SizedBox(width: 16),
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(height: 26),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                IconTextContainer(
                  iconData: Icons.star,
                  text: 'Favorite',
                ),
                IconTextContainer(
                  iconData: Icons.shopping_cart,
                  text: 'Cart',
                ),
                IconTextContainer(
                  iconData: Icons.settings,
                  text: 'Settings',
                ),
              ],
            ),
            SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Container(
                  width: 699,
                  height: 694,
                  decoration: BoxDecoration(
                    color: Colors.grey, // Ganti dengan warna yang diinginkan
                    borderRadius: BorderRadius.circular(20),
                  ),
                  padding: EdgeInsets.all(20),
                  child: TableSection(),
                ),
                SizedBox(width: 20),
                JastipPopularList(),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

class IconTextContainer extends StatelessWidget {
  final IconData iconData;
  final String text;

  IconTextContainer({required this.iconData, required this.text});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 150,
      width: 270,
      decoration: BoxDecoration(
        color: Colors.blue, // Ganti dengan warna yang diinginkan
        borderRadius: BorderRadius.circular(10),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(
            iconData,
            color: Colors.white,
            size: 48,
          ),
          SizedBox(height: 8),
          Text(
            text,
            style: TextStyle(
              color: Colors.white,
              fontSize: 18,
              fontWeight: FontWeight.bold,
            ),
          ),
        ],
      ),
    );
  }
}

class TableSection extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.grey, // Ganti dengan warna yang diinginkan
      padding: EdgeInsets.all(20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Pesanan Terbaru',
            style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
          ),
          SizedBox(height: 20),
          Expanded( // Gunakan Expanded di sini
            child: DataTable(
              columns: [
                DataColumn(
                  label: Container(
                    margin: EdgeInsets.symmetric(horizontal: 10),
                    alignment: Alignment.centerLeft, // Tambahkan alignment ke kiri
                    child: Text('No'),
                  ),
                ),
                DataColumn(
                  label: Container(
                    margin: EdgeInsets.symmetric(horizontal: 10),
                    alignment: Alignment.centerLeft, // Tambahkan alignment ke kiri
                    child: Text('NAMA BARANG'),
                  ),
                ),
                DataColumn(
                  label: Container(
                    margin: EdgeInsets.symmetric(horizontal: 2),
                    alignment: Alignment.centerLeft, // Tambahkan alignment ke kiri
                    child: Text('Total Pesanan'),
                  ),
                ),
              ],
              rows: List.generate(
                10,
                (index) => DataRow(
                  cells: [
                    DataCell(
                      Container(
                        margin: EdgeInsets.symmetric(horizontal: 10),
                        alignment: Alignment.centerLeft, // Tambahkan alignment ke kiri
                        child: Text((index + 1).toString()),
                      ),
                    ),
                    DataCell(
                      Container(
                        margin: EdgeInsets.symmetric(horizontal: 8), // Tambahkan jarak horizontal di sini
                        alignment: Alignment.centerLeft, // Tambahkan alignment ke kiri
                        child: Text('Barang $index'),
                      ),
                    ),
                    DataCell(
                      Container(
                        margin: EdgeInsets.symmetric(horizontal: 8), // Tambahkan jarak horizontal di sini
                        alignment: Alignment.centerLeft, // Tambahkan alignment ke kiri
                        child: Text((5 + index).toString()),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class JastipPopularList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Jastip Popular List',
            style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
          ),
          // Implement list fetching data from Firebase Cloud Firestore API here
          // For example, use StreamBuilder or FutureBuilder
        ],
      ),
    );
  }
}
