# docker-naviseccli
A Docker container to simplify running EMC's `naviseccli` utility for the management of Navisphere-based storage systems.

## Requirements
A few things are required to use this utility on your machine:
 - a fairly recent [Docker installation](https://www.docker.com/community-edition#/download)
 - a compatible EMC storage system (e.g. the EMC VNX family, the CLARiiON CX family, and various Celerra systems)
 - the [binary RPM package](https://download.emc.com/downloads/DL34038_Navisphere-CLI-(Linux-x32)-7.30.15.0.44.rpm) of `naviseccli` from EMC (you will actually have to login)

Beware that `naviseccli` **does not support** recent EMC storage systems. You might want to take a look [at my repository](https://github.com/lxndrp/docker-uemcli) for Unisphere-based systems.

## Installation and Usage
Because I can't redistribute the original RPM, you have to build your own local Docker image, like so:
 1. Clone this repository.
 2. Drop the downloaded RPM in the same folder as the `Dockerfile`.
 3. Open a shell and run
 ```bash
 docker image build . -t local/naviseccli:7.30.15.0.44-1 -t local/naviseccli:latest
 ```

After that, you can execute
```bash
docker run -ti --rm --volume ~/.emc:/root/.emc local/naviseccli
```
on your favourite shell.

During the first run, `naviseccli` will (provided that you successfully login to your storage system **and** pass the `--save-user` switch to it) store your encrypted credentials on the mounted container volume. Subsequent runs will pick them up and use them to seamlessly authenticate you.

If you happen to be lazy, feel free to take a look at the naviseccli.alias (using the `alias` BUILTIN of `sh(1)` under *NIX) or naviseccli.alias.cmd (using the `DOSKEY` utility under Windows) file; make sure that it gets processed by your shell, and you can run the command by it's name directly.

Note that this is not a tutorial on how to use `naviseccli`; EMC did a great job in writing a comprehensive [user manual](https://support.emc.com/docu10323_Navisphere-Command-Line-Interface-(CLI)-Reference.pdf); for quick help, try to run
```bash
$ naviseccli -help
```
to get a few details on the most common parameters and switches, but since the command is quite powerful, I recommend you to [RTFM](http://www.urbandictionary.com/define.php?term=RTFM).

## Contributing
If you happen to find a bug or have a suggestion for improvement, feel free to open an issue. Thanks!