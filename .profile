source ~/.../lib/scripting
for n in \
    ~/.profile-common \
    ~/.profile-local \
    ~/.profile-$USER \
    ~/.profile-$LOCAL
do
    ...sourceif $n
done
