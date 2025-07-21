# How to set up SSH keys for GitHub

## ℹ️ Purpose of this guide:

I barely knew about how to set SSH keys before writing this (_I wass a **noob** who only knew the theory_), so I'm making this guide to guide others like me who want to learn more ~~or those who want to make their GitHub as green as an Irish pasture.~~

![Field with cows](/images/illiya-vjestica-%20fields.jpg)

> Photo by <a href="https://unsplash.com/@illiyapresents?utm_content=creditCopyText&utm_medium=referral&utm_source=unsplash">Illiya Vjestica</a> on <a href="https://unsplash.com/photos/herd-of-sheep-on-green-grass-field-during-daytime-W5FdAcHp7l8?utm_content=creditCopyText&utm_medium=referral&utm_source=unsplash">Unsplash</a>

This is essential for building automations like Cheeky.

**No SSH, NO push.** 🚫

---

## 🔑 Why SSH Keys?

SSH keys help us authenticate with GitHub **without typing the credentials** every single time our lovely **Cheeky** pushes a commit (_which would otherwise defeat the purpose of automatization_).

They're more **secure and convenient** due to:

- **Stronger security:** SSH uses cryptographic keys instead of your password, so it's harder to _hack_.
- **Easier management:** You can add multiple SSH keys to your GitHub account and revoke them without changing your password.

You can run other automated scripts too, but I hope Cheeky remains your favourite <3.

---

## Step 1: Check for existing SSH Keys

Let's check if you have anything lying around. :suspect:

Open your terminal and run:

`ls ~/.ssh`

If you spot files like _\_id_rsa_, _id*ed25519*_ or anything that ends in _*.pub*_, you've got keys already!

If not, we'll make them in the next step.

## Step 2: Generate a new SSH Key

Now, let's make our very own cryptographic key:

`ssh-keygen -t ed25519 -C "example@mail.com"`

You’ll be asked:

- **Where to save the key.** Press Enter to go with the default path:
  /home/you/.ssh/id_ed25519

- **Passphrase.** You can add one for extra security (_recommended_), or just smash Enter to skip it and live on the edge.

**Congratulations!** You should now have two files:

- id*ed25519 (\_your **private key**, never share this!*)

- id*ed25519.pub (\_your **public key**, the one we’ll give to GitHub.*)

## Step 3: Add your SSH key to the SSH agent

We want the system to remember the key without bugging us constantly.

First, **start the ssh-agent**:

`eval "$(ssh-agent -s)"`

Then, **add your new key** to it:

`ssh-add ~/.ssh/id_ed25519`

Done!

## Step 4: Add the public key to GitHub

Time to connect your computer to your GitHub account.

**Copy your public key** with:

`cat ~/.ssh/id_ed25519.pub`

(_It should look like a long line starting with ssh-ed25519 and ending with your email._)

Now, in your browser, go to:

> GitHub → Settings → SSH and GPG keys → New SSH key

And fill the fields:

- **Title:** I recommend making it the name of you device. Something like “_Thinkpad X270_” (_my dear laptop_) will help you remember what it is clearly.

- **Key:** Paste what you copied.

- and click **Add SSH key**!

## Step 5: Change your git Remote to SSH

If your repo was cloned using HTTPS (_if you used Visual Studio, chances are it was_), you’ll need to switch it to use SSH:

**Open your Terminal** in Visual Studio Code and run:

`git remote -v`

If you see https://github.com/..., it’s time for a change.

**Inside your repo folder,** run:

`git remote set-url origin git@github.com:yourusername/your-repo.git`

(_Replace this with your actual username and repo name._)

That’s it. Now let’s **double check that it worked**:

`git remote -v`

You should now see:

> origin git@github.com:saraleitexyz/cheeky_commit_bot.git (fetch)

> origin git@github.com:saraleitexyz/cheeky_commit_bot.git (push)

(_Replace with your own repo if you're not me. Unless you are me. In which case, hi._)

Now Git will use SSH for pushes, pulls and impressing those hiring managers. :trollface:

## Step 6: Test your SSH connection

For the final step, **let's make sure it all works**:

`ssh -T git@github.com`

You might be prompted to enter "yes" or "no". SSH is asking if you're are sure the connection is legit and not other machine pretending to be GitHub.

It’s totally normal the first time you connect to a new host.

- Type **yes.**

Now, if you see something like:

> Hi _y/n_! You've successfully authenticated, but GitHub does not provide shell access.

**Perfect, you’re in! Congrats, you've finished setting up your SSH!** 𓆝 𓆟
