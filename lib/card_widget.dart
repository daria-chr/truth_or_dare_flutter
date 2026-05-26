import 'package:flutter/material.dart';
import 'game_data.dart';

class CardWidget extends StatelessWidget {
  final GameCard? card;

  const CardWidget({super.key, required this.card});

  String _getLabel(CardType type) {
    switch (type) {
      case CardType.truth:
        return '🔵  П Р А В Д А';
      case CardType.dare:
        return '🔴  Д Е Й С Т В И Е';
      case CardType.neutral:
        return '⚪  Н Е Й Т Р А Л Ь Н О Е';
    }
  }

  Color _getLabelColor(CardType type) {
    switch (type) {
      case CardType.truth:
        return Colors.blue.shade700;
      case CardType.dare:
        return Colors.red.shade700;
      case CardType.neutral:
        return Colors.blueGrey.shade700;
    }
  }

 @override
  Widget build(BuildContext context) {
    return Container(
      width: 300,
      height: 220,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(24),
        boxShadow: const [
          BoxShadow(
            color: Colors.black26,
            blurRadius: 20,
            spreadRadius: 2,
            offset: Offset(0, 6),
          ),
        ],
      ),
      child: Padding(
        padding: const EdgeInsets.all(24),
        child: card == null
            ? const Center(
                child: Text(
                  'Нажми «Следующий»\nчтобы начать игру! 🎮',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 18,
                    color: Colors.grey,
                    height: 1.5,
                  ),
                ),
              )
            : Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    _getLabel(card!.type),
                    style: TextStyle(
                      fontSize: 13,
                      fontWeight: FontWeight.bold,
                      color: _getLabelColor(card!.type),
                      letterSpacing: 1,
                    ),
                  ),
                  const SizedBox(height: 16),
                  Text(
                    card!.text,
                    textAlign: TextAlign.center,
                    style: const TextStyle(
                      fontSize: 17,
                      color: Colors.black87,
                      fontWeight: FontWeight.w500,
                      height: 1.4,
                    ),
                  ),
                ],
              ),
      ),
    );
  }
}