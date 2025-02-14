import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import '../widgets/base_screen.dart';

class BureauScreen extends StatefulWidget {
  @override
  _BureauScreenState createState() => _BureauScreenState();
}

class _BureauScreenState extends State<BureauScreen> {
  late Future<List<dynamic>> _productsFuture;
  List<dynamic> _allProducts = [];
  List<dynamic> _filteredProducts = [];
  String _searchQuery = '';

  @override
  void initState() {
    super.initState();
    _loadProducts().then((products) {
      setState(() {
        _allProducts = products;
        _filteredProducts = products;
      });
    });
  }

  Future<List<dynamic>> _loadProducts() async {
    try {
      final String response = await rootBundle.loadString('assets/biens_agricoles.json');
      final List<dynamic> data = json.decode(response) as List<dynamic>;
      return data;
    } catch (e) {
      print('Error loading products: $e');
      return [];
    }
  }

  void _filterProducts(String query) {
    setState(() {
      _searchQuery = query;
      _filteredProducts = _allProducts.where((product) {
        final title = product['title'].toLowerCase();
        final description = product['description'].toLowerCase();
        final searchLower = query.toLowerCase();
        return title.contains(searchLower) || description.contains(searchLower);
      }).toList();
    });
  }

  @override
  Widget build(BuildContext context) {
    return BaseScreen(
      currentIndex: 0,
      showBottomNavBar: true,
      child: Scaffold(
        appBar: AppBar(
          title: Text(
            'BIENS AGRICOLES',
            style: TextStyle(
              color: Color.fromRGBO(76, 175, 80, 1),
              fontWeight: FontWeight.bold,
            ),
          ),
          backgroundColor: Colors.white,
          elevation: 0,
          leading: IconButton(
            icon: Icon(Icons.arrow_back, color: Colors.green),
            onPressed: () {
              Navigator.pop(context);
            },
          ),
        ),
        body: Stack(
          children: [
           
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                children: [
                  _buildSearchBar(),
                  SizedBox(height: 10),
                  _buildFilterBar(),
                  SizedBox(height: 10),
                  Expanded(
                    child: _filteredProducts.isNotEmpty
                        ? ListView.separated(
                            padding: EdgeInsets.only(top: 16.0),
                            itemCount: _filteredProducts.length,
                            separatorBuilder: (context, index) => SizedBox(height: 16),
                            itemBuilder: (context, index) {
                              final product = _filteredProducts[index];
                              return _buildProductCard(product);
                            },
                          )
                        : Center(
                            child: Text('No products found'),
                          ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildSearchBar() {
    return TextField(
      decoration: InputDecoration(
        hintText: 'Search',
        suffixIcon: Icon(Icons.search, color: Colors.green),
        filled: true,
        fillColor: Colors.white,
        contentPadding: EdgeInsets.symmetric(vertical: 10),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8),
          borderSide: BorderSide.none,
        ),
      ),
      onChanged: (query) => _filterProducts(query),
    );
  }

  Widget _buildFilterBar() {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 8, horizontal: 16),
      decoration: BoxDecoration(
        color: Colors.grey.shade200,
        borderRadius: BorderRadius.circular(8),
      ),
      child: Row(
        children: [
          Expanded(child: _buildFilterButton('Region')),
          Container(
            height: 24,
            width: 1,
            color: Colors.grey.shade400,
            margin: EdgeInsets.symmetric(horizontal: 8),
          ),
          Expanded(child: _buildFilterButton('Nature')),
          Container(
            height: 24,
            width: 1,
            color: Colors.grey.shade400,
            margin: EdgeInsets.symmetric(horizontal: 8),
          ),
          Expanded(child: _buildFilterButton('Type')),
        ],
      ),
    );
  }

  Widget _buildFilterButton(String label) {
    return Center(
      child: Text(
        label,
        style: TextStyle(color: Colors.grey.shade600),
      ),
    );
  }

  Widget _buildProductCard(Map<String, dynamic> product) {
    return Container(
      width: 410,
      height: 169,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(8),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.3),
            spreadRadius: 1,
            blurRadius: 5,
            offset: Offset(0, 3),
          ),
        ],
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Expanded(
            flex: 2,
            child: ClipRRect(
              borderRadius: BorderRadius.horizontal(left: Radius.circular(8)),
              child: Image.asset(
                product['imageUrl'],
                fit: BoxFit.cover,
              ),
            ),
          ),
          SizedBox(width: 12),
          Expanded(
            flex: 3,
            child: Padding(
              padding: const EdgeInsets.all(14.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    product['title'],
                    style: TextStyle(
                      fontSize: 17,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(height: 6),
                  Text(
                    product['description'],
                    style: TextStyle(
                      fontSize: 13,
                      color: Colors.grey,
                    ),
                  ),
                  Spacer(),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      _buildActionButton('Message', Icons.message),
                      _buildActionButton('consultation', Icons.favorite),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildActionButton(String label, IconData icon) {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 6, horizontal: 12),
      decoration: BoxDecoration(
        color: label == 'Buy' ? Colors.green : Colors.white,
        borderRadius: BorderRadius.circular(8),
        border: Border.all(color: Colors.grey),
      ),
      child: Row(
        children: [
          Icon(icon, color: label == 'Buy' ? Colors.white : Colors.green, size: 20),
          SizedBox(width: 8),
          Text(
            label,
            style: TextStyle(
              color: label == 'Buy' ? Colors.white : Colors.green,
              fontWeight: FontWeight.bold,
            ),
          ),
        ],
      ),
    );
  }

  
}
