 #!/bin/bash

ps aux | grep "/sbin" | awk '{print $2}' > pid_sbin.txt
