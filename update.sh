#!/usr/bin/env sh

FILES=(Xdefaults bashrc vimrc xinitrc zshrc)

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
	fi
done

echo "update successfully"
