
/*
************************
Create Licenses
************************
Bretford-DevOps: I want the ability to generate new licenses and specify the license parameters.
Bretford-Support Agent: I want the ability to generate new licenses and choose from standard license types.
    1. License (key)
*/

#Creating License
INSERT INTO `berzerk`.`License`
(`LicenseTypeID`,
`LicenseKey`,
`IsDeleted`,
`CreatedAt`,
`CreatedBy`,
`UpdatedAt`,
`UpdatedBy`)
VALUES
(2,
'1230-1236-7894-8523',
0,
current_timestamp(),
1,
current_timestamp(),
1);


/*
************************
View Licenses
************************
Bretford-DevOps: I want the ability to view the list of all licenses, their status, parameters, and who is using them.
*/

SELECT l.LicenseKey
	,lt.NAME AS LicenseType
    ,CASE WHEN odl.Status = 'E'  THEN 'Expired'
    WHEN odl.Status = 'A' THEN 'Active'
    WHEN odl.Status = 'C' THEN 'Cancelled'
    ELSE 'Yet to Sell'
    END AS Status
    ,CASE WHEN odl.ActivatedAt IS NULL THEN 'N/A'
    ELSE odl.ActivatedAt
    END AS ActivatedDate
    ,CASE WHEN odl.ExpiresAt IS NULL THEN 'N/A'
    ELSE odl.ExpiresAt
    END AS ExpireDate
    ,CASE WHEN odl.CancelledAt IS NULL THEN 'N/A'
    ELSE odl.CancelledAt
    END AS CancelledDate
    ,odl.Comment As ReasonForCancellation
    ,CASE WHEN o.Name IS NULL THEN 'UnAssigned'
    ELSE o.Name
    END AS AssignedTo
   ,d.Name AS DealerName
FROM berzerk.License l
INNER JOIN berzerk.License_Type lt ON l.LicenseTypeID = lt.LicenseTypeID
LEFT OUTER JOIN berzerk.Organization_Dealer_License odl ON l.LicenseID = odl.LicenseID
LEFT OUTER JOIN berzerk.Organization o ON odl.OrgID = o.OrgID 
LEFT OUTER JOIN berzerk.Organization d ON odl.dealerID = d.OrgID 
ORDER BY l.LicenseID;


/*
************************
Modify Licenses
************************
Bretford-DevOps: I want the ability to modify existing license parameters.
*/
UPDATE `berzerk`.`License`
SET
`LicenseTypeID` = 3,
`LicenseKey` = '1234-AZ32-K5F2-Y8L0P',
`IsDeleted` = 0,
`UpdatedAt` = current_timestamp(), #system generated
`UpdatedBy` = 1 #system generated
WHERE `LicenseID` = 10;

/*
************************
Create license type
************************
Bretford-DevOps: I want the ability to define new license types.
*/

#Creating License Type
INSERT INTO `berzerk`.`License_Type`
(`Name`,
`MaxWebUser`,
`MaxLockerBay`,
`DurationDays`,
`ApiAccess`,
`Reporting`,
`IsDeleted`,
`CreatedAt`,
`CreatedBy`,
`UpdatedAt`,
`UpdatedBy`)
VALUES
('Test',
200,
300,
750,
0,
0,
0,
current_timestamp(),
1,
current_timestamp(),
1);



/*
************************
revoke licenses [PENDING]
************************
Bretford-DevOps: I want the ability to revoke licenses.
*/
UPDATE `berzerk`.`Organization_Dealer_License`
SET
`Status` = 'E',
CancelledDate = current_timestamp(),
`UpdatedAt` = current_timestamp(),
`UpdatedBy` = 1
WHERE OrgID = 1 AND LicenseID=?;




/*
*******************************
Create new tenant organization
********************************
Tenant Org: Root User* & Tenant Admin: I want to sign-up for the service using a license key I received from a reseller or Bretford.
*/

INSERT INTO `berzerk`.`Organization`
(`EntityTypeID`,
`TenantID`,
`TenantTypeID`,
`Name`,
`ContactEmail`,
`ContactNumber`,
`Address`,
`City`,
`State`,
`Zip`,
`Country`,
`IsOrgRoot`,
`IsActivate`,
`Status`,
`ChildOf`,
`HierarchyID`,
`RootUserID`,
`APIKey`,
`ExternalID`,
`Comment`,
`IsDeleted`,
`CreatedAt`,
`CreatedBy`,
`UpdatedAt`,
`UpdatedBy`)
VALUES
(3,
1,
1,
'Duval School District',
'Contact@duval.org',
'485-526-9874',
'Street1,Address',
'Springfield',
'IL',
62723,
'United States',
1,
0,
Null,
1,
1,
'axw213fghg6h7878k',
0,
0,
null,
0,
current_timestamp(),
1,
current_timestamp(),
1);


/*
***********************************
Update tenant organization profile
***********************************
Tenant Org-Root User* & Tenant Admin: I want to specify the name of my organization and provide profile details like address.
*/

UPDATE `berzerk`.`Organization`
SET
`Name` = 'Duval',
`ContactEmail` = 'info@duval.org',
`ContactNumber` = '234-785-4110',
`Address` = 'Address',
`City` = 'SP',
`State` = 'IL',
`Zip` = 63825,
`Country` = 'United States',
`UpdatedAt` = current_timestamp(),
`UpdatedBy` = 'wedsds234xs23xcvb'
WHERE `OrgID` = 1002;



/*
************************************************************
Create tenant root user AND Create/Destroy Tenant Web-Users 
************************************************************
Tenant Org-Root User* & Tenant Admin: After entering my license key and verifying its validity, 
I want to choose a sign in method for creating my root user account (Choose from Auth0 sign on methods).
	1. Create Tenant web users
    2. Update the web user ID into Org table to define a web user is a root user
*/

INSERT INTO `berzerk`.`Web_User`
(`WebUserID`,
`FirstName`,
`MiddleName`,
`LastName`,
`Email`,
`RFID`,
`PolicyID`,
`SignedUp`,
`LastLogin`,
`IdentityProvider`,
`LoginCount`,
`IsDeleted`,
`CreatedAt`,
`CreatedBy`,
`UpdatedAt`,
`UpdatedBy`)
VALUES
('0004376b2c369b57040ea667b1574p06',
'Brad',
'P',
'Haddin',
'hadd@duval.org',
'93b742f6c72a96dcfda160a6c46fa58942c3b76c',
null,
'2009-02-04 04:09:11',
'2017-02-04 04:09:11',
'Auth0',
120,
0,
current_timestamp(),
1,
current_timestamp(),
1);

#Update Root User to Organization
UPDATE `berzerk`.`Organization`
SET
`RootUserID` = '0004376b2c369b57040ea667b1574p06',
`UpdatedAt` = current_timestamp(),
`UpdatedBy` = 1
WHERE `OrgID` = 1002;


/*
***********************************
Assign tenant web-user roles
***********************************
Bretford: DevOps, Bretford: Support Agent, Partner 
I want the ability to grant/revoke web application access to other individuals within any customer's organizations from the web application.

	1. Showing roles which belongs to the corresponding tenant and built-in roles
	2. Assign role to web user
*/

#Showing roles which belongs to the corresponding tenant and built-in roles
SELECT * FROM berzerk.Role WHERE TenantID IS NULL OR TenantID IN ('319289125');


#Assign role to web user
INSERT INTO `berzerk`.`Web_User_Org_Role`
(`WebUserID`,
`OrgID`,
`RoleID`,
`CreatedAt`,
`CreatedBy`,
`UpdatedAt`,
`UpdatedBy`)
VALUES
('0004376b2c369b57040ea667b1574p06',
3,
2,
current_timestamp(),
1,
current_timestamp(),
1);



/*
********************************************
BERZERK-100 - Role and Menu CRUD operations
********************************************
1. Menu options for a particular role
*/
SELECT r.Name AS RoleName, m.Name AS Menus, m.ParentMenuID, m.MenuOrder FROM berzerk.Role r 
INNER JOIN berzerk.Role_Menu rm ON r.RoleID = rm.RoleID
INNER JOIN berzerk.Menu m ON rm.MenuID = m.MenuID
WHERE r.RoleID = 1;

