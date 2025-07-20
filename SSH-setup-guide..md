# How to set up SSH Keys for GitHub:

## Purpose of this guide:

I barely knew about SSH keys before writing this (_I was a **noob** who only knew their name_), so I'm making this guide to guide others like me who want to learn more ~~or those who want to make their GitHub as green as an Irish pasture.~~

## Why SSH Keys?

SSH keys help us authenticate with GitHub without typing the credentials every single time our lovely **Cheeky** pushes a commit (_that would actually defeat the purpose of automatization_).

They're more secure and convenient due to:

- **Stronger security:** SSH uses cryptographic keys instead of your password, so it's harder to _hack_.
- **Easier management:** You can add multiple SSH keys to your GitHub account and revoke them without changing your password.

You can also run other automated scripts other than Cheeky, but I hope he remains your favourite <3.

## Step 1: Check for existing SSH Keys

Before you start generating keys like a madman, let's check if you have anything lying around.

Open your terminal and run:

`ls ~/.ssh`

If you see anything like _id_rsa, id_ed25519_ or anything that ends in _.pub_, you're already halfway.

If not? We'll make one in the next step.

## Step 2: Generate a new SSH Key

Now, let's make our very own cryptographic key:

`ssh-keygen -t ed25519 -C "example@mail.com"`

You’ll be asked:

- Where to save the key – Just press Enter to go with the default:
  /home/you/.ssh/id_ed25519

- Passphrase – You can add one for extra security (recommended), or just smash Enter twice to skip it and live on the edge.

Congratulations! You should now have two files:

- id_ed25519 (your private key – never share this!)

- id_ed25519.pub (your public key – this is the one we’ll give to GitHub)

## Step 3: Add Your SSH Key to the SSH Agent

We want your system to remember the key without nagging us constantly.

First, start the ssh-agent:

`eval "$(ssh-agent -s)"`

Then, add your new key to it:

`ssh-add ~/.ssh/id_ed25519`

Done! Your system now whispers your key into GitHub’s ear — securely.

## Step 4: Add the Public Key to GitHub

Time to connect your computer to your GitHub account.

Copy your public key with:

`cat ~/.ssh/id_ed25519.pub`

It should look like a long line starting with ssh-ed25519 and ending with your email.

Now go to:

> GitHub → Settings → SSH and GPG keys → New SSH key

- Title: Something like “My Laptop” or “CheekyBot HQ”

- Key: Paste what you copied

- Click Add SSH key

## Step 5: Change Your Git Remote to SSH

If your repo was cloned using HTTPS (if you used VSCODE is by default), you’ll need to switch it to use SSH (the cool one with git@github.com:).

If you cloned your repo in VS Code using the big green "Code" button, it probably gave you an HTTPS URL like this:

Open your Terminal in VSCode and run:

`git remote -v`

If you see https://github.com/..., it’s time for an upgrade.

Inside your repo folder, run:

`git remote set-url origin git@github.com:yourusername/your-repo.git`

(I hope you understand that you have to replace with your actual username and repo name.)

That’s it. Now let’s double-check that it worked:
git remote -v

You should now see:

origin git@github.com:saraleitexyz/cheeky_commit_bot.git (fetch)
origin git@github.com:saraleitexyz/cheeky_commit_bot.git (push)

(Replace with your own repo if you’re not me. Unless you are me. In which case, hi.)

Now Git will use SSH for pushes, pulls, and impressing people.

## Step 6: Test Your SSH Connection

Let’s make sure it all works:

`ssh -T git@github.com`

This is SSH’s way of saying:

“Hey, I’ve never talked to this ‘github.com’ machine before. Are you sure it’s legit and not some evil twin pretending to be GitHub?”

It’s totally normal the first time you connect to a new host.

Type yes.

If you see something like:

`Hi saraleitexyz! You've successfully authenticated, but GitHub does not provide shell access.`

Perfect, you’re in!
