#Flappybird for MATLAB

#### Author: HybridSystemsLab UCSC
Design support tools benefit from rich information about games’ emergent behavior. Inventing successful AI players for particular games can help producing some of this information, but this is both labor intensive and limited in that it can generally only reveal that a solution exists and not say that no solution exists or that certain classes of solution exist. We show a generic method for posing and answering feasible-path, optimal-path, and reachable-space queries in action games, and we devise a measure of game level difficulty. We accomplish all this by encoding action videogame characters as hybrid dynamical systems, using Flappy Bird and Super Mario as case studies.


The files included in this repository outline reachability analysis mentioned in the paper(Analyzing Action Games: A Hybrid Systems Approach) consisting  in proposing methods and algorithms to approximate the set of points, the so-called reachable set, generated by the system solutions starting from a given set of initial points by the user, denoted χo , after finite (hybrid) time (T, J). 
## Usage:
 e,g. run('x0',[1.65;2.5;0.1;0;0],'ObstacleSetup',2,'horizon',16,'simTime',40)

## Control:

  User set input and run simulation. Not interactive Yet...
## Note:
** Should you encounter a problem, or would like to provide feedback please drop a comment down below.  **

Thank you for visiting our repository :)
