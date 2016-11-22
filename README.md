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

## Notes

`eslintblame` expects [eslint's default stylish format](http://eslint.org/docs/user-guide/formatters/#stylish).

## Contribute

Just open a Pull Request

## License

MIT ♥ — See [LICENSE](./LICENSE)

