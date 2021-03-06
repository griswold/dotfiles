# My dotfiles

## thanks

I liked Zach Holman's [post](http://zachholman.com/2010/08/dotfiles-are-meant-to-be-forked/)
on dotfiles as well as his topical project structure, so I forked it...even though
it doesn't include a ton of his customizations.

## install

- `git clone git://github.com/griswold/dotfiles ~/.dotfiles`
- `cd ~/.dotfiles`
- `rake full_install`

The `full_install` rake task will fetch any submodule dependencies,
compile any plugins with native extensions (as in command-t), and
symlink the appropriate files in `.dotfiles` to your home directory.

Once you have done a `full_install`, you can just run `install` in the future
if you need to re-symlink the files for any reason.

## topical

Everything's built around topic areas. If you're adding a new area to your
forked dotfiles — say, "Java" — you can simply add a `java` directory and put
files in there. Anything with an extension of `.zsh` will get automatically
included into your shell. Anything with an extension of `.symlink` will get
symlinked without extension into `$HOME` when you run `rake install`.

## components

There's a few special files in the hierarchy.

- **bin/**: Anything in `bin/` will get added to your `$PATH` and be made
  available everywhere.
- **topic/\*.sh**: Any files ending in `.sh` get loaded into your
  environment.
- **topic/\*.symlink**: Any files ending in `*.symlink` get symlinked into
  your `$HOME`. This is so you can keep all of those versioned in your dotfiles
  but still keep those autoloaded files in your home directory. These get
  symlinked in when you run `rake install`.
- **topic/\*.completion.sh**: Any files ending in `completion.sh` get loaded
  last so that they get loaded after we set up zsh autocomplete functions.

