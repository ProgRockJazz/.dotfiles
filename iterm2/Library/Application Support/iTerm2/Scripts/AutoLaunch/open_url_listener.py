#!/usr/bin/env python3
# iTerm2 AutoLaunch: opens URLs in the local default browser when a remote
# process emits OSC 1337 Custom=id=myopenurl:open-url <url>. Paired with
# nvim's diffity launcher so diffs running on an SSH host open here.
#
# Install: `stow iterm2` symlinks this to
# ~/Library/Application Support/iTerm2/Scripts/AutoLaunch/. Requires the
# iTerm2 Python API to be enabled (Settings -> General -> Magic ->
# "Enable Python API"). Restart iTerm2 to auto-start, or run it once from
# Scripts -> AutoLaunch in the menu bar.
import iterm2
import webbrowser


async def main(connection):
    async with iterm2.CustomControlSequenceMonitor(
        connection, identity="myopenurl", regex=r"^open-url (.+)$"
    ) as mon:
        while True:
            match = await mon.async_get()
            webbrowser.open(match.group(1))


iterm2.run_forever(main)
