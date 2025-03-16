#!/Users/frean/.dotfiles/zsh/venv/bin/python
import iterm2
import argparse


async def change_iterm2_tabs_profile(connection, profile_name):
    # Get the current iTerm2 window and sessions
    app = await iterm2.async_get_app(connection)
    if app is None:
        return
    windows = app.windows

    partial_profiles = await iterm2.PartialProfile.async_query(connection)
    profile = None
    for partial in partial_profiles:
        if partial.name == profile_name:
            profile = await partial.async_get_full_profile()
    if profile is None:
        raise ValueError("Invalid profile")

    # Iterate through all windows and tabs (sessions) and change their profiles
    for window in windows:
        for tab in window.tabs:
            for session in tab.sessions:
                await session.async_set_profile(profile)

async def main(connection, profile):
    await change_iterm2_tabs_profile(connection, profile)

if __name__ == "__main__":
    parser = argparse.ArgumentParser(description="Change iTerm2 tabs profile.")
    parser.add_argument("--profile", help="The name of the iTerm2 profile to apply to all tabs.")
    args = parser.parse_args()

    iterm2.run_until_complete(lambda connection: main(connection, args.profile))
