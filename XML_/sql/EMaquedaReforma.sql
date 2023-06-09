USE [EMaquedaReforma]
GO
/****** Object:  StoredProcedure [dbo].[Crud]    Script Date: 4/19/2023 12:41:28 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[Crud]
@idpersona int,@nombre varchar(50),@direccion varchar(50),@edad int,@correo varchar(50),@Habilidad1 varchar(50),@habilidad2 varchar(50),@opcion int 
AS
------eliminar
IF(@opcion=1)
  EXEC PersonasDelete @idpersona 
IF(@opcion=2)
  EXEC PersonasUpdate @nombre,@direccion,@edad,@correo,@habilidad1,@habilidad2,@idpersona
GO
/****** Object:  StoredProcedure [dbo].[PersonasDelete]    Script Date: 4/19/2023 12:41:28 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[PersonasDelete]
@IdPersona int
AS
DELETE FROM [dbo].[Personas]
      WHERE IdPersona=@IdPersona

GO
/****** Object:  StoredProcedure [dbo].[PersonasTipos]    Script Date: 4/19/2023 12:41:28 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[PersonasTipos] 
@edad INT OUTPUT
AS 
IF (@edad<30)
SET @edad=1;
IF(@edad>30 AND @edad<60)
SET @edad=2;
IF(@edad>60)
SET @edad=3;
print @edad
GO
/****** Object:  StoredProcedure [dbo].[PersonasUpdate]    Script Date: 4/19/2023 12:41:28 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[PersonasUpdate]
@nombre varchar(50),@direccion varchar(50),@edad int,@correo varchar(50),@habilidad1 varchar(50),@habilidad2 varchar(50),@idPersona int
AS
DECLARE @RES INT
IF (@edad<30)
SET @RES=1;
IF(@edad>30 AND @edad<60)
SET @RES=2;
IF(@edad>60)
SET @RES=3;
print @edad
UPDATE [dbo].[Personas]
   SET [Nombre] = @nombre
      ,[Direccion] = @direccion
      ,[Edad] = @edad
      ,[Correo] = @correo
      ,[Habilidades] = @habilidad1+' / '+@habilidad2
      ,[IdTipo] = @RES 
 WHERE IdPersona=@idPersona

GO
/****** Object:  Table [dbo].[DetalleFactura]    Script Date: 4/19/2023 12:41:28 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[DetalleFactura](
	[IdDetalleFactura] [int] IDENTITY(1,1) NOT NULL,
	[FolioFactura] [int] NULL,
	[IdProducto] [int] NULL,
	[Cantidad] [tinyint] NULL,
PRIMARY KEY CLUSTERED 
(
	[IdDetalleFactura] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Factura]    Script Date: 4/19/2023 12:41:28 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Factura](
	[FolioFactura] [int] IDENTITY(1,1) NOT NULL,
	[Fecha] [date] NULL,
	[IdProveedor] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[FolioFactura] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Personas]    Script Date: 4/19/2023 12:41:28 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Personas](
	[IdPersona] [int] IDENTITY(1,1) NOT NULL,
	[Nombre] [varchar](50) NULL,
	[Direccion] [varchar](50) NULL,
	[Edad] [int] NULL,
	[Correo] [varchar](50) NULL,
	[Habilidades] [varchar](100) NULL,
	[IdTipo] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[IdPersona] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Producto]    Script Date: 4/19/2023 12:41:28 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Producto](
	[IdProducto] [int] IDENTITY(1,1) NOT NULL,
	[Descripcion] [varchar](50) NULL,
	[PrecioUnitario] [money] NULL,
PRIMARY KEY CLUSTERED 
(
	[IdProducto] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Proveedor]    Script Date: 4/19/2023 12:41:28 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Proveedor](
	[IdProveedor] [int] IDENTITY(1,1) NOT NULL,
	[RazonSocial] [varchar](50) NULL,
	[Direccion] [varchar](100) NULL,
	[Telefono] [varchar](10) NULL,
PRIMARY KEY CLUSTERED 
(
	[IdProveedor] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
ALTER TABLE [dbo].[DetalleFactura]  WITH CHECK ADD FOREIGN KEY([FolioFactura])
REFERENCES [dbo].[Factura] ([FolioFactura])
GO
ALTER TABLE [dbo].[DetalleFactura]  WITH CHECK ADD FOREIGN KEY([IdProducto])
REFERENCES [dbo].[Producto] ([IdProducto])
GO
ALTER TABLE [dbo].[Factura]  WITH CHECK ADD FOREIGN KEY([IdProveedor])
REFERENCES [dbo].[Proveedor] ([IdProveedor])
GO
