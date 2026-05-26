import 'package:flutter/material.dart';
import 'game_data.dart';
import 'card_widget.dart';

class GameScreen extends StatefulWidget {
  const GameScreen({super.key});

  @override
  State<GameScreen> createState() => _GameScreenState();
}

class _GameScreenState extends State<GameScreen> {
  GameCard? _currentCard;
  bool _isFlipping = false;
  double _cardOpacity = 1.0;

  List<Color> _getBackgroundColors() {
    if (_currentCard == null) {
      return [
        const Color(0xFF4A148C),
        const Color(0xFF7B1FA2),
        const Color(0xFFCE93D8),
      ];
    }

    switch (_currentCard!.type) {
      case CardType.truth:
        return [
          const Color(0xFF0D47A1),
          const Color(0xFF1976D2),
          const Color(0xFF90CAF9),
        ];
      case CardType.dare:
        return [
          const Color(0xFFB71C1C),
          const Color(0xFFE53935),
          const Color(0xFFFFCC02),
        ];
      case CardType.neutral:
        return [
          const Color(0xFF263238),
          const Color(0xFF546E7A),
          const Color(0xFFB0BEC5),
        ];
    }
  }

  Future<void> _nextCard() async {
    if (_isFlipping) return;

    setState(() {
      _isFlipping = true;
      _cardOpacity = 0.0;
    });

    await Future.delayed(const Duration(milliseconds: 350));

    final newCard = getRandomCard();

    setState(() {
      _currentCard = newCard;
      _cardOpacity = 1.0;
    });

    await Future.delayed(const Duration(milliseconds: 350));

    setState(() {
      _isFlipping = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedContainer(
      width: double.infinity,
      height: double.infinity,
      duration: const Duration(milliseconds: 600),
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: _getBackgroundColors(),
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
        ),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Text(
            '🎲 Правда или Действие',
            style: TextStyle(
              color: Colors.white,
              fontSize: 24,
              fontWeight: FontWeight.bold,
            ),
          ),

          const SizedBox(height: 12),
          const Text(
            'Нажми кнопку и узнай своё задание',
            style: TextStyle(
              color: Colors.white70,
              fontSize: 14,
            ),
          ),

          const SizedBox(height: 48),
          AnimatedOpacity(
            opacity: _cardOpacity,
            duration: const Duration(milliseconds: 350),
            child: AnimatedSwitcher(
              duration: const Duration(milliseconds: 300),
              child: CardWidget(
                key: ValueKey(_currentCard?.text ?? 'empty'),
                card: _currentCard,
              ),
            ),
          ),

          const SizedBox(height: 48),
          ElevatedButton(
            onPressed: _isFlipping ? null : _nextCard,
            style: ElevatedButton.styleFrom(
              backgroundColor: Colors.white,
              foregroundColor: Colors.deepPurple,
              disabledBackgroundColor: Colors.white38,
              padding: const EdgeInsets.symmetric(
                horizontal: 52,
                vertical: 18,
              ),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(32),
              ),
              elevation: 6,
            ),
            child: Text(
              _isFlipping ? '⏳ Загружаем...' : 'Следующий ➡',
              style: const TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),

          const SizedBox(height: 16),
          TextButton(
            onPressed: _isFlipping
                ? null
                : () {
                    setState(() {
                      _currentCard = null;
                    });
                  },
            child: const Text(
              'Начать заново',
              style: TextStyle(
                color: Colors.white70,
                fontSize: 15,
              ),
            ),
          ),

        ],
      ),
    );
  }
}