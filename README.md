# .dotfiles
All dotfiles needed for basic configuration of Linux/macOS

## Usage

- From a fresh install run `./deps`
  - This will require you to restart your shell then run `./deps` again for all of the config to be done
  - Cargo compile problems can generally be solved by `cargo installing` manually instead of using `cargo binstall`

- Then run `./install` to place config files
  - When promted restart your shell

## Notes

- Files starting with `.` are not stowed such as `.git` or `.keyboard`
