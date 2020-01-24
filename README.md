# perl-tidier

[![Docker Cloud Automated build](https://img.shields.io/docker/cloud/automated/calebhankins/perl-tidier.svg?style=flat-square)](https://hub.docker.com/r/calebhankins/perl-tidier/)
[![Docker Cloud Build Status](https://img.shields.io/docker/cloud/build/calebhankins/perl-tidier.svg?style=flat-square)](https://hub.docker.com/r/calebhankins/perl-tidier/)

A Dockerfile to tidy perl code. Windows and Linux seem to have some kind of slight difference when applying tidy rules. This docker image will apply the Debian flavor to the mounted folder paired with the container's `/src/tidy-me` folder. 

- [perl-tidier](#perl-tidier)
- [A Word of Caution](#A-Word-of-Caution)
- [Build](#Build)
- [Run](#Run)
  - [Just tidyall my Files Please](#Just-tidyall-my-Files-Please)
  - [Explore and Test Run](#Explore-and-Test-Run)

# A Word of Caution
***This will overwrite files in the mounted directory! Use with caution and have your files backed up / under version control so you can track changes!***

# Build
These commands are run from the same folder as this readme.


```powershell
# Build
docker build --rm -f "Dockerfile" -t perl-tidier .

```
# Run

Swap '`c:/git/join-hero`' with the root path for your perl project. This project is expecting a [.tidyallrc](https://metacpan.org/pod/distribution/Code-TidyAll/bin/tidyall) at the root of your project.

## Just tidyall my Files Please

``` powershell
# Run
docker run --rm -v 'c:/git/join-hero:/src/tidy-me' perl-tidier
# [tidied]  lib/JoinHero.pm

```

## Explore and Test Run

```powershell
# Override default entrypoint and use bash to explore
docker run --rm -it --entrypoint "/bin/bash" -v 'c:/git/join-hero:/src/tidy-me' perl-tidier
```

```bash
root@72e8dbeb558d:/src/tidy-me# tidyall -r  --check-only ./lib/
[checked] lib/JoinHero.pm
*** needs tidying
```
