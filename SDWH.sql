  CREATE DATABASE SDWS;

  USE SDWS;

-- ARCHIVO COMPRAS
CREATE TABLE STiempo(
	idTiempo int IDENTITY(1,1) PRIMARY KEY,
	dia int,
	mes int,
	anio int
);
GO
CREATE TABLE SProveedor(
   idProveedor int IDENTITY(1,1) PRIMARY KEY,
   CodProveedor  varchar(200),
   NombreProveedor  varchar(200),
   DireccionProveedor  varchar(200),
   NumeroProveedor  varchar(200),
   WebProveedor  varchar(200)
);
GO
CREATE TABLE SProducto(
	idProducto int IDENTITY(1,1) PRIMARY KEY,
	CodProducto  varchar(200),
	NombreProducto  varchar(200),
	MarcaProducto  varchar(200),
	Categoria  varchar(200)
);
GO
CREATE TABLE SSucursal(
	idSucursal int IDENTITY(1,1) PRIMARY KEY,
	CodSuSucursal varchar(200) NOT NULL UNIQUE,
	NombreSucursal varchar(200),
	DireccionSucursal varchar(200)
);
GO
CREATE TABLE SRegion(
	idRegion int IDENTITY(1,1) PRIMARY KEY,
	Region varchar(200) NOT NULL UNIQUE,
	Departamento varchar(200)
);
GO
CREATE TABLE STHCompras(
	idProveedor int FOREIGN KEY REFERENCES SProveedor(idProveedor),
	idProducto int FOREIGN KEY REFERENCES SProducto(idProducto),
	idSucursal int FOREIGN KEY REFERENCES SSucursal(idSucursal),
	idRegion int FOREIGN KEY REFERENCES SRegion(idRegion),
	idTiempo int FOREIGN KEY REFERENCES STiempo(idTiempo),
	Unidades int,
	CostoU int,
	PRIMARY KEY (idProveedor, idProducto, idSucursal, idTiempo)
);
-- ARCHIVO VENTAS
GO
CREATE TABLE SCliente(
   idCliente int IDENTITY(1,1) PRIMARY KEY,
   CodigoCliente varchar(200),
   NombreCliente varchar(200), 
   TipoCliente varchar(200),
   DireccionCliente varchar(200),
   NumeroCliente varchar(200)
);
GO
CREATE TABLE SVendedor(
	idVendedor int IDENTITY(1,1) PRIMARY KEY,
	CodVendedor varchar(200),
	NombreVendedor varchar(200),
	Vacacionista varchar(200)
);
GO
CREATE TABLE STHVentas(
	idCliente int FOREIGN KEY REFERENCES SCliente(idCliente),
	idVendedor int FOREIGN KEY REFERENCES SVendedor(idVendedor),
	idProducto int FOREIGN KEY REFERENCES SProducto(idProducto),
	idSucursal int FOREIGN KEY REFERENCES SSucursal(idSucursal),
	idRegion int FOREIGN KEY REFERENCES SRegion(idRegion),
	idTiempo int FOREIGN KEY REFERENCES STiempo(idTiempo),
	Unidades int,
	PrecioUnitario int,
	PRIMARY KEY (idCliente, idVendedor, idProducto, idSucursal, idTiempo)
);
GO
SELECT * FROM STiempo;
SELECT * FROM SProveedor;
SELECT * FROM SProducto;
SELECT * FROM SSucursal
SELECT * FROM SRegion;
SELECT * FROM SVendedor;
SELECT * FROM SCliente;
SELECT * FROM STHCompras;
SELECT * FROM STHVentas;
GO
SELECT COUNT(*) AS TIEMPO FROM STiempo;
SELECT COUNT(*) AS PROVEEDOR_329 FROM SProveedor;
SELECT COUNT(*) AS PRODUCTO FROM SProducto;
SELECT COUNT(*) AS SUCURSAL_119 FROM SSucursal
SELECT COUNT(*) AS REGION_22 FROM SRegion;
SELECT COUNT(*) AS VENDEDOR_69 FROM SVendedor;
SELECT COUNT(*) AS CLIENTE_298 FROM SCliente;
SELECT COUNT(*) AS STHCOMPRAS_321 FROM STHCompras;
SELECT COUNT(*) AS STHVENTAS_339 FROM STHVentas;
GO
DELETE FROM STHCompras;
DELETE FROM STHVentas;
GO
DELETE FROM STiempo;
DELETE FROM SProveedor;
DELETE FROM SProducto;
DELETE FROM SSucursal;
DELETE FROM SRegion;
GO
DELETE FROM SCliente;
DELETE FROM SVendedor;
GO
SELECT * FROM SVendedor as sc WHERE sc.Vacacionista = 'NAC';
