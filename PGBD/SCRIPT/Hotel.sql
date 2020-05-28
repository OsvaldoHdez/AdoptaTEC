CREATE DATABASE [HOTEL 5 ESTRELLAS]
USE [HOTEL 5 ESTRELLAS]

---------- Tablas -----------------
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
Depto varchar(50)
)

CREATE TABLE PUNTUACION(
idPuntuacion int primary key,
Puntuacion int,
Comentario varchar(100) null,
idCliente int,
idDepto int
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

ALTER TABLE PUNTUACION
ADD FOREIGN KEY (idDepto) REFERENCES DEPTO(idDepto);

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

ALTER TABLE FACTURA
ADD FOREIGN KEY (numPago) REFERENCES MODO_PAGO(numPago);


------- Registros --------------------------------
INSERT INTO CLIENTES (idCliente,NombC,ApeP,ApeM,edad,FechaNac,Dir,Tel,Cel,Email,RFC,LugarProv,Estatus)
VALUES
(100, 'Jesus', 'Lopez', 'Soto', 26,'1994/05/23', 'Otay 4390' , 3458793, 6642344532, 'jesus_lopez@gmail.com', 'LOSJ9405231H0', 'Tijuana,B.C.', 'Activo'),
(101, 'John', 'Cena', 'Jhonson', 48, '1968/08/03', 'La Postal #2324', 9304393, 6643904938, 'john_cena@gmail.com', 'CEJJ6808238F2', 'Tijuana,B.C.', 'Activo'),
(102, 'Jimena', 'Acosta', 'Fernandez', 30,'1990/03/14', 'Otay #4460' , 3458433, 6642345432, 'jimena_acosta@gmail.com', 'ACFL9003142J0', 'Tijuana,B.C.', 'Activo'),
(103, 'Walter', 'White', 'Flinn', 40,'1980/03/13', 'Zona centro #7890' , 3453453, 66412345122, 'walter_white@gmail.com', 'WAFW8003139S0', 'Tijuana,B.C.', 'Inactivo'),
(104, 'Keanu', 'Reeves', 'Wick', 55,'1963/09/03', 'Villa Fontana #5235' , 3453452, 6634343253, 'keanu_reeves@gmail.com', 'REWK6309036L1', 'Tijuana,B.C.', 'Activo');

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
SELECT * FROM FACTURA; J

--2. Reporte de habitaciones disponibles clasificado por tipo de habitación.
SELECT Habitaciones FROM ((DETALLE 
INNER JOIN FACTURA ON DETALLE.idFAc = FACTURA.idFac)
INNER JOIN HABITACIONES ON DETALLE.idHab = HABITACIONES.idHab) WHERE idCAT = @idCat;

SELECT * FROM HABITACIONES WHERE ID_HABIT = (SELECT ID_HABIT FROM CATEGORIA GROUP BY TIPO);

SELECT * FROM HABITACIONES WHERE DISPONIBILIDAD = 1 GROUP BY TIPO;

--3. Reporte de habitaciones ocupadas y número de huéspedes por fecha determinada.
SELECT CANT_HAB,CANT_HUE FROM DETALLE WHERE FECHA = @FECHA

SELECT * FROM DETALLE WHERE DISPONIBILIDAD = 0 BETWEEN FECHA1 AND FECHA2

--4. Reporte de ocupación del hotel clasificado por temporada en un rango de fechas dado.
SELECT * FROM CONTROL_VENTA BETWEEN FECHA1 AND FECHA2 AS TEMPORADA2020

--5. Reporte del tipo de habitación con su descripción y números de habitaciones disponible del hotel.
SELECT A.TIPO,A.DESCRIPCION,D.CANT_HAB FROM(( HABITACIONES H
INNER JOIN CAT A ON A.idCat = H.id.Cat)
INNER JOIN DETALLE D ON D.idHab = H.idHab)

SELECT * FROM CATEGORIA WHERE DIS_HABIT = 1;

--6. Reporte de los registros con mayor tiempo de ocupación por un rango de fechas determinado.
SELECT idFac, idCliente from FACTURA where FECHAIN = @FECHAIN AND FECHAOUT = @FECHAOUT

SELECT * FROM TABLA ORDER BY CANT_DIAS_TOTALES ASC BETWEEN FECHA1 AND FECHA2

--7. Reporte de los empleados totales que laboran en el hotel, clasificado por departamentos.
SELECT * FROM EMPLEADOS E INNER JOIN DEPTO D ON E.idDepto = D.idDepto

SELECT * FROM EMPLEADOS WHERE ID_EMPLEADO = (SELECT ID_EMPLEADO FROM DEPTO GROUP BY DEPTO);

--8. Reporte de los empleados de mostrador con mayor bono obtenido por el registro de los huéspedes en base a una fecha determinada.
SELECT idEmp FROM FACTURA WHERE MAX(TOTALPAGO) AND FECHA = @FECHA;

SELECT idEmp FROM FACTURA WHERE MAX(TOTALPAGO) BETWEEN FECHA1 AND FECHA2;

--9. Reporte de las ventas realizadas (Registro de habitación, servicios adquiridos) en un determinado rango de fechas.
SELECT * FROM CONTROL_VENTA

--10. Reporte de ganancias obtenidas por servicios adquiridos clasificados por tipo de servicio y en base a un rango de fechas dado.
SELECT * FROM FACTURA WHHERE (PAGO - TOTALPAGO) = 

--11. Reporte de quejas registradas en base a un rango de fechas dado y clasificado por el departamento al que fue aplicada la queja.
SELECT * FROM QUEJA WHERE idDep BETWEEN FECHA1 AND FECHA2

--12. Reporte de número de huéspedes registrados y clasificados por el medio de registro (Internet, Teléfono, Presencial) y muestre las ganancias obtenidas en base a rango de fechas dado.
SELECT * FROM CLIENTES
SELECT * FROM CLIENTES GROUP BY TIPOREGISTRO

--13. Reporte del departamento con mejor rating de satisfacción, en base a un rango de fechas dado.


