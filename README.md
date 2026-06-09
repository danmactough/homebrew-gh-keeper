# Homebrew GH Keeper

A trivial script that runs `gh auth status`, but the point is actually to just add a formula that depends on the `gh` formula to prevent `gh` from getting uninstalled.

Copied from [mvogelgesang/homebrew-tiny-sh-example](https://github.com/mvogelgesang/homebrew-tiny-sh-example)

- [Homebrew GH Keeper](#homebrew-gh-keeper)
  - [Goals](#goals)
  - [Initial Executable Version](#initial-executable-version)
  - [Updating](#updating)


## Goals

- [x] Create a simple shell script that can be installed via homebrew and run using the alias `gh-keeper`
- [x] Utilize one or more dependencies to ensure they get installed correctly
- [x] Document any missteps or gotchas along the way

## Initial Executable Version

The steps below document each step required to produce an executable that can be installed via homebrew.

- Create public GitHub repo `homebrew-gh-keeper`.

`mkdir homebrew-gh-keeper && cd homebrew-gh-keeper`

`mkdir src/`

`touch README.md`

`touch src/run.sh`

`git init`

`git add -A`

`git commit -m "Initial commit 🌅"`

`git push origin main`

`git tag -a v0.0.1 -m "0.0.1"`

`git push origin v0.0.1`

- Go to https://github.com/danmactough/homebrew-gh-keeper/releases. 
- Create new release, auto generate release notes. Publish.
- Copy link to tar.gz source code

`HOMEBREW_NO_INSTALL_FROM_API=1`

`brew tap --force homebrew/core`

Create a new Formula

`brew create https://github.com/danmactough/homebrew-gh-keeper/archive/refs/tags/v0.0.1.tar.gz`

You will receive a warning that a sha hash was not provided but that one was calculated for you, that's ok.

Copy formula to `./Formula/gh-keeper.rb`:

`cp /opt/homebrew/Library/Taps/homebrew/homebrew-core/Formula/h/homebrew-gh-keeper.rb Formula/gh-keeper.rb`

`git add -A`

`git commit -m "Added homebrew formula"`

`git push origin main`

Let's try tapping the formula and installing it

`brew tap danmactough/gh-keeper`

    ==> Tapping danmactough/gh-keeper
    Cloning into '/opt/homebrew/Library/Taps/danmactough/homebrew-gh-keeper'...
    remote: Enumerating objects: 13, done.
    remote: Counting objects: 100% (13/13), done.
    remote: Compressing objects: 100% (8/8), done.
    remote: Total 13 (delta 2), reused 11 (delta 0), pack-reused 0 (from 0)
    Receiving objects: 100% (13/13), done.
    Resolving deltas: 100% (2/2), done.
    Tapped 1 formula (15 files, 7.8KB).

`brew trust danmactough/gh-keeper`

    Trusted tap: danmactough/gh-keeper

`brew install gh-keeper`

    ==> Would install 1 formula:
    gh-keeper
    ==> Fetching downloads for: gh-keeper
    ✔︎ Formula gh-keeper (0.0.1)                                                                                         Verified    317.0 B/317.0 B
    ==> Installing gh-keeper from danmactough/gh-keeper
    🍺  /opt/homebrew/Cellar/gh-keeper/0.0.1: 3 files, 2.3KB, built in 3 seconds
    ==> Running `brew cleanup gh-keeper`...
    Disable this behaviour by setting `HOMEBREW_NO_INSTALL_CLEANUP=1`.
    Hide these hints with `HOMEBREW_NO_ENV_HINTS=1` (see `man brew`).

Try running it

`gh-keeper`

    github.com
        ✓ Logged in to github.com account danmactough (keyring)
        - Active account: false
        - Git operations protocol: https
        - Token: ghp_************************************
        - Token scopes: 'codespace', 'gist', 'notifications', 'project', 'read:discussion', 'read:gpg_key', 'read:org', 'read:public_key', 'read:repo_hook', 'repo', 'user', 'workflow', 'write:packages'

## Updating

- Make changes to the code, readme, etc. Commit and push to `main`
- Create tag `git tag -a {versionNumber} -m {versionNumber}` push to main
- Create new release from tag
- Copy tarball link, update Formula
- Fetch SHA-256 using tarball link

`curl -L {tarballLink} | shasum -a 256`

- Update Formula sha256
- Commit all formula changes and push to main
- Update `gh-keeper` to latest version

`brew update`

`brew upgrade gh-keeper`