# ToyRobotSimulator

## Usage

Run `bin/run` with filename to get robot simulation output.
Will output instructions when run without filename

```bash
$ bin/run spec/examples/example_0
0,1,NORTH

$ bin/run spec/examples/example_2
3,3,NORTH

$ bin/run spec/examples/example_1
0,0,WEST

$ bin/run
Please provide file with commands.
Use robot commands listed below. Note that robot needs to be placed before performing commands.

. PLACE will put the toy robot on the table in position X,Y and facing NORTH, SOUTH, EAST or WEST.
. The origin (0,0) can be considered to be the SOUTH WEST most corner.
. The first valid command to the robot is a PLACE command, after that, any sequence of commands may be issued, in any order, including another PLACE command. The application should discard all commands in the sequence until a valid PLACE command has been executed.
. MOVE will move the toy robot one unit forward in the direction it is currently facing.
. LEFT and RIGHT will rotate the robot 90 degrees in the specified direction without changing the position of the robot.
. REPORT will announce the X,Y and orientation of the robot.
```
