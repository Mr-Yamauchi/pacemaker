��            )   �      �  $   �  \   �  %   #  2   I     |  �  �  <  &  �  c  b  [	  A   �
  I         J     ]     v       /   �  "   �     �  %     ,   2  v   _     �  Z   �  Z   O     �  p   �  �   )  T   �       '    $   >  \   c  %   �  2   �       �  +  <  �  �     b  �  A   [  I   �     �     �          #  9   B  (   |  %   �  (   �  >   �  �   3  ,   �  ^   �  m   A     �  �   �  �   8  p   �     >                                                                                  
                         	                              
  # /etc/init.d/openais start
	     
  # grep -e "openais.*network interface" -e "AIS Executive Service" /var/log/messages
	     
  # grep CLM /var/log/messages
	     
  # grep pcmk_plugin_init /var/log/messages
	     
  # ps axf
	     
  3718 ?        Ssl    0:05 /usr/sbin/aisexec
  3723 ?        SLs    0:00  \_ /usr/lib64/heartbeat/stonithd
  3724 ?        S      0:05  \_ /usr/lib64/heartbeat/cib
  3725 ?        S      0:21  \_ /usr/lib64/heartbeat/lrmd
  3726 ?        S      0:01  \_ /usr/lib64/heartbeat/attrd
  3727 ?        S      0:00  \_ /usr/lib64/heartbeat/pengine
  3728 ?        S      0:01  \_ /usr/lib64/heartbeat/crmd
	     
  Aug 27 16:23:37 test1 openais[26337]: [MAIN ] AIS Executive Service RELEASE 'subrev 1152 version 0.80'
  Aug 27 16:23:38 test1 openais[26337]: [MAIN ] AIS Executive Service: started and ready to provide service.
  Aug 27 16:23:38 test1 openais[26337]: [TOTEM] The network interface [192.168.9.41] is now up.
	     
  Aug 27 16:53:15 test1 openais[2166]: [CLM  ] CLM CONFIGURATION CHANGE
  Aug 27 16:53:15 test1 openais[2166]: [CLM  ] New Configuration:
  Aug 27 16:53:15 test1 openais[2166]: [CLM  ] Members Left:
  Aug 27 16:53:15 test1 openais[2166]: [CLM  ] Members Joined:
  Aug 27 16:53:15 test1 openais[2166]: [CLM  ] CLM CONFIGURATION CHANGE
  Aug 27 16:53:15 test1 openais[2166]: [CLM  ] New Configuration:
  Aug 27 16:53:15 test1 openais[2166]: [CLM  ]     r(0) ip(192.168.9.41) 
  Aug 27 16:53:15 test1 openais[2166]: [CLM  ] Members Left:
  Aug 27 16:53:15 test1 openais[2166]: [CLM  ] Members Joined:
  Aug 27 16:53:15 test1 openais[2166]: [CLM  ]     r(0) ip(192.168.9.41) 
  Aug 27 16:53:15 test1 openais[2166]: [CLM  ] got nodejoin message 192.168.9.41
	     
  Aug 27 16:53:15 test1 openais[2166]: [pcmk ] info: pcmk_plugin_init: CRM: Initialized
  Aug 27 16:53:15 test1 openais[2166]: [pcmk ] Logging: Initialized pcmk_plugin_init
  Aug 27 16:53:15 test1 openais[2166]: [pcmk ] info: pcmk_plugin_init: Service: 9
  Aug 27 16:53:15 test1 openais[2166]: [pcmk ] info: pcmk_plugin_init: Local hostname: test1
	     
  Starting Corosync daemon (aisexec): starting... rc=0: OK
	     
  logging {
      to_syslog: yes
      syslog_facility: daemon
  }
	     Checking Pacemaker Confirm Corosync Started Corosync Debugging Cluster Startup Expected Pacemaker startup logging for Corosync Expected log messages - membership Expected log messages - startup Expected output when starting openais Expected process listing on a 64-bit machine If you don't see these messages, or some like them, there is likely a problem finding or loading the pacemaker plugin. Minimum logging configuration Now that we have confirmed that Corosync is functional we can check the rest of the stack. On 32-bit systems the exact path may differ, but all the above processes should be listed. Prerequisites The exact messages will differ, but you should see a new membership formed with the real IP address of your node The versions may differ, but you should see Corosync indicate it started and sucessfully attached to the machine's network interface Whatever other logging you have, these two lines are required for Pacemaker clusters translator-credits Project-Id-Version: PACKAGE VERSION
POT-Creation-Date: 2011-09-24 23:25+0300
PO-Revision-Date: 2011-09-25 10:33+0200
Last-Translator: Dan Frîncu <df.cluster@gmail.com>
Language-Team: LANGUAGE <LL@li.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
 
  # /etc/init.d/openais start
	     
  # grep -e "openais.*network interface" -e "AIS Executive Service" /var/log/messages
	     
  # grep CLM /var/log/messages
	     
  # grep pcmk_plugin_init /var/log/messages
	     
  # ps axf
	     
  3718 ?        Ssl    0:05 /usr/sbin/aisexec
  3723 ?        SLs    0:00  \_ /usr/lib64/heartbeat/stonithd
  3724 ?        S      0:05  \_ /usr/lib64/heartbeat/cib
  3725 ?        S      0:21  \_ /usr/lib64/heartbeat/lrmd
  3726 ?        S      0:01  \_ /usr/lib64/heartbeat/attrd
  3727 ?        S      0:00  \_ /usr/lib64/heartbeat/pengine
  3728 ?        S      0:01  \_ /usr/lib64/heartbeat/crmd
	     
  Aug 27 16:23:37 test1 openais[26337]: [MAIN ] AIS Executive Service RELEASE 'subrev 1152 version 0.80'
  Aug 27 16:23:38 test1 openais[26337]: [MAIN ] AIS Executive Service: started and ready to provide service.
  Aug 27 16:23:38 test1 openais[26337]: [TOTEM] The network interface [192.168.9.41] is now up.
	     
  Aug 27 16:53:15 test1 openais[2166]: [CLM  ] CLM CONFIGURATION CHANGE
  Aug 27 16:53:15 test1 openais[2166]: [CLM  ] New Configuration:
  Aug 27 16:53:15 test1 openais[2166]: [CLM  ] Members Left:
  Aug 27 16:53:15 test1 openais[2166]: [CLM  ] Members Joined:
  Aug 27 16:53:15 test1 openais[2166]: [CLM  ] CLM CONFIGURATION CHANGE
  Aug 27 16:53:15 test1 openais[2166]: [CLM  ] New Configuration:
  Aug 27 16:53:15 test1 openais[2166]: [CLM  ]     r(0) ip(192.168.9.41) 
  Aug 27 16:53:15 test1 openais[2166]: [CLM  ] Members Left:
  Aug 27 16:53:15 test1 openais[2166]: [CLM  ] Members Joined:
  Aug 27 16:53:15 test1 openais[2166]: [CLM  ]     r(0) ip(192.168.9.41) 
  Aug 27 16:53:15 test1 openais[2166]: [CLM  ] got nodejoin message 192.168.9.41
	     
  Aug 27 16:53:15 test1 openais[2166]: [pcmk ] info: pcmk_plugin_init: CRM: Initialized
  Aug 27 16:53:15 test1 openais[2166]: [pcmk ] Logging: Initialized pcmk_plugin_init
  Aug 27 16:53:15 test1 openais[2166]: [pcmk ] info: pcmk_plugin_init: Service: 9
  Aug 27 16:53:15 test1 openais[2166]: [pcmk ] info: pcmk_plugin_init: Local hostname: test1
	     
  Starting Corosync daemon (aisexec): starting... rc=0: OK
	     
  logging {
      to_syslog: yes
      syslog_facility: daemon
  }
	     Verificarea Pacemaker Confirmare Corosync A Pornit Corosync Depanarea Pornirii Clusterului Log-urile Pacemaker aşteptate la pornire pentru Corosync Mesaje de log aşteptate - apartenenţă Mesaje de log aşteptate - la pornire Rezultatul aşteptat la pornirea openais Procesele aşteptate la o listare pe o maşină pe 64 de biţi Dacă nu vedeţi aceste mesaje sau unele similare, este probabil o problemă în găsirea sau încărcarea plugin-ului pacemaker. Configuraţia minim necesară pentru log-uri Acum că am confirmat că procesul Corosync este funcţional putem verifica şi restul stivei. Pe sisteme pe 32 de biţi calea poate fi diferită, dar toate procesele de mai sus ar trebui să fie listate. Premise Mesajele exacte pot fi diferite, însă ar trebui sa vedeţi o nouă apartenenţă formată cu adresa IP reală a nodului vostru Versiunile pot fi diferite, însă ar trebui să vedeţi Corosync indicând că a pornit şi s-a ataşat cu succes la interfaţa de retea a maşinii Indiferent de ce alt tip de log-uri există, aveste două linii sunt necesare pentru clusterele de tip Pacemaker meritele traducătorului 