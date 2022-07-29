default:
	@echo "No Default make command configured"
	@echo "Please use either"
	@echo "   - make curseforge"
	@echo "   - make multimc"
	@echo "   - make technic"
	@echo "   - make all"
	@echo ""
	@echo "Curseforge will make a curseforge compatible zip"
	@echo "Multimc will make a multimc zip file which contains"
	@echo "   the packwiz updater"
	@echo ""
	@echo "Technic will make a technic pack zip"
	@echo ""
	@echo "All will make all packs it can"
	@echo ""
	
curseforge:
	@echo "Making Curseforge pack"
	packwiz curseforge export --pack-file .minecraft/pack.toml -o ../steammc-curseforge.zip
	7z d ../steammc-curseforge.zip overrides/packwiz-installer-bootstrap.jar overrides/pack.toml  overrides/index.toml	

modrinth:
	@echo "Making Modrinth pack"
	packwiz modrinth export --pack-file .minecraft/pack.toml -o ../steammc-modrinth.zip
	7z d ../steammc-modrinth.zip overrides/packwiz-installer-bootstrap.jar overrides/pack.toml  overrides/index.toml	

multimc:
	@echo "Making MultiMC pack"
	7z d ../steammc-multimc.zip ./* -r
	7z d ../steammc-multimc.zip ./.minecraft -r
	7z a ../steammc-multimc.zip ./* -r
	7z a ../steammc-multimc.zip ./.minecraft -r
	7z d ../steammc-multimc.zip ./.minecraft/mods ./.minecraft/pack.toml ./.minecraft/index.toml -r

clean:
	-rm -rf .technic
	-git gc --aggressive --prune

all: curseforge modrinth multimc technic clean

update-packwiz:
	go install github.com/packwiz/packwiz@latest
	clear
	@echo "Packwiz has been Updated"