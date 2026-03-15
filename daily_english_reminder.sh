#!/bin/bash
# ─────────────────────────────────────────────────────────────────────────────
# English Fluency Daily Reminder — HamidReza (CTO Edition)
# Runs every morning at 7:00 AM
# To install: crontab -e  →  add:  0 7 * * * /path/to/daily_english_reminder.sh
# ─────────────────────────────────────────────────────────────────────────────

DAY=$(date +%A)
DATE=$(date "+%B %d, %Y")

# ─── Day-specific content ─────────────────────────────────────────────────────
case "$DAY" in
  Monday)
    FOCUS="Speaking / Shadowing"
    EMOJI="🎙️"
    TASK="Today is Shadowing Day. Open a TED Talk on leadership or technology (ted.com/talks). Listen once, then shadow the speaker for 15 minutes — match their rhythm and intonation exactly. Don't worry about perfect words; focus on flow."
    PHRASE="Let me walk you through our approach on this."
    RESOURCE="https://www.ted.com/talks?topics=leadership"
    MOTIVATION="Every CTO who leads global teams in English started exactly where you are. The difference is they kept going."
    ;;
  Tuesday)
    FOCUS="Professional Writing"
    EMOJI="✍️"
    TASK="Today is Writing Day. Draft one professional email from your real work context — a follow-up, a status update, or a decision announcement. Then open Claude and say: 'Review this email for tone, clarity, and naturalness. Rewrite it with improvements and explain what changed.'"
    PHRASE="I wanted to follow up on our conversation and share a brief update."
    RESOURCE="Your current work inbox — use a real email context"
    MOTIVATION="Fluency is not a destination — it is a daily practice. You showed up today. That is already a win."
    ;;
  Wednesday)
    FOCUS="Reading & Comprehension"
    EMOJI="📖"
    TASK="Today is Reading Day. Read one full article from Harvard Business Review (hbr.org) or MIT Technology Review. After reading, close the article and summarize the main point out loud in 3 spoken sentences. Record yourself if possible."
    PHRASE="After reviewing the situation, my recommendation is..."
    RESOURCE="https://hbr.org  or  https://www.technologyreview.com"
    MOTIVATION="Your technical expertise is world-class. English is just the vehicle. Every day you are making that vehicle stronger."
    ;;
  Thursday)
    FOCUS="Vocabulary & Phrase Bank"
    EMOJI="🧠"
    TASK="Today is Vocabulary Day. Open your English Fluency Plan (English_Fluency_Plan_CTO.docx) and review your Phrase Bank table. Pick 3 phrases and write each one in a sentence from your own work context. Commit to using at least one in a real conversation today."
    PHRASE="I want to make sure I understand your concern — are you saying that...?"
    RESOURCE="English_Fluency_Plan_CTO.docx (your English folder)"
    MOTIVATION="The discomfort you feel when speaking English is not weakness — it is your brain building new pathways. Trust the process."
    ;;
  Friday)
    FOCUS="Role-Play Practice"
    EMOJI="🎭"
    TASK="Today is Role-Play Day. Open Claude and say: 'Let's do a role-play. You are a frustrated enterprise customer calling about a production outage. I am the CTO. Start the call.' After 10 minutes, ask for feedback on: empathy language, clarity, and professional tone."
    PHRASE="I completely understand the impact this has had on your team, and I want to assure you we are treating this as our top priority."
    RESOURCE="https://claude.ai"
    MOTIVATION="One year from today, you will look back at this period as the turning point. Keep going."
    ;;
  Saturday)
    FOCUS="Self-Recording"
    EMOJI="🎬"
    TASK="Today is Recording Day. Pick any technical or business topic you know well — a recent architecture decision, a product challenge, a team update. Record yourself speaking about it for 3 minutes on your phone. Play it back. Note 2 things you did well and 1 thing to improve."
    PHRASE="The key challenge we are solving for is..."
    RESOURCE="Your phone voice recorder app"
    MOTIVATION="The best speakers in the world practice in private so they can shine in public. That is exactly what you are doing."
    ;;
  Sunday)
    FOCUS="Free Immersion"
    EMOJI="🎬"
    TASK="Today is Free Immersion Day. No structured practice — just enjoy English. Watch a business documentary, listen to a podcast on your commute, or watch an English film with English subtitles. Let it be pleasurable and pressure-free."
    PHRASE="I'd like to take a step back and look at the bigger picture here."
    RESOURCE="Netflix, YouTube, or Spotify — your choice"
    MOTIVATION="Rest and immersion are not the same as stopping. Today you are absorbing the language. Enjoy it."
    ;;
esac

# ─── Build the notification message ──────────────────────────────────────────
MESSAGE="🌅 Good morning, HamidReza! — $DATE

Today is $DAY — $EMOJI $FOCUS Day

📋 YOUR PRACTICE TASK:
$TASK

💬 PHRASE OF THE DAY:
\"$PHRASE\"
👉 Use this at least once today in a real conversation, meeting, or email.

🔗 RESOURCE FOR TODAY:
$RESOURCE

💪 MOTIVATION:
$MOTIVATION"

# Add Friday weekly check-in reminder
if [ "$DAY" = "Friday" ]; then
  MESSAGE="$MESSAGE

📊 WEEKLY CHECK-IN:
It's Friday! Take 5 minutes to fill in your Weekly Progress Tracker in English_Fluency_Plan_CTO.docx.
Rate your confidence this week (1–10) and note one win and one area to improve."
fi

MESSAGE="$MESSAGE

Have a great day! 🚀
────────────────────────────────────────────────"

# ─── Display notification (macOS) ─────────────────────────────────────────────
# Method 1: System notification (brief pop-up)
osascript -e "display notification \"$EMOJI $FOCUS Day — Phrase: \\\"$PHRASE\\\"\" with title \"🌅 English Practice — Good Morning HamidReza!\" sound name \"Glass\""

# Method 2: Full message in terminal / log file
echo "$MESSAGE"

# Method 3: Save to a daily log file
LOG_DIR="$HOME/Documents/English_Practice_Log"
mkdir -p "$LOG_DIR"
echo "$MESSAGE" >> "$LOG_DIR/practice_log_$(date +%Y-%m).txt"
echo "---" >> "$LOG_DIR/practice_log_$(date +%Y-%m).txt"

echo ""
echo "✅ Reminder logged to: $LOG_DIR/practice_log_$(date +%Y-%m).txt"
