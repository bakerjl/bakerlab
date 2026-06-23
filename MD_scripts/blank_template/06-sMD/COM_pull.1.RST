! File specifying pulling restraints
&rst
iat=-1,-1, ! indicates a distance restraint between the Center of Mass (COM) or Center of Geometry of two separate GROUPS of atoms
r2=<replace with 4th number in vector.dat file>,
rk2=5, ! Means a firm spring constraint is applied. Keeps the direction of pulling process aligned with target path.
r2a=<total distance you want to pull by + r2>,
igr2=<replace with bottom-atoms-indices as a single line>,
igr1=<replace with top-atoms-indices as a single line>,
fxyz=0,0,0 ! represents a vector in Cartesian space (X, Y, Z). Change direction you want to pull towards to 1.
/
