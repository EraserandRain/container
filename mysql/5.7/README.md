## Usage:
### Start mysql server
```bash
docker-compose up -d
```

### Client 
```bash
# Depend on
sudo apt -y install mysql-client

# Use 'cmq' to connect mysql
alias cmq='mysql -h 127.0.0.1 -uroot -pmysql57'
cmq
```
