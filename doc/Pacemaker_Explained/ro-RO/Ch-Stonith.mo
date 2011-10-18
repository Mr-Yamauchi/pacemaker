��            )   �      �  �  �  �   %  �   �     �  �   �     �  J   �  �   �  �   �  �   �  v   �    
  �     &   �  �   �     �  �   �     �  �   �  '  2  �   Z  �   �  "   �     �  P   �  1        J     ]  '  b  �  �  �   .  �   �.     �/  �   �/     �0  K   �0  �   1  �   2  �   �2  �   �3  S  f4  �   �5  *   c6  �   �6  $   g7    �7     �8  �   �8  �  I9  �   �:  �   �;  -   ><     l<  J   �<  1   �<     =     !=                                                
                       	                                                                   
# stonith_admin --metadata -a fence_ipmilan

&lt;?xml version="1.0" ?&gt;
&lt;resource-agent name="fence_ipmilan" shortdesc="Fence agent for IPMI over LAN"&gt;
&lt;longdesc&gt;
fence_ipmilan is an I/O Fencing agent which can be used with machines controlled by IPMI. This agent calls support software using ipmitool (http://ipmitool.sf.net/).

To use fence_ipmilan with HP iLO 3 you have to enable lanplus option (lanplus / -P) and increase wait after operation to 4 seconds (power_wait=4 / -T 4)&lt;/longdesc&gt;
&lt;parameters&gt;
	&lt;parameter name="auth" unique="1"&gt;
		&lt;getopt mixed="-A" /&gt;
		&lt;content type="string" /&gt;
		&lt;shortdesc lang="en"&gt;IPMI Lan Auth type (md5, password, or none)&lt;/shortdesc&gt;
	&lt;/parameter&gt;
	&lt;parameter name="ipaddr" unique="1"&gt;
		&lt;getopt mixed="-a" /&gt;
		&lt;content type="string" /&gt;
		&lt;shortdesc lang="en"&gt;IPMI Lan IP to talk to&lt;/shortdesc&gt;
	&lt;/parameter&gt;
	&lt;parameter name="passwd" unique="1"&gt;
		&lt;getopt mixed="-p" /&gt;
		&lt;content type="string" /&gt;
		&lt;shortdesc lang="en"&gt;Password (if required) to control power on IPMI device&lt;/shortdesc&gt;
	&lt;/parameter&gt;
	&lt;parameter name="passwd_script" unique="1"&gt;
		&lt;getopt mixed="-S" /&gt;
		&lt;content type="string" /&gt;
		&lt;shortdesc lang="en"&gt;Script to retrieve password (if required)&lt;/shortdesc&gt;
	&lt;/parameter&gt;
	&lt;parameter name="lanplus" unique="1"&gt;
		&lt;getopt mixed="-P" /&gt;
		&lt;content type="boolean" /&gt;
		&lt;shortdesc lang="en"&gt;Use Lanplus&lt;/shortdesc&gt;
	&lt;/parameter&gt;
	&lt;parameter name="login" unique="1"&gt;
		&lt;getopt mixed="-l" /&gt;
		&lt;content type="string" /&gt;
		&lt;shortdesc lang="en"&gt;Username/Login (if required) to control power on IPMI device&lt;/shortdesc&gt;
	&lt;/parameter&gt;
	&lt;parameter name="action" unique="1"&gt;
		&lt;getopt mixed="-o" /&gt;
		&lt;content type="string" default="reboot"/&gt;
		&lt;shortdesc lang="en"&gt;Operation to perform. Valid operations: on, off, reboot, status, list, diag, monitor or metadata&lt;/shortdesc&gt;
	&lt;/parameter&gt;
	&lt;parameter name="timeout" unique="1"&gt;
		&lt;getopt mixed="-t" /&gt;
		&lt;content type="string" /&gt;
		&lt;shortdesc lang="en"&gt;Timeout (sec) for IPMI operation&lt;/shortdesc&gt;
	&lt;/parameter&gt;
	&lt;parameter name="cipher" unique="1"&gt;
		&lt;getopt mixed="-C" /&gt;
		&lt;content type="string" /&gt;
		&lt;shortdesc lang="en"&gt;Ciphersuite to use (same as ipmitool -C parameter)&lt;/shortdesc&gt;
	&lt;/parameter&gt;
	&lt;parameter name="method" unique="1"&gt;
		&lt;getopt mixed="-M" /&gt;
		&lt;content type="string" default="onoff"/&gt;
		&lt;shortdesc lang="en"&gt;Method to fence (onoff or cycle)&lt;/shortdesc&gt;
	&lt;/parameter&gt;
	&lt;parameter name="power_wait" unique="1"&gt;
		&lt;getopt mixed="-T" /&gt;
		&lt;content type="string" default="2"/&gt;
		&lt;shortdesc lang="en"&gt;Wait X seconds after on/off operation&lt;/shortdesc&gt;
	&lt;/parameter&gt;
	&lt;parameter name="delay" unique="1"&gt;
		&lt;getopt mixed="-f" /&gt;
		&lt;content type="string" /&gt;
		&lt;shortdesc lang="en"&gt;Wait X seconds before fencing is started&lt;/shortdesc&gt;
	&lt;/parameter&gt;
	&lt;parameter name="verbose" unique="1"&gt;
		&lt;getopt mixed="-v" /&gt;
		&lt;content type="boolean" /&gt;
		&lt;shortdesc lang="en"&gt;Verbose mode&lt;/shortdesc&gt;
	&lt;/parameter&gt;
&lt;/parameters&gt;
&lt;actions&gt;
	&lt;action name="on" /&gt;
	&lt;action name="off" /&gt;
	&lt;action name="reboot" /&gt;
	&lt;action name="status" /&gt;
	&lt;action name="diag" /&gt;
	&lt;action name="list" /&gt;
	&lt;action name="monitor" /&gt;
	&lt;action name="metadata" /&gt;
&lt;/actions&gt;
&lt;/resource-agent&gt;
 <ulink url="http://en.wikipedia.org/wiki/STONITH">STONITH</ulink> is an acronym for Shoot-The-Other-Node-In-The-Head and it protects your data from being corrupted by rogue nodes or concurrent access. Assuming we have an chassis containing four nodes and an IPMI device active on 10.0.0.1, then we would chose the <literal>fence_ipmilan</literal> driver in step 2 and obtain the following list of parameters Configuring STONITH Create a file called stonith.xml containing a primitive resource with a class of stonith, a type of <replaceable>type</replaceable> and a parameter for each of the values returned in step 2 Example Find the correct driver: <command>stonith_admin --list-installed</command> If the device does not expect the victim to be specified with the <constant>port</constant> parameter, you may also need to set the special <constant>pcmk_host_argument</constant> parameter. See <command>man stonithd</command> for details. If the device does not know how to fence nodes based on their uname, you may also need to set the special <constant>pcmk_host_map</constant> parameter. See <command>man stonithd</command> for details. If the device does not support the <constant>list</constant> command, you may also need to set the special <constant>pcmk_host_list</constant> and/or <constant>pcmk_host_check</constant> parameters. See <command>man stonithd</command> for details. It is crucial that the STONITH device can allow the cluster to differentiate between a node failure and a network one. Just because a node is unresponsive, this doesn't mean it isn't accessing your data. The only way to be 100% sure that your data is safe, is to use STONITH so we can be certain that the node is truly offline, before allowing the data to be accessed from another node. Likewise, any device that relies on the machine being active (such as SSH-based "devices" used during testing) are inappropriate. Obtaining a list of STONITH Parameters Once the stonith resource is running, you can test it by executing: <command>stonith_admin --reboot <replaceable>nodename</replaceable></command>. Although you might want to stop the cluster on that machine first. Protecting Your Data - STONITH STONITH also has a role to play in the event that a clustered service cannot be stopped. In this case, the cluster uses STONITH to force the whole node offline, thereby making it safe to start the service elsewhere. Sample STONITH Resource Since every device is different, the parameters needed to configure it will vary. To find out the parameters associated with the device, run: The biggest mistake people make in choosing a STONITH device is to use remote power switch (such as many on-board IMPI controllers) that shares power with the node it controls. In such cases, the cluster cannot be sure if the node is really offline, or active and suffering from a network fault. The output should be XML formatted text containing additional parameter descriptions. We will endevor to make the output more friendly in a later version. Upload it into the CIB using cibadmin: <command>cibadmin -C -o resources --xml-file <filename><replaceable>stonith.xml</replaceable></filename></command> What STONITH Device Should You Use Why You Need STONITH from which we would create a STONITH resource fragment that might look like this stonith_admin --metadata --agent <placeholder-1/> translator-credits type Project-Id-Version: PACKAGE VERSION
POT-Creation-Date: 2011-09-24 23:25+0300
PO-Revision-Date: 2011-10-18 23:10+0200
Last-Translator: Dan Frîncu <df.cluster@gmail.com>
Language-Team: LANGUAGE <LL@li.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
 
# stonith_admin --metadata -a fence_ipmilan

&lt;?xml version="1.0" ?&gt;
&lt;resource-agent name="fence_ipmilan" shortdesc="Fence agent for IPMI over LAN"&gt;
&lt;longdesc&gt;
fence_ipmilan is an I/O Fencing agent which can be used with machines controlled by IPMI. This agent calls support software using ipmitool (http://ipmitool.sf.net/).

To use fence_ipmilan with HP iLO 3 you have to enable lanplus option (lanplus / -P) and increase wait after operation to 4 seconds (power_wait=4 / -T 4)&lt;/longdesc&gt;
&lt;parameters&gt;
	&lt;parameter name="auth" unique="1"&gt;
		&lt;getopt mixed="-A" /&gt;
		&lt;content type="string" /&gt;
		&lt;shortdesc lang="en"&gt;IPMI Lan Auth type (md5, password, or none)&lt;/shortdesc&gt;
	&lt;/parameter&gt;
	&lt;parameter name="ipaddr" unique="1"&gt;
		&lt;getopt mixed="-a" /&gt;
		&lt;content type="string" /&gt;
		&lt;shortdesc lang="en"&gt;IPMI Lan IP to talk to&lt;/shortdesc&gt;
	&lt;/parameter&gt;
	&lt;parameter name="passwd" unique="1"&gt;
		&lt;getopt mixed="-p" /&gt;
		&lt;content type="string" /&gt;
		&lt;shortdesc lang="en"&gt;Password (if required) to control power on IPMI device&lt;/shortdesc&gt;
	&lt;/parameter&gt;
	&lt;parameter name="passwd_script" unique="1"&gt;
		&lt;getopt mixed="-S" /&gt;
		&lt;content type="string" /&gt;
		&lt;shortdesc lang="en"&gt;Script to retrieve password (if required)&lt;/shortdesc&gt;
	&lt;/parameter&gt;
	&lt;parameter name="lanplus" unique="1"&gt;
		&lt;getopt mixed="-P" /&gt;
		&lt;content type="boolean" /&gt;
		&lt;shortdesc lang="en"&gt;Use Lanplus&lt;/shortdesc&gt;
	&lt;/parameter&gt;
	&lt;parameter name="login" unique="1"&gt;
		&lt;getopt mixed="-l" /&gt;
		&lt;content type="string" /&gt;
		&lt;shortdesc lang="en"&gt;Username/Login (if required) to control power on IPMI device&lt;/shortdesc&gt;
	&lt;/parameter&gt;
	&lt;parameter name="action" unique="1"&gt;
		&lt;getopt mixed="-o" /&gt;
		&lt;content type="string" default="reboot"/&gt;
		&lt;shortdesc lang="en"&gt;Operation to perform. Valid operations: on, off, reboot, status, list, diag, monitor or metadata&lt;/shortdesc&gt;
	&lt;/parameter&gt;
	&lt;parameter name="timeout" unique="1"&gt;
		&lt;getopt mixed="-t" /&gt;
		&lt;content type="string" /&gt;
		&lt;shortdesc lang="en"&gt;Timeout (sec) for IPMI operation&lt;/shortdesc&gt;
	&lt;/parameter&gt;
	&lt;parameter name="cipher" unique="1"&gt;
		&lt;getopt mixed="-C" /&gt;
		&lt;content type="string" /&gt;
		&lt;shortdesc lang="en"&gt;Ciphersuite to use (same as ipmitool -C parameter)&lt;/shortdesc&gt;
	&lt;/parameter&gt;
	&lt;parameter name="method" unique="1"&gt;
		&lt;getopt mixed="-M" /&gt;
		&lt;content type="string" default="onoff"/&gt;
		&lt;shortdesc lang="en"&gt;Method to fence (onoff or cycle)&lt;/shortdesc&gt;
	&lt;/parameter&gt;
	&lt;parameter name="power_wait" unique="1"&gt;
		&lt;getopt mixed="-T" /&gt;
		&lt;content type="string" default="2"/&gt;
		&lt;shortdesc lang="en"&gt;Wait X seconds after on/off operation&lt;/shortdesc&gt;
	&lt;/parameter&gt;
	&lt;parameter name="delay" unique="1"&gt;
		&lt;getopt mixed="-f" /&gt;
		&lt;content type="string" /&gt;
		&lt;shortdesc lang="en"&gt;Wait X seconds before fencing is started&lt;/shortdesc&gt;
	&lt;/parameter&gt;
	&lt;parameter name="verbose" unique="1"&gt;
		&lt;getopt mixed="-v" /&gt;
		&lt;content type="boolean" /&gt;
		&lt;shortdesc lang="en"&gt;Verbose mode&lt;/shortdesc&gt;
	&lt;/parameter&gt;
&lt;/parameters&gt;
&lt;actions&gt;
	&lt;action name="on" /&gt;
	&lt;action name="off" /&gt;
	&lt;action name="reboot" /&gt;
	&lt;action name="status" /&gt;
	&lt;action name="diag" /&gt;
	&lt;action name="list" /&gt;
	&lt;action name="monitor" /&gt;
	&lt;action name="metadata" /&gt;
&lt;/actions&gt;
&lt;/resource-agent&gt;
 <ulink url="http://en.wikipedia.org/wiki/STONITH">STONITH</ulink> este un acronym de la Shoot-The-Other-Node-In-The-Head şi protejează datele voastre de la a fi corupte de către noduri pribege sau de la acces simultan. Presupunând că avem un şasiu conţinând patru noduri şi un dispozitiv IPMI activ pe 10.0.0.1, atunci am alege driverul <literal>fence_ipmilan</literal> la pasul 2 şi am obţine următoarea listă de parametri Configurarea STONITH Creaţi un fişier numit stonith.xml conţinând o resursă primitivă cu o clasă stonith, un tip de <replaceable>type</replaceable> şi un parametru pentru fiecare dintre valorile returnate la pasul 2 Exemplu Găsiţi driverul corect: <command>stonith_admin --list-installed</command> Dacă dispozitivul nu se aşteaptă ca victima să fie specificată cu parametrul <constant>port</constant>, ar putea fi nevoie să setaţi parametrul special <constant>pcmk_host_argument</constant>. Vedeţi <command>man stonithd</command> pentru detalii. Dacă dispozitivul nu ştie să evacueze noduri pe baza uname-ului acestora, ar putea fi nevoie să setaţi parametrul special <constant>pcmk_host_map</constant>. Vedeţi <command>man stonithd</command> pentru detalii. Dacă dispozitivul nu suportă comanda <command>list</command>, ar putea fi nevoie să setaţi parametrul special <constant>pcmk_host_list</constant> şi/sau <constant>pcmk_host_check</constant>. Vedeţi <command>man stonithd</command> pentru detalii. Este imperativ ca dispozitivul STONITH să permită clusterului să facă diferenţa între o defecţiune a nodului şi una a reţelei. Doar pentru că un nod nu mai răspunde, acest lucru nu înseamnă că acesta nu mai accesează datele voastre. Singura metodă de a fi 100% siguri că datele voastre sunt în siguranţă, este să folosiţi STONITH pentru a putea fi siguri că nodul este cu adevărat offline, înainte de a permite datelor să fie accesate de pe alt nod. În mod similar, orice dispozitiv care se bazează pe maşină să fie activă (cum ar fi "dispozitivele" bazate pe SSH folosite în timpul testării) sunt nepotrivite. Obţinerea unei liste de Parametri STONITH Odată ce resursa stonith rulează, o puteţi testa executând: <command>stonith_admin --reboot <replaceable>nodename</replaceable></command>. Deşi aţi putea dori să opriţi clusterul pe acea maşină mai întâi. Protejarea Datelor Voastre - STONITH STONITH mai are un rol pe care îl joacă în cazul în care un serviciu de pe cluster nu poate fi oprit. În acest caz, clusterul foloseşte STONITH pentru a forţa întregul nod offline, astfel făcând să fie sigurâ pornirea serviciului în altă parte. Exemplu de Resursă STONITH Din moment ce fiecare dispozitiv este diferit, parametrii necesari să îl configureze vor varia. Pentru a afla parametrii asociaţi dispozitivului, rulaţi: Cea mai mare greşeală pe care o fac oamenii în alegerea unui dispozitiv STONITH este să folosească un switch de curent cu acces la distanţă (cum ar fi multe controlere IPMI integrate) care partajează curentul cu nodul pe care îl controlează. În astfel de cazuri, clusterul nu poate fi sigur dacă nodul este cu adevărat offline sau inactiv şi suferind din cauza unei probleme de reţea. Rezultatul de ieşire ar trebui să fie text formatat XML conţinând descrierile parametrilor adiţionali. Ne vom aventura să facem rezultatul de ieşire mai prietenos într-o versiune ulterioară. Încărcaţi-l în CIB folosind cibadmin: <command>cibadmin -C -o resources --xml-file <filename><replaceable>stonith.xml</replaceable></filename></command> Ce Dispozitiv STONITH Ar Trebui Să Folosiţi De Ce Aveţi Nevoie De STONITH din care am crea un fragment de resursă STONITH care ar putea arăta aşa stonith_admin --metadata --agent <placeholder-1/> meritele-traducătorului type 