#bin/ksh

#Pupose of this Pl/sql block to valid and referesh 
echo 'start pl-sql bloack..'
##
##
exec_mv_func()
{

#notify the invalid 
if [ `wc -l text.txt | cut -d " " -f1` -ne 0 ]
then
awk 'BEGIN {
FS="|"
print  "Content-Type: text/html"
print  "<HTML>" "<p>Hi,</p><p>Please find below the Invalid ,</p>""<TABLE border="1"><tr bgcolor=red><TH>MViews</TH><TH>Status</TH>"
}
 {
printf "<TR>"
for(i=1;i<=NF;i++)
printf "<TD>%s</TD>", $i
print "</TR>"
 }
END{
print "</TABLE></tr><p></p><p></p></BODY></HTML>"
 } ' test> MVH.html

FILES=`awk -F'|' '{ print $1 }' MV_HealthCheck.txt`
>MV_STATUS.txt
for j in $FILES
do
EXIT;
/
EOF`
echo "$j""," "$MV" >>STATUS.txt

done
if [ `wc -l STATUS.txt | cut -d " " -f1` -ne 0 ]
then
awk 'BEGIN {
FS=","
print  " "
print  "<HTML>" "<p>Status after Refresh...</p>""<TABLE border="1"><tr bgcolor=green><TH>MViews</TH><TH>Status</TH>"
}

fi

