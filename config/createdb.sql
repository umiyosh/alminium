create database alminium DEFAULT CHARACTER SET utf8;
create user 'alminium' identified by 'alminium';
grant all privileges on alminium.* to alminium@localhost IDENTIFIED by 'alminium';

