### Инструкция по разворачиванию

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

P.S.
возможно прийдеться установить wireguard на сервер
для того что бы скрипт заработал
```
apt install wireguard
```