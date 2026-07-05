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

---

## Database Operations

### Dump

```bash
cd /var/www/Personal-Website/
git pull
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

## Development

```bash
cd edenculver
npm run dev -- --open
```

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

---

## How To Deploy

See [how to deploy](./how to deploy.md)
