### Description: docker server for file share
Base on 【https://github.com/codeskyblue/gohttpserver】

### Usage

```bash
git clone https://github.com/EraserandRain/docker-project
## or single folder download
svn export https://github.com/EraserandRain/docker-project/branches/master/file-server

# start
docker-compose up -d
```
### Config

Config: `share/.ghs.yml` 
```yaml
---
upload: true | false
delete: true | false
```
