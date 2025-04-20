# meta-abc

Simple yocto layer example for advantech RSB-3720 board.

## Repo tool

Install the repo tool

```bash
mkdir -p ~/.bin
PATH="${HOME}/.bin:${PATH}"
curl https://storage.googleapis.com/git-repo-downloads/repo > ~/.bin/repo
chmod a+rx ~/.bin/repo
```

## Clone source code

To clone the full yocto advantech source tree

```bash
mkdir -p ~/work/advantech/imx-6.6.52-2.2.0-adv/
cd ~/work/advantech/imx-6.6.52-2.2.0-adv/

repo init -u https://github.com/Advantech-EECC/imx-manifest -b imx-linux-scarthgap-adv -m imx-6.6.52-2.2.0-adv.xml

```

## Add meta-abc

```bash
cd ~/work/advantech/imx-6.6.52-2.2.0-adv/sources/
git clone https://github.com/miketsukerman/meta-abc.git
```

## pull docker image

```bash
docker pull crops/poky:ubuntu-22.04
docker run --rm -it -v ./:/yocto crops/poky:ubuntu-22.04
```

## setup yocto build env

```bash
DISTRO=fsl-imx-wayland MACHINE=rsb3720 source imx-setup-release.sh -b build-wayland
```

## Update bblayers.conf

add following lines to bblayers.conf

```bash
${BSPDIR}/sources/meta-eecc-nxp
${BSPDIR}/sources/meta-abc
```

## Run the build

```bash
bitbake core-image-base
```
