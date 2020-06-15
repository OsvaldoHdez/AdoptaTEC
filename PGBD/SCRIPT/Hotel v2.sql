CREATE DATABASE [HOTEL 5 ESTRELLAS]
USE [HOTEL 5 ESTRELLAS]

CREATE TABLE CLIENTES(
idCliente int primary key,
NombC varchar(30),
ApeP varchar(15),
ApeM varchar(15),
edad int,
FechaNac date,
Dir varchar(50),
Tel int,
Cel int,
Email varchar(30),
RFC varchar(20),
LugarProv varchar(30),
Estatus varchar(20),
)

CREATE TABLE ACOMPA(
idAcompa int primary key,
idCliente int,
NombA varchar(30),
ApeP varchar(15),
ApeM varchar(15),
FechaNacA date,
Email varchar(30)
)

CREATE TABLE FACTURA(
idFac int primary key,
idCliente int,
numFac int,
Fecha date,
Paquete varchar(50),
Servicios varchar(50),
numPago int,
Pago int,
TotalPago int
)

CREATE TABLE DETALLE (
idVenta int,
idHab int,
idRes int,
Cantidad_Hab int,
Precio int,
Dias int
)

CREATE TABLE HABITACIONES(
idHab int primary key,
Detalles varchar(100),
Precio int,
Stock int,
idCat int
)

CREATE TABLE CATEGORIA(
idCat int primary key,
Tipo varchar(30),
Descripcion varchar(100)
)

CREATE TABLE EMPLEADOS(
idEmp int primary key,
NombC varchar(30),
ApeP varchar(15),
ApeM varchar(15),
edad int,
FechaNac date,
Dir varchar(50),
Tel int,
Cel int,
Email varchar(30),
RFC varchar(20),
Puesto varchar(30),
idDepto int
)

CREATE TABLE INV_SERV(
idServ int primary key,
Servicio varchar(50),
Tipo varchar(30),
Precio int
)

CREATE TABLE PAQ_SERV(
idPaq int primary key,
Paquete varchar(50),
Descripcion varchar(100),
Duracion varchar(100),
Precio int
)

CREATE TABLE PROMOCIONES(
idProm int primary key,
idTipo int,
Promo varchar(100),
FechaOP date,
FechaFN date
)

CREATE TABLE QUEJA(
idQueja int primary key,
idCliente int,
Queja varchar(50) not null
)

CREATE TABLE MODO_PAGO(
numPago int primary key,
nombre varchar(50),
Otros_Det varchar(100),
Fecha date
)

CREATE TABLE RESERVACIONES(
idRes int primary key,
idCliente int,
idTipo int,
Peticion varchar(100),
Fecha date,
HotelStart date,
HotalEnd date,
cant_hab int,
Dias int,
Pago int,
Hora time
)

CREATE TABLE CONTROL_VENTA(
idVenta int primary key,
idEmp int,
idCliente int,
idFac int,
idPaq int,
idServ int,
TotalHab int,
Fecha date
)

CREATE TABLE DEPTO(
idDepto int primary key,
Depto varchar(50),
)

CREATE TABLE PUNTUACION(
Comentario varchar(100),
Puntuacion int,
idDepto int,
idCliente int
)

CREATE TABLE VERIFICACION(
idRes int,
idVenta int,
Confirmacion int
)

CREATE TABLE TIPO_CLIENTE(
idTipo int primary key,
Tipo varchar(50)
)

----- Llaves Foraneas -----
ALTER TABLE ACOMPA
ADD FOREIGN KEY (idCliente) REFERENCES CLIENTES(idCliente);

ALTER TABLE QUEJA
ADD FOREIGN KEY (idCliente) REFERENCES CLIENTES(idCliente);

ALTER TABLE PUNTUACION
ADD FOREIGN KEY (idDepto) REFERENCES DEPTO(idDepto);

ALTER TABLE EMPLEADOS
ADD FOREIGN KEY (idDepto) REFERENCES DEPTO(idDepto);

ALTER TABLE PUNTUACION 
ADD FOREIGN KEY (idCliente) REFERENCES CLIENTES(idCliente);

ALTER TABLE RESERVACIONES
ADD FOREIGN KEY (idCliente) REFERENCES CLIENTES(idCliente);

ALTER TABLE RESERVACIONES
ADD FOREIGN KEY (idTipo) REFERENCES TIPO_CLIENTE(idTipo);

ALTER TABLE PROMOCIONES
ADD FOREIGN KEY (idTipo) REFERENCES TIPO_CLIENTE(idTipo);

ALTER TABLE VERIFICACION
ADD FOREIGN KEY (idRes) REFERENCES RESERVACIONES(idRes);

ALTER TABLE VERIFICACION
ADD FOREIGN KEY (idVenta) REFERENCES CONTROL_VENTA(idVenta);


ALTER TABLE HABITACIONES
ADD FOREIGN KEY (idCat) REFERENCES CATEGORIA(idCat);

ALTER TABLE CONTROL_VENTA
ADD FOREIGN KEY (idPaq) REFERENCES PAQ_SERV(idPaq);

ALTER TABLE CONTROL_VENTA
ADD FOREIGN KEY (idServ) REFERENCES INV_SERV(idServ);

ALTER TABLE CONTROL_VENTA
ADD FOREIGN KEY (idEmp) REFERENCES EMPLEADOS(idEmp);

ALTER TABLE CONTROL_VENTA
ADD FOREIGN KEY (idFac) REFERENCES FACTURA(idFac);

ALTER TABLE DETALLE
ADD FOREIGN KEY (idHab) REFERENCES HABITACIONES(idHab);

ALTER TABLE DETALLE
ADD FOREIGN KEY (idVenta) REFERENCES CONTROL_VENTA(idVenta);

ALTER TABLE FACTURA
ADD FOREIGN KEY (numPago) REFERENCES MODO_PAGO(numPago);

AlTER TABLE DETALLE 
ADD FOREIGN KEY (idRes) REFERENCES RESERVACIONES(idRes);

AlTER TABLE FACTURA
ADD FOREIGN KEY (idCliente) REFERENCES CLIENTES(idCliente);

ALTER TABLE CONTROL_VENTA
ADD FOREIGN KEY (idCliente) REFERENCES CLIENTES(idCliente);

AlTER TABLE CONTROL_VENTA
ADD FOREIGN KEY (idEmp) REFERENCES EMPLEADOS(idEmp);

------- Registros --------------------------------
INSERT INTO CLIENTES (idCliente,NombC,ApeP,ApeM,edad,FechaNac,Dir,Tel,Cel,Email,RFC,LugarProv,Estatus)
VALUES
(100, 'Jesus', 'Lopez', 'Soto', 26,'1994/05/23', 'Otay 4390' , 3458793, 6642344532, 'jesus_lopez@gmail.com', 'LOSJ9405231H0', 'Tijuana,B.C.', 'Activo'),
(101, 'John', 'Cena', 'Jhonson', 48, '1968/08/03', 'La Postal #2324', 9304393, 6643904938, 'john_cena@gmail.com', 'CEJJ6808238F2', 'Tijuana,B.C.', 'Activo'),
(102, 'Jimena', 'Acosta', 'Fernandez', 30,'1990/03/14', 'Otay #4460' , 3458433, 6642345432, 'jimena_acosta@gmail.com', 'ACFL9003142J0', 'Tijuana,B.C.', 'Activo'),
(103, 'Walter', 'White', 'Flinn', 40,'1980/03/13', 'Zona centro #7890' , 3453453, 66412345122, 'walter_white@gmail.com', 'WAFW8003139S0', 'Tijuana,B.C.', 'Inactivo'),
(104, 'Keanu', 'Reeves', 'Wick', 55,'1963/09/03', 'Villa Fontana #5235' , 3453452, 6634343253, 'keanu_reeves@gmail.com', 'REWK6309036L1', 'Tijuana,B.C.', 'Activo'));

select*from CLIENTES

INSERT INTO ACOMPA (idAcompa,idCliente,NombA,ApeP,ApeM,FechaNacA,Email) 
VALUES
(1000,100,'Jorge','Mendez','Lopez','2001/12/17','jorge_mendez@gmail.com' ),
(1001,100,'Guadalupe','Mendez','Lopez','1999/11/13','jose_mendez@gmail.com' ),
(1002,101,'Fernando','Martinez','Perez','1998/09/27','fernando_martinez@gmail.com' ),
(1003,103,'Alfonso','Corona','Sanchez','2000/04/11','alfonso_corona@gmail.com' ),
(1004,104,'Diego','Maradona','Hernandez','1995/12/16','diego_maradona@gmail.com' );

INSERT INTO QUEJA (idQueja,idCliente,Queja)
VALUES
(2000,100,'Pesimo servicio del Depto de Servicio al cuarto'),
(2001,103,'Mala comunicacion en recepcion'),
(2002,104,'Demora de atencion en el comedor')

INSERT INTO PUNTUACION (idPuntuacion,Comentario,idCliente,Puntuacion)
VALUES
(3000,'Excelente Servicio',100,10,4000),
(3001,'Buen Servicio',101,8,4001),
(3002,'Servicio aceptable',102,7,4002),
(3003,'Mal servicio',103,5,4003),
(3004,'Pesimo Servicio',104,1,4004)


INSERT INTO DEPTO (idDepto,Depto)
VALUES
(4000,'Servicio de atencion al cuarto'),
(4001,'Alberca'),
(4002,'Comedor'),
(4003,'Limpieza'),
(4004,'Recepcion'),
(4005,'Atencion al cliente'),
(4006,'Spa'),
(4007,'Gimnasio'),
(4008,'Restaurant'),
(4009,'Salon de eventos'),
(4010,'Bar'),
(4011,'Discoteca'),
(4012,'Campo de Golf'),
(4013,'Casino'),
(4014,'Tours de Parques de entretenimiento'),
(4015,'Museos'),
(4016,'Zona historicas'),
(4017,'Servicios de traslados')


INSERT INTO EMPLEADOS (idDepto,NombC,ApeP,ApeM,edad,FechaNac,Dir,Tel,Cel,Email,RFC,Puesto,idDepto)
VALUES
(5000,'Jesus','Ibarra','Hernandez',25,'1995/01/21','Morita','3424543','6642345432','jesus_ibarra@gmail.com','IBHJ9501216Y2','Mantenimiento de Gimnasio',4007),
(5001,'Maria','Sanchez','Ramirez',26,'1994/02/25','Dorado','3424532','6643526432','maria_sanchez@gmail.com','SARM9402256R2','Recepcionista',4004),
(5002,'Abel','Camargo','Segundo',24,'1996/03/12','El lago','4245465','6642343523','abel_camargo@gmail.com','CASA9603124E4','Bartender',4010),
(5003,'Kevin','Salazar','Olivas',23,'1997/04/01','Mariano','3424598','6642348472','kevin_salazar@gmail.com','SAOK9704016U6','Mantenimiento de Campo de Golf',4012),
(5004,'Lizeth','Hernandez','Florez',21,'1999/05/14','Florido','3424587','6642334364','lizeth_hernandez@gmail.com','HEFL9905147L1','Mantenimiento de Alberca',4001)

INSERT INTO RESERVACIONES (idRes, idCliente, idTipo, Peticion, Fecha, Pago)
VALUES
(6000, 100, 7000,'buena vista, cercano a la alberca','2020/03/21',500 ),
(6001, 101, 7001,'buena vista, cercano a la alberca','2020/04/21',500 ),
(6002, 102, 7000,'buena vista, cercano a la alberca','2020/05/21',500 ),
(6003, 103, 7002,'buena vista, cercano a la alberca','2020/02/21',500 ),
(6004, 104, 7001,'buena vista, cercano a la alberca','2020/01/21',500 );

INSERT INTO TIPO_CLIENTE (idTipo, Tipo)
VALUES
(7000,'Bueno'),
(7001,'Regular'),
(7002,'Malo'),
(7003,'Excelente');

INSERT INTO PROMOCIONES (idProm, idTipo, Promo, FechaOP, FechaFN)
VALUES
(7004,7003,'Primavera: paquete alberca, spa,buffet y parques recreativos ilimitados por un fin de semana por 5000 pesos'),
(7005,7000,'Verano: Paquete alberca + parques recreativos ilimitados por un fin de semana por 4000 pesos'),
(7006,7001, 'Oto�o: Paquete Jacuzzi/spa + parque recreativos por un fin de semana a 3000 pesos'),
(7007, 7002,'Invierno: Paquete 2x1 por un fin de semana a 2000 pesos')

INSERT INTO VERIFICACION (idRes, idFac)
VALUES
(6000, 8000, 1),
(6001, 8001, 1),
(6002, 8002, 1),
(6003, 8003, 1),
(6004, 8004, 1);

INSERT INTO FACTURA (idFac, numFac, Fecha, Paquete, Servicios, numPago, Pago, TotalPago)
VALUES
(8000, 9000, '2020/01/21','Primavera','ninguno',10000,5000,5050),
(8001, 9001, '2020/02/21','Invierno','ninguno',10001,5000,2050),
(8002, 9002, '2020/03/21','Oto�o','ninguno',10002,5000,3050),
(8003, 9003, '2020/04/21','Verano','ninguno',10003,5000,4050),
(8004, 9004, '2020/05/21','Verano','ninguno',10004,5000,4050);

INSERT INTO MODO_PAGO (numPago, nombre, Otros_Det, Fecha)
VALUES
(10001,'x','x','2020/01/21'),
(10002,'x','x','2020/01/21'),
(10003,'x','x','2020/01/21'),
(10004,'x','x','2020/01/21'),
(10005,'x','x','2020/01/21');

INSERT INTO CONTROL_VENTA (idVenta, idEmp,idFac, idPaq, idServ, TotalHab)
VALUES
(11000,5000,8000,12000,13013,2),
(11001,5001,8001,12001,13013,2),
(11002,5002,8002,12002,13013,2),
(11003,5003,8003,12003,13013,2),
(11004,5004,8004,12000,13013,2);

INSERT INTO PAQ_SERV (idPaq, Descripcion, Duracion, Precio)
VALUES
(12000,'Primavera','x','3 dias',5000),
(12001,'Verano','x','3 dias',4000),
(12002,'Oto�o','x','3 dias',3000),
(12003,'Invierno','x','3 dias',2000);

INSERT INTO INV_SERV (idServ, Servicio, Tipo, Precio)
VALUES
(13000,'Servicio de atencion al cuarto'),
(13001,'Alberca'),
(13002,'Comedor'),
(13003,'Limpieza'),
(13004,'Recepcion'),
(13005,'Atencion al cliente'),
(13006,'Spa'),
(13007,'Gimnasio'),
(13008,'Restaurant'),
(13009,'Salon de eventos'),
(13010,'Bar'),
(13011,'Discoteca'),
(13012,'Campo de Golf'),
(13013,'Casino'),
(13014,'Tours de Parques de entretenimiento'),
(13015,'Museos'),
(13016,'Zona historicas'),
(13017,'Servicios de traslados')

INSERT INTO DETALLE (idVenta,idHab,Cantidad_Hab,Precio)
VALUES
(11000,14000,2,500);

INSERT INTO HABITACIONES (idHab,Detalles,Precio,Stock,idCat)
VALUES
(14000,'x',500,10,15000),
(14001,'x',700,10,15001),
(14002,'x',900,10,15002),
(14003,'x',1100,7,15003),
(14004,'x',1500,5,15004);

INSERT INTO CATEGORIA (idCat,Tipo,Descripcion)
VALUES
(15000,'basica','x'),
(15001,'premium','x'),
(15002,'suite','x'),
(15003,'junior suite','x'),
(15004,'gran suite','x');

------- Triggers ----------------------------------
--1. Selecci�n de un tipo de habitaci�n y que esta permita sugerirle m�ltiples paquetes de servicios interno o externos al cliente.
CREATE TRIGGER INSERT_RESERVACIÓN ON RESERVACIONES
FOR INSERT
AS
SELECT * FROM PAQ_SERV
SELECT * FROM INV_SERV
PRINT('Inserción éxitosa')
GO

--2. Cancelaci�n de una reservaci�n que ya se hab�a completado.
CREATE TRIGGER CANCEL_RESERVACION ON RESERVACIONES
FOR DELETE
AS
PRINT('Cancelación de reservación éxitosa')
GO

--3. Modificaci�n de los paquetes que hab�a seleccionado el hu�sped.
CREATE TRIGGER UPDATE_CONTROL_VENTA ON CONTROL_VENTA
FOR UPDATE
AS
PRINT('Actualización éxitosa')
GO

--4. Realizar una auditor�a de los agentes de mostrador, los cuales presente el nombre del
-- agente, el tipo de habitaci�n que registro, cuantos d�as mantendr� dicho registro, y que
-- paquetes de servicios internos y externos dio de alta con el registro de habitaci�n, si el
-- agente hizo registros de clientes con m�s de 3 d�as de hospedaje, obtiene un bono de
-- $380.00 por registro, si es de 5 d�as tendr� un bono de $500.00 pesos por registro y si es
-- de 10 d�as en adelante obtendr� un bono de $1500.00 por hospedaje.

--5. Proceso que permita registrar un nuevo paquete de servicios o simple servicios con precios para cada tipo de habitaci�n que se contemple.
CREATE TRIGGER INSERT_PAQ ON INV_SERV
FOR INSERT
AS
SELECT * FROM HABITACIONES
PRINT('Inserción éxitosa')
GO

------- Consultas ---------------------------------
--1. Factura del servicio de estad�a en Hotel.
SELECT * FROM FACTURA;

--2. Reporte de habitaciones disponibles clasificado por tipo de habitaci�n.
SELECT Habitaciones FROM ((DETALLE 
INNER JOIN FACTURA ON DETALLE.idFAc = FACTURA.idFac)
INNER JOIN HABITACIONES ON DETALLE.idHab = HABITACIONES.idHab) WHERE idCAT = @idCat
SELECT * FROM HABITACIONES WHERE DISPONIBILIDAD = 1 GROUP BY TIPO;
SELECT * FROM HABITACIONES WHERE idCat = (SELECT idCat FROM CATEGORIA GROUP BY TIPO);

--3. Reporte de habitaciones ocupadas y n�mero de hu�spedes por fecha determinada.
SELECT CANT_HAB,CANT_HUE FROM DETALLE WHERE FECHA = @FECHA
SELECT * FROM DETALLE WHERE DISPONIBILIDAD = 0 BETWEEN FECHA1 AND FECHA2

--4. Reporte de ocupaci�n del hotel clasificado por temporada en un rango de fechas dado.
SELECT * FROM CONTROL_VENTA BETWEEN FECHA1 AND FECHA2 AS TEMPORADA2020

--5. Reporte del tipo de habitaci�n con su descripci�n y n�meros de habitaciones disponible del hotel.
SELECT A.TIPO,A.DESCRIPCION,D.CANT_HAB FROM(( HABITACIONES H
INNER JOIN CAT A ON A.idCat = H.id.Cat)
INNER JOIN DETALLE D ON D.idHab = H.idHab)
SELECT * FROM CATEGORIA WHERE DIS_HABIT = 1;

--6. Reporte de los registros con mayor tiempo de ocupaci�n por un rango de fechas determinado.
SELECT idFac, idCliente from FACTURA where FECHAIN = @FECHAIN AND FECHAOUT = @FECHAOUT
SELECT * FROM TABLA ORDER BY CANT_DIAS_TOTALES ASC BETWEEN FECHA1 AND FECHA2

--7. Reporte de los empleados totales que laboran en el hotel, clasificado por departamentos.
SELECT * FROM EMPLEADOS E INNER JOIN DEPTO D ON E.idDepto = D.idDepto
SELECT * FROM EMPLEADOS WHERE ID_EMPLEADO = (SELECT ID_EMPLEADO FROM DEPTO GROUP BY DEPTO);

--8. Reporte de los empleados de mostrador con mayor bono obtenido por el registro de los hu�spedes en base a una fecha determinada.
SELECT idEmp FROM FACTURA WHERE MAX(TOTALPAGO) AND FECHA = @FECHA
SELECT idEmp FROM FACTURA WHERE MAX(TOTALPAGO) BETWEEN FECHA1 AND FECHA2;

--9. Reporte de las ventas realizadas (Registro de habitaci�n, servicios adquiridos) en un determinado rango de fechas.
SELECT * FROM VENTAS

--10. Reporte de ganancias obtenidas por servicios adquiridos clasificados por tipo de servicio y en base a un rango de fechas dado.
SELECT * FROM FACTURA WHHERE (PAGO - TOTALPAGO) = 

--11. Reporte de quejas registradas en base a un rango de fechas dado y clasificado por el departamento al que fue aplicada la queja.
SELECT * FROM QUEJA WHERE idQueja =
SELECT * FROM QUEJA WHERE GROUP BY idDep BETWEEN FECHA1 AND FECHA2

--12. Reporte de n�mero de hu�spedes registrados y clasificados por el medio de registro (Internet, Tel�fono, Presencial) y muestre las ganancias obtenidas en base a rango de fechas dado.
SELECT * FROM CLIENTES
SELECT * FROM CLIENTES GROUP BY TIPOREGISTRO

--13. Reporte del departamento con mejor rating de satisfacci�n, en base a un rango de fechas dado.
SELECT * FROM DEPTO WHERE idDepto = (SELECT idDepto FROM PUNTUACION GROUP BY Puntuacion);

/*Generar como mínimo 5 procedimientos almacenados o los que sean necesarios que
permitan mejorar el rendimiento con respecto al proceso de reservación y registro de
huéspedes, también se puede considerar el manejo de rangos de fechas o promociones.*/
--1. RESERVACIONES
CREATE PROCEDURE dbo.InsertarReservación 
@idRes int,
@idCliente int,
@idTipo int,
@Peticion varchar(100),
@Fecha date,
@HotelStart date,
@HotalEnd date,
@cant_hab int,
@Dias int,
@Pago int,
@Hora time
AS
INSERT INTO dbo.RESERVACIONES (idRes, idCliente, idTipo, Peticion, Fecha, HotelStart, HotalEnd, cant_hab, Dias, Pago, Hora) 
VALUES (@idRes, @idCliente, @idTipo, @Peticion, @Fecha, @HotelStart, @HotalEnd, @cant_hab, @Dias, @Pago, @Hora)

--2. REGISTRO CLIENTES
CREATE PROCEDURE dbo.InsertarClientes 
@idCliente int,
@NombC varchar(30),
@ApeP varchar(15),
@ApeM varchar(15),
@edad int,
@FechaNac date,
@Dir varchar(50),
@Tel int,
@Cel int,
@Email varchar(30),
@RFC varchar(20),
@LugarProv varchar(30),
@Estatus varchar(20)
AS
INSERT INTO dbo.CLIENTES (idCliente, NombC, ApeP, ApeM, edad, FechaNac, Dir, Tel, Cel, Email, RFC, LugarProv, Estatus) 
VALUES (@idCliente, @NombC, @ApeP, @ApeM, @edad, @FechaNac, @Dir, @Tel, @Cel, @Email, @RFC, @LugarProv, @Estatus)

--3. Actualizar promociones
CREATE PROCEDURE dbo.ActualizarPromociones
@idProm int,
@idTipo int,
@Promo varchar(100),
@FechaOP date,
@FechaFN date
AS
UPDATE dbo.PROMOCIONES 
SET 
idProm = @idProm,
idTipo = @idTipo,
Promo = @Promo,
FechaOP = @FechaOP,
FechaFN = @FechaFN
WHERE idProm = @idProm

--4. Actualizar datos de reservación
CREATE PROCEDURE dbo.ActualizarReservaciones
@idRes int,
@idCliente int,
@idTipo int,
@Peticion varchar(100),
@Fecha date,
@HotelStart date,
@HotalEnd date,
@cant_hab int,
@Dias int,
@Pago int,
@Hora time
AS
UPDATE dbo.RESERVACIONES 
SET 
idRes = @idRes,
idCliente = @idCliente,
idTipo = @idTipo,
Peticion = @Peticion,
Fecha = @Fecha,
HotelStart = @HotelStart,
HotalEnd = @HotalEnd,
cant_hab = @cant_hab,
Dias = @Dias,
Pago = @Pago,
Hora = @Hora
WHERE idRes = @idRes

--5. Actualizar habitaciones
CREATE PROCEDURE dbo.ActualizarHabitaciones
@idHab int,
@Detalles varchar(100),
@Precio int,
@Stock int,
@idCat int
AS
UPDATE dbo.HABITACIONES
SET 
idHab = @idHab,
Detalles = @Detalles,
Precio = @Precio,
Stock = @Stock,
idCat = @idCat
WHERE idHab = @idHab