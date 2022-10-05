
/*hasta el final estan las consultas de agregacion */


create database Dbjob;

use Dbjob; 

/*crear tabla */
create table Db_trabajos(
	idtrabajos int identity(1,1) primary key,
	nombre varchar(20),
	sueldobase float

);  


/*ingresar valores  */
insert into dbo.Db_trabajos (nombre , sueldobase) values ('Programado', 1500); 



/*selecionar valor con sentencia where condicion cuando sueldo sea igual 1500*/

select * from Db_trabajos where sueldobase=1500;

/*Crear tabla a partir de otra (select - into)*/

 select idtrabajos,nombre , sueldobase
  into dbnewTable
  from Db_trabajos

  /*se replica la tabla apartir de los datos de la tabla Db_trabajos*/
  select * from dbnewTable




/********** 		PRACTICA Y EJERCICIOS					************/



/*Insertar el registro [‘943775’, ‘Roberto Morales’, ‘Santa Tecla’, ‘8886-
6555’] en la tabla CLIENTE.*/


insert into Table_cliente(nombre_cliente , ciudad, telefono) values ('Roberto Morales' , 'Santa Tecla ' , 8886-
6555) 

/*Insertar el registro [5,’San Miguel’] en la tabla ALMACEN.*/

insert into almacen(id_almacen , ciudad)  values (5 , 'San Miguel');

/*3. Insertar [’P000011’, ‘01/10/2009’, ‘943775’, 600.00] en PEDIDO.*/ 

insert into pedido(id_pedido , fecha_pedido , id_cliente , Total_importe) values ('P00011' , '01/10/2009' , '943775' , 600.00 )



/*mostrar datos de la tabla cliente*/

SELECT * from Table_cliente ; 

/*actulizar datos de clite id 1 */ 

UPDATE Table_cliente
SET nombre_cliente = 'antonio', ciudad = 'Lourdes'
WHERE id_cliente = 1; 

/*Id_Pedido=’P00009’*/

DELETE FROM pedido WHERE  id_pedido = 'P00009'
DELETE FROM detalle_pedido where id_pedido = 'P00009'
DELETE FROM envio WHERE id_pedido = 'P00009'

/*Eliminar datos*/
DELETE FROM Table_cliente
WHERE id_cliente = 1;



/*Modificar Fecha_Envio y Id_Almacen de la tabla ENVIOS con
Id_Pedido=’P00001, con los valores ‘01/10/2009’ y 5,
respectivamente.*/


UPDATE envio set  

Fecha_Envio = '01/10/2009',
id_almacen  = 5 

where id_pedido =  'P00009'


/*Modificar el atributo Precio de la tabla ARTICULO con ID_Articulo
=’9583463’ cambiándolo a 702.00.*/

UPDATE articulo set 
precio_UNI  =  702.00
where  id_articulo = 9583463


/*Modificar el atributo Ciudad de la tabla ALMACENES con Id_Almacen
= 1 cambiándolo a ‘Sonsonate’.*/


UPDATE almacen set  
ciudad = 'Sonsonate'  
where id_almacen =  1 ; 








/******** BASE DE DATOS PEDIDOS **********/

  create database  pedidos; 

  use pedidos;

  create table Table_cliente(
	
	id_cliente int  identity(1,1) primary key , 
	nombre_cliente varchar(50) , 
	ciudad varchar(50), 
	telefono integer , 
  
--   ); 


create table pedido(
	id_pedido int identity(1,1) primary key, 
	fecha_pedido datetime , 
	id_cliente int , 
CONSTRAINT fkcliente FOREIGN KEY (id_cliente) REFERENCES Table_cliente(id_cliente),


); 

ALTER TABLE pedido
ADD Total_importe float;

create table articulo( 
	
	id_articulo int identity(1,1) primary key , 
	nombre_articulo varchar(50) ,
	precio_UNI  decimal(3,2) 

);  


create table almacen(
	
	id_almacen int identity(1,1) primary  key, 
	ciudad text , 
	

);  


create table detalle_pedido(
	 id_pedido int identity(1,1) primary key, 
	 id_Articulo  int , 

	 CONSTRAINT fkpedido FOREIGN KEY (id_articulo) REFERENCES detalle_pedido(id_articulo),

);  


create table envio(
	id_pedido varchar(50) , 

CONSTRAINT fkcliente FOREIGN KEY (id_pedido) REFERENCES articulo(id_articulo),


); 








