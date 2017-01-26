eslintblame
===========

[Bash script](./bin/eslintblame), [Fish Shell function](./functions/eslintblame.fish), and [npm package](https://www.npmjs.com/package/eslintblame) to parse eslint output into git-blame to unveil the offenders.

![eslintblame](https://i.imgur.com/0l7QyeA.gif)

## Install

### Using npm

```shell
npm -g install eslintblame
```

Or on a project:

```
npm install --save-dev eslintblame
```

And use it in your scripts:

```json
{
  "scripts": {
    "blame": "eslint . | eslintblame"
  }
}
```

**NOTES**: won't work on windows (unless you're using [Bash on Windows](https://msdn.microsoft.com/en-us/commandline/wsl/about)).

### Using [Fish Shell](https://fishshell.com/)

#### Recomended

Use [fisherman](http://fisherman.sh/):

```shell
fisher install stefanmaric/eslintblame
```

#### Manual

```shell
curl -Lo ~/.config/fish/functions/eslintblame.fish --create-dirs git.io/eslintblame
```

### Shell script as binary file

Download the [bash script](./bin/eslint), copy in somewhere available in your `$PATH` and give it execution permissions with `chmod`.

## Use

Pipe eslint output to `eslintblame`

```shell
eslint . | eslintblame
```

### Using [standard cli](http://standardjs.com/)?

Use [`snazzy`](https://www.npmjs.com/package/snazzy) to format output:

```shell
standard | snazzy | eslintblame
```

Or replace the command entirely:

```shell
snazzy | eslintblame
```

## Notes

`eslintblame` expects [eslint's default stylish format](http://eslint.org/docs/user-guide/formatters/#stylish).

## Contribute

Just open a Pull Request

## License

MIT ♥ — See [LICENSE](./LICENSE)
