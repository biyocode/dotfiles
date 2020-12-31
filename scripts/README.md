# Custom Linux Scripts/Setup

## Setup

Run `./script.setup all` to setup and/or update all scripts on local

## Lockscreen/Login Screen User Icon Setup
Image: 96 x 96 png
Image Filename: `${USER}.png`
Image Location: `/var/lib/AccountsService/icons/`
Config File: `/var/lib/AccountsService/users/${USER}`
Config Content:
```
[User]
Icon=/var/lib/AccountsService/icons/${USER}.png
```

## Passphrase Theme
If the passphrase window prompt is not the correct theme, edit `/usr/bin/pinentry` and put an exec on top with `pinentry-gnome3` or something. 

## Postgresql Setup
(https://wiki.archlinux.org/index.php/PostgreSQL)[Postgresql Arch Wiki]
```
sudo postgres
[postgres] initdb -D /var/lib/postgres/data
sudo systemctl start postgresql.service
sudo systemctl enable postgresql.service
```
### Postgresql User Setup
```
[postgres] createuser --interactive
```

## Themes

### Refreshing Theme Icons
Icon Refresh: `gtk-update-icon-cache`
