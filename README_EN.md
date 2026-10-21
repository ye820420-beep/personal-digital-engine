# Personal Digital Engine

[简体中文](README.md) | **English**

![License](https://img.shields.io/badge/license-CC%20BY%204.0-blue)
![Dependencies](https://img.shields.io/badge/dependencies-none-brightgreen)
![Files](https://img.shields.io/badge/core%20files-1-orange)

> **Not another budgeting app. Not another habit tracker.**
> It is **one file**. Hand it to any AI, and it becomes your personal data system.
>
> You give it raw data. It gives you back **an account book that only you can read**.

---

## Why this exists

Ask an AI "how do I lose weight", "how do I make more money", "how do I finally learn English" —
and you will always get **the correct answer**.

Not because the AI is bad. Because **it does not know you**.

It does not know what time you fall asleep, how much you spend on delivery food each month,
how many weeks in a row you have finished learning nothing, or who the last person you called was.
Without that, the only thing it can give you is correct nonsense.

Justin Sun put it plainly: **"Visualize it, quantify it, make it summarizable — then put it all in Markdown."**
His own routine: photograph his meals and let an AI estimate the calories, hand sleep data to an Oura Ring,
and have the AI write him a daily report.

The problem is that after he said it, **nobody built the thing you could actually use**.

This project is that thing.

---

## Start in 30 seconds

**You do not download anything.** Copy this one line and paste it to your AI:

```
Read this link and install what it says: https://raw.githubusercontent.com/ye820420-beep/personal-digital-engine/main/skills/%E4%B8%AA%E4%BA%BA%E6%95%B0%E5%AD%97%E5%8C%96%E5%BC%95%E6%93%8E.md
```

1. Open Doubao / Yuanbao / DeepSeek / WorkBuddy / Claude / ChatGPT — any of them — start a new chat, **paste it, hit enter**
2. It says "installed", then you say **"run a sample"** — you will see the finished output in 60 seconds
3. If you like it, say **"start"** — it asks questions in six groups; rough answers are fine

> That link *is* [`skills/个人数字化引擎.md`](skills/%E4%B8%AA%E4%BA%BA%E6%95%B0%E5%AD%97%E5%8C%96%E5%BC%95%E6%93%8E.md) in this repo.
> **When the repo updates, the link updates** — no re-downloading, no new link to chase.

After that, just toss it a sentence whenever you feel like it:

```
"had beef noodles for dinner"   -> logs a meal
"taxi 38"                       -> logs an expense
"6 out of 10 today"             -> logs a mood
"dragged the report again"      -> logs a work item
```

**"Didn't exercise today" is also data.** Whether this system survives two months depends on
how cheap it is to log — not on how disciplined you are.

---

## Install: three ways, none of them "download from GitHub"

### A. Send your AI one line (easiest)

Works with any chat AI that can read a link (Doubao / Yuanbao / DeepSeek / ChatGPT / Claude web / WorkBuddy).
Copy the whole line, paste, enter:

```
Read this link and install what it says: https://raw.githubusercontent.com/ye820420-beep/personal-digital-engine/main/skills/%E4%B8%AA%E4%BA%BA%E6%95%B0%E5%AD%97%E5%8C%96%E5%BC%95%E6%93%8E.md
```

**If the AI cannot open links**, fall back to one of these:

| Situation | What to do |
|---|---|
| I just want to read the file | Open [`skills/个人数字化引擎.md`](skills/%E4%B8%AA%E4%BA%BA%E6%95%B0%E5%AD%97%E5%8C%96%E5%BC%95%E6%93%8E.md) → **Raw** (top right) → select all → copy |
| I want the file to upload myself | `./install.sh here` (Windows: `install.bat here`) writes `个人数字化引擎.md` to the current folder |

### B. Command-line AI (Claude Code / Codex / WorkBuddy / Cursor)

**One line. It installs into every AI tool already on your machine:**

```bash
curl -fsSL https://raw.githubusercontent.com/ye820420-beep/personal-digital-engine/main/install.sh | bash
```

**Windows** — clone, then double-click `install.bat`:

```powershell
git clone --depth 1 https://github.com/ye820420-beep/personal-digital-engine.git
cd personal-digital-engine
install.bat          # tools that are already installed
install.bat all      # create the folder even if the tool is missing
install.bat here     # just give me the file, I'll upload it myself
```

The script does exactly one thing: it copies `skills/个人数字化引擎.md` into the
`SKILL.md` location each tool expects. **It uploads nothing, phones home to nothing,
and needs no keys** — read `install.sh` before you run it, it is 100 lines of `cp`.

| Tool | Installs to |
|---|---|
| Claude Code | `~/.claude/skills/personal-digital-engine/SKILL.md` |
| Codex | `~/.codex/skills/personal-digital-engine/SKILL.md` |
| WorkBuddy | `~/.workbuddy/skills/personal-digital-engine/SKILL.md` |
| Cursor | `~/.cursor/skills/personal-digital-engine/SKILL.md` |

> By default it only touches tools whose folder **already exists**; everything else is
> skipped, so it will not litter your machine. Force all: `./install.sh all`.

### C. What to say after installing (the boot phrase)

However you installed it, start every new chat with this line:

```
You have the Personal Digital Engine installed. Read 流水账-YYYY-MM.md and 我的档案.md first,
then answer me in three lines: how many entries this month / how many days I skipped /
what I should backfill today. After that, log whatever I say — three lines, nothing more.
```

> The boot phrase also lives inside the skill file, so the AI will remind you.

---

## ⭐ Deploy once, run forever

**Core principle: the file is the memory. The AI's memory does not matter — the file does.**

So switching AI, switching computers, switching phones, or opening a hundred new chats
will never break the system. **As long as the files are there, the state is there.**

**When you move to a new AI or a new device, paste this bootstrap prompt. You are back in 30 seconds:**

```
You have the "Personal Digital Engine" installed. First read 流水账-YYYY-MM.md and 我的档案.md,
then reply with three lines: how many entries this month / how many days I missed /
what I should backfill today. After that, log whatever I say. Three lines only, nothing more.
```

**At the end of every conversation, the AI proactively hands you a "relay block"**
(date / day number / which days were missed / what to say when you reopen / what is due).
Copy it, paste it into another AI or another device, and keep going.

---

## 📱 Using it on your phone

**Short answer: yes — but split the work. The phone logs; the computer reads.**

| Option | How | Good for |
|---|---|---|
| **A. Sync folder + AI app** | Put the data folder in Nutcloud / OneDrive / iCloud / Weiyun, install the same AI app on your phone. To log: open the app, attach the two files, say "log: taxi 38", save the updated ledger back to the sync folder | People who want to log directly from the phone |
| **B. Dump raw material only (lightest)** | Send meal photos, screenshots and one-liners to your own WeChat "File Transfer" chat, then archive them on the computer in one sitting | People who want to keep doing this for months (A + B mixed is recommended) |
| **C. Run it fully on the phone** | Termux on Android, iSH / a-Shell on iOS | Power users only. Steep setup — beginners should skip |

⚠️ One honest limitation: most mobile apps do not support a "skill directory", so **you have to re-attach the two files each time (~10 seconds)**. That is a limitation of the app ecosystem, not of this system.

**Viewing the dashboard:** copy `仪表盘.html` to your phone and open it in a browser. It is already mobile-adapted (tables scroll sideways, cards stack, tab position is remembered).

---

## What you end up with (all local files on your own machine)

| File (Chinese) | What it is |
|---|---|
| `我的档案.md` | Six-dimension profile + scores + three-color status |
| `问题总表.md` | Fix-it list sorted by priority; each "first step" is small enough to do today |
| `仪表盘.html` ★ | Double-click to open — a personal workbench: sidebar nav, time-of-day greeting, seven tabs that make you legible to yourself |
| `个人发展矩阵.md` | Current state / 3-month target / signals of success / this week's action |
| `流水账-YYYY-MM.md` | All raw data, one file per month |
| `日报-YYYY-MM-DD.md` | That day's raw stream |
| `日常琐事.md` | Todos / recurring chores / passing thoughts |

> File names are Chinese because the engine was built for Chinese-speaking users.
> You can ask the AI to rename them in any language — the format is what matters, not the name.

### The seven dashboard tabs

| Tab | What you see |
|---|---|
| **Overview** | Overall score, six-axis radar, this month's cash flow, the one thing that matters most this week, top-3 to fix |
| **Body** | Weight curve (with target line), sleep hours (colored by whether you hit your target), intake vs. burn dual curve |
| **Mood** | Daily score line (red dots on bad days), trigger ranking, which recovery method actually works |
| **Learning** | Weekly hours bar chart, streak, where your in-progress list is stuck |
| **Work** | Where your time went, available vs. genuinely unbroken time, overdue items |
| **Relationships** | Contact list (red if untouched for 30+ days), this week's interactions, relationships to repair |
| **Money** | Income/expense detail, category share, 6-month trend, subscription audit |

### ⭐ It is not a picture — it is a page you can log into

The generated `仪表盘.html` ships with an interaction layer. **You can log without opening an AI:**

| Feature | How |
|---|---|
| **Log one** | Tap the bottom button -> pick a category -> type a line and a number -> save, **and the density map changes colour on the spot** |
| **Export for AI** | One click produces a standard ledger table plus completed todos — copy it or download `.md` |
| **Import a ledger** | Drag `流水账-YYYY-MM.md` onto the page and the charts update immediately |
| **Checkable todos** | Checked state is kept locally, survives refresh, and travels with the export |
| **Density range** | Switch between 7 / 14 / 30 days |

**Division of labour:** the AI organises (turns your casual sentences into structured data);
the page lets you log on the fly; the export goes back to the AI and merges into your profile.
**Everything stays on your own device — nothing is uploaded to any server.**

> The page opens as a local `file://`, and browsers do not let it rewrite files in the same
> folder (a security limit). So "log on the page → export → merge in the AI" is required,
> not a design flaw.

---

## ⭐ What separates it from every other dashboard: every recommendation carries evidence

Other tools tell you "you are overweight".

This tells you:

> **Section 2, Item 9**: Switch your household salt to a low-sodium substitute
> Cost: a few cents more per bag, taste barely changes
> Benefit: all-cause mortality risk about 12% lower (randomized trial in rural China, 20,995 participants, 4.74 years of follow-up)
> Evidence grade: **A** ｜ Source: NEJM 2021 (DOI: 10.1056/NEJMoa2105675)
> ⚠️ **If you have impaired kidney function or take potassium-sparing drugs, ask your doctor first**

### The source is swappable and extendable

The mechanism lives in section 9 of `skills/个人数字化引擎.md`.
When the engine needs to suggest a next step, **it searches `sources/` first, and if it finds nothing it must say so out loud** — it is never allowed to invent a citation.

Default source:

> **《高性价比人生指南》 (HowToLiveBetter)** https://github.com/eternity4719/HowToLiveBetter
> Free and open, CC BY 4.0, 667 recommendations, 1,675 links to primary literature.
> **This is a source this project cites — not a work of this project. Copyright belongs to the original author.**

**To add a source, drop a `.md` / `.txt` into `sources/` and register it in one line:**

| Type | Example | License note |
|---|---|---|
| Open books | 《自学是门手艺》, OpenStax textbooks (English) | **CC BY-NC-ND material may only be quoted verbatim — never rewritten** |
| Official documents | 《中国居民膳食指南》 (Chinese Dietary Guidelines) | Note the edition year |
| **Your own files** | Medical checkup reports, reimbursement policy, vaccination records, employment contract, mortgage contract, doctor's orders | ⚠️ **Put these in `private/`, not `sources/`** |

**The last type is the most valuable.** Open books give generic answers; your own files give answers
that are true for you and no one else. **That is the real source of "it fits me better the longer I use it".**

> ⚠️ **Keep the two directories separate.** `sources/` is public (it goes into git); `private/` holds your
> own material (`.gitignore` blocks it — it can never be committed).
> The AI reads both, but **medical reports and contracts belong in `private/` only** — mix them together
> and sooner or later someone runs `git add .` and pushes their own checkup report to GitHub.

Full rules: [`sources/建议源清单.md`](sources/%E5%BB%BA%E8%AE%AE%E6%BA%90%E6%B8%85%E5%8D%95.md) (Chinese).

---

## 🔒 Privacy: where your data lives, and what is in this repo

This is the one thing that has to be unambiguous.

**What is in the repo:** rules, templates and sample data only. **The rules are empty — they are just an instruction manual.**

**Where your data is:** on your own computer, the whole time. Those seven `.md` and `.html` files.

**Can it leak:** no. The first rule written into the skill is "never ask the user to upload to the cloud, never send user data to any service."
On top of that, `.gitignore` is configured so that even if you run `git add .` inside your own data folder, not one personal file gets committed.

**How to delete everything:** delete the folder. No cloud copy, no account, nothing left outside the recycle bin.

**What if you switch AI:** copy the folder, hand it to another AI, it reads the same format and keeps computing.
That is the only reason this uses Markdown instead of an app — **your data is never locked in by anyone**.

More detail: [`docs/隐私与数据主权.md`](docs/%E9%9A%90%E7%A7%81%E4%B8%8E%E6%95%B0%E6%8D%AE%E4%B8%BB%E6%9D%83.md) (Chinese).

---

## Three principles

1. **Do not aim for perfect logging.** Three months of rough data beats one week of precise data followed by quitting.
2. **Never more than 3 high-priority items.** More than 3 means all of them get ignored.
3. **Do not draw conclusions before two months.** The output of this system is not week one's numbers — it is the profile two months later, the one where the AI actually knows you.

---

## Repository layout

```
skills/      个人数字化引擎.md        <- the core. This one file is the engine
install.sh / install.bat               <- one-line installer for your AI tools (see "Install")
sources/     建议源清单.md            <- decides where recommendations come from
                                       (open books, official documents — public)
private/     (create it yourself)     <- medical reports / contracts / doctor's orders
                                       never committed
templates/   empty templates (profile / issue list / ledger / chores / dashboard)
examples/    sample output (generated for a fictional person "小林" — open it to see the result)
docs/        privacy and data-sovereignty notes
```

`examples/仪表盘-样例.html` can be opened by double-clicking — you do not need to install
anything to preview what the finished product looks like.

---

## Output language

The engine and all bundled content are in Chinese. However, the skill is a plain instruction file:
**tell the AI "reply in English" (or any language) and it will follow**, including generating
the dashboard and all files in that language. Nothing in the file names or format is language-bound.

---

## License

This project (excluding cited sources and third-party content) is released under **CC BY 4.0** —
use it, modify it, redistribute it freely, **as long as you keep the attribution**.

《高性价比人生指南》 is an independent open project under CC BY 4.0, copyright of its author eternity4719.
This project cites it with attribution and does not include a copy of its text.

---

## Who made this

**蛙蛙在学习 (Wawa is Learning)** — teaching ordinary people to use AI for real problems at work and in life.
Same name on Douyin and Xiaohongshu. This project grew out of a video about "turning yourself into data";
the tool was built for that video's audience.

Issues, ideas, or it broke on you — open an issue.
