

import 'package:telegram_chat_bot/telegram_chat_bot.dart';

void main(List<String> arguments) async{
  await TelegramBot().init();
  print("run telegram bot");
}
