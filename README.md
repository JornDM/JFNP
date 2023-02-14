# Welcome to JFNP!

Jorn's First Networking Project (JFNP) is my first personal project in which I will construct a fully functioning network using Vagrant and Ansible.
Feel free to use the code that I wrote in your own projects! And give this projet a star ;). 
The hostname of all the VM's are the names of the letters in the Latin Alphabet. 
All the VM's are in the ``192.168.10.0/24`` network and are connected with eachother using a **Host-Only Adapter**.  

## Contents 
This project has the following servers/machines:
1. A database server   
  * name: Alpha (VM-name: db)
  * type of database service: mariadb 
  * Runs the mariadb exporter (for prometheus)

2. A router 
  * name: Beta (VM-name: router)
  * Has **DNS** and **DHCP** service through `dnsmasq`.
  * Also works as a **NAT router** through `iptables`.
  * Runs the dnsmasq exporter (for prometheus)

3. A webserver
  * name: Gamma (VM-name: web)
  * type of webserver: Nginx
  * Runs a self-made simple webapplication
  * Also runs the apache exporter (for prometheus)


4. A monitoring server
  * name: Beta (VM-name: monitoring)
  * Runs Prometheus and Grafana 
  * Will Scrape the following data:
    * mariadb (queries, uptime, etc.)
    * dnsmasq (nslookups, dhcp-leases, etc.)
      * For dnsmasq: I couldn't find a appropriate grafana dashboard that uses Prometheus as a datasource. I created one myself (_it is very simple, I know ;)_). You can find it in `vagrant/configfiles/monitor/dashboards/dnsmasq.json`.
    * apache (uptime, amount of people visited the webpage, etc.)


## How to Deploy? 
TODO...

## Credits and Sources
1. This project uses the `ansible-skeleton`, created by [bertvv](https://github.com/bertvv). Thank you so much for this incredibly usefull skeleton. 
  * Check it out: [https://github.com/bertvv/ansible-skeleton](https://github.com/bertvv/ansible-skeleton)


