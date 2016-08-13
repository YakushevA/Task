#!/usr/bin/perl
$HELLO = $ENV{'OUTPUT_STRING'};
if ($HELLO eq "Hello-Alice")
{
	system("echo Hello-Alice > /var/www/docker-alice/site/index.html");
	system("cp", "/apache-default", "/etc/apache2/sites-available/docker-alice.conf");
	system("sed", "-i", "s/_NAME_/docker-alice/", "/etc/apache2/sites-available/docker-alice.conf");
	system("a2ensite", "docker-alice.conf");
	system("a2dissite", "docker-bob.conf");
	system("a2dissite", "docker-tom.conf");
}
if ($HELLO eq "Hello-Bob")
{
	system("echo Hello-Bob > /var/www/docker-bob/site/index.html");
	system("cp", "/apache-default", "/etc/apache2/sites-available/docker-bob.conf");
	system("sed", "-i", "s/_NAME_/docker-bob/", "/etc/apache2/sites-available/docker-bob.conf");
	system("a2ensite", "docker-bob.conf");
	system("a2dissite", "docker-alice.conf");
	system("a2dissite", "docker-tom.conf");

}
if ($HELLO eq "Hello-Tom")
{
	system("echo Hello-Tom > /var/www/docker-tom/site/index.html");
	system("cp", "/apache-default", "/etc/apache2/sites-available/docker-tom.conf");
	system("sed", "-i", "s/_NAME_/docker-tom/", "/etc/apache2/sites-available/docker-tom.conf");
	system("a2ensite", "docker-tom.conf");
	system("a2dissite", "docker-alice.conf");
	system("a2dissite", "docker-bob.conf");

}
system("a2dissite", "000-default");
system("apache2ctl -D FOREGROUND");





