/*==============================================================*/
/* DBMS name:      MySQL 5.0                                    */
/* Created on:     02-May-20 23:23:43                           */
/*==============================================================*/


drop table if exists Categorie;

drop table if exists Command;

drop table if exists Facture;

drop table if exists Manager;

drop table if exists Product;

drop table if exists Provider;

drop table if exists Ray;

drop table if exists Users;

/*==============================================================*/
/* Table: Categorie                                             */
/*==============================================================*/
create table Categorie
(
   idCategory           int not null,
   Name                 varchar(254),
   primary key (idCategory)
);

/*==============================================================*/
/* Table: Command                                               */
/*==============================================================*/
create table Command
(
   idCommand            int not null,
   idFacture            int not null,
   idManager            int not null,
   Date                 datetime,
   primary key (idCommand)
);

/*==============================================================*/
/* Table: Facture                                               */
/*==============================================================*/
create table Facture
(
   idFacture            int not null,
   PrixUHT              float,
   MontantHT            float,
   Date                 datetime,
   Quantite             int,
   NumeroF              varchar(254),
   primary key (idFacture)
);

/*==============================================================*/
/* Table: Manager                                               */
/*==============================================================*/
create table Manager
(
   idManager            int not null,
   Username             varchar(254),
   Matricule            varchar(254),
   primary key (idManager)
);

/*==============================================================*/
/* Table: Product                                               */
/*==============================================================*/
create table Product
(
   idProvider           int not null,
   idProduct            int not null,
   idCategory           int not null,
   idRay                int not null,
   idCommand            int not null,
   Reference            varchar(254),
   Designation          varchar(254),
   Image                varchar(254),
   primary key (idProduct)
);

/*==============================================================*/
/* Table: Provider                                              */
/*==============================================================*/
create table Provider
(
   idProvider           int not null,
   FullName             varchar(254),
   Phone                varchar(254),
   Email                varchar(254),
   Country              varchar(254),
   Logo                 varchar(254),
   primary key (idProvider)
);

/*==============================================================*/
/* Table: Ray                                                   */
/*==============================================================*/
create table Ray
(
   idRay                int not null,
   idManager            int not null,
   RefRay               varchar(254),
   primary key (idRay)
);

/*==============================================================*/
/* Table: Users                                                 */
/*==============================================================*/
create table Users
(
   id_User              int not null,
   username             varchar(254),
   password             varchar(254),
   primary key (id_User)
);

alter table Command add constraint FK_BelongToFacture foreign key (idFacture)
      references Facture (idFacture) on delete restrict on update restrict;

alter table Command add constraint FK_SendCommand foreign key (idManager)
      references Manager (idManager) on delete restrict on update restrict;

alter table Product add constraint FK_BelongToCategory foreign key (idCategory)
      references Categorie (idCategory) on delete restrict on update restrict;

alter table Product add constraint FK_BelongToRay foreign key (idRay)
      references Ray (idRay) on delete restrict on update restrict;

alter table Product add constraint FK_Build foreign key (idProvider)
      references Provider (idProvider) on delete restrict on update restrict;

alter table Product add constraint FK_Concerne foreign key (idCommand)
      references Command (idCommand) on delete restrict on update restrict;

alter table Ray add constraint FK_Controle foreign key (idManager)
      references Manager (idManager) on delete restrict on update restrict;

