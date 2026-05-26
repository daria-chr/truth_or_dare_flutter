import 'dart:math';

enum CardType { truth, dare, neutral }

class GameCard {
  final String text;
  final CardType type;

  const GameCard({required this.text, required this.type});
}

final List<GameCard> allCards = [

  //Вопросы для правды
  GameCard(
    text: 'Какой твой самый большой страх?',
    type: CardType.truth,
  ),
  GameCard(
    text: 'Нравился ли тебе кто-то из присутстыующих?',
    type: CardType.truth,
  ),
  GameCard(
    text: 'Что ты скрываешь от родителей?',
    type: CardType.truth,
  ),
  GameCard(
    text: 'Какую ложь ты рассказывал чаще всего?',
    type: CardType.truth,
  ),
  GameCard(
    text: 'О чём ты больше всего сожалеешь?',
    type: CardType.truth,
  ),
  GameCard(
    text: 'Какой твой самый неловкий момент в жизни?',
    type: CardType.truth,
  ),
  GameCard(
    text: 'Кто из присутствующих нравится тебе больше всего?',
    type: CardType.truth,
  ),
  GameCard(
    text: 'Что самое странное ты когда-либо делал?',
    type: CardType.truth,
  ),
  GameCard(
    text: 'Есть ли у тебя секрет, который ты никому не рассказывал?',
    type: CardType.truth,
  ),
  GameCard(
    text: 'Если бы ты мог поменяться жизнью с кем-то из присутствующих? с кем?',
    type: CardType.truth,
  ),

  //Действия
  GameCard(
    text: 'Сделай 20 приседаний прямо сейчас!',
    type: CardType.dare,
  ),
  GameCard(
    text: 'Позвони кому-нибудь из контактов и спой 30 секунд песни.',
    type: CardType.dare,
  ),
  GameCard(
    text: 'Говори с иностранным акцентом следующие 3 минуты.',
    type: CardType.dare,
  ),
  GameCard(
    text: 'Изобрази любое животное-остальные должны угадать.',
    type: CardType.dare,
  ),
  GameCard(
    text: 'Сделай стойку у стены на 10 секунд.',
    type: CardType.dare,
  ),
  GameCard(
    text: 'Напиши что-нибудь смешное на бумаге и покажи всем.',
    type: CardType.dare,
  ),
  GameCard(
    text: 'Продекламируй стихотворение с максимальным пафосом!',
    type: CardType.dare,
  ),
  GameCard(
    text: 'Сделай комплимент каждому игроку за 30 секунд.',
    type: CardType.dare,
  ),
  GameCard(
    text: 'Станцуй 1 минуту без музыки.',
    type: CardType.dare,
  ),
  GameCard(
    text: 'Съешь что-нибудь необычное, что найдёшь на кухне.',
    type: CardType.dare,
  ),

  //Нейтральное
  GameCard(
    text: '⏭ Пропуск хода. Повезёт в следующий раз!',
    type: CardType.neutral,
  ),
  GameCard(
    text: '🎲 Придумай задание сам для любого игрока.',
    type: CardType.neutral,
  ),
  GameCard(
    text: '🔄 Поменяйся местами с любым игроком.',
    type: CardType.neutral,
  ),
  GameCard(
    text: '✨ Свободный ход-делай что хочешь!',
    type: CardType.neutral,
  ),
  GameCard(
    text: '🎁 Сам выбирай: правда или действие?',
    type: CardType.neutral,
  ),
  GameCard(
    text: '👑 Ты король/королева! Один раунд все делают то, что ты скажешь.',
    type: CardType.neutral,
  ),
];

final _random = Random();

GameCard getRandomCard() {
  return allCards[_random.nextInt(allCards.length)];
}