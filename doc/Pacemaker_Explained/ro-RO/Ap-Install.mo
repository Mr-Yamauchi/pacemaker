��    #      4  /   L        c   	  B   m     �  H  �  e     &   r     �  <   �  =   �  �   -     �  '   �     �     �  5        C  �   P  �   �  �   k  j   	    �	  �   �
  [  �  �   �  U   p  ]   �  �   $  �   �  Z   �     �  $   �       "   9     \  '  o  c   �  B   �     >  H  Q  s   �  0        ?  >   ^  ?   �  �   �     k  (        �     �  >   �  	     �     �   �  �   T  v   !  .  �  3  �  �  �  �   ~  T   4  x   �  �       �  b   �     3   .   M      |   (   �      �                                                                             !                #                                 "      	             
             
  aisexec {
    user:  root
    group: root
  }
  service {
    name: pacemaker
    ver: 0
  }
	   
  bindnetaddr: fec0::1:a800:4ff:fe00:20 
  mcastaddr: ff05::1
	   
  crm respawn
	   
  totem {
      version: 2
      secauth: off
      threads: 0
      interface {
          ringnumber: 0
          bindnetaddr: 1.2.3.4
          mcastaddr: 226.94.1.1
          mcastport: 1234
      }
  }
  logging {
      fileline: off
      to_syslog: yes
      syslog_facility: daemon
  }
  amf {
      mode: disabled
  }
	 Add the following to a functional <filename>ha.cf</filename> configuration file and restart Heartbeat An example Corosync configuration file Choosing a Cluster Stack Configuration fragment for enabling Pacemaker under Corosync Configuration fragment for enabling Pacemaker under Heartbeat Corosync is an OSI Certified implementation of an industry standard (the Service Availability Forum Application Interface Specification). Enabling Pacemaker Example options for an IPv6 environment For Corosync For Heartbeat Here are some factors that may influence the decision Installation It is also possible to configure Corosync for an IPv6 based environment. Simply configure bindnetaddr and mcastaddr with their IPv6 equivalents. Eg It is likely that Pacemaker, at some point in the future, will make use of some of these additional services not provided by Heartbeat Please consult the <ulink url="http://www.corosync.org/">Corosync website</ulink> and documentation for details on enabling encryption and peer authentication for the cluster. SUSE/Novell, Red Hat and Oracle are all putting their collective weight behind the Corosync cluster stack. The Corosync configuration is normally located in <filename>/etc/corosync/corosync.conf</filename> and an example for a machine with an address of 1.2.3.4 in a cluster communicating on port 1234 (without peer authentication and message encryption) is shown below. The cluster needs to be run as root so that its child processes (the lrmd in particular) have sufficient privileges to perform the actions requested of it. After-all, a cluster manager that can't add an IP address or start apache is of little use. The interesting part of the configuration is the totem section. This is where we define the how the node can communicate with the rest of the cluster and what protocol version and options (including encryption<placeholder-1/>) it should use. Beginners are encouraged to use the values shown and modify the interface section based on their network. The logging should be mostly obvious and the amf section refers to the Availability Management Framework and is not covered in this document. The second directive is the one that actually instructs the cluster to run Pacemaker. To date, Pacemaker has received less real-world testing on Corosync than it has on Heartbeat. To tell Corosync to use the Pacemaker cluster manager, add the following fragment to a functional Corosync configuration and restart the cluster. Ultimately the choice of cluster stack is a personal decision that must be made in the context of you or your company's needs and strategic direction. Pacemaker currently functions equally well with both stacks. Using Corosync gives your applications access to the following additional cluster services checkpoint service cluster closed process group service distributed locking service extended virtual synchrony service translator-credits Project-Id-Version: PACKAGE VERSION
POT-Creation-Date: 2011-09-24 23:25+0300
PO-Revision-Date: 2011-09-25 18:43+0200
Last-Translator: Dan Frîncu <df.cluster@gmail.com>
Language-Team: LANGUAGE <LL@li.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
 
  aisexec {
    user:  root
    group: root
  }
  service {
    name: pacemaker
    ver: 0
  }
	   
  bindnetaddr: fec0::1:a800:4ff:fe00:20 
  mcastaddr: ff05::1
	   
  crm respawn
	   
  totem {
      version: 2
      secauth: off
      threads: 0
      interface {
          ringnumber: 0
          bindnetaddr: 1.2.3.4
          mcastaddr: 226.94.1.1
          mcastport: 1234
      }
  }
  logging {
      fileline: off
      to_syslog: yes
      syslog_facility: daemon
  }
  amf {
      mode: disabled
  }
	 Adăugaţi următoarele la fişierul de configurare <filename>ha.cf</filename> funcţional şi reporniţi Heartbeat Un exemplu de fişier de configurare al Corosync Alegerea unei stive de cluster Fragment de configurare pentru a activa Pacemaker sub Corosync Fragment de configurare pentru a activa Pacemaker sub Heartbeat Corosync este o implementare certificată OSI a unui standard al industriei (Service Availability Forum Application Interface Specification). Activarea Pacemaker Exemple de opţiuni pentru un mediu IPV6 Pentru Corosync Pentru Heartbeat Aceştia sunt câţiva factori care vă pot influenţa decizia Instalare Este totodată posibilă configurarea Corosync pentru un mediu bazat pe IPV6. Pur şi simplu se configurează bindnetaddr şi mcastaddr cu echivalentele IPV6 ale acestora. Ex Este probabil ca Pacemaker, la un moment dat în viitor, să utilizeze o parte din aceste servicii adiţionale care nu sunt furnizate de Heartbeat Vă rugăm să consultaţi <ulink url="http://www.corosync.org/">website-ul Corosync</ulink> şi documentaţia pentru detalii despre activarea criptării şi a autentificării partenerului pentru cluster. SUSE/Novell, Red Hat şi Oracle îşi pun la contribuţie greutatea colectivă în spatele stivei de cluster Corosync. Fişierul de configurare al Corosync se găseşte în mod normal în <filename>/etc/corosync/corosync.conf</filename> şi un exemplu pentru o maşină cu adresa 1.2.3.4 într-un cluster care comunică pe portul 1234 (fără autentificarea a partenerului sau criptarea mesajelor) este prezentat mai jos. Clusterul trebuie sa ruleze ca root pentru ca şi procesele copil ale acestuia (lrmd în particular) să aibe suficiente privilegii pentru a îndeplini acţiunile care i s-au cerut. La urma urmei, un manager de cluster care nu poate să adauge o adresă IP sau să pornească un apache este de puţin folos. Partea interesantă a configuraţiei o reprezintă secţiunea totem. Aici definim cum poate comunica un nod cu restul clusterului şi ce versiune de protocol şi opţiuni (incluzând criptarea<placeholder-1/>) ar trebui să folosească. Începătorii sunt încurajaţi să folosească valorile prezentate şi să modifice secţiunea referitoare la interfaţă pe baza reţelei acestora. Logarea ar trebui să fie în cea mai mare parte evidentă şi secţiunea amf se referă la Framework-ul pentru Gestiunea Disponibilităţii şi nu este acoperit în acest document. A doua directivă este cea care instruieşte de fapt clusterul să ruleze Pacemaker. Până în acest moment, Pacemaker a avut parte de mai puţină testare în "real-world" pe Corosync faţă de Heartbeat Pentru a îi spune Corosync-ului să folosească Pacemaker ca şi manager al clusterului, adăugaţi următorul fragment la o configuraţie funcţională de Corosync şi reporniţi clusterul. În ultimă instanţă alegerea unei stive de cluster este o decizie personală care trebuie realizată în contextul nevoilor şi a direcţiei strategice ale individului sau ale companiei. În momentul de faţă Pacemaker funcţionează la fel de bine cu ambele stive. Folosirea Corosync oferă aplicaţiilor dvs. acces la următoarele servicii de cluster adiţionale serviciu punct de control serviciu de grup de procese închis pe cluster serviciu de blocare distribuit serviciu de sincronie virtuală extinsă meritele traducătorului 