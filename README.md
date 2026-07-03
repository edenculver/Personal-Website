# [edenculver.net](https://edenculver.net/)

---

## Update Live Site

```bash
cd /var/www/Personal-Website/edenculver/
git pull
npm run build
# typically takes 2-3 minutes
sudo pm2 restart edenculver
# may not be necessary
```

## Database Operations

### Dump

```bash
cd /var/www/Personal-Website/
sudo -u postgres pg_dump edenculverdb > /var/www/Personal-Website/database/edenculverdb.sql
git add .
git commit -m "dump"
git push
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

```bash
# clone the repo
cd /var/www/
sudo git clone git@github.com:edenculver/Personal-Website.git
sudo chown -R edenculver:edenculver Personal-Website

# make a symlink from your home directory for convenience
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

Change `/etc/nginx/sites-available/default` to this:
```conf
upstream sveltekit {
	server 127.0.0.1:3000;
	keepalive 8;
}

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

	location / {
		proxy_pass http://sveltekit;
		proxy_redirect off;
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

```bash
# install PostgreSQL
sudo apt install postgresql

# create database
createdb edenculverdb
psql edenculverdb
```

```sql
-- create read-only user
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

#### Website Setup

Configure environment variables
- Create `/var/www/Personal-Website/edenculver/.env` like the following:
```bash
HOST=127.0.0.1
DB_USERNAME=readonly
DB_PASSWORD=password123
```

```bash
# install nvm
curl -o- https://raw.githubusercontent.com/creationix/nvm/v0.33.11/install.sh | bash
# restart your terminal!
# install/update Node.js
nvm install node
# update npm
npm update -g npm
# install packages
cd /var/www/Personal-Website/edenculver/
npm install
# build production version
npm run build
# start server with pm2
sudo HOST=127.0.0.1 pm2 start /var/www/Personal-Website/edenculver/build/index.js --name="edenculver" --watch
sudo pm2 save
```

---

## Development

```bash
cd edenculver
npm run dev -- --open
```

---

## Development Standards

- TS variable naming in camelCase, except when using postgresql column names
- TS classes in PascalCase
- All postgresql tables and columns in snake_case
- All Tailwind classes sorted in this order:
	1. Positioning
	2. Margin
	3. Border, border color, rounded
	4. Width, height
	5. Padding
	6. BG color
	7. Text alignment, text size, font weight
	8. Flex, gap, items, justify
	9. Anything else
