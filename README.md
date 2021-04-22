# radar_parser

Simple Perl script to take the exported data from a google sheet, in tsv format, and convert it into a csv format that is parsable by the [build-your-own-radar](https://hub.docker.com/r/wwwthoughtworks/build-your-own-radar) docker image

```
# tsv headers
name    ring    quadrant        isNew   description     URL     Used on project    People to talk to       Warnings

# csv headers
name    ring    quadrant        isNew   description
```

Everything after description is concatenated into description if it has a value.

```
Usage:
./process.pl input.tsv > output.csv
```
