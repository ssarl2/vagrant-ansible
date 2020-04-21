@echo off
setlocal
set /p name=Which vagrant do you want to reconfigure and restart? If you want to do all, just press enter: || set name=default

if %name%==default (
    vagrant halt && vagrant destroy -f && vagrant up
) else (
    vagrant halt %name% && vagrant destroy %name% -f && vagrant up %name%
)