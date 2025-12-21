# [edenculver.net](https://edenculver.net)

---

## Database Operations

### Dump

```bash
sudo mariadb-dump -u root -p -x -B --skip-extended-insert edenculver > /var/www/edenculver.net/database/edenculver.sql
```

### Log in

```bash
sudo mysql -u root -p
```

```sql
USE edenculver;
```

### Common commands

```sql
SHOW tables;
DESCRIBE battle_pack;
SELECT * FROM battle_pack;
START TRANSACTION;
INSERT INTO minifig VALUES ('sw1416', 'Death Trooper', 'Thrawn', 1);
UPDATE battle_pack SET msrp='9.99' WHERE set_number=7654;
DELETE FROM leitmotif WHERE leitmotif_id=25;
COMMIT;
```

## Restart API after server reboot

```bash
sudo pm2 resurrect
```

---

## How To Deploy

### Repo Setup

Clone the repo

```bash
cd /var/www/
sudo git clone git@github.com:edenculver/Personal-Website.git
```

Make a symlink from your home directory for convenience

```bash
ln -s /var/www/Personal-Website/ ~/Personal-Website
```

### Web Server Setup

Generate a CSR

```bash
openssl req -newkey rsa:2048 -keyout ~/culverpi.key -out ~/culverpi.csr
```

Submit the CSR

1. [SSL Certificates](https://ap.www.namecheap.com/ProductList/SslCertificates)
2. Activate > Next > Manually > Next
3. Paste in the CSR
4. Next > Next > Next > Submit

Follow the [instructions](https://www.namecheap.com/support/knowledgebase/article.aspx/9637/68/how-can-i-complete-domain-control-validation-dcv-for-my-ssl-certificate/) for DNS validation

1. [SSL Certificates](https://ap.www.namecheap.com/ProductList/SslCertificates)
2. Details
3. Click the link that says "from this page (Edit methods)"
4. Click the dropdown next to Edit Methods > Get Record
5. In a new tab, go to [Advanced DNS](https://ap.www.namecheap.com/Domains/DomainControlPanel/edenculver.net/advancedns)
6. Add New Record > CNAME Record
7. Copy the Host (excluding .edenculver.net) and Target
8. Save Changes (checkmark)
9. [Test if the CNAME has been created correctly](https://mxtoolbox.com/CnameLookup.aspx)

Install SSL files

- Cert path: `/var/www/edenculver.net/ssl/edenculver_net.crt`
- Key path: `/var/www/edenculver.net/ssl/culverpi.key`
- If you put them somewhere else, put the paths in `/var/www/edenculver.net/.env`, such as:

```bash
CERT_PATH=ssl/domain.crt
KEY_PATH=ssl/domain.key
```

Change `/etc/nginx/sites-available/default` to this:

```
# redirect to HTTPS
server {
	listen 80;
	server_name edenculver.net;
	return 301 https://edenculver.net$request_uri;
}

# edenculver.net
server {
	listen 443 ssl default_server;
	server_name edenculver.net;
	ssl_certificate /var/www/edenculver.net/ssl/edenculver_net.crt;
	ssl_certificate_key /var/www/edenculver.net/ssl/culverpi.key;

	root /var/www/edenculver.net;
	index index.html index.htm index.nginx-debian.html;

	# edenculver.net
	location / {
		try_files $uri $uri/ =404;
	}
	# API
	location /api {
		proxy_pass https://localhost:3000;
		proxy_http_version 1.1;
		proxy_set_header Upgrade $http_upgrade;
		proxy_set_header Connection 'upgrade';
		proxy_set_header Host $host;
		proxy_cache_bypass $http_upgrade;
		add_header Access-Control-Allow-Origin * always;
	}
}
```

- Make sure to change the SSL paths if needed

Restart nginx

```bash
sudo nginx -t
sudo systemctl restart nginx
```

Set up port forwarding on your router  

Point Namecheap DNS to your router

1. [Advanced DNS](https://ap.www.namecheap.com/Domains/DomainControlPanel/edenculver.net/advancedns)
2. Change the value of the A Record to your router's public IP
3. Save Changes (checkmark)

### Database Setup

Install MariaDB

```bash
sudo apt install mariadb-server
```

Secure the installation

```bash
sudo mysql_secure_installation
```

- Take the default value for all prompts except `Change the root password? [Y/n]`. Answer `n` to that one.

Log in to the database as root

```bash
sudo mysql -u root -p
```

Create the read-only user

```sql
CREATE USER 'edenculver_ro'@'localhost' IDENTIFIED BY 'password123';
GRANT SELECT ON edenculver.* TO 'edenculver_ro'@'localhost';
FLUSH PRIVILEGES;
```

Build the database using `databases/edenculver.sql`

### API Setup

Install Node.js

Set up Node.js

```bash
sudo npm init
sudo npm install dotenv
sudo npm install express
sudo npm install mysql
sudo npm install pm2
```

Configure environment variables

- Create file .env like the following:

```bash
DB_USERNAME=edenculver_ro
DB_PASSWORD=password123
```

Start app server with pm2

```bash
sudo pm2 start database/api.js --name="edenculverAPI" --watch
sudo pm2 save
```
