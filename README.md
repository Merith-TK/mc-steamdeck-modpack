## Update Pack Template
This is a template modpack makers can use to easily release their modpack onto multiple platforms.
currently this template only supports 
- Windows
	- Technic
	- MultiMC

### How to use this?
- Modpack Makers
	- Well first your going to need to install `busybox`, `git`, `go` `7zip`, and `make` on your computer, I personally reccomend getting all of these through [Scoop](https://scoop.sh/)
	- After installing scoop, just run
		- `scoop install busybox git go make 7zip`
		- after you run the previous command, run
			- `go install github.com/packwiz/packwiz@latest`
		- and everything should be there, 
	- I reccomend using VSCode to manage your modpack as you have a full visual editor and git manager built in.
	- to add mods, run `packwiz <curseforge or modrinth> install <modid>`
		- for sodium from modrinth, `packwiz modrinth install sodium`
	- to make a release, run `make multimc` or `make technic`

	- Dont forget to make a git repo for your modpack, I reccomend using [GitLab](https://gitlab.com) due to its free Large File Support.

	- There are a few files you will need to edit as a maintainer to properly use this tool, 
		- `.gitignore`
			- Your modpack will create files that can and most likely will create issues with the updater, input the filepaths you wish for the updater to ignore, (usually files/folders that do not need to be bundled as they will be automatically created)
		- `.minecraft/icon.png`
			- This is your Modpack Icon, please change it, you may alter this one if you do not have one made specifically for you, the image is a 32x32 pixel image scaled up to 1024x1024
			- Also change the file name for it
		- `instance.cfg`
			- iconKey=icon, change this to whatever you named your modpack icon (excluding file extension)
			- name=Example Modpack, change this to your modpack name
		- `Makefile`
			- Edit this so that you can name your release zips how you want them to


- Modpack Users
	- You have no need to look at this repo as it stands at the moment, 