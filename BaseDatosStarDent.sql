
Create table Roles(
Id_Rol int Primary key identity,
Rol varchar(20) not null

);
create table Empleados(
Id_Empleado int primary key identity,
Nombres Varchar(50) not null,
Apellidos Varchar(50) not null,
Correo Varchar(50) not null,
Contraseña Varchar(50)not null,
CC Numeric(12,0)unique not null,
Id_Emp_Rol int not null,
Constraint Empleados_Rol foreign key(Id_Emp_Rol)References Roles(Id_Rol)
);
Create table Clientes(
Id_Cliente int primary key identity,
Nombres Varchar(50) not null,
Apellidos Varchar(50) not null ,
Telefono Numeric(10,0) not null,
Correo Varchar(50) not null,
Documento Numeric (12,0)unique not null,
TipoDocu varchar(10)not null,
EPS Varchar(50)not null
);
Create table Reportes(
Id_Repor int primary key identity,
Id_clien_Report int not null,
Id_Emple_Report int not null,
Descripcion Varchar(max) not null,
Constraint Repor_Clien foreign key(Id_clien_Report)References Clientes (Id_Cliente),
Constraint Repor_Emple foreign key (Id_Emple_Report)References Empleados(Id_Empleado)
);
Create table Citas(
Id_Cita int primary key identity,
Fecha date not null,
Hora time not null,
Id_Cliente_citas int,
Constraint Citas_cliente foreign key(Id_Cliente_citas)References Clientes(Id_Cliente)
)

Create table Ingresos(
Id_Ingresos int primary key identity,
Desccripcion_Ingreso Varchar(max) not null,
Valor bigint not null,
Fecha_Ingreso date,
Id_empleado_ingresos int,
Constraint Ingresos_Empleados foreign key(Id_empleado_ingresos)references Empleados(Id_Empleado)
);

insert into Roles(Rol)values('Usuario'),('Empleado'),('Adiministrador');

insert into Empleados(Nombres,Apellidos,Correo,Contraseña,CC,Id_Emp_Rol)values('Jhonathan Andres','Varon Cuellar','Jhnaotanvaron9@gmail.com','1234',1006514394,2);
insert into Empleados(Nombres,Apellidos,Correo,Contraseña,CC,Id_Emp_Rol)values('Carlos ','Hurtatis','Carlos@gmail.com','12345',26655768,3);

select *From Empleados

select *from Clientes

select *from Reportes

select Id_Cita,Fecha,Hora,Nombres from Citas,Clientes where Fecha = '2018/12/01' and Id_Cliente = Id_Cliente_citas


DBCC CHECKIDENT (Clientes, RESEED,0)



drop table Ingresos,Citas,Reportes,Clientes,Empleados,Roles