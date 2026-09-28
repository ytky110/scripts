#!/usr/bin/env fish

set p firefox-profile-migrate.fish

set filelist places.sqlite logins.json key4.db cookies.sqlite formhistory.sqlite permissions.sqlite extensions storage extension-settings.json chrome

if test (count $argv) != 2
    echo "usage: $p <srcdir> <targetdir>"
end

set srcdir $argv[1]
set targetdir $argv[2]

for file in $filelist
    if test -e "$srcdir/$file"
        echo "$srcdir/$file -> $targetdir/"
        cp -R $srcdir/$file $targetdir/
    end
end
