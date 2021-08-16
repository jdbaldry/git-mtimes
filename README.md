# git-mtimes

Exploration into storing file mtimes in git so that Make can be used after cloning.

## Example

The Makefile in this repository has phony targets that demonstrate how to store and restore mtimes from a file that is committed to the git repository.
In a real-world repository, there would likely be commit hooks or CI steps that would run these commands.

### Store the mtimes

Stores the mtimes of all git files. For convenience, they are stored in an executable script but a structured file may be more useful to other tooling.

```console
$ make mtimes
```

## Update the mtimes

Runs the executable script to touch up every file's mtime.

```console
$ make update
```

## Display the current mtimes

Presents the current mtimes, can be used before and updating to show the changes.

```console
$ make current
```
