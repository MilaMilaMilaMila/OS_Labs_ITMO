 #!/bin/bash

 ps -Ao pid,stime | sort -r -n | sed -r "s/\s*([0-9]+)\s(.+)$/\1/" | sed -n 1p