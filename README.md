# generate-debian-package plugin for Jenkins

Generate Debian package, my way

## How to use it?

### Warning!

For now, it really does something when your jenkins is hosted on a debian 7.



### Pre requisites

You need to have 

* theses package already setup

```
devscripts pbuilder dh-make fakeroot build-essential dh-autoreconf quilt
```

* administrative rights to run pbuilder
 * with sudo, in /etc/sudoers.d/jenkins

```
jenkins ALL=(ALL) NOPASSWD: /usr/sbin/pbuilder
```

### Setup

Download hpi file and follow [Jenkins](https://wiki.jenkins-ci.org/display/JENKINS/Plugins#Plugins-Howtoinstallplugins) guide

### Configuration

TODO

## Development

For development and to see this plugin in a test Jenkins server:

```
$ bundle install
$ jpi server
```

### Vagrant
You can use the vagrant by running in the root directory
```
vagrant up
```

Then you'll the latest stable jenkins browseable at http://192.168.33.10:8080

**NB**: no auth is setup!


## Contributing

1. Fork it
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Added some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create new Pull Request
