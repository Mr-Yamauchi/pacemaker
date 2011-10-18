��    ]           �      �  �  �  �  �  �   z  �  <     �  	          D   #  F   h  Q   �  R     =   T  W   �  +   �  _        v  6   �  \   �  P   !  %   r     �     �  <   �  *     P   0  i   �  ;   �     '  V   �  1  �  (   0  +   Y  H   �    �      �   V   �   )   O!  M   y!  �   �!  X   i"     �"  a   �"    *#  ;   E$  <   �$  *   �$  l   �$  �   V%  >   &  	   @&  L   J&     �&  J   �&  :   �&     9'     T'  1   r'  R   �'     �'  s   (  �   �(  "   j)      �)    �)  g   �*  �   .+  <   ,  0  I,  �   z-  �  A.  g  �/  C   d2  �   �2  -   k3  �   �3  ,   E4  3   r4  �   �4    05  G   E6     �6  2   �6  :   �6  %   7  ;   ?7  ,   {7  -   �7  P   �7     '8  7   /8     g8  
   z8  '  �8  �  �9  �  H=  �   >A  �   B     �G  	   �G     �G  E   �G  G   -H  a   uH  r   �H  L   JI  h   �I  ,    J  z   -J     �J  F   �J  Z   K  X   aK  ,   �K  #   �K     L  >    L  *   _L  d   �L  p   �L  C   `M  �   �M  e   0N  �   �N  0   dO  >   �O  a   �O  _  6P  1   �S  o   �S  6   8T  i   oT  �   �T  ^   U     �U  }   �U  B  cV  D   �W  N   �W  3   :X  �   nX  �   �X  ?   �Y     �Y  `   �Y  $   QZ  L   vZ  L   �Z  (   [  +   9[  :   e[  T   �[     �[  �   \    �\  .   �]     �]  &  ^  w   4_  �   �_  H   �`  \  �`  �   <b  �  +c  �  e  I   �g  �   h  4   i  �   7i  .   ,j  L   [j  �   �j  )  Kk  G   ul     �l  2   �l  :   m  %   Im  ;   om  ,   �m  -   �m  P   n     Wn  M   _n     �n  
   �n        .   '                 5   F         C   A      1   O       Z   H      V      "   @   M               4   2   >   7            6       &   G   Y              3   !   K   X   ?   P         D       J       :   <       ;               0             	   L       /   B   [   E      +                      )              ]                 -          %   I   8   
          ,   9             N   R   (   \       S   $      =       Q   W              T       #              U   *    
  <placeholder-1/>
  ============
  Last updated: Fri Nov 23 15:26:13 2007
  Current DC: sles-3 (2298606a-6a8c-499a-9d25-76242f7006ec)
  3 Nodes configured.
  5 Resources configured.
  ============

  Node: sles-1 (1186dc9a-324d-425a-966e-d757e693dc86): online
      192.168.100.181    (heartbeat::ocf:IPaddr):    Started sles-1
      192.168.100.182    (heartbeat:IPaddr):        Started sles-1
      192.168.100.183    (heartbeat::ocf:IPaddr):    Started sles-1
      rsc_sles-1    (heartbeat::ocf:IPaddr):    Started sles-1
      child_DoFencing:2    (stonith:external/vmware):    Started sles-1
  Node: sles-2 (02fb99a8-e30e-482f-b3ad-0fb3ce27d088): standby
  Node: sles-3 (2298606a-6a8c-499a-9d25-76242f7006ec): online
      rsc_sles-2    (heartbeat::ocf:IPaddr):    Started sles-3
      rsc_sles-3    (heartbeat::ocf:IPaddr):    Started sles-3
      child_DoFencing:0    (stonith:external/vmware):    Started sles-3 
  <placeholder-1/>
  ============
  Last updated: Fri Nov 23 15:26:13 2007
  Current DC: sles-3 (2298606a-6a8c-499a-9d25-76242f7006ec)
  3 Nodes configured.
  5 Resources configured.
  ============

  Node: sles-1 (1186dc9a-324d-425a-966e-d757e693dc86): online
  Node: sles-2 (02fb99a8-e30e-482f-b3ad-0fb3ce27d088): standby
  Node: sles-3 (2298606a-6a8c-499a-9d25-76242f7006ec): online

  Resource Group: group-1
    192.168.100.181    (heartbeat::ocf:IPaddr):    Started sles-1
    192.168.100.182    (heartbeat:IPaddr):        Started sles-1
    192.168.100.183    (heartbeat::ocf:IPaddr):    Started sles-1
  rsc_sles-1    (heartbeat::ocf:IPaddr):    Started sles-1
  rsc_sles-2    (heartbeat::ocf:IPaddr):    Started sles-3
  rsc_sles-3    (heartbeat::ocf:IPaddr):    Started sles-3
  Clone Set: DoFencing
    child_DoFencing:0    (stonith:external/vmware):    Started sles-3
    child_DoFencing:1    (stonith:external/vmware):    Stopped
    child_DoFencing:2    (stonith:external/vmware):    Started sles-1 
 # <command>crm_shadow --create test</command>
 Setting up shadow instance
 Type Ctrl-D to exit the crm_shadow shell
 shadow[test]: 
 shadow[test] # <command>crm_shadow --which</command>
 test 
 shadow[test] # <command>crm_failcount -G -r rsc_c001n01</command>
  name=fail-count-rsc_c001n01 value=0
 shadow[test] # <command>crm_standby -v on -n c001n02</command>
 shadow[test] # <command>crm_standby -G -n c001n02</command>
 name=c001n02 scope=nodes value=on
 shadow[test] # <command>cibadmin --erase --force</command>
 shadow[test] # <command>cibadmin --query</command>
<![CDATA[
 <cib cib_feature_revision="1" validate-with="pacemaker-1.0" admin_epoch="0" crm_feature_set="3.0" have-quorum="1" epoch="112"
      dc-uuid="c001n01" num_updates="1" cib-last-written="Fri Jun 27 12:17:10 2008">
    <configuration>
       <crm_config/>
       <nodes/>
       <resources/>
       <constraints/>
    </configuration>
    <status/>
 </cib>
]]>
  shadow[test] # <command>crm_shadow --delete test --force</command>
  Now type Ctrl-D to exit the crm_shadow shell
  shadow[test] # <command>exit</command>
  # <command>crm_shadow --which</command>
  No shadow instance provided
  # <command>cibadmin -Q</command>
<![CDATA[
 <cib cib_feature_revision="1" validate-with="pacemaker-1.0" admin_epoch="0" crm_feature_set="3.0" have-quorum="1" epoch="110"
       dc-uuid="c001n01" num_updates="551">
    <configuration>
       <crm_config>
          <cluster_property_set id="cib-bootstrap-options">
             <nvpair id="cib-bootstrap-1" name="stonith-enabled" value="1"/>
             <nvpair id="cib-bootstrap-2" name="pe-input-series-max" value="30000"/>
]]>
	 # cibadmin -Q | grep stonith # crm_mon # crm_mon -n @@image: 'images/Policy-Engine-big.png'; md5=THIS FILE DOESN'T EXIST @@image: 'images/Policy-Engine-small.png'; md5=THIS FILE DOESN'T EXIST Actions with a blue border are ones the cluster does not feel need to be executed Actions with a dashed border of any color do not form part of the transition graph Actions with a green border form part of the transition graph Actions with a red border are ones the cluster would like to execute but are unrunnable Actions with black text are sent to the LRM Actions with orange text are pseudo/pretend actions that the cluster uses to simplify the graph An empty configuration An example transition graph as represented by Graphviz Another, slightly more complex, transition graph that you're not expected to be able to read Any action depending on an action with a red border will not be able to execute. Arrows indicate ordering dependencies Complex Cluster Transition Configuration Basics Configuration options (called <literal>crm_config</literal>) Creating and displaying the active sandbox Dashed-arrows indicate dependencies that are not present in the transition graph Details on all the available options can be obtained using the <command>crm_mon --help</command> command. Do I Need to Update the Configuration on all Cluster Nodes? For a full list of <command>crm_shadow</command> options and commands, invoke it with the <parameter>--help</parameter> option. For information on the options supported by ptest, use <command>ptest --help</command> From this point on, all cluster commands will automatically use the shadow copy instead of talking to the cluster's active configuration. Once you have finished experimenting, you can either commit the changes, or discard them as shown below. Again, be sure to follow the on-screen instructions carefully. How Should the Configuration be Updated? Identify the object you wish to delete. eg. If you only wanted to modify the resources section, you could instead do In the above example, it appears that a new node, <literal>node2</literal>, has come online and that the cluster is checking to make sure <literal>rsc1</literal>, <literal>rsc2</literal> and <literal>rsc3</literal> are not already running there (Indicated by the <literal>*_monitor_0</literal> entries). Once it did that, and assuming the resources were not active there, it would have liked to stop <literal>rsc1</literal> and <literal>rsc2</literal> on <literal>node1</literal> and move them to <literal>node2</literal>. However, there appears to be some problem and the cluster cannot or is not permitted to perform the stop actions which implies it also cannot perform the start actions. For some reason the cluster does not want to start <literal>rsc3</literal> anywhere. Interpreting the Graphviz output Loops are <emphasis>really</emphasis> bad. Please report them to the development team. Making Configuration Changes in a Sandbox Making changes in a sandbox and verifying the real configuration is untouched Next identify the resource's tag name and id (in this case we'll chose <literal>primitive</literal> and <literal>child_DoFencing</literal>). Then simply execute: No. Any changes are immediately synchronized to the other active members of the cluster. Nodes Now that it is clear how NOT to update the configuration, we can begin to explain how you should. Often it is desirable to preview the effects of a series of changes before updating the configuration atomically. For this purpose we have created <command>crm_shadow</command> which creates a "shadow" copy of the configuration and arranges for all the command line tools to use it. Or to find the current location of my-test-rsc one can use: Or to see if somenode is allowed to run resources, there is: Quickly Deleting Part of the Configuration Read the above carefully, failure to do so could result in you destroying the cluster's active configuration Resource actions have text of the form <replaceable>rsc</replaceable>_<replaceable>action</replaceable>_<replaceable>interval</replaceable><replaceable>node</replaceable> Resource relationships (called <literal>constraints</literal>) Resources Rule 1 - Never edit the cib.xml file manually. Ever. I'm not making this up. Rule 2 - Read Rule 1 again. Safely using an editor to modify a subsection of the cluster configuration Safely using an editor to modify the cluster configuration Sample output from crm_mon Sample output from crm_mon -n Searching for STONITH related configuration items Shadow copies are identified with a name, making it possible to have more than one Small Cluster Transition Some common tasks can also be performed with one of the higher level tools that avoid the need to read or edit XML. Some of the better XML editors can make use of a Relax NG schema to help make sure any changes you make are valid. The schema describing the configuration can normally be found in /usr/lib/heartbeat/pacemaker.rng on most systems. Testing Your Configuration Changes The Current State of the Cluster The DC (Designated Controller) node is where all the decisions are made and if the current DC fails a new one is elected from the remaining cluster nodes. The choice of DC is of no significance to an administrator beyond the fact that its logs will generally be more interesting. The cluster is written using XML notation and divided into two main sections; configuration and status. The configuration section contains the more traditional information like cluster options, lists of resources and indications of where they should be placed. The configuration section is the primary focus of this document. The configuration section itself is divided into four parts: The most powerful tool for modifying the configuration is the cibadmin command which talks to a running cluster. With cibadmin, the user can query, add, remove, update or replace any part of the configuration and all changes take effect immediately so there is no need to perform a reload-like operation. The simplest way of using cibadmin is to use it to save the current configuration to a temporary file, edit that file with your favorite text or XML editor and then upload the revised configuration. The status section contains the history of each resource on each node and based on this data, the cluster can construct the complete current state of the cluster. The authoritative source for the status section is the local resource manager (lrmd) process on each cluster node and the cluster will occasionally repopulate the entire section. For this reason it is never written to disk and admin's are advised against modifying it in any way. The tool uses the same library as the live cluster to show what it would have done given the supplied input. It's output, in addition to a significant amount of logging, is stored in two files <filename>tmp.graph</filename> and <filename>tmp.dot</filename>, both are representations of the same thing -- the cluster's response to your changes. In the graph file is stored the complete transition, containing a list of all the actions, their parameters and their pre-requisites. Because the transition graph is not terribly easy to read, the tool also generates a Graphviz dot-file representing the same information. There are three basic rules for updating the cluster configuration: To begin, simply invoke <command>crm_shadow</command> and give it the name of a configuration to create <placeholder-1/> and be sure to follow the simple on-screen instructions. <placeholder-2/> To enable stonith for example, one could run: To reduce bandwidth, the cluster only broadcasts the incremental updates that result from your changes and uses MD5 sums to ensure that each copy is completely consistent. Updating the Configuration Without Using XML Using a sandbox to make multiple changes atomically Using this tool, you can examine the state of the cluster for irregularities and see how it responds when you cause or simulate failures. We saw previously how to make a series of changes to a "shadow" copy of the configuration. Before loading the changes back into the cluster (eg. <command>crm_shadow --commit mytest --force</command>), it is often advisable to simulate the effect of the changes with ptest. Eg. cibadmin --delete --crm_xml ‘&lt;primitive id="child_DoFencing"/&gt;' cibadmin --query &gt; tmp.xml cibadmin --query --obj_type resources &gt; tmp.xml cibadmin --replace --obj_type resources --xml-file tmp.xml cibadmin --replace --xml-file tmp.xml crm_attribute --attr-name stonith-enabled --attr-value true crm_resource --locate --resource my-test-rsc crm_standby --get-value --node-uname somenode ptest --live-check -VVVVV --save-graph tmp.graph --save-dotfile <placeholder-1/> tmp.dot to avoid modifying any other part of the configuration. translator-credits vi tmp.xml Project-Id-Version: PACKAGE VERSION
POT-Creation-Date: 2011-09-24 23:25+0300
PO-Revision-Date: 2011-10-11 10:15+0200
Last-Translator: Dan Frîncu <df.cluster@gmail.com>
Language-Team: LANGUAGE <LL@li.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
 
  <placeholder-1/>
  ============
  Last updated: Fri Nov 23 15:26:13 2007
  Current DC: sles-3 (2298606a-6a8c-499a-9d25-76242f7006ec)
  3 Nodes configured.
  5 Resources configured.
  ============

  Node: sles-1 (1186dc9a-324d-425a-966e-d757e693dc86): online
      192.168.100.181    (heartbeat::ocf:IPaddr):    Started sles-1
      192.168.100.182    (heartbeat:IPaddr):        Started sles-1
      192.168.100.183    (heartbeat::ocf:IPaddr):    Started sles-1
      rsc_sles-1    (heartbeat::ocf:IPaddr):    Started sles-1
      child_DoFencing:2    (stonith:external/vmware):    Started sles-1
  Node: sles-2 (02fb99a8-e30e-482f-b3ad-0fb3ce27d088): standby
  Node: sles-3 (2298606a-6a8c-499a-9d25-76242f7006ec): online
      rsc_sles-2    (heartbeat::ocf:IPaddr):    Started sles-3
      rsc_sles-3    (heartbeat::ocf:IPaddr):    Started sles-3
      child_DoFencing:0    (stonith:external/vmware):    Started sles-3 
  <placeholder-1/>
  ============
  Last updated: Fri Nov 23 15:26:13 2007
  Current DC: sles-3 (2298606a-6a8c-499a-9d25-76242f7006ec)
  3 Nodes configured.
  5 Resources configured.
  ============

  Node: sles-1 (1186dc9a-324d-425a-966e-d757e693dc86): online
  Node: sles-2 (02fb99a8-e30e-482f-b3ad-0fb3ce27d088): standby
  Node: sles-3 (2298606a-6a8c-499a-9d25-76242f7006ec): online

  Resource Group: group-1
    192.168.100.181    (heartbeat::ocf:IPaddr):    Started sles-1
    192.168.100.182    (heartbeat:IPaddr):        Started sles-1
    192.168.100.183    (heartbeat::ocf:IPaddr):    Started sles-1
  rsc_sles-1    (heartbeat::ocf:IPaddr):    Started sles-1
  rsc_sles-2    (heartbeat::ocf:IPaddr):    Started sles-3
  rsc_sles-3    (heartbeat::ocf:IPaddr):    Started sles-3
  Clone Set: DoFencing
    child_DoFencing:0    (stonith:external/vmware):    Started sles-3
    child_DoFencing:1    (stonith:external/vmware):    Stopped
    child_DoFencing:2    (stonith:external/vmware):    Started sles-1 
 # <command>crm_shadow --create test</command>
 Setting up shadow instance
 Type Ctrl-D to exit the crm_shadow shell
 shadow[test]: 
 shadow[test] # <command>crm_shadow --which</command>
 test 
 shadow[test] # <command>crm_failcount -G -r rsc_c001n01</command>
  name=fail-count-rsc_c001n01 value=0
 shadow[test] # <command>crm_standby -v on -n c001n02</command>
 shadow[test] # <command>crm_standby -G -n c001n02</command>
 name=c001n02 scope=nodes value=on
 shadow[test] # <command>cibadmin --erase --force</command>
 shadow[test] # <command>cibadmin --query</command>
<![CDATA[
 <cib cib_feature_revision="1" validate-with="pacemaker-1.0" admin_epoch="0" crm_feature_set="3.0" have-quorum="1" epoch="112"
      dc-uuid="c001n01" num_updates="1" cib-last-written="Fri Jun 27 12:17:10 2008">
    <configuration>
       <crm_config/>
       <nodes/>
       <resources/>
       <constraints/>
    </configuration>
    <status/>
 </cib>
]]>
  shadow[test] # <command>crm_shadow --delete test --force</command>
  Now type Ctrl-D to exit the crm_shadow shell
  shadow[test] # <command>exit</command>
  # <command>crm_shadow --which</command>
  No shadow instance provided
  # <command>cibadmin -Q</command>
<![CDATA[
 <cib cib_feature_revision="1" validate-with="pacemaker-1.0" admin_epoch="0" crm_feature_set="3.0" have-quorum="1" epoch="110"
       dc-uuid="c001n01" num_updates="551">
    <configuration>
       <crm_config>
          <cluster_property_set id="cib-bootstrap-options">
             <nvpair id="cib-bootstrap-1" name="stonith-enabled" value="1"/>
             <nvpair id="cib-bootstrap-2" name="pe-input-series-max" value="30000"/>
]]>
	 # cibadmin -Q | grep stonith # crm_mon # crm_mon -n @@image: 'images/Policy-Engine-big.png'; md5=ACEST FIŞIER NU EXISTĂ @@image: 'images/Policy-Engine-small.png'; md5=ACEST FIŞIER NU EXISTĂ Acţiunile cu o margine albastră sunt cele pe care clusterul nu consideră că trebuie executate Acţiunile cu o margine întreruptă cu spaţii de orice culoare nu se formează ca parte a grafului de tranziţie Acţiunile cu o margine verde se formează ca parte a grafului de tranziţie Acţiunile cu o margine roşie sunt cele pe care clusterul ar dori să le execute dar sunt neexecutabile Acţiunile cu text negru sunt trimise la LRM Acţiunile cu text portocaliu sunt acţiuni pseudo/de prefacere pe care clusterul le foloseşte pentru a simplifica graful O configuraţie goală Un exemplu de graf de tranziţie aşa cum este reprezentat de Graphviz Un alt graf de tranziţie, ceva mai complex, pe care nu se aşteaptă să îl puteţi citi Orice acţiune care depine de o acţiune cu o margine roşie nu va putea să se execute. Săgeţile indică dependinţele de ordonare Tranziţii Complexe ale Clusterului Bazele Configurării Opţiuni de configurare (numite <literal>crm_config</literal>) Crearea şi prezentarea sandbox-ului activ Săgeţile întrerupte de spaţii indică dependinţe care nu sunt prezente în graful de tranziţie Detalii despre toate opţiunile disponibile pot fi obţinute folosind comanda <command>crm_mon --help</command>. Trebuie să Actualizez Configuraţia pe toate Nodurile Clusterului? Pentru o listă completă de opţiuni şi comenzi ale <command>crm_shadow</command>, apelaţi-l cu opţiunea <parameter>--help</parameter>. Pentru informaţii legate de opţiunile suportate de ptest, folosiţi <command>ptest --help</command> Din acest punct înainte, toate comenzile clusterului vor folosi copia ascunsă în loc să comunice cu copia activă a configuraţiei clusterului. Odată ce aţi terminat de experimentat, puteţi fie să  Cum Ar Trebui să fie Actualizată Configuraţia Identificaţi obiectul pe care doriţi să îl ştergeţi. ex. Dacă aţi dorit doar să modificaţi secţiunea de resurse, aţi putea alternativ să executaţi În exemplul de mai sus, este aparent faptul că un nod nou, <literal>node2</literal>, a venit online şi clusterul verifică să se asigure că <literal>rsc1</literal>, <literal>rsc2</literal> şi <literal>rsc3</literal> nu rulează deja acolo (aspect indicat de intrările <literal>*_monitor_0</literal>). Odată ce a realizat acest lucru şi, mergând pe presupunerea că resursele nu erau active acolo, ar fi preferat să oprească <literal>rsc1</literal> şi <literal>rsc2</literal> pe <literal>node1</literal> şi să le mute pe <literal>node2</literal>. Totuşi se pare că există o problemă şi clusterul nu poate sau nu îi este permis să execute operaţiunile de oprire, fapt care implică neputinţa de a efectua acţiunile de pornire de asemenea. Pentru un motiv necunoscut încâ clusterul nu vrea să pornească <literal>rsc3</literal> nicăieri. Interpretarea rezultatului de ieşire al Graphviz Buclele de execuţie sunt <emphasis>foarte</emphasis> rele. Vă rugăm să le raportaţi echipei de dezvoltare. Realizând Modificări de Configurare într-un Sandbox Realizarea de modificări într-un sandbox şi apoi verificarea că configuraţia reală nu este atinsă. Apoi identificaţi numele tag-ului resursei şi id-ul (în acest caz vom alege <literal>primitive</literal> şi <literal>child_DoFencing</literal>). Apoi executaţi: Nu. Orice modificări sunt sincronizate imediat către ceilalţi membri activi ai clusterului. Noduri Acum că este clar cum să NU actualizăm configuraţia, putem începe să explicăm cum ar trebui să realizăm acest lucru. Deseori este de dorit să previzualizaţi efectele unei serii de modificări înainte să actualizaţi configuraţia în mod atomic. Pentru acest scop am creat <command>crm_shadow</command> care creează o copie "ascunsă" a configuraţiei şi face astfel încât toate utilitarele din linia de comandă să o folosească. Sau pentru a afla locaţia curentă a my-test-rsc aţi putea folosi: Sau pentru a vedea dacă unui nod îi este permis să ruleze resurse, există: Ştergerea Rapidă a unei Părţi din Configuraţie Citiţi cele de mai sus cu atenţie, nerespectarea acestora poate rezulta în distrugerea de către voi a configuraţiei active a clusterului  Acţiunile resurselor au text de forma <replaceable>rsc</replaceable>_<replaceable>action</replaceable>_<replaceable>interval</replaceable><replaceable>node</replaceable> Relaţii între resurse (numite <literal>restricţii</literal>) Resurse Regula 1 - Nu editaţi niciodată fişierul cib.xml manual. Niciodată. Nu inventez acest lucru. Regula 2 - Citiţi Regula 1 din nou. Folosind cu siguranţă un editor pentru a modifica configuraţia clusterlui Folosind cu siguranţă un editor pentru a modifica configuraţia clusterlui Mostră de rezultat obţinut din crm_mon Mostră de rezultat obţinut din crm_mon -n Căutând pentru elemente de configurare legate de STONITH Copiile ascunse sunt identificate cu un nume, fiind posibil să avem mai mult de una Tranziţia unui Cluster Mic Câteva task-uri comune pot fi efectuate de asemenea cu unul dintre utilitarele de nivel înalt pentru a evita nevoia de a citi sau edita XML. Unele dintre editoarele mai bune de XML pot folosi schema Relax NG pentru a vă ajuta să fiţi siguri că modificările pe care le realizaţi sunt valide. Schema care descrie configuraţia poate fi găsită în mod normal în /usr/lib/heartbeat/pacemaker.rng pe majoritatea sistemelor. Testarea Modificărilor Voastre de Configurare Starea Cuirentă a Clusterului Nodul CD (Controller Desemnat) este locul unde toate deciziile sunt luate şi dacă DC-ul eşuează unul nou este ales din nodurile rămase în cluster. Alegerea unui DC nu are nici o semnificaţie pentru administrator dincolo de faptul că logurile acestuia vor fi în general mai interesante. Clusterul este scris folosind notaţie XML şi este împărţit în două secţiuni principale; configurare şi status. Secţiunea de configurare conţine informaţii mai tradiţionale precum opţiuni ale clusterului, liste de resurse şi indicări despre unde ar trebui acestea plasate. Secţiunea de configurare este scopul primar al acestui document. Secţiunea de configurare în sine este împărţită în patru părţi: Cea mai puternică uneaktă pentru modificarea configuraţiei este comanda cibadmin care comunică cu un cluster funcţional. Cu cibadmin, utilizatorul poate interoga, adăuga, înlătura, actualiza sau înlocui orice parte a configuraţiei şi toate modificările au efect imediat aşa că nu este necesar să executaţi operaţiuni de tip reload. Cel  mai simplu mod de a folosi cibadmin este de a-l folosi pentru a salva configuraţia curentă într-un fişier temporar, să editaţi acel fişier cu editorul de text sau XML favorit şi apoi să încărcaţi configuraţia revizuită. Secţiunea de status conţine istoricul fiecărei resurse de pe fiecare nod şi pe baza acestor date, clusterul poate construi starea completă a clusterului. Sursa autoritativă pentru secţiunea de status este procesul managerului de resurse local (lrmd) pe fiecare nod iar clusterul va repopula în mod ocazional întreaga secţiune. Din acest motiv nu este scris niciodată pe disc iar administratorii sunt sfătuiţi împotriva modificării în orice fel a acestuia. Utilitarul foloseşte aceeaşi librărie ca şi clusterul live pentru a arăta ce ar fi realizat cu informaţiile primite. Rezultatul de ieşire, împreună cu o cantitate semnificativă de loguri, este stocat în două fişiere <filename>tmp.graph</filename> şi <filename>tmp.dot</filename>, ambele sunt reprezentări ale aceluiaşi lucru -- răspunsul clusterului la modificările voastre. În fişierul graph este stocată tranziţia completă, conţinând o listă cu toate acţiunile, parametrii acestora şi cerinţele premergătoare ale acestora. Pentru că graph-ul de tranziţie nu este foarte uşor de citit, utilitarul generează un fişier Graphviz dot de asemenea reprezentând aceleaşi informaţii. Sunt trei reguli de bază pentru actualizarea configuraţiei clusterului: Pentru a începe, invocaţi pur şi simplu <command>crm_shadow</command> şi daţi-i numele unei configuraţii pe care să o creeze <placeholder-1/> şi asiguraţi-vă că urmaţi simplele instrucţiuni de pe ecran . <placeholder-2/> Pentru a activa stonith de exemplu, aţi putea rula: Pentru a reduce consumul de lăţime de bandă, clusterul transmite numai actualizările incrementale care rezultă din modificările realizate voastre şi foloseşte hash-uri MD5 pentru a se asigura că fiecare copie este complet consistentă. Updatând Configuraţia Fără să Folosim XML Folosirea unui sandbox pentru a realiza mai multe modificări în mod atomic Folosind acest utilitar, puteţi examina starea clusterului pentru neconcordanţe şi pentru a vedea cum răspunde atunci când provocaţi sau simulaţi eşecuri. Am văzut anterior cum să realizăm o serie de modificări într-o copie "ascunsă" a configuraţiei. Înainte de a încărca modificările înapoi în cluster (ex. <command>crm_shadow --commit mytest --force</command>), este adeseori recomandat să simulaţi efectul modificărilor cu ptest. Ex. cibadmin --delete --crm_xml ‘&lt;primitive id="child_DoFencing"/&gt;' cibadmin --query &gt; tmp.xml cibadmin --query --obj_type resources &gt; tmp.xml cibadmin --replace --obj_type resources --xml-file tmp.xml cibadmin --replace --xml-file tmp.xml crm_attribute --attr-name stonith-enabled --attr-value true crm_resource --locate --resource my-test-rsc crm_standby --get-value --node-uname somenode ptest --live-check -VVVVV --save-graph tmp.graph --save-dotfile <placeholder-1/> tmp.dot pentru a evita modificările survenite la orice altă parte a configuraţiei. meritele-traducătorului vi tmp.xml 