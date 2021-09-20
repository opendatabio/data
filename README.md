# Data
Seed  libraries for use during the installation of an OpenDataBio database. These datasets are created using the `mkdata.sh` (or `mkdata_docker.sh`) shell script from an ODB database of the developer. These seeds are loaded into an OpenDataBio during installation using the `php install` command.

The `seeds.json` file controls which seed file should be used for each OpenDataBio version (greater than 0.7.5, which is the first version to import seeds).

## Version notes

* 0.9.1.alpha1 - Locations for Brazil, including all admins, all federal conservation units, all indigenous areas and the mayor Biomes; Taxons including only the root nodes for kingdoms and the [APWeb order level tree](http://www.mobot.org/MOBOT/research/APweb/), with all relevant clades. Families, genera, species etc, are left to user demand, and easily imported using the Taxon import api.
* 0.7.5 to 0.8.0  - Locations for Brazil (admins only) - Taxons to species level (Brazil);
