# git-mtimes

Exploration into storing file mtimes in git so that Make can be used after cloning.

## Why

GNU Make is a great tool for avoiding excessive rebuilding but CI systems often clone the repository, losing all file context, and making Makefiles ineffective.

## Example

The Makefile in this repository has phony targets that demonstrate how to store and restore mtimes from a file that is committed to the git repository.
In a real-world repository, there would likely be commit hooks or CI steps that would run these commands.

### Store the mtimes

Stores the mtimes of all git files. For convenience, they are stored in an executable script but a structured file may be more useful to other tooling.

```console
$ make mtimes
```

### Update the mtimes

Runs the executable script to touch up every file's mtime.

```console
$ make update
```

### Display the mtimes

Presents the mtimes, can be used before and updating to show the changes.

```console
$ make display
```

### Set mtimes to current time

```console
$ make current
```
