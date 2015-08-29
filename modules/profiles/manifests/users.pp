# Users profile
class profiles::users (
  $root_password = '$6$sR59IT59$3tmdaMQiYW.gYwiNLyROMpLizTWIEClweYFQbdi8bVJyKVZvKezJs.bTr2GX40bomHnR4vACW4wndarvVI1ly/' # SHA512 for 'changeme'
){

  user { 'root':
    password => $root_password
  }

}
