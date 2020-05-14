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
Estatus varchar(20)
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
Cantidad_Hab int,
Precio int
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
Puesto varchar(30)
)

CREATE TABLE INV_SERV(
idServ int primary key,
Servicio varchar(50),
Tipo varchar(30),
Precio int
)

CREATE TABLE PAQ_SERV(
idPaq int primary key,
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
Pago int
)

CREATE TABLE CONTROL_VENTA(
idVenta int primary key,
idEmp int,
idFac int,
idPaq int,
idServ int,
TotalHab int
)

CREATE TABLE DEPTO(
idDepto int primary key,
Depto varchar(50),
idPuntuacion int
)

CREATE TABLE PUNTUACION(
idPuntuacion int primary key,
Comentario varchar(100) null,
idCliente int
)

CREATE TABLE VERIFICACION(
idRes int,
idFac int
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
ADD FOREIGN KEY (idCliente) REFERENCES CLIENTES(idCliente);

ALTER TABLE EMPLEADOS
ADD FOREIGN KEY (idDepto) REFERENCES DEPTO(idDepto);

ALTER TABLE DEPTO
ADD FOREIGN KEY (idPuntuacion) REFERENCES PUNTUACION(idPuntuacion);

ALTER TABLE RESERVACIONES
ADD FOREIGN KEY (idCliente) REFERENCES CLIENTES(idCliente);

ALTER TABLE RESERVACIONES
ADD FOREIGN KEY (idTipo) REFERENCES TIPO_CLIENTE(idTipo);

ALTER TABLE PROMOCIONES
ADD FOREIGN KEY (idTipo) REFERENCES TIPO_CLIENTE(idTipo);

ALTER TABLE VERIFICACION
ADD FOREIGN KEY (idRes) REFERENCES RESERVACIONES(idRes);

ALTER TABLE VERIFICACION
ADD FOREIGN KEY (idFac) REFERENCES FACTURA(idFac);

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



------- Triggers ----------------------------------
--1. Selección de un tipo de habitación y que esta permita sugerirle múltiples paquetes de servicios interno o externos al cliente.

--2. Cancelación de una reservación que ya se había completado.

--3. Modificación de los paquetes que había seleccionado el huésped.

--4. Realizar una auditoría de los agentes de mostrador, los cuales presente el nombre del
-- agente, el tipo de habitación que registro, cuantos días mantendrá dicho registro, y que
-- paquetes de servicios internos y externos dio de alta con el registro de habitación, si el
-- agente hizo registros de clientes con más de 3 días de hospedaje, obtiene un bono de
-- $380.00 por registro, si es de 5 días tendrá un bono de $500.00 pesos por registro y si es
-- de 10 días en adelante obtendrá un bono de $1500.00 por hospedaje.

--5. Proceso que permita registrar un nuevo paquete de servicios o simple servicios con precios para cada tipo de habitación que se contemple.


------- Consultas ---------------------------------
--1. Factura del servicio de estadía en Hotel.
SELECT * FROM FACTURA;
--2. Reporte de habitaciones disponibles clasificado por tipo de habitación.
SELECT Habitaciones FROM ((DETALLE 
INNER JOIN FACTURA ON DETALLE.idFAc = FACTURA.idFac)
INNER JOIN HABITACIONES ON DETALLE.idHab = HABITACIONES.idHab) WHERE idCAT = @idCat
--3. Reporte de habitaciones ocupadas y número de huéspedes por fecha determinada.
SELECT CANT_HAB,CANT_HUE FROM DETALLE WHERE FECHA = @FECHA
--4. Reporte de ocupación del hotel clasificado por temporada en un rango de fechas dado.

--5. Reporte del tipo de habitación con su descripción y números de habitaciones disponible del hotel.
SELECT A.TIPO,A.DESCRIPCION,D.CANT_HAB FROM(( HABITACIONES H
INNER JOIN CAT A ON A.idCat = H.id.Cat)
INNER JOIN DETALLE D ON D.idHab = H.idHab)
--6. Reporte de los registros con mayor tiempo de ocupación por un rango de fechas determinado.
SELECT idFac, idCliente from FACTURA where FECHAIN = @FECHAIN AND FECHAOUT = @FECHAOUT
--7. Reporte de los empleados totales que laboran en el hotel, clasificado por departamentos.
SELECT * FROM EMPLEADOS E INNER JOIN DEPTO D ON E.idDepto = D.idDepto
--8. Reporte de los empleados de mostrador con mayor bono obtenido por el registro de los huéspedes en base a una fecha determinada.
SELECT idEmp FROM FACTURA WHERE MAX(TOTALPAGO) AND FECHA = @FECHA
--9. Reporte de las ventas realizadas (Registro de habitación, servicios adquiridos) en un determinado rango de fechas.
SELECT * FROM VENTAS
--10. Reporte de ganancias obtenidas por servicios adquiridos clasificados por tipo de servicio y en base a un rango de fechas dado.
SELECT * FROM FACTURA WHHERE (PAGO - TOTALPAGO) = 
--11. Reporte de quejas registradas en base a un rango de fechas dado y clasificado por el departamento al que fue aplicada la queja.

--12. Reporte de número de huéspedes registrados y clasificados por el medio de registro (Internet, Teléfono, Presencial) y muestre las ganancias obtenidas en base a rango de fechas dado.
SELECT * FROM CLIENTES
--13. Reporte del departamento con mejor rating de satisfacción, en base a un rango de fechas dado.


