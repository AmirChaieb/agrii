import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../config.dart';
import '../providers/post_provider.dart';
import '../models/pagination.dart';
import '../models/post.dart';
import '../widgets/base_screen.dart';

class BiensAgricolesScreen extends ConsumerWidget {
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final postsAsyncValue = ref.watch(postsProvider(PaginationModel(Category : 'biens',page: 1, pageSize: 10)));

    return BaseScreen(
      currentIndex: 0,
      showBottomNavBar: true,
      child: Scaffold(
        appBar: AppBar(
          title: Text(
            'BIENS AGRICOLE',
            style: TextStyle(
              color: Color.fromRGBO(76, 175, 80, 1),
              fontWeight: FontWeight.bold,
            ),
          ),
          backgroundColor: Colors.white,
          elevation: 0,
          leading: IconButton(
            icon: Icon(Icons.arrow_back, color: Colors.green),
            onPressed: () => Navigator.pop(context),
          ),
        ),
        body: Stack(
          children: [
            // Arrière-plan
            _buildBackgroundImage(112.04, 96.6, -120, 'assets/images/background.png', 101.87, 100.08),
            _buildBackgroundImage(158.36, 383.1, 118.65, 'assets/images/background.png', 144.13, 141.59),
            _buildBackgroundImage(461.47, 315.62, 58.41, 'assets/images/background.png', 144.13, 141.59),
            _buildBackgroundImage(803.8, 363.16, 70.53, 'assets/images/background.png', 82.88, 81.42),

            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                children: [
                  // Recherche
                  _buildSearchBar(),
                  SizedBox(height: 10),
                  // Filtre
                  _buildFilterBar(),
                  SizedBox(height: 10),
                  // Liste des posts
                  Expanded(
                    child: postsAsyncValue.when(
                      data: (posts) {
                        if (posts == null || posts.isEmpty) {
                          return Center(child: Text('Aucun post trouvé'));
                        }
                        return ListView.builder(
                          padding: EdgeInsets.all(6),
                          itemCount: posts.length,
                          itemBuilder: (context, index) {
                            return _buildPostCard(posts[index]);
                          },
                        );
                      },
                      loading: () => Center(child: CircularProgressIndicator()),
                      error: (err, stack) => Center(child: Text('Erreur : $err')),
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

  // Barre de recherche
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
      onChanged: (query) {
        // Logique de filtrage ici (si nécessaire)
      },
    );
  }

  // Barre de filtres
  Widget _buildFilterBar() {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 10, horizontal: 20),
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

  // Bouton de filtre
  Widget _buildFilterButton(String label) {
    return Center(
      child: Text(
        label,
        style: TextStyle(color: Colors.grey.shade600),
      ),
    );
  }

  // Carte pour afficher chaque post
  Widget _buildPostCard(Post post) {
    return Container(
      width: double.infinity, // Augmentation de la largeur pour éviter l'overflow
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
              child: Image.network(
                Config.imageURL + post.PostImage,
                fit: BoxFit.cover,
                errorBuilder: (context, error, stackTrace) => Icon(Icons.broken_image, size: 150),
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
                    post.postId,
                    style: TextStyle(
                      fontSize: 17,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(height: 6),
                  Text(
                    post.PostDescription,
                    style: TextStyle(
                      fontSize: 13,
                      color: Colors.grey,
                    ),
                    maxLines: 2, // Limite le texte à 2 lignes
                    overflow: TextOverflow.ellipsis, // Affiche "..." si le texte dépasse
                  ),
                  Spacer(),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      _buildActionButton('Buy', Icons.shopping_cart),
                      _buildActionButton('Favorite', Icons.favorite),
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

  // Bouton d'action
  Widget _buildActionButton(String label, IconData icon) {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 6, horizontal: 6),
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

  // Méthode pour afficher l'image d'arrière-plan
  Widget _buildBackgroundImage(double top, double left, double angle, String assetPath, double width, double height) {
    return Positioned(
      top: top,
      left: left,
      child: Transform.rotate(
        angle: angle * 3.141592653589793 / 180,
        child: Opacity(
          opacity: 0.1,
          child: Image.asset(
            assetPath,
            width: width,
            height: height,
          ),
        ),
      ),
    );
  }
}
