The Warehouse Management System is designed to efficiently manage warehouse operations such as inventory tracking, order processing, storage management, and shipment handling. The system aims to provide accuracy, scalability, and real-time visibility into warehouse activities.
 
 Approach:
 
The system is designed having 3 roles for my Project Database.

Which are :
-Admin
-user
-manager

Real-World Relationships

-one warehouse can store many inventory
-one inventory can have multiple products
-one warehouse processes many order
-one order can have one shipment
-one warehouse handles  many shipments
-one role can be handled by many user
-one user can purchase many orders

Requirement Analysis
Identified core warehouse operations: inventory control, warehouse management, order fulfillment, shipment tracking, and user role management.

Database-First Design
A normalized relational database was designed to ensure data integrity and reduce redundancy.


Database Design
Used relational database MySQL for structured data.

core entities include:

Warehouse

Inventory

Products

purchase_Orders

Shipments

Roles

API Design
APIs follow REST architecture with standard HTTP methods:
   GET – Fetch data
   POST – Create records
   PUT – Update records
   PATCH-
   DELETE – Remove records

Swagger/OpenAPI is used for documentation.

Reason:
REST APIs are platform-independent, scalable, and easy to document and test.

Authentication & Authorization
Role-based access control using a Role table instead of separate admin/user tables.
Each user is mapped to a role.

Reason:
RBAC improves scalability and avoids schema changes when adding new roles.

3.4 Inventory Management Strategy
Inventory quantity is updated automatically during:

Order creation

Shipment dispatch

Stock validation is done before order confirmation.

Reason:
Ensures real-time inventory accuracy and prevents over-selling.

Trade-Offs:

Relational DB over NoSQL  ->	Less flexible for unstructured data but ensures strong consistency
Normalized tables ->	Slightly complex queries but avoids redundancy
REST APIs  ->	Slight overhead compared to direct DB access, but improves security and scalability
Single Role table ->	Simpler design but requires careful permission handling
No event-driven architecture ->	Easier implementation but less real-time scalability