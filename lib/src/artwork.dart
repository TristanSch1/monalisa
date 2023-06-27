import 'package:flutter/material.dart';

class Artwork extends StatefulWidget {
  const Artwork({super.key});

  @override
  State<Artwork> createState() => _Artwork();
}

class _Artwork extends State<Artwork> {
  bool _isFavorite = false;
  bool _showDescription = false;

  void toggleFavorite() {
    setState(() {
      _isFavorite = !_isFavorite;
    });
  }

  void toggleDescription() {
    setState(() {
      _showDescription = !_showDescription;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: const Text('Museum'),
      ),
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Stack(
              alignment: Alignment.center,
              children: <Widget>[
                Image.asset("images/mona_lisa.png"),
                Align(
                  alignment: Alignment.center,
                  child: Opacity(
                    opacity: _isFavorite ? 1.0 : 0.75,
                    child: Icon(Icons.favorite, size: 100, color: _isFavorite ? Colors.red : Colors.white),
                  ),
                ),
                Align(
                  alignment: Alignment.bottomCenter,
                  child: AnimatedOpacity(
                    opacity: _showDescription ? 1.0 : 0.0,
                    duration: const Duration(milliseconds: 500),
                    child: Container(
                        width: 300,
                        height: 500,
                        color: Colors.black.withOpacity(0.5),
                        child: const SingleChildScrollView(
                          padding: EdgeInsets.all(10),
                          child: Text('La Joconde, ou Portrait de Mona Lisa, est un tableau de l\'artiste Léonard de Vinci, réalisé entre 1503 et 1506 ou entre 1513 et 15161,2, et peut-être jusqu\'à 1517 (l\'artiste étant mort le 2 mai 1519), qui représente un portrait mi-corps, probablement celui de la Florentine Lisa Gherardini, épouse de Francesco del Giocondo. Acquise par François Ier, cette peinture à l\'huile sur panneau de bois de peuplier de 77 × 53 cm est exposée au musée du Louvre à Paris. La Joconde est l\'un des rares tableaux attribués de façon certaine à Léonard de Vinci. La Joconde est devenue un tableau éminemment célèbre car, depuis sa réalisation, nombre d\'artistes l\'ont pris comme référence. À l\'époque romantique, les artistes ont été fascinés par ce tableau et ont contribué à développer le mythe qui l\'entoure, en faisant de ce tableau l\'une des œuvres d\'art les plus célèbres du monde, si ce n\'est la plus célèbre : elle est en tout cas considérée comme l\'une des représentations d\'un visage féminin les plus célèbres au monde. Au xxie siècle, elle est devenue l\'objet d\'art le plus visité au monde, devant le diamant Hope, avec 20 000 visiteurs qui viennent l\'admirer et la photographier quotidiennement.',
                              style: TextStyle(fontFamily: "merriweather", fontSize: 15, color: Colors.white)),
                        )
                    ),
                  ),
                ),
              ],
            ),
            const Text('Mona Lisa', style: TextStyle(fontFamily: "merriweather", fontSize: 30, color: Colors.brown)),
            const Text('Léonard De Vinci', style: TextStyle(fontFamily: "merriweather", fontSize: 15, fontWeight: FontWeight.bold, color: Colors.brown)),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                IconButton(icon: const Icon(Icons.article), color: Colors.brown, onPressed: toggleDescription),
                IconButton(
                  icon: Icon(_isFavorite ? Icons.favorite : Icons.favorite_border, color: _isFavorite ? Colors.red : Colors.brown,),
                  onPressed: () {
                    toggleFavorite();
                    ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(_isFavorite ? 'Oeuvre ajoutée à vos favoris !' : 'Oeuvre supprimée des favoris'), backgroundColor: Colors.teal));
                  },
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
