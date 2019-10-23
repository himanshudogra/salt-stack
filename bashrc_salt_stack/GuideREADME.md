Please follow below steps listed to implement the given use case.


Step1. Create the salt state under salt/bashrc/init.sls file.
	- Updated in the bashrc directory.

Step2. Create "shn.inactivity_timeout" file.
	- Updated in the bashrc directory.

Step3. push the changes into the respective env using git.

For ex: Only for govcloud env-

		diff --git a/bashrc/init.sls b/bashrc/init.sls
	index 9c10a6f9..3776c667 100644
	--- a/bashrc/init.sls
	+++ b/bashrc/init.sls
	@@ -4,3 +4,9 @@
	     file.managed:
	         - mode:     755
	         - source:   salt://bashrc/shn.profile
	+{% if grains.get('environment') in ['govcloud'] %}
	+/etc/profile.d/20-inactivity_timeout.sh:
	+    file.managed:
	+        - mode:     755
	+        - source:   salt://bashrc/shn.inactivity_timeout
	+{% endif %}
	
	diff --git a/bashrc/shn.inactivity_timeout b/bashrc/shn.inactivity_timeout
	new file mode 100644
	index 00000000..3d2c91bf
	--- /dev/null
	+++ b/bashrc/shn.inactivity_timeout
	@@ -0,0 +1,4 @@
	+#!/bin/bash
	+# Log out in 15  minutes if the session is idle
	+export TMOUT=900
	+readonly TMOUT

Step4. Run below command on salt master server to run the state on the minions-

	salt <target> state.sls bashrc

Step5. Login to the minion node and check for "/etc/profile.d/20-inactivity_timeout.sh" file if it has created and wait for the session to get logout after 15 min.

