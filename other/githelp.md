# Developers Against Humanity
# Git Help Document

## Who is this document for?

This is a very superficial document for beginners to Git and GitHub. If you already know how to use GitHub or you've used it in another software engineering course, you probably won't find this very useful.

If this is your first time using Git and GitHub, then this document will show you the fundamentals of committing, pulling, pushing, and branches.

## What is Git?

Git is a repository-based version control system. It's used as a unified place for source code, and its collaborative nature fosters open-source development. Git isn't to be confused with GitHub. GitHub provides Git as a service. GitHub isn't the only Git provider; GitLab, BitBucket, and Microsoft Azure Pipelines are all GAAS tools, and they have their own advantages and disadvantages.

Think of it like a shared Google Drive. You can share that folder with others, and they can contribute code. Git is like the protocol that allows you to upload and edit files to your Google Drive, but GitHub is like Google Drive itself.

However, Git differs from Google Drive in several key ways.

1. There's no real-time synchronization. This might seem like a disadvantage, but it is critical in ensuring that everyone has the same version of the code as a starting point, and when people create solutions, they can replace the existing code base with a tested and working solution. If it were real-time, people would end up pushing code that could be untested, unstable, or poorly written.
2. Git is open-source itself. Unlike Google Drive, the underlying technology behind Git is open-source, originally created by the same person behind the Linux family of operating systems: Linus Torvalds.
3. Git is designed for plaintext files (`*.txt`, `*.cpp`, `*.js`, `*.R`, `*.py`), not interpreted files (`*.docx`, `*.pdf`, `*.jpg`, `*.mp4`).
4. Git is designed for small files, generally under 100MB per file. Larger files often require additional software to "lazy-load" them, like Git Large File Support (LFS). GitHub warns you if you try to update or add a file larger than 50MB and blocks files larger than 100MB.

Git uses a local-remote model. When you clone (download) a repository to your computer, you create a local version of the repository on your computer, based off of the remote repository, like the one on GitHub. You then make changes to your local version and use your local version to update the remote repository.

However, sending entire files every time would be wasteful of network and server resources, so Git, by design, only transfers the differences in the files that you've updated, referred to as deltas. So, say you were editing a file and you added a couple of lines to the end of the file. Git would notice that all you've done is add a couple of lines, so it'd only send those couple of lines to the remote repository, rather than copying the entire file again. Nifty, huh!

## How to use Git

### Accounts

If you are working with the Developers Against Humanity project, you'll need to have a GitHub account, as we're using GitHub for our version control remote repository. You need not pay to upgrade your subscription, however, you can enable some special features for free by joining [GitHub's education program](https://education.github.com).

### Installing Git

If you don't already have it, you'll need to install Git on your computer. If you have a Mac, you might already have it, but if you haven't explicitly installed it on Windows, you'll need to.

**For all of this to work properly, you'll also want to install Atom, a fairly feature-rich text-editor.** To get Atom, go to [this link](https://atom.io/).

#### On a Mac

You have it easy. Open up a new Terminal window. Attempt to run `git status`. If Git is installed, it will report that the current directory is not a valid Git repository. If Git is not installed, it will report that the command `git` cannot be found. Your Mac should automatically prompt you to install Git from the developer tools.

#### On Windows

1. Go to [the Git SCM downloads page](https://git-scm.com/downloads). Download the latest stable version of Git to your computer.
2. Launch the installer. You might need to provide UAC permission to allow the installer to run properly.
3. Accept the terms and conditions of use, then click Next.
4. Use the default installation directory (normally `C:\Program Files\Git`), then click Next.
5. Under Windows Explorer integration, make sure that Git Bash Here is enabled, Git LFS is enabled, that `.git*` configuration files are associated with the default text editor, and that `.sh` files are to be run with Bash. Click Next.
6. Leave the program shortcuts in the default location, then click Next.
7. When asked what editor you would like Git to use, select **Atom** as the default editor, NOT Vim!
8. When asked how you want to use Git from the command line, select "Git from the command line and also from 3rd-party software." Click Next.
9. Ensure that you're using the OpoenSSL library, then click Next.
10. Ensure that Git treats line endings in text files by checking out Windows-style, but commits Unix-style endings. This ensures that collaborators who are not using Windows see the text files correctly. Click Next.
11. Select MinTTY as the default terminal emulator for Git Bash, then click Next.
12. Ensure that the checkbox for "Enable Git Credential Manager" is checked, and optionally enable file system caching. Click Install.
13. Git might take a while to install. Just be patient.
14. Once completed, uncheck the box to view the release notes, then close the setup wizard by clicking Next.
15. To use Git, right-click on the Start menu, then select the Windows PowerShell. You can now navigate directories just the same as your Unix counterparts.

#### On Linux

Git should be installed by default.

### Cloning the Remote Repository

To clone a remote repository, such as one on GitHub, navigate to the GitHub repository. On the right-side, you should see a green button to Clone/Download. Click it, then copy the URL that's shown under Clone via HTTPS.

On your local computer, open a new PowerShell or Terminal window (depending on whether you're on Windows or macOS) and navigate to the desired directory. To go up a directory, use `cd ..` (change directory) and to enter a directory, use `cd <directoryName>`. To list the contents of the current directory, use `ls` (list).

Once you're in the desired directory in your terminal, say `~/kim3/development`, type `git clone <remote repository URL` and strike Return. For example, if I wanted to copy this repository, I could use `git clone https://github.com/kim3-sudo/developers-against-humanity.git`. To paste in a terminal window, do NOT use Ctrl+C or Cmd+C! Instead, **right-click on the mouse inside of the terminal window to paste**. Ctrl+C is the standard keyboard interrupt and will cancel the current operation!

After the clone from remote repository completes, you can enter that repository by using `cd <repository name>`.

### Making a New File

Now that you're in the new directory, you can open up a Windows Explorer or macOS Finder window and navigate to that same directory that you were in above, such as your Documents folder or a special development folder. There, you'll see the repository that you cloned as a directory, and you can enter it.

In the text editor of your choice (Atom is a pretty good one), you can write out a plaintext file, such as a C++, Python, JavaScript, or text file. Save (Ctrl+S/Cmd+S) in the desired location in the git directory that you cloned earlier.

By default, Git does not track new files. Tracking means that Git is actively following the changes that a file undergoes. An untracked file will not ever get put in the remote repository. To add the file, you need to go back to your terminal. To see if there are files that are untracked, use `git status`. Any untracked files will show up in green, while newly tracked files will show up in green. To track a file, you'll need to add it to the Git configuration file. To do so, run `git add <filename>`. You can also add an entire directory (`git add <directoryname>`). If you want to add everything that's not tracked and showing up in red, you can run `git add .`, which will add everything in the current directory and anything deeper.

Once you add a file to the Git configuration file, you shouldn't ever have to re-add it.

*Helpful Hint: Git doesn't support empty directories. If you really want to keep a directory, you can make a new, empty file named `.gitkeep`. It doesn't need to contain anything, but it lets Git know that it shouldn't get rid of that directory.*

### Editing an Existing File

Most of the time, you'll be editing files that already exist. Before you begin editing, you'll want to make sure that you have the latest version of the remote repository. This decreases the chance of a merge conflict bunging things up. A merge conflict occurs when two people try to edit the same file, and one person's edits would overwrite the other person's edits.

To get the latest version of the remote repository, run `git pull`.

Now, in your Windows Explorer or macOS Finder window, you can find the file that you'd like to edit and open it in your text editor of choice. Edit to your heart's content. Pour your soul into it. Baby it and nurture it. Cherish it forever. Edit that document.

Once you're done, save the file (Ctrl+S/Cmd+S) and exit your text editor (or don't, some text editors support live changes, like Atom). Now, go back to your terminal window. To make sure that your changes will be committed, run a `git status`. If you see that your changes are going to be committed (files in green), then you're good to go. If you need to add your file to the tracking list, use the `git add <filename>` thing from above.

Commit your file. Committing your file indicates that you've made changes that you'd like to push to the remote repository for everyone else to use. It's kind of like saving your file to the server (in reality, it's a little bit more complicated than that, but that's a good way to think about it). You can commit as much or as little new material as you want. To commit all of the tracked changes, use `git commit -m "Enter your commit message here."`, where your commit message is a succinct description of what changes you've made. If possible, keep it under 50 characters. Include emojis, as indicated in the [CONTRIBUTING.md document](https://github.com/kim3-sudo/developers-against-humanity/blob/master/CONTRIBUTING.md). Here are some example commit messages:

- :tada: Add a function for Rando Cardissian
- :toilet: Cleaned up helperfunction.prog
- :lock: Updated npm cards dependency to v5.1.3

Pull the latest version of the remote repository by using `git pull`. Always pull before pushing.

Finally, push your changes up to the remote repository by using `git push`. 
