import 'package:flutter/material.dart';
import 'package:flutter_4/models/game.dart';
import 'package:flutter_4/pages/game_page.dart';

class GameItem extends StatelessWidget {
  final bool liked;
  final Function() onFavoriteToggle;
  const GameItem(
      {super.key,
      required this.game,
      required this.liked,
      required this.onFavoriteToggle});
  final Game game;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => Navigator.push(
          context,
          MaterialPageRoute(
              builder: (ctx) => GamePage(
                    game: game,
                    liked: liked,
                    onFavoriteToggle: onFavoriteToggle,
                  ))),
      child: Column(
        children: [
          Stack(
            children: [
              AspectRatio(
                  aspectRatio: 6 / 8,
                  child: Container(
                    decoration: BoxDecoration(
                        image: DecorationImage(
                            image: NetworkImage(game.imageUrl),
                            fit: BoxFit.cover),
                        borderRadius: BorderRadius.circular(15)),
                  )),
              Positioned(
                  top: 3,
                  right: 3,
                  child: IconButton(
                    onPressed: () => onFavoriteToggle(),
                    icon: liked
                        ? const Icon(Icons.favorite, color: Colors.red)
                        : const Icon(Icons.favorite_border,
                            color: Colors.white),
                  ))
            ],
          ),
          Container(
              alignment: Alignment.centerLeft,
              padding: const EdgeInsets.fromLTRB(8, 5, 8, 0),
              child: FittedBox(
                fit: BoxFit.fitWidth,
                child: Text(
                  game.name,
                  style: const TextStyle(
                      color: Colors.black87,
                      fontWeight: FontWeight.w900,
                      fontSize: 20),
                  textAlign: TextAlign.left,
                  softWrap: false,
                ),
              )),
          Container(
            alignment: Alignment.centerLeft,
            padding: const EdgeInsets.fromLTRB(8, 1, 8, 5),
            child: Text(game.price,
                style: const TextStyle(
                    color: Colors.black54,
                    fontWeight: FontWeight.w900,
                    fontSize: 18),
                textAlign: TextAlign.left),
          ),
          ElevatedButton(
              onPressed: () => {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (ctx) => GamePage(
                                  onFavoriteToggle: onFavoriteToggle,
                                  liked: liked,
                                  game: game,
                                )))
                  },
              style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.blueGrey,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(15))),
              child: const Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(
                    Icons.shopping_cart,
                    size: 24,
                    color: Colors.white,
                  ),
                  SizedBox(width: 10),
                  Text(
                    "В корзину",
                    style: TextStyle(color: Colors.white),
                  )
                ],
              ))
        ],
      ),
    );
  }
}
