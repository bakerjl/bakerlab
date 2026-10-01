# bakerlab
This is the home for all of the Baker Lab stuff\
A place to share any relevant scripts in a way that is easier to navigate than through directories in onDemand.\
\
Rules:
>  • Feel free to upload any new analysis scripts and update old ones if you have any major improvements,\
>  but for the most part, if it ain't broke, don't fix it!\
>  • Make sure all relevant scripts are organized into folders and named clearly.\
>  • All new folders must have a readme detailing what it is for and use cases.\
>  • Avoid redundant scripts -- no need to create a new file if only the parameters are different. Look around \
>   before committing.\
>  • Include comments throughout code explaining what it does (doesn't need to be too detailed, mainly try \
>  to outline what people will need to change for their files)\
>  • Use placeholder names for any files specific to your directory setup.\
>  • Only upload into the scripts folder for your relevant projects.

Please avoid frequent restructuring of your folder system.\
It is good practice to number all of your directories including the names of your projects.\
Keeping things consistent makes analysis scripts simpler to use down the line.\

Avoid copying .nc files.\
If you want to copy all of the input and run files from a specific folder use the cp command in terminal,\
after cd'ing to the destination folder:\
> cp /<filepath to where files you want to copy are>/*.in .\
> cp /<filepath to where files you want to copy are>/*.sh .

