#!/bin/bash
# Flags para o MySQLdump
DUMPOPTS="--no-create-info --skip-add-drop-table"
# Informações de conexão
CONNOPTS="-uopendatabio -p opendatabio"
DATE=`date +%Y-%m-%d`
LOCATIONSEED=LocationSeed_Brazil_$DATE.sql
TAXONSEED=TaxonSeed_Brazil_APGIV_$DATE.sql

# Gera o dump
mysqldump $DUMPOPTS $CONNOPTS locations > $LOCATIONSEED
# Adiciona o comando para remover os locations existentes
sed -i '15a\
SET FOREIGN_KEY_CHECKS=0;\
DELETE FROM locations;
' $LOCATIONSEED
# Comprime o arquivo
tar czf $LOCATIONSEED.tar.gz $LOCATIONSEED

# Gera o dump
mysqldump $DUMPOPTS $CONNOPTS taxons taxon_external > $TAXONSEED
# Adiciona o comando para remover os taxons existentes
sed -i '15a\
SET FOREIGN_KEY_CHECKS=0;\
DELETE FROM taxons;\
DELETE FROM taxon_external;
' $TAXONSEED
# Comprime o arquivo
tar czf $TAXONSEED.tar.gz $TAXONSEED
