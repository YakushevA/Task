#!/usr/bin/perl
$VHOST1 = $ENV{'VHOST1'};
$VHOST2 = $ENV{'VHOST2'};
$VHOST3 = $ENV{'VHOST3'};
($NAME1,$PORT1) = split(/:/,$VHOST1);
($NAME2,$PORT2) = split(/:/,$VHOST2);
($NAME3,$PORT3) = split(/:/,$VHOST3);
system("cp", "/default", "/etc/nginx/sites-available/$NAME1");
system("cp", "/default", "/etc/nginx/sites-available/$NAME2");
system("cp", "/default", "/etc/nginx/sites-available/$NAME3");
system("sed", "-i", "s/_PORT_/$PORT1/", "/etc/nginx/sites-available/$NAME1");
system("sed", "-i", "s/_NAME_/$NAME1/", "/etc/nginx/sites-available/$NAME1");
system("sed", "-i", "s/_PORT_/$PORT2/", "/etc/nginx/sites-available/$NAME2");
system("sed", "-i", "s/_NAME_/$NAME2/", "/etc/nginx/sites-available/$NAME2");
system("sed", "-i", "s/_PORT_/$PORT3/", "/etc/nginx/sites-available/$NAME3");
system("sed", "-i", "s/_NAME_/$NAME3/", "/etc/nginx/sites-available/$NAME3");
system("ln", "-s", "/etc/nginx/sites-available/$NAME1", "/etc/nginx/sites-enabled/$NAME1");
system("ln", "-s", "/etc/nginx/sites-available/$NAME2", "/etc/nginx/sites-enabled/$NAME2");
system("ln", "-s", "/etc/nginx/sites-available/$NAME3", "/etc/nginx/sites-enabled/$NAME3");
system("rm", "/etc/nginx/sites-available/default");
system("echo VHOST1:$NAME1:$PORT1 > /variable.txt");
system("echo VHOST2:$NAME2:$PORT2 >> /variable.txt");
system("echo VHOST3:$NAME3:$PORT3 >> /variable.txt");
system("service nginx start");

