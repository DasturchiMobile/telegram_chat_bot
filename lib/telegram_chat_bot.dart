import 'package:teledart/model.dart';
import 'package:teledart/teledart.dart';
import 'package:teledart/telegram.dart';

class TelegramBot {
  Future<void> init()async{
    var botToken = '7186454811:AAGm60ozxCmE8M5ZJhbo1azOARhxupLRohM';
    final username = (await Telegram(botToken).getMe()).username;
    var teledart = TeleDart(botToken, Event(username!));
    teledart.start();

    teledart.onCommand("start").listen((message) {
      message.reply("""
      Assalomu alaykum, 
      xurmatli ${message.from?.username}
      Bizning botga xush kelibsiz!
      Sizning telegram id: ${message.from?.id}
      Siz telegram premiumga ${(message.from?.isPremium ?? false) ? "egasiz" : "ega emassiz"}
      """);
    });
    teledart.onCommand("lang").listen((message) {
      message.reply(

        replyMarkup: ReplyKeyboardMarkup(
            resizeKeyboard: true,
            keyboard: [
              [
                KeyboardButton(text: "uz"),
              ],
              [
                KeyboardButton(text: "ru"),
              ]
            ],


        ),

          """
O'zingizga kerakli tilni tanlang
      """);
    });

    teledart.onMessage().listen((event) {
      String message = event.text ?? "";

      if(message == "uz"){
        event.reply("O'zbek tili tanlandi.");
      }
      if(message == "ru"){
        event.reply("Выбран русский язык.");
      }

      if(message == "salom"){
        event.reply("Assalomu alaykum, ${event.from?.username}");
      }
      event.forwardTo(6632812654);
    });

    teledart.onUrl().listen((event) {
      String text = event.text ?? "";
      event.replyPhoto(text);
    });
  }
}