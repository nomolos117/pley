?# Group: 18
# Names: Santiago Perez A, Justin Kardach, Kyle T, Lou C
# Date: 4/4/17
# ===============================================
# Creation Script of the tables in the database.


# Creates table for the restaurant.
# Contains the following attributes: Name, Hours_Open, Rating, Website.
# Primay key = Name
CREATE TABLE Restaurant (
    Name									varchar(30) not null,
    Hours_Open							varchar(30),
    Rating									Integer,
    Website									varchar(30),
CONSTRAINT RestaurantPK PRIMARY KEY(Name));


# Creates table for the service type.
# Contains the following attributes: RestaurantName, TYPE
# Type must be FF = FastFood, CD = Casual Dining, FD = Fine Dining, TD = Takeout/Delivery
# Primary key = RestaurantName & Type (Composite Key)
# Foreign key = Name from Restaurant Table.
CREATE TABLE ServiceType (
	RestaurantName					varchar(30) not null,
	Type									varchar(2),
		check(Type in(“FF”, “CD”, “FD”, “TD”)),
CONSTRAINT ServiceTypePK PRIMARY KEY(RestaurantName, Type),
CONSTRAINT ServiceTypeFK FOREIGN KEY(RestaurantName) REFERENCES Restaurant(Name));


# Creates table for Contact.
# Contains the following attributes: RestaurantName, Address, PhoneNumber.
# Primary key = RestaurantName & Address. (Composite Key)
# Foreign key = Name from Restaurant Table.
CREATE TABLE Contact (
    RestaurantName					varchar(30) not null,
    Address								varchar(30) not null,
    PhoneNumber						numeric(10,0),
CONSTRAINT ContactPK PRIMARY KEY(RestaurantName, Address),
CONSTRAINT ContactFK FOREIGN KEY(RestaurantName) REFERENCES Restaurant(Name));


# Creates table for Food.
# Contains the following attributes: RestaurantName, FoodCategory, AVGPrice.
# FoodCategory must be Latin, African, Asian, American, European, Fusion, Australian, Antarctican, or Other.
# Primary key = RestaurantName & FoodCategory. (Composite Key)
# Foreign key = Name from Restaurant Table.
CREATE TABLE Food (
    RestaurantName					varchar(30),
    FoodCategory						varchar(30),
		check(FoodCategory in('Latin', 'African', 'Asian', 'American', 'European', 'Fusion', 'Australian', 'Antarctican', 'Other')),
    AVGPrice								integer,
CONSTRAINT FoodPK PRIMARY KEY(RestaurantName, FoodCategory),
CONSTRAINT FoodFK FOREIGN KEY(RestaurantName) REFERENCES Restaurant(Name));


# Creates table for FF_Sub.
# Contains the following attributes: FF_RName, hasDriveThru.
# Primary key = FF_RName.
# Foreign key = FF_RName from Restaurant Table.
CREATE TABLE FF_Sub (
    FF_RName								varchar(30),
    hasDriveThru							boolean,
CONSTRAINT FF_SubPK PRIMARY KEY(FF_Rname),
CONSTRAINT FF_SubFK FOREIGN KEY(FF_RName) REFERENCES Restaurant(Name));


# Creates table for CD_Sub.
# Contains the following attributes: CD_RName, hasTip, isBuffet.
# Primary key = CD_RName.
# Foreign key = CD_RName from Restaurant Table.
CREATE TABLE CD_Sub (
    CD_RName							varchar(30),
    hasTip									boolean,
    isBuffet									boolean,
CONSTRAINT CD_SubPK PRIMARY KEY(CD_RName),
CONSTRAINT CD_SubFK FOREIGN KEY(CD_RName) REFERENCES Restaurant(Name));

# Creates table for FD_Sub.
# Contains the following attributes: FD_RName, hasTip, hasDressCode.
# Primary key = FD_RName.
# Foreign key = FD_RName from Restaurant Table.
CREATE TABLE FD_Sub (
    FD_RName							varchar(30),
    hasTip									boolean,
    hasDressCode						boolean,
CONSTRAINT FD_SubPK PRIMARY KEY(FD_RName),
CONSTRAINT FD_SubFK FOREIGN KEY(FD_RName) REFERENCES Restaurant(Name));

# Creates table for TD_Sub.
# Contains the following attributes: FD_RName, orderOption, hasTip.
# orderOption must be: Phone, Internet, UberEats, Delivery, Takeout.
# Primary key = TD_RName.
# Foreign key = TD_RName from Restaurant Table.
CREATE TABLE TD_Sub (
    TD_RName							varchar(30),
    orderOption							varchar(30),
        check(Type in('Phone', 'Internet', 'UberEats', 'Delivery', 'Take Out')),
    hasTip									boolean,
CONSTRAINT TD_SubPK PRIMARY KEY(TD_RName),
CONSTRAINT TD_SubFK FOREIGN KEY(TD_RName) REFERENCES Restaurant(Name));