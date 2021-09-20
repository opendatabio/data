#!/bin/bash
# Flags para o MySQLdump
DUMPOPTS="--no-create-info --skip-add-drop-table"
# Informações de conexão
CONNOPTS="-uroot -p opendatabio"
DATE=`date +%Y-%m-%d`
LOCATIONSEED=LocationSeed_Brazil_$DATE.sql
TAXONSEED=TaxonSeed_APWebOrderLevelTree_$DATE.sql

# Gera o dump
docker exec -i odb_mysql mysqldump $DUMPOPTS $CONNOPTS locations location_related > $LOCATIONSEED
# Adiciona o comando para remover os locations existentes
sed -i '16a\
SET FOREIGN_KEY_CHECKS=0;\
DELETE FROM locations;\
DELETE FROM location_related;
' $LOCATIONSEED
# Comprime o arquivo
tar czf $LOCATIONSEED.tar.gz $LOCATIONSEED

# Gera o dump
docker exec -i odb_mysql mysqldump $DUMPOPTS $CONNOPTS taxons taxon_external > $TAXONSEED
# Adiciona o comando para remover os taxons existentes
sed -i '16a\
SET FOREIGN_KEY_CHECKS=0;\
DELETE FROM taxons;\
DELETE FROM taxon_external;
' $TAXONSEED
# Comprime o arquivo
tar czf $TAXONSEED.tar.gz $TAXONSEED
