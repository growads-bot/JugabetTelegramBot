from telegram import InlineKeyboardButton, InlineKeyboardMarkup, Update
from telegram.ext import ApplicationBuilder, CommandHandler, ContextTypes
import os

TOKEN = os.getenv("BOT_TOKEN")

MAIN_LINK = "https://track.juga.live/4b8d7b48-284a-41ba-a007-9cb52694ddfb"
SPORTS_BONUS_LINK = "https://track.juga.live/563eed25-d153-40cd-89f0-16c9979790ce"
LIVE_CASINO_LINK = "https://track.juga.live/0cf84ef0-4180-4e81-a8fb-7a18e437aabe"

async def start(update: Update, context: ContextTypes.DEFAULT_TYPE):
    welcome_text = (
        "🎰 *Jugabet Chile* 🎰\n"
        "¡Bienvenido al mejor casino y apuestas deportivas! 🇨🇱\n\n"
        "🔥 Regístrate ahora y obtén bonos exclusivos 🔥"
    )
    buttons = [
        [InlineKeyboardButton("🎁 Bono Deportes", url=SPORTS_BONUS_LINK)],
        [InlineKeyboardButton("🎲 Casino en Vivo", url=LIVE_CASINO_LINK)],
        [InlineKeyboardButton("🌐 Ir a Jugabet", url=MAIN_LINK)],
    ]
    await update.message.reply_text(
        welcome_text,
        reply_markup=InlineKeyboardMarkup(buttons),
        parse_mode="Markdown"
    )

app = ApplicationBuilder().token(TOKEN).build()
app.add_handler(CommandHandler("start", start))

if __name__ == "__main__":
    import asyncio
    asyncio.run(app.run_polling())
