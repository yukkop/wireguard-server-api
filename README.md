this is from https://github.com/suquant/wgrest
but in docker =D

# Инструкция по разворачиванию

выгрузить репозиторий в отдельную папку на сервере
к примеру:
```
git clone <путь к репозиторию>
```

перейти в эту папку
```
cd <имя папки>
```

запустить докер
```
docker-compose up --build
```

запускаем скрипт для генерации файла wg0.conf
```
chmod 555 generator.sh
./generator.sh > config/wireguard/etc/wireguard/wg0.conf
```


## после чего перезапускаем контейнер, или перебилживаем, не суть
узнаем id контейнера
```
docker ps
```

останавливаем контейнер
```
docker stop <id контейнера или несколько первых символов этого id>
```

запускаем заново
```
docker-compose up --build
```


P.S.
возможно прийдеться установить wireguard на сервер
для того что бы скрипт заработал
```
apt install wireguard
```

-----------------------------
У сервера есть веб часть
```<ip>:8383/devices```

пароль: capybara

![capybara](https://user-images.githubusercontent.com/45404995/217745100-1a47e81a-5740-4a78-ac54-4a9c3982de9a.png)
