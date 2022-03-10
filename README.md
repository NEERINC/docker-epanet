# EPANET

Base docker image for running EPANET simulations.

## Usage

Pull the image:tag down with the EPANET version you want to use.

_See https://hub.docker.com/r/neerteam/epanet/tags?page=1&ordering=last_updated for a list of available tags._

```sh
docker pull neerteam/epanet:2.2.0-alpine
```

Next, use it as a base image for your application with the specific version you want:
```dockerfile
FROM neerteam/epanet:2.2.0-alpine

# Setup the rest of your image
# ...

# EPANET can be found in /usr/local/bin as several different linked names, with the primary being `runepanet`
# Other ways to call the swmm binary file:
# - `epanet`
```

## Roadmap

See the [open issues](https://github.com/NEERINC/docker-epanet/issues) for a list of proposed features (and known issues).

## Contributing

Contributions are always welcome and highly appreciated! Please read through our [code of conduct](.github/CODE_OF_CONDUCT.md) first.

1. Fork the project
2. Create your bugfix/feature branch
```sh
git checkout -b {bugfix/feature}/my-bugfix-or-feature
```
3. Add, commit, and push your changes with a meaningful message
```sh
git add . && git commit -m "Changed X,Y,Z" && git push
```
4. Open a pull request with our repository's _develop_ branch

## License

Distributed under the GPL-3.0 License. See [LICENSE](./LICENSE) for more information.
