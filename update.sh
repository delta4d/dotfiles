#!/usr/bin/env sh

FILES=(Xdefaults bashrc vimrc xinitrc zshrc)
NEEDS_UPDATE=0

for file in ${FILES[@]}; do
	src="$HOME/.$file"
	if [[ ! -z $(diff $src $file) ]]; then
		read -p "$src changed, update it? [Y/N](Y) " op
		op=${op:-Y}
		[[ "$op" != "Y" ]] && echo "skip $file" && continue
		cp $src $file
		git add $file
		read -p "give a short comment on $src" comment
		git commit -m $comment
		NEEDS_UPDATE=1
	fi
done

if [[ 0 -eq $? ]]; then
	if ((NEEDS_UPDATE)); then
		echo "start git push"
		git push origin master
		echo "update successfully"
	else
		echo "nothing to do, yay"
	fi
else
	echo "oops, something goes wrong T_T"
fi
