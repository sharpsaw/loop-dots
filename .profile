source ~/.../lib/scripting
for n in \
    ~/.profile-common \
    ~/.profile-local \
    ~/.profile-$USER \
    ~/.profile-$LOCAL
do
    ...source-if $n
done
