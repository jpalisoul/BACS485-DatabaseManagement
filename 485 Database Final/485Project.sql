CREATE TABLE Warehouse (
  WarehouseID CHAR(4),
  WarehouseName CHAR(20),
  Location CHAR(100),
  PRIMARY KEY (WarehouseID)
);

CREATE TABLE Employee (
  EmployeeID NUMBER(6,0),
  PhoneNumber NUMBER(10,0),
  FirstName CHAR(10),
  MiddleName CHAR(10),
  LastName CHAR(10),
  Address CHAR(255),
  ManagerID NUMBER(6,0),
  PRIMARY KEY (EmployeeID)
);

CREATE TABLE Parts (
  PartNumber CHAR(5),
  Quantity INTEGER,
  Assembly CHAR(3),
  PRIMARY KEY (PartNumber)
);

CREATE TABLE Backorder (
  BackorderID NUMBER(8,0),
  BackorderDate DATE,
  ManagerID NUMBER(6,0),
  Quantity INTEGER,
  PartNumber CHAR(5),
  FOREIGN KEY (ManagerID) REFERENCES Employee,
  FOREIGN KEY (PartNumber) REFERENCES Parts,
  PRIMARY KEY (BackorderID)
);

CREATE TABLE BackorderArchive (
  BackorderArchiveID NUMBER(8,0),
  BackorderDate DATE,
  PartNumber CHAR(5),
  Quantity INTEGER,
  BackorderID NUMBER(8,0),
  FOREIGN KEY (BackorderID) REFERENCES Backorder,
  PRIMARY KEY (BackorderArchiveID)
);

CREATE TABLE Batches (
  BatchNumber INTEGER,
  BatchSize INTEGER,
  ShipmentDate DATE,
  ManagerID NUMBER(6,0),
  PartNumber CHAR(5),
  FOREIGN KEY (PartNumber) REFERENCES Parts,
  FOREIGN KEY (ManagerID) REFERENCES Employee,
  PRIMARY KEY (BatchNumber)
);

CREATE TABLE BatchCheck (
  ArrivalDate DATE,
  CheckedIn CHAR(3),
  BatchNumber INTEGER,
  PRIMARY KEY (ArrivalDate),
  FOREIGN KEY (BatchNumber) REFERENCES Batches
);

CREATE TABLE Item (
  ItemNumber NUMBER(8,0),
  PartNumber CHAR(5),
  BatchNumber INTEGER,
  FOREIGN KEY (BatchNumber) REFERENCES Batches,
  PRIMARY KEY (ItemNumber)
);

CREATE TABLE Bin (
  BinNumber INTEGER,
  Capacity INTEGER,
  WarehouseID CHAR(4),
  BatchNumber INTEGER,
  PartNumber CHAR(5),
  FOREIGN KEY (PartNumber) REFERENCES Parts,
  FOREIGN KEY (WarehouseID) REFERENCES Warehouse,
  FOREIGN KEY (BatchNumber) REFERENCES Batches,
  PRIMARY KEY (BinNumber)
);
