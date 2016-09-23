
class php {
#install php5 and required modules
#install php5 for apache

  package {
  "php5": ensure => installed, notify => Class["apache2::service"];
    "php5-mysql" : ensure => installed;
    "phpmyadmin" : ensure => installed;
    "php5-curl" : ensure => installed;
    "php5-mcrypt": ensure => installed, notify => Class["apache2::service"];
  }

  file {
  "/etc/apache2/conf.d":
    ensure => directory,
    require => [Package['phpmyadmin'],Package['apache2']];
  }

  file {
  "/etc/apache2/conf.d/phpmyadmin.conf":
    target => "/etc/phpmyadmin/apache.conf",
    ensure => link,
    require => [Package['phpmyadmin'],Package['apache2'],File['/etc/apache2/conf.d']],
    notify => Class["apache2::service"];
  }
}
