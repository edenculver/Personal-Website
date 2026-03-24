# [edenculver.net](https://edenculver.net)

---

## Database Operations

### Dump

```bash
sudo -u postgres pg_dump edenculverdb > /var/www/Personal-Website/database/edenculverdb.sql
```

### Log in

```bash
sudo -u postgres psql edenculverdb
```

### Common commands

```sql
\dt
\d table_name
select * from table_name;
begin;
insert into table_name (id, name) values (1, 'hello');
update table_name set name='world' where id=1;
delete from table_name where id=1;
commit;
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
sudo chown -R edenculver:edenculver Personal-Website
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

- Fill out the information prompts as desired
- Set the common name to `edenculver.net`

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
9. [Test if the CNAME has been created correctly](https://mxtoolbox.com/SuperTool.aspx?action=cname%3aedenculver.net&run=toolpage#). It will take a few hours before it succeeds.

Install SSL files

You will get an email with the cert file. Download it and copy the it onto the server: `/var/www/Personal-Website/ssl/edenculver_net.crt`

The key file needs to not have a password. Remove the password from the key you generated earlier with:

```bash
openssl rsa -in ~/culverpi.key -out /var/www/Personal-Website/ssl/culverpi.key
```

If you put these files somewhere else, put the paths in `/var/www/Personal-Website/.env`, such as:

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
	ssl_certificate /var/www/Personal-Website/ssl/edenculver_net.crt;
	ssl_certificate_key /var/www/Personal-Website/ssl/culverpi.key;

	root /var/www/Personal-Website;
	index index.html index.htm index.nginx-debian.html;

	# redirect to home page
	location = / {
		try_files /pages/home /pages/home/ =404;
	}

	# alias to make /pages and .html in URLs optional
	location / {
		try_files $uri $uri/ $uri.html /pages/$uri /pages/$uri/ /pages/$uri.html =404;
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

Install PostgreSQL

```bash
sudo apt install postgresql
```

Create database

```bash
createdb edenculverdb
psql edenculverdb
```

Create read-only user

```sql
create user readonly with encrypted password 'password123';
grant connect on database edenculverdb to readonly;
grant usage on schema public to readonly;
grant select on all tables in schema public to readonly;
alter default privileges in schema public grant select on tables to readonly;
```

Allow remote connections (for testing purposes)

1. Open `/etc/postgresql/13/main/postgresql.conf` and change the line `#listen_addresses = 'localhost'` to `listen_addresses = '*'`
2. Open `/etc/postgresql/13/main/pg_hba.conf` and add `host all readonly 192.168.1.10/32 md5` to the bottom
3. Restart postgresql

```bash
sudo systemctl restart postgresql
```

Build the database using `databases/edenculverdb.sql`

### API Setup

Install Node.js

Set up Node.js

```bash
sudo npm init
sudo npm install dotenv
sudo npm install express
sudo npm install pg
sudo npm install pm2
```

Configure environment variables

- Create file .env like the following:

```bash
DB_USERNAME=readonly
DB_PASSWORD=password123
```

Start app server with pm2

```bash
sudo pm2 start database/api.js --name="edenculverAPI" --watch
sudo pm2 save
```
