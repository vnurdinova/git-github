node default{
class { 'linux': }                #class helps to avoid repetitive code and keep our manifest nice and clean and easily readable.
}

class linux {
  $admintools = ['git','nano','screen']      #array is a series of values.

  packaage { $admintools:
     ensure => 'installed',
           }
$httpservice = $osfamily?{        #this is selectar. It selects value out of possible values.
      'redhat' => 'httpd',
      'debian' => 'http',
      default  => 'httpd',}

package { '$httpservice':
 ensure => 'installed',
        }

service { '$httpservice':
 ensure => 'running',
 enable => true,
        }

}

