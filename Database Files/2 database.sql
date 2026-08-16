use master 
go 
alter database RecipeDB SET SINGLE_USER WITH ROLLBACK IMMEDIATE
drop database if exists RecipeDB
go 
create database RecipeDB
go 
use RecipeDB
go
