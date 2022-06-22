### Description: docker server for file share
Base on 【https://github.com/codeskyblue/gohttpserver】

```bash
git clone http@github.com:EraserandRain/file-server.git

cd ./file-server

docker-compose up -d
```
Config: `share/.ghs.yml` 
```yaml
---
upload: true | false
delete: true | false
```
