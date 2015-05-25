FROM wolffaxn/base:latest

MAINTAINER Alexander Wolff <wolffaxn@gmail.com>

# first install the repository RPM from the PostgreSQL yum repository
RUN rpm -Uvh http://yum.postgresql.org/9.4/redhat/rhel-7-x86_64/pgdg-centos94-9.4-1.noarch.rpm; yum clean all
# install postgresql packages
RUN yum -y install postgresql94 postgresql94-server postgresql94-contrib; yum clean all

# create intial database
RUN su - postgres -c /usr/pgsql-9.4/bin/initdb

# configure postgresql so that remote database connections are possible
RUN echo "host all  all    0.0.0.0/0  md5" >> /var/lib/pgsql/9.4/data/pg_hba.conf
RUN echo "listen_addresses='*'" >> /var/lib/pgsql/9.4/data/postgresql.conf

# expose the PostgreSQL port
EXPOSE 5432

# add volumes to allow backup of config files, databases and logs
VOLUME ["/etc/postgresql", "/var/lib/postgresql", "/var/log/postgresql"]

# run postgresql
CMD ["/bin/su", "postgres", "-c", "/usr/pgsql-9.4/bin/postgres -D /var/lib/pgsql/9.4/data -c config_file=/var/lib/pgsql/9.4/data/postgresql.conf"]
