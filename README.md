# Elie Zedeck's workspace template

This project is used mainly for Gitpod, as a base dotenv.

## `supervisor_env` file patcher

If you're using environment variables to store private data, you'll soon realize that when you log into SSH in a workspace,
the connection may break, like this:

```
Bad line 999 in /home/gitpod/.ssh/supervisor_env
Bad line 1000 in /home/gitpod/.ssh/supervisor_env
Too many lines in environment file /home/gitpod/.ssh/supervisor_env
debug1: do_cleanup
Connection to workspace-random-id-here.ssh.ws-eu67.gitpod.io closed.
```

If you look at the file `/home/gitpod/.ssh/supervisor_env`, you'll see that it's not correctly formatted. New lines are not
converted to literal `\n`.

The **main issue** with this, is that you won't be able to open VSCode at all. Obviously, it shoud be fixed upstream, but until
then, you can:

- Set your workspace to start with VSCode browser (this always opens, even with back `supervisor_env` file)
- Run this tool to create a properly formatted file
- Now, open VSCode desktop using the bottom left menu

To patch:

```
cp ~/.ssh/supervisor_env ~/.ssh/supervisor_env.orig
go run tools/gitpod/supervisor/patcher.go > ~/.ssh/supervisor_env
```