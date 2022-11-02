 #!/bin/bash

 read number1 number2 number3
 echo -en "$number1\n$number2\n$number3" |  sort -n |  tail -n 1
