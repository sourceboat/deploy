# sourceboat/deploy

[![Docker Build Status](https://img.shields.io/docker/cloud/build/sourceboat/deploy.svg?style=flat-square)](https://hub.docker.com/r/sourceboat/deploy/builds/)
[![Release](https://img.shields.io/github/release/sourceboat/deploy.svg?style=flat-square)](https://github.com/sourceboat/deploy/releases)
[![Docker Pulls](https://img.shields.io/docker/pulls/sourceboat/deploy.svg?style=flat-square)](https://hub.docker.com/r/sourceboat/deploy/)
[![Image Size](https://img.shields.io/docker/image-size/sourceboat/deploy?style=flat-square)](https://microbadger.com/images/sourceboat/deploy)
[![MicroBadger Layers](https://img.shields.io/microbadger/layers/sourceboat/deploy.svg?style=flat-square)](https://microbadger.com/images/sourceboat/deploy)

Docker image to run remote commands via SSH.

## Usage 

### Known hosts

To add your host to the known hosts of the SSH agent, simply add the content to the environment variable `$SSH_KNOWN_HOSTS`.
To get the the public key for your host, you can use `ssh-keyscan`

```
$ ssh-keyscan -p <port> <ip-or-hostname>
```

Put the output of the command into the `$SSH_KNOWN_HOSTS` environment variable.

### SSH Private Key

To add your SSH private key, add the content of your private key to the environment variable `$SSH_PRIVATE_KEY`.

### Example

To use this image via GitLab CI add the following to the `.gitlab-ci.yml`:

```yaml
deploy:
  stage: deploy
  image: sourceboat/deploy:latest
  script:
    - ssh $HOST <your command>
```

Make sure, the environment variable `$SSH_KNOWN_HOSTS` and/or `$SSH_PRIVATE_KEY` are set in your project settings.

## Changelog

Check [releases](https://github.com/sourceboat/deploy/releases) for all notable changes.

## Credits

- [Phil-Bastian Berndt](https://github.com/pehbehbeh)
- [All Contributors](https://github.com/sourceboat/deploy/graphs/contributors)

## License

The MIT License (MIT). Please see [License File](LICENSE.md) for more information.
