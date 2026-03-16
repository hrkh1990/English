# How to Set Up Your Daily 7 AM English Reminder

This guide sets up `daily_english_reminder.sh` to run automatically every morning at 7:00 AM on your Mac.

---

## Step 1 — Make the script executable

Open Terminal and run:

```bash
chmod +x ~/path/to/English/daily_english_reminder.sh
```

> Replace `~/path/to/English/` with the actual path to your English folder (e.g. `~/CoWork/English/`).

---

## Step 2 — Add to crontab (runs automatically at 7 AM daily)

In Terminal, open your crontab:

```bash
crontab -e
```

Add this line at the bottom (update the path to match your folder):

```
0 7 * * * /Users/YOUR_USERNAME/CoWork/English/daily_english_reminder.sh
```

Save and exit (press `Escape`, then type `:wq` and press Enter if using vim).

---

## Step 3 — Grant Terminal permission to show notifications

Go to: **System Settings → Notifications → Terminal**
Turn on: **Allow Notifications**

---

## What happens every morning at 7 AM

- A macOS notification pops up with your phrase of the day
- The full briefing is printed to your terminal
- Your practice is logged to `~/Documents/English_Practice_Log/`

---

## Run it manually anytime

```bash
~/CoWork/English/daily_english_reminder.sh
```

---

## The Weekly Rotation

| Day       | Focus                  |
|-----------|------------------------|
| Monday    | 🎙️ Shadowing           |
| Tuesday   | ✍️ Professional Writing |
| Wednesday | 📖 Reading              |
| Thursday  | 🧠 Vocabulary           |
| Friday    | 🎭 Role-Play with Claude|
| Saturday  | 🎬 Self-Recording       |
| Sunday    | 🎬 Free Immersion       |
