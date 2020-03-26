#!/bin/sh
#!/bin/echo
read -p 'Username: ' uservar
echo $uservar
read -p "HOST IP/Name: " IP
echo $IP
read -p "Database Name: " DBNAME
echo $DBNAME
echo " <---------- Deleting transaction table data, Please enter the password for Hosted DB  ----------> "
echo " "
echo " <--------- This Script will delete tables like virtual_inventory, inventory, status, documents, document_rows, document_attachment ---------->"
echo ""
export PGPASSWORD= postgres
psql -h $IP -p 5432 -U $uservar -d $DBNAME -W << EOF
delete from  virtual_inventory;
delete from inventory;
delete from status;
delete from document_attachment;
delete from document_rows;
delete from document;
EOF
