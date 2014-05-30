class dojekyll (

  # class arguments
  # ---------------
  # setup defaults

  $user = 'web',
  $group_name = 'www-data',

  # end of class arguments
  # ----------------------
  # begin class

) {

  exec { 'dojekyll-install-rvm-ruby':
    path => '/bin:/sbin:/usr/bin:/usr/sbin',
    command => 'curl -L https://get.rvm.io | bash -s stable --ruby=2.0.0'
    require => [Class['docommon::dev']],
  }->
  exec { 'dojekyll-install-jekyll':
    path => '/bin:/sbin:/usr/bin:/usr/sbin',
    command => 'bash -c "source /usr/local/rvm/scripts/rvm && gem install -q --no-rdoc jekyll"',
    require => [Class['donodejs']],
  }

}
