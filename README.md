eslintblame
===========

[Fish Shell](https://fishshell.com/) function to parse eslint output into git-blame to unveil the offenders.

![eslintblame](https://i.imgur.com/0l7QyeA.gif)

## Install

### Recomended

Use [fisherman](http://fisherman.sh/):

```shell
fisher install stefanmaric/eslintblame
```

### Manual

```shell
curl -Lo ~/.config/fish/functions/eslintblame.fish --create-dirs git.io/eslintblame
```

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

## Bash

Do you need `eslintblame` for Bash? Open a [new issue](https://github.com/stefanmaric/eslintblame/issues/new) and I will try to port it ASAP.

## Contribute

Just open a Pull Request

## License

MIT ♥ — See [LICENSE](./LICENSE)
