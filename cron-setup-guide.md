# How to use cron and crontab

## ℹ️ Purpose of this guide:

Let's learn how to use cron and crontab without summoning a daemon from the 9th circle of Bash. :feelsgood:

![Hell](/docs/chris-barbalis-hell.jpg)

> Photo by <a href="https://unsplash.com/@cbarbalis?utm_content=creditCopyText&utm_medium=referral&utm_source=unsplash">Chris Barbalis</a> on <a href="https://unsplash.com/photos/silhouette-photography-of-trees-aX4zU9Rp7jo?utm_content=creditCopyText&utm_medium=referral&utm_source=unsplash">Unsplash</a>

If you're tired of running cheeky.sh manually and wish the system could do it for you _without lifting a finger_, **this guide is for you.**

---

## 😈 What is `cron` and `crontab`?

`Cron` is a Linux **background service** (_A.K.A. daemon_) that runs tasks at scheduled times. It's **perfect for repetitive tasks** that you'd rather not think about like the totally-legit commits we are going to do.

`Crontab` (_which stands for "cron table"_) is, in the other hand, your personal **list of scheduled commands**. It tells the `cron` **what** to run and **when** it should be run.

They're perfect for:

- Running backup scripts.
- Sending automated reports.
- Running **Cheeky** daily to maintain your GitHub streak.

---

## Step 1: Open crontab

Open the terminal and type:

`crontab -e`

(_If it's your first time, it will ask which text editor to use. Pick your favorite or do yourself a favour and learn **Vim**._ :godmode:)

---

## Step 2: Understand the syntax and automate

Here's the structure of a Cron Job:

![Structure of a Cron Job](/docs/cron-job-structure.png)

To run Cheeky twice a day, I added a new line like this:

`0 10,19 * * * /home/saraleitexyz/cheeky_commit_bot/cheeky.sh`

This literally means:

- 0 10, 19 🠪 At 10:00 and 19:00 (_IF the computer is on_).
- \* \* \* 🠪 Every day, month and weekday
- Command 🠪 Path to the script so it knows what to run.

---

### 💡 Tips:

- Before relying on cron, run your scripts manually. You **REALLY** don't want a script with an error running in the background.
- You can easily check your crontab anytime with `crontab -l`.

---

**And that's it! You can sit back and relax, Cheeky should be working just fine!** 𓆝 𓆟
