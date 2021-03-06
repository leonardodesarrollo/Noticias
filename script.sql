USE [News]
GO
/****** Object:  Table [dbo].[Perfil]    Script Date: 06/26/2018 20:43:17 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Perfil](
	[IdPerfil] [int] IDENTITY(1,1) NOT NULL,
	[NomPerfil] [varchar](100) NOT NULL,
	[Activo] [tinyint] NULL,
 CONSTRAINT [PK_Perfil] PRIMARY KEY CLUSTERED 
(
	[IdPerfil] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
SET IDENTITY_INSERT [dbo].[Perfil] ON
INSERT [dbo].[Perfil] ([IdPerfil], [NomPerfil], [Activo]) VALUES (1, N'Administrador', 1)
INSERT [dbo].[Perfil] ([IdPerfil], [NomPerfil], [Activo]) VALUES (2, N'Usuario', 1)
INSERT [dbo].[Perfil] ([IdPerfil], [NomPerfil], [Activo]) VALUES (3, N'Invitado', 1)
SET IDENTITY_INSERT [dbo].[Perfil] OFF
/****** Object:  UserDefinedFunction [dbo].[f_params_to_list]    Script Date: 06/26/2018 20:44:06 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create FUNCTION [dbo].[f_params_to_list] (@par VARCHAR(500))
returns @result TABLE (value VARCHAR(30))
AS  
begin
     DECLARE @TempList table
          (
          value VARCHAR(30)
          )

     DECLARE @Value varchar(30), @Pos int

     SET @par = LTRIM(RTRIM(@par))+ ','
     SET @Pos = CHARINDEX(',', @par, 1)

     IF REPLACE(@par, ',', '') <> ''
     BEGIN
          WHILE @Pos > 0
          BEGIN
               SET @Value = LTRIM(RTRIM(LEFT(@par, @Pos - 1)))
               IF @Value <> ''
               BEGIN
                    INSERT INTO @TempList (value) VALUES (@Value) 
               END
               SET @par = RIGHT(@par, LEN(@par) - @Pos)
               SET @Pos = CHARINDEX(',', @par, 1)

          END
     END    
     INSERT @result
     SELECT value 
        FROM @TempList
     RETURN
END
GO
/****** Object:  Table [dbo].[Estado]    Script Date: 06/26/2018 20:43:17 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Estado](
	[IdEstado] [int] IDENTITY(1,1) NOT NULL,
	[NombreEstado] [varchar](50) NULL,
	[Activo] [tinyint] NULL,
 CONSTRAINT [PK_Estado] PRIMARY KEY CLUSTERED 
(
	[IdEstado] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
SET IDENTITY_INSERT [dbo].[Estado] ON
INSERT [dbo].[Estado] ([IdEstado], [NombreEstado], [Activo]) VALUES (1, N'Por Revisar', 1)
INSERT [dbo].[Estado] ([IdEstado], [NombreEstado], [Activo]) VALUES (2, N'Revisado', 1)
SET IDENTITY_INSERT [dbo].[Estado] OFF
/****** Object:  Table [dbo].[Comuna]    Script Date: 06/26/2018 20:43:17 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING OFF
GO
CREATE TABLE [dbo].[Comuna](
	[IdComuna] [varchar](10) NOT NULL,
	[NomComuna] [varchar](60) NOT NULL,
	[NomProvincia] [varchar](60) NOT NULL,
	[IdRegion] [varchar](2) NOT NULL,
	[NomRegion] [varchar](60) NOT NULL,
 CONSTRAINT [PK_ComunaS] PRIMARY KEY CLUSTERED 
(
	[IdComuna] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
INSERT [dbo].[Comuna] ([IdComuna], [NomComuna], [NomProvincia], [IdRegion], [NomRegion]) VALUES (N'01101', N'Iquique', N'Iquique', N'1', N'Tarapaca')
INSERT [dbo].[Comuna] ([IdComuna], [NomComuna], [NomProvincia], [IdRegion], [NomRegion]) VALUES (N'01107', N'Alto Hospicio', N'Iquique', N'1', N'Tarapaca')
INSERT [dbo].[Comuna] ([IdComuna], [NomComuna], [NomProvincia], [IdRegion], [NomRegion]) VALUES (N'01401', N'Pozo Almonte', N'Tamarugal', N'1', N'Tarapaca')
INSERT [dbo].[Comuna] ([IdComuna], [NomComuna], [NomProvincia], [IdRegion], [NomRegion]) VALUES (N'01402', N'Camiña', N'Tamarugal', N'1', N'Tarapaca')
INSERT [dbo].[Comuna] ([IdComuna], [NomComuna], [NomProvincia], [IdRegion], [NomRegion]) VALUES (N'01403', N'Colchane', N'Tamarugal', N'1', N'Tarapaca')
INSERT [dbo].[Comuna] ([IdComuna], [NomComuna], [NomProvincia], [IdRegion], [NomRegion]) VALUES (N'01404', N'Huara', N'Tamarugal', N'1', N'Tarapaca')
INSERT [dbo].[Comuna] ([IdComuna], [NomComuna], [NomProvincia], [IdRegion], [NomRegion]) VALUES (N'01405', N'Pica', N'Tamarugal', N'1', N'Tarapaca')
INSERT [dbo].[Comuna] ([IdComuna], [NomComuna], [NomProvincia], [IdRegion], [NomRegion]) VALUES (N'02101', N'Antofagasta', N'Antofagasta', N'2', N'Antofagasta')
INSERT [dbo].[Comuna] ([IdComuna], [NomComuna], [NomProvincia], [IdRegion], [NomRegion]) VALUES (N'02102', N'Mejillones', N'Antofagasta', N'2', N'Antofagasta')
INSERT [dbo].[Comuna] ([IdComuna], [NomComuna], [NomProvincia], [IdRegion], [NomRegion]) VALUES (N'02103', N'Sierra Gorda', N'Antofagasta', N'2', N'Antofagasta')
INSERT [dbo].[Comuna] ([IdComuna], [NomComuna], [NomProvincia], [IdRegion], [NomRegion]) VALUES (N'02104', N'Taltal', N'Antofagasta', N'2', N'Antofagasta')
INSERT [dbo].[Comuna] ([IdComuna], [NomComuna], [NomProvincia], [IdRegion], [NomRegion]) VALUES (N'02201', N'Calama', N'El Loa', N'2', N'Antofagasta')
INSERT [dbo].[Comuna] ([IdComuna], [NomComuna], [NomProvincia], [IdRegion], [NomRegion]) VALUES (N'02202', N'Ollague', N'El Loa', N'2', N'Antofagasta')
INSERT [dbo].[Comuna] ([IdComuna], [NomComuna], [NomProvincia], [IdRegion], [NomRegion]) VALUES (N'02203', N'San Pedro de Atacama', N'El Loa', N'2', N'Antofagasta')
INSERT [dbo].[Comuna] ([IdComuna], [NomComuna], [NomProvincia], [IdRegion], [NomRegion]) VALUES (N'02301', N'Tocopilla', N'Tocopilla', N'2', N'Antofagasta')
INSERT [dbo].[Comuna] ([IdComuna], [NomComuna], [NomProvincia], [IdRegion], [NomRegion]) VALUES (N'02302', N'María Elena', N'Tocopilla', N'2', N'Antofagasta')
INSERT [dbo].[Comuna] ([IdComuna], [NomComuna], [NomProvincia], [IdRegion], [NomRegion]) VALUES (N'03101', N'Copiapó', N'Copiapo', N'3', N'Atacama')
INSERT [dbo].[Comuna] ([IdComuna], [NomComuna], [NomProvincia], [IdRegion], [NomRegion]) VALUES (N'03102', N'Caldera', N'Copiapo', N'3', N'Atacama')
INSERT [dbo].[Comuna] ([IdComuna], [NomComuna], [NomProvincia], [IdRegion], [NomRegion]) VALUES (N'03103', N'Tierra Amarilla', N'Copiapo', N'3', N'Atacama')
INSERT [dbo].[Comuna] ([IdComuna], [NomComuna], [NomProvincia], [IdRegion], [NomRegion]) VALUES (N'03201', N'Chañaral', N'Chañaral', N'3', N'Atacama')
INSERT [dbo].[Comuna] ([IdComuna], [NomComuna], [NomProvincia], [IdRegion], [NomRegion]) VALUES (N'03202', N'Diego de Almagro', N'Chañaral', N'3', N'Atacama')
INSERT [dbo].[Comuna] ([IdComuna], [NomComuna], [NomProvincia], [IdRegion], [NomRegion]) VALUES (N'03301', N'Vallenar', N'Huasco', N'3', N'Atacama')
INSERT [dbo].[Comuna] ([IdComuna], [NomComuna], [NomProvincia], [IdRegion], [NomRegion]) VALUES (N'03302', N'Alto del Carmen', N'Huasco', N'3', N'Atacama')
INSERT [dbo].[Comuna] ([IdComuna], [NomComuna], [NomProvincia], [IdRegion], [NomRegion]) VALUES (N'03303', N'Freirina', N'Huasco', N'3', N'Atacama')
INSERT [dbo].[Comuna] ([IdComuna], [NomComuna], [NomProvincia], [IdRegion], [NomRegion]) VALUES (N'03304', N'Huasco', N'Huasco', N'3', N'Atacama')
INSERT [dbo].[Comuna] ([IdComuna], [NomComuna], [NomProvincia], [IdRegion], [NomRegion]) VALUES (N'04101', N'La Serena', N'Elqui', N'4', N'Coquimbo')
INSERT [dbo].[Comuna] ([IdComuna], [NomComuna], [NomProvincia], [IdRegion], [NomRegion]) VALUES (N'04102', N'Coquimbo', N'Elqui', N'4', N'Coquimbo')
INSERT [dbo].[Comuna] ([IdComuna], [NomComuna], [NomProvincia], [IdRegion], [NomRegion]) VALUES (N'04103', N'Andacollo', N'Elqui', N'4', N'Coquimbo')
INSERT [dbo].[Comuna] ([IdComuna], [NomComuna], [NomProvincia], [IdRegion], [NomRegion]) VALUES (N'04104', N'La Higuera', N'Elqui', N'4', N'Coquimbo')
INSERT [dbo].[Comuna] ([IdComuna], [NomComuna], [NomProvincia], [IdRegion], [NomRegion]) VALUES (N'04105', N'Paihuano', N'Elqui', N'4', N'Coquimbo')
INSERT [dbo].[Comuna] ([IdComuna], [NomComuna], [NomProvincia], [IdRegion], [NomRegion]) VALUES (N'04106', N'Vicuña', N'Elqui', N'4', N'Coquimbo')
INSERT [dbo].[Comuna] ([IdComuna], [NomComuna], [NomProvincia], [IdRegion], [NomRegion]) VALUES (N'04201', N'Illapel', N'Choapa', N'4', N'Coquimbo')
INSERT [dbo].[Comuna] ([IdComuna], [NomComuna], [NomProvincia], [IdRegion], [NomRegion]) VALUES (N'04202', N'Canela', N'Choapa', N'4', N'Coquimbo')
INSERT [dbo].[Comuna] ([IdComuna], [NomComuna], [NomProvincia], [IdRegion], [NomRegion]) VALUES (N'04203', N'Los Vilos', N'Choapa', N'4', N'Coquimbo')
INSERT [dbo].[Comuna] ([IdComuna], [NomComuna], [NomProvincia], [IdRegion], [NomRegion]) VALUES (N'04204', N'Salamanca', N'Choapa', N'4', N'Coquimbo')
INSERT [dbo].[Comuna] ([IdComuna], [NomComuna], [NomProvincia], [IdRegion], [NomRegion]) VALUES (N'04301', N'Ovalle', N'Limari', N'4', N'Coquimbo')
INSERT [dbo].[Comuna] ([IdComuna], [NomComuna], [NomProvincia], [IdRegion], [NomRegion]) VALUES (N'04302', N'Combarbalá', N'Limari', N'4', N'Coquimbo')
INSERT [dbo].[Comuna] ([IdComuna], [NomComuna], [NomProvincia], [IdRegion], [NomRegion]) VALUES (N'04303', N'Monte Patria', N'Limari', N'4', N'Coquimbo')
INSERT [dbo].[Comuna] ([IdComuna], [NomComuna], [NomProvincia], [IdRegion], [NomRegion]) VALUES (N'04304', N'Punitaqui', N'Limari', N'4', N'Coquimbo')
INSERT [dbo].[Comuna] ([IdComuna], [NomComuna], [NomProvincia], [IdRegion], [NomRegion]) VALUES (N'04305', N'Río Hurtado', N'Limari', N'4', N'Coquimbo')
INSERT [dbo].[Comuna] ([IdComuna], [NomComuna], [NomProvincia], [IdRegion], [NomRegion]) VALUES (N'05101', N'Valparaíso', N'Valparaiso', N'5', N'Valparaiso')
INSERT [dbo].[Comuna] ([IdComuna], [NomComuna], [NomProvincia], [IdRegion], [NomRegion]) VALUES (N'05102', N'Casablanca', N'Valparaiso', N'5', N'Valparaiso')
INSERT [dbo].[Comuna] ([IdComuna], [NomComuna], [NomProvincia], [IdRegion], [NomRegion]) VALUES (N'05103', N'Concón', N'Valparaiso', N'5', N'Valparaiso')
INSERT [dbo].[Comuna] ([IdComuna], [NomComuna], [NomProvincia], [IdRegion], [NomRegion]) VALUES (N'05104', N'Juan Fernández', N'Valparaiso', N'5', N'Valparaiso')
INSERT [dbo].[Comuna] ([IdComuna], [NomComuna], [NomProvincia], [IdRegion], [NomRegion]) VALUES (N'05105', N'Puchuncaví', N'Valparaiso', N'5', N'Valparaiso')
INSERT [dbo].[Comuna] ([IdComuna], [NomComuna], [NomProvincia], [IdRegion], [NomRegion]) VALUES (N'05106', N'Quilpué', N'Valparaiso', N'5', N'Valparaiso')
INSERT [dbo].[Comuna] ([IdComuna], [NomComuna], [NomProvincia], [IdRegion], [NomRegion]) VALUES (N'05107', N'Quintero', N'Valparaiso', N'5', N'Valparaiso')
INSERT [dbo].[Comuna] ([IdComuna], [NomComuna], [NomProvincia], [IdRegion], [NomRegion]) VALUES (N'05108', N'Villa Alemana', N'Valparaiso', N'5', N'Valparaiso')
INSERT [dbo].[Comuna] ([IdComuna], [NomComuna], [NomProvincia], [IdRegion], [NomRegion]) VALUES (N'05109', N'Viña del Mar', N'Valparaiso', N'5', N'Valparaiso')
INSERT [dbo].[Comuna] ([IdComuna], [NomComuna], [NomProvincia], [IdRegion], [NomRegion]) VALUES (N'05201', N'Isla de Pascua', N'Isla de Pascua', N'5', N'Valparaiso')
INSERT [dbo].[Comuna] ([IdComuna], [NomComuna], [NomProvincia], [IdRegion], [NomRegion]) VALUES (N'05301', N'Los Andes', N'Los Andes', N'5', N'Valparaiso')
INSERT [dbo].[Comuna] ([IdComuna], [NomComuna], [NomProvincia], [IdRegion], [NomRegion]) VALUES (N'05302', N'Calle Larga', N'Los Andes', N'5', N'Valparaiso')
INSERT [dbo].[Comuna] ([IdComuna], [NomComuna], [NomProvincia], [IdRegion], [NomRegion]) VALUES (N'05303', N'Rinconada', N'Los Andes', N'5', N'Valparaiso')
INSERT [dbo].[Comuna] ([IdComuna], [NomComuna], [NomProvincia], [IdRegion], [NomRegion]) VALUES (N'05304', N'San Esteban', N'Los Andes', N'5', N'Valparaiso')
INSERT [dbo].[Comuna] ([IdComuna], [NomComuna], [NomProvincia], [IdRegion], [NomRegion]) VALUES (N'05401', N'La Ligua', N'Petorca', N'5', N'Valparaiso')
INSERT [dbo].[Comuna] ([IdComuna], [NomComuna], [NomProvincia], [IdRegion], [NomRegion]) VALUES (N'05402', N'Cabildo', N'Petorca', N'5', N'Valparaiso')
INSERT [dbo].[Comuna] ([IdComuna], [NomComuna], [NomProvincia], [IdRegion], [NomRegion]) VALUES (N'05403', N'Papudo', N'Petorca', N'5', N'Valparaiso')
INSERT [dbo].[Comuna] ([IdComuna], [NomComuna], [NomProvincia], [IdRegion], [NomRegion]) VALUES (N'05404', N'Petorca', N'Petorca', N'5', N'Valparaiso')
INSERT [dbo].[Comuna] ([IdComuna], [NomComuna], [NomProvincia], [IdRegion], [NomRegion]) VALUES (N'05405', N'Zapallar', N'Petorca', N'5', N'Valparaiso')
INSERT [dbo].[Comuna] ([IdComuna], [NomComuna], [NomProvincia], [IdRegion], [NomRegion]) VALUES (N'05501', N'Quillota', N'Quillota', N'5', N'Valparaiso')
INSERT [dbo].[Comuna] ([IdComuna], [NomComuna], [NomProvincia], [IdRegion], [NomRegion]) VALUES (N'05502', N'Calera', N'Quillota', N'5', N'Valparaiso')
INSERT [dbo].[Comuna] ([IdComuna], [NomComuna], [NomProvincia], [IdRegion], [NomRegion]) VALUES (N'05503', N'Hijuelas', N'Quillota', N'5', N'Valparaiso')
INSERT [dbo].[Comuna] ([IdComuna], [NomComuna], [NomProvincia], [IdRegion], [NomRegion]) VALUES (N'05504', N'La Cruz', N'Quillota', N'5', N'Valparaiso')
INSERT [dbo].[Comuna] ([IdComuna], [NomComuna], [NomProvincia], [IdRegion], [NomRegion]) VALUES (N'05505', N'Limache', N'Quillota', N'5', N'Valparaiso')
INSERT [dbo].[Comuna] ([IdComuna], [NomComuna], [NomProvincia], [IdRegion], [NomRegion]) VALUES (N'05506', N'Nogales', N'Quillota', N'5', N'Valparaiso')
INSERT [dbo].[Comuna] ([IdComuna], [NomComuna], [NomProvincia], [IdRegion], [NomRegion]) VALUES (N'05507', N'Olmué', N'Quillota', N'5', N'Valparaiso')
INSERT [dbo].[Comuna] ([IdComuna], [NomComuna], [NomProvincia], [IdRegion], [NomRegion]) VALUES (N'05601', N'San Antonio', N'San Antonio', N'5', N'Valparaiso')
INSERT [dbo].[Comuna] ([IdComuna], [NomComuna], [NomProvincia], [IdRegion], [NomRegion]) VALUES (N'05602', N'Algarrobo', N'San Antonio', N'5', N'Valparaiso')
INSERT [dbo].[Comuna] ([IdComuna], [NomComuna], [NomProvincia], [IdRegion], [NomRegion]) VALUES (N'05603', N'Cartagena', N'San Antonio', N'5', N'Valparaiso')
INSERT [dbo].[Comuna] ([IdComuna], [NomComuna], [NomProvincia], [IdRegion], [NomRegion]) VALUES (N'05604', N'El Quisco', N'San Antonio', N'5', N'Valparaiso')
INSERT [dbo].[Comuna] ([IdComuna], [NomComuna], [NomProvincia], [IdRegion], [NomRegion]) VALUES (N'05605', N'El Tabo', N'San Antonio', N'5', N'Valparaiso')
INSERT [dbo].[Comuna] ([IdComuna], [NomComuna], [NomProvincia], [IdRegion], [NomRegion]) VALUES (N'05606', N'Santo Domingo', N'San Antonio', N'5', N'Valparaiso')
INSERT [dbo].[Comuna] ([IdComuna], [NomComuna], [NomProvincia], [IdRegion], [NomRegion]) VALUES (N'05701', N'San Felipe', N'San Felipe de Aconcagua', N'5', N'Valparaiso')
INSERT [dbo].[Comuna] ([IdComuna], [NomComuna], [NomProvincia], [IdRegion], [NomRegion]) VALUES (N'05702', N'Catemu', N'San Felipe de Aconcagua', N'5', N'Valparaiso')
INSERT [dbo].[Comuna] ([IdComuna], [NomComuna], [NomProvincia], [IdRegion], [NomRegion]) VALUES (N'05703', N'Llay Llay', N'San Felipe de Aconcagua', N'5', N'Valparaiso')
INSERT [dbo].[Comuna] ([IdComuna], [NomComuna], [NomProvincia], [IdRegion], [NomRegion]) VALUES (N'05704', N'Panquehue', N'San Felipe de Aconcagua', N'5', N'Valparaiso')
INSERT [dbo].[Comuna] ([IdComuna], [NomComuna], [NomProvincia], [IdRegion], [NomRegion]) VALUES (N'05705', N'Putaendo', N'San Felipe de Aconcagua', N'5', N'Valparaiso')
INSERT [dbo].[Comuna] ([IdComuna], [NomComuna], [NomProvincia], [IdRegion], [NomRegion]) VALUES (N'05706', N'Santa María', N'San Felipe de Aconcagua', N'5', N'Valparaiso')
INSERT [dbo].[Comuna] ([IdComuna], [NomComuna], [NomProvincia], [IdRegion], [NomRegion]) VALUES (N'06101', N'Rancagua', N'Cachapoal', N'6', N'del Libertador Gral. Bernardo O''higgins')
INSERT [dbo].[Comuna] ([IdComuna], [NomComuna], [NomProvincia], [IdRegion], [NomRegion]) VALUES (N'06102', N'Codegua', N'Cachapoal', N'6', N'del Libertador Gral. Bernardo O''higgins')
INSERT [dbo].[Comuna] ([IdComuna], [NomComuna], [NomProvincia], [IdRegion], [NomRegion]) VALUES (N'06103', N'Coinco', N'Cachapoal', N'6', N'del Libertador Gral. Bernardo O''higgins')
INSERT [dbo].[Comuna] ([IdComuna], [NomComuna], [NomProvincia], [IdRegion], [NomRegion]) VALUES (N'06104', N'Coltauco', N'Cachapoal', N'6', N'del Libertador Gral. Bernardo O''higgins')
INSERT [dbo].[Comuna] ([IdComuna], [NomComuna], [NomProvincia], [IdRegion], [NomRegion]) VALUES (N'06105', N'Doñihue', N'Cachapoal', N'6', N'del Libertador Gral. Bernardo O''higgins')
INSERT [dbo].[Comuna] ([IdComuna], [NomComuna], [NomProvincia], [IdRegion], [NomRegion]) VALUES (N'06106', N'Graneros', N'Cachapoal', N'6', N'del Libertador Gral. Bernardo O''higgins')
INSERT [dbo].[Comuna] ([IdComuna], [NomComuna], [NomProvincia], [IdRegion], [NomRegion]) VALUES (N'06107', N'Las Cabras', N'Cachapoal', N'6', N'del Libertador Gral. Bernardo O''higgins')
INSERT [dbo].[Comuna] ([IdComuna], [NomComuna], [NomProvincia], [IdRegion], [NomRegion]) VALUES (N'06108', N'Machalí', N'Cachapoal', N'6', N'del Libertador Gral. Bernardo O''higgins')
INSERT [dbo].[Comuna] ([IdComuna], [NomComuna], [NomProvincia], [IdRegion], [NomRegion]) VALUES (N'06109', N'Malloa', N'Cachapoal', N'6', N'del Libertador Gral. Bernardo O''higgins')
INSERT [dbo].[Comuna] ([IdComuna], [NomComuna], [NomProvincia], [IdRegion], [NomRegion]) VALUES (N'06110', N'Mostazal', N'Cachapoal', N'6', N'del Libertador Gral. Bernardo O''higgins')
INSERT [dbo].[Comuna] ([IdComuna], [NomComuna], [NomProvincia], [IdRegion], [NomRegion]) VALUES (N'06111', N'Olivar', N'Cachapoal', N'6', N'del Libertador Gral. Bernardo O''higgins')
INSERT [dbo].[Comuna] ([IdComuna], [NomComuna], [NomProvincia], [IdRegion], [NomRegion]) VALUES (N'06112', N'Peumo', N'Cachapoal', N'6', N'del Libertador Gral. Bernardo O''higgins')
INSERT [dbo].[Comuna] ([IdComuna], [NomComuna], [NomProvincia], [IdRegion], [NomRegion]) VALUES (N'06113', N'Pichidegua', N'Cachapoal', N'6', N'del Libertador Gral. Bernardo O''higgins')
INSERT [dbo].[Comuna] ([IdComuna], [NomComuna], [NomProvincia], [IdRegion], [NomRegion]) VALUES (N'06114', N'Quinta de Tilcoco', N'Cachapoal', N'6', N'del Libertador Gral. Bernardo O''higgins')
INSERT [dbo].[Comuna] ([IdComuna], [NomComuna], [NomProvincia], [IdRegion], [NomRegion]) VALUES (N'06115', N'Rengo', N'Cachapoal', N'6', N'del Libertador Gral. Bernardo O''higgins')
INSERT [dbo].[Comuna] ([IdComuna], [NomComuna], [NomProvincia], [IdRegion], [NomRegion]) VALUES (N'06116', N'Requinoa', N'Cachapoal', N'6', N'del Libertador Gral. Bernardo O''higgins')
INSERT [dbo].[Comuna] ([IdComuna], [NomComuna], [NomProvincia], [IdRegion], [NomRegion]) VALUES (N'06117', N'San Vicente', N'Cachapoal', N'6', N'del Libertador Gral. Bernardo O''higgins')
INSERT [dbo].[Comuna] ([IdComuna], [NomComuna], [NomProvincia], [IdRegion], [NomRegion]) VALUES (N'06201', N'Pichilemu', N'Cardenal Caro', N'6', N'del Libertador Gral. Bernardo O''higgins')
INSERT [dbo].[Comuna] ([IdComuna], [NomComuna], [NomProvincia], [IdRegion], [NomRegion]) VALUES (N'06202', N'La Estrella', N'Cardenal Caro', N'6', N'del Libertador Gral. Bernardo O''higgins')
INSERT [dbo].[Comuna] ([IdComuna], [NomComuna], [NomProvincia], [IdRegion], [NomRegion]) VALUES (N'06203', N'Litueche', N'Cardenal Caro', N'6', N'del Libertador Gral. Bernardo O''higgins')
INSERT [dbo].[Comuna] ([IdComuna], [NomComuna], [NomProvincia], [IdRegion], [NomRegion]) VALUES (N'06204', N'Marchihue', N'Cardenal Caro', N'6', N'del Libertador Gral. Bernardo O''higgins')
INSERT [dbo].[Comuna] ([IdComuna], [NomComuna], [NomProvincia], [IdRegion], [NomRegion]) VALUES (N'06205', N'Navidad', N'Cardenal Caro', N'6', N'del Libertador Gral. Bernardo O''higgins')
INSERT [dbo].[Comuna] ([IdComuna], [NomComuna], [NomProvincia], [IdRegion], [NomRegion]) VALUES (N'06206', N'Paredones', N'Cardenal Caro', N'6', N'del Libertador Gral. Bernardo O''higgins')
GO
print 'Processed 100 total records'
INSERT [dbo].[Comuna] ([IdComuna], [NomComuna], [NomProvincia], [IdRegion], [NomRegion]) VALUES (N'06301', N'San Fernando', N'Colchagua', N'6', N'del Libertador Gral. Bernardo O''higgins')
INSERT [dbo].[Comuna] ([IdComuna], [NomComuna], [NomProvincia], [IdRegion], [NomRegion]) VALUES (N'06302', N'Chépica', N'Colchagua', N'6', N'del Libertador Gral. Bernardo O''higgins')
INSERT [dbo].[Comuna] ([IdComuna], [NomComuna], [NomProvincia], [IdRegion], [NomRegion]) VALUES (N'06303', N'Chimbarongo', N'Colchagua', N'6', N'del Libertador Gral. Bernardo O''higgins')
INSERT [dbo].[Comuna] ([IdComuna], [NomComuna], [NomProvincia], [IdRegion], [NomRegion]) VALUES (N'06304', N'Lolol', N'Colchagua', N'6', N'del Libertador Gral. Bernardo O''higgins')
INSERT [dbo].[Comuna] ([IdComuna], [NomComuna], [NomProvincia], [IdRegion], [NomRegion]) VALUES (N'06305', N'Nancagua', N'Colchagua', N'6', N'del Libertador Gral. Bernardo O''higgins')
INSERT [dbo].[Comuna] ([IdComuna], [NomComuna], [NomProvincia], [IdRegion], [NomRegion]) VALUES (N'06306', N'Palmilla', N'Colchagua', N'6', N'del Libertador Gral. Bernardo O''higgins')
INSERT [dbo].[Comuna] ([IdComuna], [NomComuna], [NomProvincia], [IdRegion], [NomRegion]) VALUES (N'06307', N'Peralillo', N'Colchagua', N'6', N'del Libertador Gral. Bernardo O''higgins')
INSERT [dbo].[Comuna] ([IdComuna], [NomComuna], [NomProvincia], [IdRegion], [NomRegion]) VALUES (N'06308', N'Placilla', N'Colchagua', N'6', N'del Libertador Gral. Bernardo O''higgins')
INSERT [dbo].[Comuna] ([IdComuna], [NomComuna], [NomProvincia], [IdRegion], [NomRegion]) VALUES (N'06309', N'Pumanque', N'Colchagua', N'6', N'del Libertador Gral. Bernardo O''higgins')
INSERT [dbo].[Comuna] ([IdComuna], [NomComuna], [NomProvincia], [IdRegion], [NomRegion]) VALUES (N'06310', N'Santa Cruz', N'Colchagua', N'6', N'del Libertador Gral. Bernardo O''higgins')
INSERT [dbo].[Comuna] ([IdComuna], [NomComuna], [NomProvincia], [IdRegion], [NomRegion]) VALUES (N'07101', N'Talca', N'Talca', N'7', N'del Maule')
INSERT [dbo].[Comuna] ([IdComuna], [NomComuna], [NomProvincia], [IdRegion], [NomRegion]) VALUES (N'07102', N'Constitución', N'Talca', N'7', N'del Maule')
INSERT [dbo].[Comuna] ([IdComuna], [NomComuna], [NomProvincia], [IdRegion], [NomRegion]) VALUES (N'07103', N'Curepto', N'Talca', N'7', N'del Maule')
INSERT [dbo].[Comuna] ([IdComuna], [NomComuna], [NomProvincia], [IdRegion], [NomRegion]) VALUES (N'07104', N'Empedrado', N'Talca', N'7', N'del Maule')
INSERT [dbo].[Comuna] ([IdComuna], [NomComuna], [NomProvincia], [IdRegion], [NomRegion]) VALUES (N'07105', N'Maule', N'Talca', N'7', N'del Maule')
INSERT [dbo].[Comuna] ([IdComuna], [NomComuna], [NomProvincia], [IdRegion], [NomRegion]) VALUES (N'07106', N'Pelarco', N'Talca', N'7', N'del Maule')
INSERT [dbo].[Comuna] ([IdComuna], [NomComuna], [NomProvincia], [IdRegion], [NomRegion]) VALUES (N'07107', N'Pencahue', N'Talca', N'7', N'del Maule')
INSERT [dbo].[Comuna] ([IdComuna], [NomComuna], [NomProvincia], [IdRegion], [NomRegion]) VALUES (N'07108', N'Río Claro', N'Talca', N'7', N'del Maule')
INSERT [dbo].[Comuna] ([IdComuna], [NomComuna], [NomProvincia], [IdRegion], [NomRegion]) VALUES (N'07109', N'San Clemente', N'Talca', N'7', N'del Maule')
INSERT [dbo].[Comuna] ([IdComuna], [NomComuna], [NomProvincia], [IdRegion], [NomRegion]) VALUES (N'07110', N'San Rafael', N'Talca', N'7', N'del Maule')
INSERT [dbo].[Comuna] ([IdComuna], [NomComuna], [NomProvincia], [IdRegion], [NomRegion]) VALUES (N'07201', N'Cauquenes', N'Cauquenes', N'7', N'del Maule')
INSERT [dbo].[Comuna] ([IdComuna], [NomComuna], [NomProvincia], [IdRegion], [NomRegion]) VALUES (N'07202', N'Chanco', N'Cauquenes', N'7', N'del Maule')
INSERT [dbo].[Comuna] ([IdComuna], [NomComuna], [NomProvincia], [IdRegion], [NomRegion]) VALUES (N'07203', N'Pelluhue', N'Cauquenes', N'7', N'del Maule')
INSERT [dbo].[Comuna] ([IdComuna], [NomComuna], [NomProvincia], [IdRegion], [NomRegion]) VALUES (N'07301', N'Curicó', N'Curico', N'7', N'del Maule')
INSERT [dbo].[Comuna] ([IdComuna], [NomComuna], [NomProvincia], [IdRegion], [NomRegion]) VALUES (N'07302', N'Hualañé', N'Curico', N'7', N'del Maule')
INSERT [dbo].[Comuna] ([IdComuna], [NomComuna], [NomProvincia], [IdRegion], [NomRegion]) VALUES (N'07303', N'Licantén', N'Curico', N'7', N'del Maule')
INSERT [dbo].[Comuna] ([IdComuna], [NomComuna], [NomProvincia], [IdRegion], [NomRegion]) VALUES (N'07304', N'Molina', N'Curico', N'7', N'del Maule')
INSERT [dbo].[Comuna] ([IdComuna], [NomComuna], [NomProvincia], [IdRegion], [NomRegion]) VALUES (N'07305', N'Rauco', N'Curico', N'7', N'del Maule')
INSERT [dbo].[Comuna] ([IdComuna], [NomComuna], [NomProvincia], [IdRegion], [NomRegion]) VALUES (N'07306', N'Romeral', N'Curico', N'7', N'del Maule')
INSERT [dbo].[Comuna] ([IdComuna], [NomComuna], [NomProvincia], [IdRegion], [NomRegion]) VALUES (N'07307', N'Sagrada Familia', N'Curico', N'7', N'del Maule')
INSERT [dbo].[Comuna] ([IdComuna], [NomComuna], [NomProvincia], [IdRegion], [NomRegion]) VALUES (N'07308', N'Teno', N'Curico', N'7', N'del Maule')
INSERT [dbo].[Comuna] ([IdComuna], [NomComuna], [NomProvincia], [IdRegion], [NomRegion]) VALUES (N'07309', N'Vichuquén', N'Curico', N'7', N'del Maule')
INSERT [dbo].[Comuna] ([IdComuna], [NomComuna], [NomProvincia], [IdRegion], [NomRegion]) VALUES (N'07401', N'Linares', N'Linares', N'7', N'del Maule')
INSERT [dbo].[Comuna] ([IdComuna], [NomComuna], [NomProvincia], [IdRegion], [NomRegion]) VALUES (N'07402', N'Colbún', N'Linares', N'7', N'del Maule')
INSERT [dbo].[Comuna] ([IdComuna], [NomComuna], [NomProvincia], [IdRegion], [NomRegion]) VALUES (N'07403', N'Longaví', N'Linares', N'7', N'del Maule')
INSERT [dbo].[Comuna] ([IdComuna], [NomComuna], [NomProvincia], [IdRegion], [NomRegion]) VALUES (N'07404', N'Parral', N'Linares', N'7', N'del Maule')
INSERT [dbo].[Comuna] ([IdComuna], [NomComuna], [NomProvincia], [IdRegion], [NomRegion]) VALUES (N'07405', N'Retiro', N'Linares', N'7', N'del Maule')
INSERT [dbo].[Comuna] ([IdComuna], [NomComuna], [NomProvincia], [IdRegion], [NomRegion]) VALUES (N'07406', N'San Javier', N'Linares', N'7', N'del Maule')
INSERT [dbo].[Comuna] ([IdComuna], [NomComuna], [NomProvincia], [IdRegion], [NomRegion]) VALUES (N'07407', N'Villa Alegre', N'Linares', N'7', N'del Maule')
INSERT [dbo].[Comuna] ([IdComuna], [NomComuna], [NomProvincia], [IdRegion], [NomRegion]) VALUES (N'07408', N'Yerbas Buenas', N'Linares', N'7', N'del Maule')
INSERT [dbo].[Comuna] ([IdComuna], [NomComuna], [NomProvincia], [IdRegion], [NomRegion]) VALUES (N'08101', N'Concepción', N'Concepcion', N'8', N'del BioBio')
INSERT [dbo].[Comuna] ([IdComuna], [NomComuna], [NomProvincia], [IdRegion], [NomRegion]) VALUES (N'08102', N'Coronel', N'Concepcion', N'8', N'del BioBio')
INSERT [dbo].[Comuna] ([IdComuna], [NomComuna], [NomProvincia], [IdRegion], [NomRegion]) VALUES (N'08103', N'Chiguayante', N'Concepcion', N'8', N'del BioBio')
INSERT [dbo].[Comuna] ([IdComuna], [NomComuna], [NomProvincia], [IdRegion], [NomRegion]) VALUES (N'08104', N'Florida', N'Concepcion', N'8', N'del BioBio')
INSERT [dbo].[Comuna] ([IdComuna], [NomComuna], [NomProvincia], [IdRegion], [NomRegion]) VALUES (N'08105', N'Hualqui', N'Concepcion', N'8', N'del BioBio')
INSERT [dbo].[Comuna] ([IdComuna], [NomComuna], [NomProvincia], [IdRegion], [NomRegion]) VALUES (N'08106', N'Lota', N'Concepcion', N'8', N'del BioBio')
INSERT [dbo].[Comuna] ([IdComuna], [NomComuna], [NomProvincia], [IdRegion], [NomRegion]) VALUES (N'08107', N'Penco', N'Concepcion', N'8', N'del BioBio')
INSERT [dbo].[Comuna] ([IdComuna], [NomComuna], [NomProvincia], [IdRegion], [NomRegion]) VALUES (N'08108', N'San Pedro De La Paz', N'Concepcion', N'8', N'del BioBio')
INSERT [dbo].[Comuna] ([IdComuna], [NomComuna], [NomProvincia], [IdRegion], [NomRegion]) VALUES (N'08109', N'Santa Juana', N'Concepcion', N'8', N'del BioBio')
INSERT [dbo].[Comuna] ([IdComuna], [NomComuna], [NomProvincia], [IdRegion], [NomRegion]) VALUES (N'08110', N'Talcahuano', N'Concepcion', N'8', N'del BioBio')
INSERT [dbo].[Comuna] ([IdComuna], [NomComuna], [NomProvincia], [IdRegion], [NomRegion]) VALUES (N'08111', N'Tomé', N'Concepcion', N'8', N'del BioBio')
INSERT [dbo].[Comuna] ([IdComuna], [NomComuna], [NomProvincia], [IdRegion], [NomRegion]) VALUES (N'08112', N'Hualpén', N'Concepcion', N'8', N'del BioBio')
INSERT [dbo].[Comuna] ([IdComuna], [NomComuna], [NomProvincia], [IdRegion], [NomRegion]) VALUES (N'08201', N'Lebu', N'Arauco', N'8', N'del BioBio')
INSERT [dbo].[Comuna] ([IdComuna], [NomComuna], [NomProvincia], [IdRegion], [NomRegion]) VALUES (N'08202', N'Arauco', N'Arauco', N'8', N'del BioBio')
INSERT [dbo].[Comuna] ([IdComuna], [NomComuna], [NomProvincia], [IdRegion], [NomRegion]) VALUES (N'08203', N'Cañete', N'Arauco', N'8', N'del BioBio')
INSERT [dbo].[Comuna] ([IdComuna], [NomComuna], [NomProvincia], [IdRegion], [NomRegion]) VALUES (N'08204', N'Contulmo', N'Arauco', N'8', N'del BioBio')
INSERT [dbo].[Comuna] ([IdComuna], [NomComuna], [NomProvincia], [IdRegion], [NomRegion]) VALUES (N'08205', N'Curanilahue', N'Arauco', N'8', N'del BioBio')
INSERT [dbo].[Comuna] ([IdComuna], [NomComuna], [NomProvincia], [IdRegion], [NomRegion]) VALUES (N'08206', N'Los Alamos', N'Arauco', N'8', N'del BioBio')
INSERT [dbo].[Comuna] ([IdComuna], [NomComuna], [NomProvincia], [IdRegion], [NomRegion]) VALUES (N'08207', N'Tirua', N'Arauco', N'8', N'del BioBio')
INSERT [dbo].[Comuna] ([IdComuna], [NomComuna], [NomProvincia], [IdRegion], [NomRegion]) VALUES (N'08301', N'Los Angeles', N'Biobio', N'8', N'del BioBio')
INSERT [dbo].[Comuna] ([IdComuna], [NomComuna], [NomProvincia], [IdRegion], [NomRegion]) VALUES (N'08302', N'Antuco', N'Biobio', N'8', N'del BioBio')
INSERT [dbo].[Comuna] ([IdComuna], [NomComuna], [NomProvincia], [IdRegion], [NomRegion]) VALUES (N'08303', N'Cabrero', N'Biobio', N'8', N'del BioBio')
INSERT [dbo].[Comuna] ([IdComuna], [NomComuna], [NomProvincia], [IdRegion], [NomRegion]) VALUES (N'08304', N'Laja', N'Biobio', N'8', N'del BioBio')
INSERT [dbo].[Comuna] ([IdComuna], [NomComuna], [NomProvincia], [IdRegion], [NomRegion]) VALUES (N'08305', N'Mulchén', N'Biobio', N'8', N'del BioBio')
INSERT [dbo].[Comuna] ([IdComuna], [NomComuna], [NomProvincia], [IdRegion], [NomRegion]) VALUES (N'08306', N'Nacimiento', N'Biobio', N'8', N'del BioBio')
INSERT [dbo].[Comuna] ([IdComuna], [NomComuna], [NomProvincia], [IdRegion], [NomRegion]) VALUES (N'08307', N'Negrete', N'Biobio', N'8', N'del BioBio')
INSERT [dbo].[Comuna] ([IdComuna], [NomComuna], [NomProvincia], [IdRegion], [NomRegion]) VALUES (N'08308', N'Quilaco', N'Biobio', N'8', N'del BioBio')
INSERT [dbo].[Comuna] ([IdComuna], [NomComuna], [NomProvincia], [IdRegion], [NomRegion]) VALUES (N'08309', N'Quilleco', N'Biobio', N'8', N'del BioBio')
INSERT [dbo].[Comuna] ([IdComuna], [NomComuna], [NomProvincia], [IdRegion], [NomRegion]) VALUES (N'08310', N'San Rosendo', N'Biobio', N'8', N'del BioBio')
INSERT [dbo].[Comuna] ([IdComuna], [NomComuna], [NomProvincia], [IdRegion], [NomRegion]) VALUES (N'08311', N'Santa Bárbara', N'Biobio', N'8', N'del BioBio')
INSERT [dbo].[Comuna] ([IdComuna], [NomComuna], [NomProvincia], [IdRegion], [NomRegion]) VALUES (N'08312', N'Tucapel', N'Biobio', N'8', N'del BioBio')
INSERT [dbo].[Comuna] ([IdComuna], [NomComuna], [NomProvincia], [IdRegion], [NomRegion]) VALUES (N'08313', N'Yumbel', N'Biobio', N'8', N'del BioBio')
INSERT [dbo].[Comuna] ([IdComuna], [NomComuna], [NomProvincia], [IdRegion], [NomRegion]) VALUES (N'08314', N'Alto Biobío', N'Biobio', N'8', N'del BioBio')
INSERT [dbo].[Comuna] ([IdComuna], [NomComuna], [NomProvincia], [IdRegion], [NomRegion]) VALUES (N'08401', N'Chillán', N'Ñuble', N'8', N'del BioBio')
INSERT [dbo].[Comuna] ([IdComuna], [NomComuna], [NomProvincia], [IdRegion], [NomRegion]) VALUES (N'08402', N'Bulnes', N'Ñuble', N'8', N'del BioBio')
INSERT [dbo].[Comuna] ([IdComuna], [NomComuna], [NomProvincia], [IdRegion], [NomRegion]) VALUES (N'08403', N'Cobquecura', N'Ñuble', N'8', N'del BioBio')
INSERT [dbo].[Comuna] ([IdComuna], [NomComuna], [NomProvincia], [IdRegion], [NomRegion]) VALUES (N'08404', N'Coelemu', N'Ñuble', N'8', N'del BioBio')
INSERT [dbo].[Comuna] ([IdComuna], [NomComuna], [NomProvincia], [IdRegion], [NomRegion]) VALUES (N'08405', N'Coihueco', N'Ñuble', N'8', N'del BioBio')
INSERT [dbo].[Comuna] ([IdComuna], [NomComuna], [NomProvincia], [IdRegion], [NomRegion]) VALUES (N'08406', N'Chillán Viejo', N'Ñuble', N'8', N'del BioBio')
INSERT [dbo].[Comuna] ([IdComuna], [NomComuna], [NomProvincia], [IdRegion], [NomRegion]) VALUES (N'08407', N'El Carmen', N'Ñuble', N'8', N'del BioBio')
INSERT [dbo].[Comuna] ([IdComuna], [NomComuna], [NomProvincia], [IdRegion], [NomRegion]) VALUES (N'08408', N'Ninhue', N'Ñuble', N'8', N'del BioBio')
INSERT [dbo].[Comuna] ([IdComuna], [NomComuna], [NomProvincia], [IdRegion], [NomRegion]) VALUES (N'08409', N'Ñiquén', N'Ñuble', N'8', N'del BioBio')
INSERT [dbo].[Comuna] ([IdComuna], [NomComuna], [NomProvincia], [IdRegion], [NomRegion]) VALUES (N'08410', N'Pemuco', N'Ñuble', N'8', N'del BioBio')
INSERT [dbo].[Comuna] ([IdComuna], [NomComuna], [NomProvincia], [IdRegion], [NomRegion]) VALUES (N'08411', N'Pinto', N'Ñuble', N'8', N'del BioBio')
INSERT [dbo].[Comuna] ([IdComuna], [NomComuna], [NomProvincia], [IdRegion], [NomRegion]) VALUES (N'08412', N'Portezuelo', N'Ñuble', N'8', N'del BioBio')
INSERT [dbo].[Comuna] ([IdComuna], [NomComuna], [NomProvincia], [IdRegion], [NomRegion]) VALUES (N'08413', N'Quillón', N'Ñuble', N'8', N'del BioBio')
INSERT [dbo].[Comuna] ([IdComuna], [NomComuna], [NomProvincia], [IdRegion], [NomRegion]) VALUES (N'08414', N'Quirihue', N'Ñuble', N'8', N'del BioBio')
INSERT [dbo].[Comuna] ([IdComuna], [NomComuna], [NomProvincia], [IdRegion], [NomRegion]) VALUES (N'08415', N'Ranquil', N'Ñuble', N'8', N'del BioBio')
INSERT [dbo].[Comuna] ([IdComuna], [NomComuna], [NomProvincia], [IdRegion], [NomRegion]) VALUES (N'08416', N'San Carlos', N'Ñuble', N'8', N'del BioBio')
INSERT [dbo].[Comuna] ([IdComuna], [NomComuna], [NomProvincia], [IdRegion], [NomRegion]) VALUES (N'08417', N'San Fabián', N'Ñuble', N'8', N'del BioBio')
INSERT [dbo].[Comuna] ([IdComuna], [NomComuna], [NomProvincia], [IdRegion], [NomRegion]) VALUES (N'08418', N'San Ignacio', N'Ñuble', N'8', N'del BioBio')
INSERT [dbo].[Comuna] ([IdComuna], [NomComuna], [NomProvincia], [IdRegion], [NomRegion]) VALUES (N'08419', N'San Nicolás', N'Ñuble', N'8', N'del BioBio')
INSERT [dbo].[Comuna] ([IdComuna], [NomComuna], [NomProvincia], [IdRegion], [NomRegion]) VALUES (N'08420', N'Trehuaco', N'Ñuble', N'8', N'del BioBio')
INSERT [dbo].[Comuna] ([IdComuna], [NomComuna], [NomProvincia], [IdRegion], [NomRegion]) VALUES (N'08421', N'Yungay', N'Ñuble', N'8', N'del BioBio')
INSERT [dbo].[Comuna] ([IdComuna], [NomComuna], [NomProvincia], [IdRegion], [NomRegion]) VALUES (N'09101', N'Temuco', N'Cautin', N'9', N'de la Araucania')
INSERT [dbo].[Comuna] ([IdComuna], [NomComuna], [NomProvincia], [IdRegion], [NomRegion]) VALUES (N'09102', N'Carahue', N'Cautin', N'9', N'de la Araucania')
INSERT [dbo].[Comuna] ([IdComuna], [NomComuna], [NomProvincia], [IdRegion], [NomRegion]) VALUES (N'09103', N'Cunco', N'Cautin', N'9', N'de la Araucania')
INSERT [dbo].[Comuna] ([IdComuna], [NomComuna], [NomProvincia], [IdRegion], [NomRegion]) VALUES (N'09104', N'Curarrehue', N'Cautin', N'9', N'de la Araucania')
INSERT [dbo].[Comuna] ([IdComuna], [NomComuna], [NomProvincia], [IdRegion], [NomRegion]) VALUES (N'09105', N'Freire', N'Cautin', N'9', N'de la Araucania')
INSERT [dbo].[Comuna] ([IdComuna], [NomComuna], [NomProvincia], [IdRegion], [NomRegion]) VALUES (N'09106', N'Galvarino', N'Cautin', N'9', N'de la Araucania')
INSERT [dbo].[Comuna] ([IdComuna], [NomComuna], [NomProvincia], [IdRegion], [NomRegion]) VALUES (N'09107', N'Gorbea', N'Cautin', N'9', N'de la Araucania')
GO
print 'Processed 200 total records'
INSERT [dbo].[Comuna] ([IdComuna], [NomComuna], [NomProvincia], [IdRegion], [NomRegion]) VALUES (N'09108', N'Lautaro', N'Cautin', N'9', N'de la Araucania')
INSERT [dbo].[Comuna] ([IdComuna], [NomComuna], [NomProvincia], [IdRegion], [NomRegion]) VALUES (N'09109', N'Loncoche', N'Cautin', N'9', N'de la Araucania')
INSERT [dbo].[Comuna] ([IdComuna], [NomComuna], [NomProvincia], [IdRegion], [NomRegion]) VALUES (N'09110', N'Melipeuco', N'Cautin', N'9', N'de la Araucania')
INSERT [dbo].[Comuna] ([IdComuna], [NomComuna], [NomProvincia], [IdRegion], [NomRegion]) VALUES (N'09111', N'Nueva Imperial', N'Cautin', N'9', N'de la Araucania')
INSERT [dbo].[Comuna] ([IdComuna], [NomComuna], [NomProvincia], [IdRegion], [NomRegion]) VALUES (N'09112', N'Padre Las Casas', N'Cautin', N'9', N'de la Araucania')
INSERT [dbo].[Comuna] ([IdComuna], [NomComuna], [NomProvincia], [IdRegion], [NomRegion]) VALUES (N'09113', N'Perquenco', N'Cautin', N'9', N'de la Araucania')
INSERT [dbo].[Comuna] ([IdComuna], [NomComuna], [NomProvincia], [IdRegion], [NomRegion]) VALUES (N'09114', N'Pitrufquén', N'Cautin', N'9', N'de la Araucania')
INSERT [dbo].[Comuna] ([IdComuna], [NomComuna], [NomProvincia], [IdRegion], [NomRegion]) VALUES (N'09115', N'Pucón', N'Cautin', N'9', N'de la Araucania')
INSERT [dbo].[Comuna] ([IdComuna], [NomComuna], [NomProvincia], [IdRegion], [NomRegion]) VALUES (N'09116', N'Saavedra', N'Cautin', N'9', N'de la Araucania')
INSERT [dbo].[Comuna] ([IdComuna], [NomComuna], [NomProvincia], [IdRegion], [NomRegion]) VALUES (N'09117', N'Teodoro Schmidt', N'Cautin', N'9', N'de la Araucania')
INSERT [dbo].[Comuna] ([IdComuna], [NomComuna], [NomProvincia], [IdRegion], [NomRegion]) VALUES (N'09118', N'Toltén', N'Cautin', N'9', N'de la Araucania')
INSERT [dbo].[Comuna] ([IdComuna], [NomComuna], [NomProvincia], [IdRegion], [NomRegion]) VALUES (N'09119', N'Vilcún', N'Cautin', N'9', N'de la Araucania')
INSERT [dbo].[Comuna] ([IdComuna], [NomComuna], [NomProvincia], [IdRegion], [NomRegion]) VALUES (N'09120', N'Villarrica', N'Cautin', N'9', N'de la Araucania')
INSERT [dbo].[Comuna] ([IdComuna], [NomComuna], [NomProvincia], [IdRegion], [NomRegion]) VALUES (N'09121', N'Cholchol', N'Cautin', N'9', N'de la Araucania')
INSERT [dbo].[Comuna] ([IdComuna], [NomComuna], [NomProvincia], [IdRegion], [NomRegion]) VALUES (N'09201', N'Angol', N'Malleco', N'9', N'de la Araucania')
INSERT [dbo].[Comuna] ([IdComuna], [NomComuna], [NomProvincia], [IdRegion], [NomRegion]) VALUES (N'09202', N'Collipulli', N'Malleco', N'9', N'de la Araucania')
INSERT [dbo].[Comuna] ([IdComuna], [NomComuna], [NomProvincia], [IdRegion], [NomRegion]) VALUES (N'09203', N'Curacautín', N'Malleco', N'9', N'de la Araucania')
INSERT [dbo].[Comuna] ([IdComuna], [NomComuna], [NomProvincia], [IdRegion], [NomRegion]) VALUES (N'09204', N'Ercilla', N'Malleco', N'9', N'de la Araucania')
INSERT [dbo].[Comuna] ([IdComuna], [NomComuna], [NomProvincia], [IdRegion], [NomRegion]) VALUES (N'09205', N'Lonquimay', N'Malleco', N'9', N'de la Araucania')
INSERT [dbo].[Comuna] ([IdComuna], [NomComuna], [NomProvincia], [IdRegion], [NomRegion]) VALUES (N'09206', N'Los Sauces', N'Malleco', N'9', N'de la Araucania')
INSERT [dbo].[Comuna] ([IdComuna], [NomComuna], [NomProvincia], [IdRegion], [NomRegion]) VALUES (N'09207', N'Lumaco', N'Malleco', N'9', N'de la Araucania')
INSERT [dbo].[Comuna] ([IdComuna], [NomComuna], [NomProvincia], [IdRegion], [NomRegion]) VALUES (N'09208', N'Purén', N'Malleco', N'9', N'de la Araucania')
INSERT [dbo].[Comuna] ([IdComuna], [NomComuna], [NomProvincia], [IdRegion], [NomRegion]) VALUES (N'09209', N'Renaico', N'Malleco', N'9', N'de la Araucania')
INSERT [dbo].[Comuna] ([IdComuna], [NomComuna], [NomProvincia], [IdRegion], [NomRegion]) VALUES (N'09210', N'Traiguén', N'Malleco', N'9', N'de la Araucania')
INSERT [dbo].[Comuna] ([IdComuna], [NomComuna], [NomProvincia], [IdRegion], [NomRegion]) VALUES (N'09211', N'Victoria', N'Malleco', N'9', N'de la Araucania')
INSERT [dbo].[Comuna] ([IdComuna], [NomComuna], [NomProvincia], [IdRegion], [NomRegion]) VALUES (N'10101', N'Puerto Montt', N'Llanquihue', N'10', N'de los Lagos')
INSERT [dbo].[Comuna] ([IdComuna], [NomComuna], [NomProvincia], [IdRegion], [NomRegion]) VALUES (N'10102', N'Calbuco', N'Llanquihue', N'10', N'de los Lagos')
INSERT [dbo].[Comuna] ([IdComuna], [NomComuna], [NomProvincia], [IdRegion], [NomRegion]) VALUES (N'10103', N'Cochamó', N'Llanquihue', N'10', N'de los Lagos')
INSERT [dbo].[Comuna] ([IdComuna], [NomComuna], [NomProvincia], [IdRegion], [NomRegion]) VALUES (N'10104', N'Fresia', N'Llanquihue', N'10', N'de los Lagos')
INSERT [dbo].[Comuna] ([IdComuna], [NomComuna], [NomProvincia], [IdRegion], [NomRegion]) VALUES (N'10105', N'Frutillar', N'Llanquihue', N'10', N'de los Lagos')
INSERT [dbo].[Comuna] ([IdComuna], [NomComuna], [NomProvincia], [IdRegion], [NomRegion]) VALUES (N'10106', N'Los Muermos', N'Llanquihue', N'10', N'de los Lagos')
INSERT [dbo].[Comuna] ([IdComuna], [NomComuna], [NomProvincia], [IdRegion], [NomRegion]) VALUES (N'10107', N'Llanquihue', N'Llanquihue', N'10', N'de los Lagos')
INSERT [dbo].[Comuna] ([IdComuna], [NomComuna], [NomProvincia], [IdRegion], [NomRegion]) VALUES (N'10108', N'Maullín', N'Llanquihue', N'10', N'de los Lagos')
INSERT [dbo].[Comuna] ([IdComuna], [NomComuna], [NomProvincia], [IdRegion], [NomRegion]) VALUES (N'10109', N'Puerto Varas', N'Llanquihue', N'10', N'de los Lagos')
INSERT [dbo].[Comuna] ([IdComuna], [NomComuna], [NomProvincia], [IdRegion], [NomRegion]) VALUES (N'10201', N'Castro', N'Chiloe', N'10', N'de los Lagos')
INSERT [dbo].[Comuna] ([IdComuna], [NomComuna], [NomProvincia], [IdRegion], [NomRegion]) VALUES (N'10202', N'Ancud', N'Chiloe', N'10', N'de los Lagos')
INSERT [dbo].[Comuna] ([IdComuna], [NomComuna], [NomProvincia], [IdRegion], [NomRegion]) VALUES (N'10203', N'Chonchi', N'Chiloe', N'10', N'de los Lagos')
INSERT [dbo].[Comuna] ([IdComuna], [NomComuna], [NomProvincia], [IdRegion], [NomRegion]) VALUES (N'10204', N'Curaco de Vélez', N'Chiloe', N'10', N'de los Lagos')
INSERT [dbo].[Comuna] ([IdComuna], [NomComuna], [NomProvincia], [IdRegion], [NomRegion]) VALUES (N'10205', N'Dalcahue', N'Chiloe', N'10', N'de los Lagos')
INSERT [dbo].[Comuna] ([IdComuna], [NomComuna], [NomProvincia], [IdRegion], [NomRegion]) VALUES (N'10206', N'Puqueldón', N'Chiloe', N'10', N'de los Lagos')
INSERT [dbo].[Comuna] ([IdComuna], [NomComuna], [NomProvincia], [IdRegion], [NomRegion]) VALUES (N'10207', N'Queilén', N'Chiloe', N'10', N'de los Lagos')
INSERT [dbo].[Comuna] ([IdComuna], [NomComuna], [NomProvincia], [IdRegion], [NomRegion]) VALUES (N'10208', N'Quellón', N'Chiloe', N'10', N'de los Lagos')
INSERT [dbo].[Comuna] ([IdComuna], [NomComuna], [NomProvincia], [IdRegion], [NomRegion]) VALUES (N'10209', N'Quemchi', N'Chiloe', N'10', N'de los Lagos')
INSERT [dbo].[Comuna] ([IdComuna], [NomComuna], [NomProvincia], [IdRegion], [NomRegion]) VALUES (N'10210', N'Quinchao', N'Chiloe', N'10', N'de los Lagos')
INSERT [dbo].[Comuna] ([IdComuna], [NomComuna], [NomProvincia], [IdRegion], [NomRegion]) VALUES (N'10301', N'Osorno', N'Osorno', N'10', N'de los Lagos')
INSERT [dbo].[Comuna] ([IdComuna], [NomComuna], [NomProvincia], [IdRegion], [NomRegion]) VALUES (N'10302', N'Puerto Octay', N'Osorno', N'10', N'de los Lagos')
INSERT [dbo].[Comuna] ([IdComuna], [NomComuna], [NomProvincia], [IdRegion], [NomRegion]) VALUES (N'10303', N'Purranque', N'Osorno', N'10', N'de los Lagos')
INSERT [dbo].[Comuna] ([IdComuna], [NomComuna], [NomProvincia], [IdRegion], [NomRegion]) VALUES (N'10304', N'Puyehue', N'Osorno', N'10', N'de los Lagos')
INSERT [dbo].[Comuna] ([IdComuna], [NomComuna], [NomProvincia], [IdRegion], [NomRegion]) VALUES (N'10305', N'Río Negro', N'Osorno', N'10', N'de los Lagos')
INSERT [dbo].[Comuna] ([IdComuna], [NomComuna], [NomProvincia], [IdRegion], [NomRegion]) VALUES (N'10306', N'San Juan de la Costa', N'Osorno', N'10', N'de los Lagos')
INSERT [dbo].[Comuna] ([IdComuna], [NomComuna], [NomProvincia], [IdRegion], [NomRegion]) VALUES (N'10307', N'San Pablo', N'Osorno', N'10', N'de los Lagos')
INSERT [dbo].[Comuna] ([IdComuna], [NomComuna], [NomProvincia], [IdRegion], [NomRegion]) VALUES (N'10401', N'Chaitén', N'Palena', N'10', N'de los Lagos')
INSERT [dbo].[Comuna] ([IdComuna], [NomComuna], [NomProvincia], [IdRegion], [NomRegion]) VALUES (N'10402', N'Futaleufú', N'Palena', N'10', N'de los Lagos')
INSERT [dbo].[Comuna] ([IdComuna], [NomComuna], [NomProvincia], [IdRegion], [NomRegion]) VALUES (N'10403', N'Hualaihue', N'Palena', N'10', N'de los Lagos')
INSERT [dbo].[Comuna] ([IdComuna], [NomComuna], [NomProvincia], [IdRegion], [NomRegion]) VALUES (N'10404', N'Palena', N'Palena', N'10', N'de los Lagos')
INSERT [dbo].[Comuna] ([IdComuna], [NomComuna], [NomProvincia], [IdRegion], [NomRegion]) VALUES (N'11101', N'Coihaique', N'Coihaique', N'11', N'Aysén del Gral. Carlos Ibáñez del Campo')
INSERT [dbo].[Comuna] ([IdComuna], [NomComuna], [NomProvincia], [IdRegion], [NomRegion]) VALUES (N'11102', N'Lago Verde', N'Coihaique', N'11', N'Aysén del Gral. Carlos Ibáñez del Campo')
INSERT [dbo].[Comuna] ([IdComuna], [NomComuna], [NomProvincia], [IdRegion], [NomRegion]) VALUES (N'11201', N'Aisén', N'Aisen', N'11', N'Aysén del Gral. Carlos Ibáñez del Campo')
INSERT [dbo].[Comuna] ([IdComuna], [NomComuna], [NomProvincia], [IdRegion], [NomRegion]) VALUES (N'11202', N'Cisnes', N'Aisen', N'11', N'Aysén del Gral. Carlos Ibáñez del Campo')
INSERT [dbo].[Comuna] ([IdComuna], [NomComuna], [NomProvincia], [IdRegion], [NomRegion]) VALUES (N'11203', N'Guaitecas', N'Aisen', N'11', N'Aysén del Gral. Carlos Ibáñez del Campo')
INSERT [dbo].[Comuna] ([IdComuna], [NomComuna], [NomProvincia], [IdRegion], [NomRegion]) VALUES (N'11301', N'Cochrane', N'Capitan Prat', N'11', N'Aysén del Gral. Carlos Ibáñez del Campo')
INSERT [dbo].[Comuna] ([IdComuna], [NomComuna], [NomProvincia], [IdRegion], [NomRegion]) VALUES (N'11302', N'Ohiggins', N'Capitan Prat', N'11', N'Aysén del Gral. Carlos Ibáñez del Campo')
INSERT [dbo].[Comuna] ([IdComuna], [NomComuna], [NomProvincia], [IdRegion], [NomRegion]) VALUES (N'11303', N'Tortel', N'Capitan Prat', N'11', N'Aysén del Gral. Carlos Ibáñez del Campo')
INSERT [dbo].[Comuna] ([IdComuna], [NomComuna], [NomProvincia], [IdRegion], [NomRegion]) VALUES (N'11401', N'Chile Chico', N'General Carrera', N'11', N'Aysén del Gral. Carlos Ibáñez del Campo')
INSERT [dbo].[Comuna] ([IdComuna], [NomComuna], [NomProvincia], [IdRegion], [NomRegion]) VALUES (N'11402', N'Río Ibáñez', N'General Carrera', N'11', N'Aysén del Gral. Carlos Ibáñez del Campo')
INSERT [dbo].[Comuna] ([IdComuna], [NomComuna], [NomProvincia], [IdRegion], [NomRegion]) VALUES (N'12101', N'Punta Arenas', N'Magallanes', N'12', N'Magallanes')
INSERT [dbo].[Comuna] ([IdComuna], [NomComuna], [NomProvincia], [IdRegion], [NomRegion]) VALUES (N'12102', N'Laguna Blanca', N'Magallanes', N'12', N'Magallanes')
INSERT [dbo].[Comuna] ([IdComuna], [NomComuna], [NomProvincia], [IdRegion], [NomRegion]) VALUES (N'12103', N'Río Verde', N'Magallanes', N'12', N'Magallanes')
INSERT [dbo].[Comuna] ([IdComuna], [NomComuna], [NomProvincia], [IdRegion], [NomRegion]) VALUES (N'12104', N'San Gregorio', N'Magallanes', N'12', N'Magallanes')
INSERT [dbo].[Comuna] ([IdComuna], [NomComuna], [NomProvincia], [IdRegion], [NomRegion]) VALUES (N'12201', N'Cabo de Hornos', N'Antartica Chilena', N'12', N'Magallanes')
INSERT [dbo].[Comuna] ([IdComuna], [NomComuna], [NomProvincia], [IdRegion], [NomRegion]) VALUES (N'12202', N'ANTÁRTICA', N'', N'12', N'')
INSERT [dbo].[Comuna] ([IdComuna], [NomComuna], [NomProvincia], [IdRegion], [NomRegion]) VALUES (N'12301', N'Porvenir', N'Tierra del Fuego', N'12', N'Magallanes')
INSERT [dbo].[Comuna] ([IdComuna], [NomComuna], [NomProvincia], [IdRegion], [NomRegion]) VALUES (N'12302', N'Primavera', N'Tierra del Fuego', N'12', N'Magallanes')
INSERT [dbo].[Comuna] ([IdComuna], [NomComuna], [NomProvincia], [IdRegion], [NomRegion]) VALUES (N'12303', N'Timaukel', N'Tierra del Fuego', N'12', N'Magallanes')
INSERT [dbo].[Comuna] ([IdComuna], [NomComuna], [NomProvincia], [IdRegion], [NomRegion]) VALUES (N'12401', N'Natales', N'Ultima Esperanza', N'12', N'Magallanes')
INSERT [dbo].[Comuna] ([IdComuna], [NomComuna], [NomProvincia], [IdRegion], [NomRegion]) VALUES (N'12402', N'Torres del Paine', N'Ultima Esperanza', N'12', N'Magallanes')
INSERT [dbo].[Comuna] ([IdComuna], [NomComuna], [NomProvincia], [IdRegion], [NomRegion]) VALUES (N'13101', N'Santiago', N'Santiago', N'13', N'Metropolitana')
INSERT [dbo].[Comuna] ([IdComuna], [NomComuna], [NomProvincia], [IdRegion], [NomRegion]) VALUES (N'13102', N'Cerrillos', N'Santiago', N'13', N'Metropolitana')
INSERT [dbo].[Comuna] ([IdComuna], [NomComuna], [NomProvincia], [IdRegion], [NomRegion]) VALUES (N'13103', N'Cerro Navia', N'Santiago', N'13', N'Metropolitana')
INSERT [dbo].[Comuna] ([IdComuna], [NomComuna], [NomProvincia], [IdRegion], [NomRegion]) VALUES (N'13104', N'Conchalí', N'Santiago', N'13', N'Metropolitana')
INSERT [dbo].[Comuna] ([IdComuna], [NomComuna], [NomProvincia], [IdRegion], [NomRegion]) VALUES (N'13105', N'El Bosque', N'Santiago', N'13', N'Metropolitana')
INSERT [dbo].[Comuna] ([IdComuna], [NomComuna], [NomProvincia], [IdRegion], [NomRegion]) VALUES (N'13106', N'Estación Central', N'Santiago', N'13', N'Metropolitana')
INSERT [dbo].[Comuna] ([IdComuna], [NomComuna], [NomProvincia], [IdRegion], [NomRegion]) VALUES (N'13107', N'Huechuraba', N'Santiago', N'13', N'Metropolitana')
INSERT [dbo].[Comuna] ([IdComuna], [NomComuna], [NomProvincia], [IdRegion], [NomRegion]) VALUES (N'13108', N'Independencia', N'Santiago', N'13', N'Metropolitana')
INSERT [dbo].[Comuna] ([IdComuna], [NomComuna], [NomProvincia], [IdRegion], [NomRegion]) VALUES (N'13109', N'La Cisterna', N'Santiago', N'13', N'Metropolitana')
INSERT [dbo].[Comuna] ([IdComuna], [NomComuna], [NomProvincia], [IdRegion], [NomRegion]) VALUES (N'13110', N'La Florida', N'Santiago', N'13', N'Metropolitana')
INSERT [dbo].[Comuna] ([IdComuna], [NomComuna], [NomProvincia], [IdRegion], [NomRegion]) VALUES (N'13111', N'La Granja', N'Santiago', N'13', N'Metropolitana')
INSERT [dbo].[Comuna] ([IdComuna], [NomComuna], [NomProvincia], [IdRegion], [NomRegion]) VALUES (N'13112', N'La Pintana', N'Santiago', N'13', N'Metropolitana')
INSERT [dbo].[Comuna] ([IdComuna], [NomComuna], [NomProvincia], [IdRegion], [NomRegion]) VALUES (N'13113', N'La Reina', N'Santiago', N'13', N'Metropolitana')
INSERT [dbo].[Comuna] ([IdComuna], [NomComuna], [NomProvincia], [IdRegion], [NomRegion]) VALUES (N'13114', N'Las Condes', N'Santiago', N'13', N'Metropolitana')
INSERT [dbo].[Comuna] ([IdComuna], [NomComuna], [NomProvincia], [IdRegion], [NomRegion]) VALUES (N'13115', N'Lo Barnechea', N'Santiago', N'13', N'Metropolitana')
INSERT [dbo].[Comuna] ([IdComuna], [NomComuna], [NomProvincia], [IdRegion], [NomRegion]) VALUES (N'13116', N'Lo Espejo', N'Santiago', N'13', N'Metropolitana')
INSERT [dbo].[Comuna] ([IdComuna], [NomComuna], [NomProvincia], [IdRegion], [NomRegion]) VALUES (N'13117', N'Lo Prado', N'Santiago', N'13', N'Metropolitana')
INSERT [dbo].[Comuna] ([IdComuna], [NomComuna], [NomProvincia], [IdRegion], [NomRegion]) VALUES (N'13118', N'Macul', N'Santiago', N'13', N'Metropolitana')
INSERT [dbo].[Comuna] ([IdComuna], [NomComuna], [NomProvincia], [IdRegion], [NomRegion]) VALUES (N'13119', N'Maipú', N'Santiago', N'13', N'Metropolitana')
INSERT [dbo].[Comuna] ([IdComuna], [NomComuna], [NomProvincia], [IdRegion], [NomRegion]) VALUES (N'13120', N'Ñuñoa', N'Santiago', N'13', N'Metropolitana')
INSERT [dbo].[Comuna] ([IdComuna], [NomComuna], [NomProvincia], [IdRegion], [NomRegion]) VALUES (N'13121', N'Pedro Aguirre Cerda', N'Santiago', N'13', N'Metropolitana')
INSERT [dbo].[Comuna] ([IdComuna], [NomComuna], [NomProvincia], [IdRegion], [NomRegion]) VALUES (N'13122', N'Peñalolén', N'Santiago', N'13', N'Metropolitana')
INSERT [dbo].[Comuna] ([IdComuna], [NomComuna], [NomProvincia], [IdRegion], [NomRegion]) VALUES (N'13123', N'Providencia', N'Santiago', N'13', N'Metropolitana')
INSERT [dbo].[Comuna] ([IdComuna], [NomComuna], [NomProvincia], [IdRegion], [NomRegion]) VALUES (N'13124', N'Pudahuel', N'Santiago', N'13', N'Metropolitana')
INSERT [dbo].[Comuna] ([IdComuna], [NomComuna], [NomProvincia], [IdRegion], [NomRegion]) VALUES (N'13125', N'Quilicura', N'Santiago', N'13', N'Metropolitana')
GO
print 'Processed 300 total records'
INSERT [dbo].[Comuna] ([IdComuna], [NomComuna], [NomProvincia], [IdRegion], [NomRegion]) VALUES (N'13126', N'Quinta Normal', N'Santiago', N'13', N'Metropolitana')
INSERT [dbo].[Comuna] ([IdComuna], [NomComuna], [NomProvincia], [IdRegion], [NomRegion]) VALUES (N'13127', N'Recoleta', N'Santiago', N'13', N'Metropolitana')
INSERT [dbo].[Comuna] ([IdComuna], [NomComuna], [NomProvincia], [IdRegion], [NomRegion]) VALUES (N'13128', N'Renca', N'Santiago', N'13', N'Metropolitana')
INSERT [dbo].[Comuna] ([IdComuna], [NomComuna], [NomProvincia], [IdRegion], [NomRegion]) VALUES (N'13129', N'San Joaquín', N'Santiago', N'13', N'Metropolitana')
INSERT [dbo].[Comuna] ([IdComuna], [NomComuna], [NomProvincia], [IdRegion], [NomRegion]) VALUES (N'13130', N'San Miguel', N'Santiago', N'13', N'Metropolitana')
INSERT [dbo].[Comuna] ([IdComuna], [NomComuna], [NomProvincia], [IdRegion], [NomRegion]) VALUES (N'13131', N'San Ramón', N'Santiago', N'13', N'Metropolitana')
INSERT [dbo].[Comuna] ([IdComuna], [NomComuna], [NomProvincia], [IdRegion], [NomRegion]) VALUES (N'13132', N'Vitacura', N'Santiago', N'13', N'Metropolitana')
INSERT [dbo].[Comuna] ([IdComuna], [NomComuna], [NomProvincia], [IdRegion], [NomRegion]) VALUES (N'13201', N'Puente Alto', N'Cordillera', N'13', N'Metropolitana')
INSERT [dbo].[Comuna] ([IdComuna], [NomComuna], [NomProvincia], [IdRegion], [NomRegion]) VALUES (N'13202', N'Pirque', N'Cordillera', N'13', N'Metropolitana')
INSERT [dbo].[Comuna] ([IdComuna], [NomComuna], [NomProvincia], [IdRegion], [NomRegion]) VALUES (N'13203', N'San José de Maipo', N'Cordillera', N'13', N'Metropolitana')
INSERT [dbo].[Comuna] ([IdComuna], [NomComuna], [NomProvincia], [IdRegion], [NomRegion]) VALUES (N'13301', N'Colina', N'Chacabuco', N'13', N'Metropolitana')
INSERT [dbo].[Comuna] ([IdComuna], [NomComuna], [NomProvincia], [IdRegion], [NomRegion]) VALUES (N'13302', N'Lampa', N'Chacabuco', N'13', N'Metropolitana')
INSERT [dbo].[Comuna] ([IdComuna], [NomComuna], [NomProvincia], [IdRegion], [NomRegion]) VALUES (N'13303', N'Til til', N'Chacabuco', N'13', N'Metropolitana')
INSERT [dbo].[Comuna] ([IdComuna], [NomComuna], [NomProvincia], [IdRegion], [NomRegion]) VALUES (N'13401', N'San Bernardo', N'Maipo', N'13', N'Metropolitana')
INSERT [dbo].[Comuna] ([IdComuna], [NomComuna], [NomProvincia], [IdRegion], [NomRegion]) VALUES (N'13402', N'Buin', N'Maipo', N'13', N'Metropolitana')
INSERT [dbo].[Comuna] ([IdComuna], [NomComuna], [NomProvincia], [IdRegion], [NomRegion]) VALUES (N'13403', N'Calera de Tango', N'Maipo', N'13', N'Metropolitana')
INSERT [dbo].[Comuna] ([IdComuna], [NomComuna], [NomProvincia], [IdRegion], [NomRegion]) VALUES (N'13404', N'Paine', N'Maipo', N'13', N'Metropolitana')
INSERT [dbo].[Comuna] ([IdComuna], [NomComuna], [NomProvincia], [IdRegion], [NomRegion]) VALUES (N'13501', N'Melipilla', N'Melipilla', N'13', N'Metropolitana')
INSERT [dbo].[Comuna] ([IdComuna], [NomComuna], [NomProvincia], [IdRegion], [NomRegion]) VALUES (N'13502', N'Alhué', N'Melipilla', N'13', N'Metropolitana')
INSERT [dbo].[Comuna] ([IdComuna], [NomComuna], [NomProvincia], [IdRegion], [NomRegion]) VALUES (N'13503', N'Curacaví', N'Melipilla', N'13', N'Metropolitana')
INSERT [dbo].[Comuna] ([IdComuna], [NomComuna], [NomProvincia], [IdRegion], [NomRegion]) VALUES (N'13504', N'María Pinto', N'Melipilla', N'13', N'Metropolitana')
INSERT [dbo].[Comuna] ([IdComuna], [NomComuna], [NomProvincia], [IdRegion], [NomRegion]) VALUES (N'13505', N'San Pedro', N'Melipilla', N'13', N'Metropolitana')
INSERT [dbo].[Comuna] ([IdComuna], [NomComuna], [NomProvincia], [IdRegion], [NomRegion]) VALUES (N'13601', N'Talagante', N'Talagante', N'13', N'Metropolitana')
INSERT [dbo].[Comuna] ([IdComuna], [NomComuna], [NomProvincia], [IdRegion], [NomRegion]) VALUES (N'13602', N'El Monte', N'Talagante', N'13', N'Metropolitana')
INSERT [dbo].[Comuna] ([IdComuna], [NomComuna], [NomProvincia], [IdRegion], [NomRegion]) VALUES (N'13603', N'Isla de Maipo', N'Talagante', N'13', N'Metropolitana')
INSERT [dbo].[Comuna] ([IdComuna], [NomComuna], [NomProvincia], [IdRegion], [NomRegion]) VALUES (N'13604', N'Padre Hurtado', N'Talagante', N'13', N'Metropolitana')
INSERT [dbo].[Comuna] ([IdComuna], [NomComuna], [NomProvincia], [IdRegion], [NomRegion]) VALUES (N'13605', N'Peñaflor', N'Talagante', N'13', N'Metropolitana')
INSERT [dbo].[Comuna] ([IdComuna], [NomComuna], [NomProvincia], [IdRegion], [NomRegion]) VALUES (N'14101', N'Valdivia', N'Valdivia', N'14', N'Los Ríos')
INSERT [dbo].[Comuna] ([IdComuna], [NomComuna], [NomProvincia], [IdRegion], [NomRegion]) VALUES (N'14102', N'Corral', N'Valdivia', N'14', N'Los Ríos')
INSERT [dbo].[Comuna] ([IdComuna], [NomComuna], [NomProvincia], [IdRegion], [NomRegion]) VALUES (N'14103', N'Lanco', N'Valdivia', N'14', N'Los Ríos')
INSERT [dbo].[Comuna] ([IdComuna], [NomComuna], [NomProvincia], [IdRegion], [NomRegion]) VALUES (N'14104', N'Los Lagos', N'Valdivia', N'14', N'Los Ríos')
INSERT [dbo].[Comuna] ([IdComuna], [NomComuna], [NomProvincia], [IdRegion], [NomRegion]) VALUES (N'14105', N'Máfil', N'Valdivia', N'14', N'Los Ríos')
INSERT [dbo].[Comuna] ([IdComuna], [NomComuna], [NomProvincia], [IdRegion], [NomRegion]) VALUES (N'14106', N'Mariquina', N'Valdivia', N'14', N'Los Ríos')
INSERT [dbo].[Comuna] ([IdComuna], [NomComuna], [NomProvincia], [IdRegion], [NomRegion]) VALUES (N'14107', N'Paillaco', N'Valdivia', N'14', N'Los Ríos')
INSERT [dbo].[Comuna] ([IdComuna], [NomComuna], [NomProvincia], [IdRegion], [NomRegion]) VALUES (N'14108', N'Panguipulli', N'Valdivia', N'14', N'Los Ríos')
INSERT [dbo].[Comuna] ([IdComuna], [NomComuna], [NomProvincia], [IdRegion], [NomRegion]) VALUES (N'14201', N'La Unión', N'Ranco', N'14', N'Los Ríos')
INSERT [dbo].[Comuna] ([IdComuna], [NomComuna], [NomProvincia], [IdRegion], [NomRegion]) VALUES (N'14202', N'Futrono', N'Ranco', N'14', N'Los Ríos')
INSERT [dbo].[Comuna] ([IdComuna], [NomComuna], [NomProvincia], [IdRegion], [NomRegion]) VALUES (N'14203', N'Lago Ranco', N'Ranco', N'14', N'Los Ríos')
INSERT [dbo].[Comuna] ([IdComuna], [NomComuna], [NomProvincia], [IdRegion], [NomRegion]) VALUES (N'14204', N'Río Bueno', N'Ranco', N'14', N'Los Ríos')
INSERT [dbo].[Comuna] ([IdComuna], [NomComuna], [NomProvincia], [IdRegion], [NomRegion]) VALUES (N'15101', N'Arica', N'Arica', N'15', N'Arica y Parinacota')
INSERT [dbo].[Comuna] ([IdComuna], [NomComuna], [NomProvincia], [IdRegion], [NomRegion]) VALUES (N'15102', N'Camarones', N'Arica', N'15', N'Arica y Parinacota')
INSERT [dbo].[Comuna] ([IdComuna], [NomComuna], [NomProvincia], [IdRegion], [NomRegion]) VALUES (N'15201', N'Putre', N'Parinacota', N'15', N'Arica y Parinacota')
INSERT [dbo].[Comuna] ([IdComuna], [NomComuna], [NomProvincia], [IdRegion], [NomRegion]) VALUES (N'15202', N'General Lagos', N'Parinacota', N'15', N'Arica y Parinacota')
/****** Object:  Table [dbo].[ALERTAS]    Script Date: 06/26/2018 20:43:17 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[ALERTAS](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[ID_ALERTA] [varchar](100) NOT NULL,
	[DELIVERYTO] [varchar](50) NULL,
	[FEED_URL] [varchar](500) NULL,
	[HOWMANY] [varchar](50) NULL,
	[howOften] [varchar](50) NULL,
	[language] [varchar](50) NULL,
	[query] [varchar](500) NULL,
	[region] [varchar](50) NULL,
	[UltActualizacion] [datetime] NULL,
 CONSTRAINT [PK_ALERTAS_1] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
SET IDENTITY_INSERT [dbo].[ALERTAS] ON
INSERT [dbo].[ALERTAS] ([ID], [ID_ALERTA], [DELIVERYTO], [FEED_URL], [HOWMANY], [howOften], [language], [query], [region], [UltActualizacion]) VALUES (1, N'56389d94ac39c0f0:07f0aa2d59cdbfa7:com:es:CL:R', N'Email', N'https://www.google.com/alerts/feeds/14895529404289089980/11255675764143382217', N'AllResults', N'AsItHappens', N'Spanish', N'ampliación AND calle OR avenida OR rutA -dormitorio -casa -departamento -cultural -edificio', N'Chile', CAST(0x0000A90B0150CE0C AS DateTime))
INSERT [dbo].[ALERTAS] ([ID], [ID_ALERTA], [DELIVERYTO], [FEED_URL], [HOWMANY], [howOften], [language], [query], [region], [UltActualizacion]) VALUES (2, N'56389d94ac39c0f0:1290533965a38521:com:es:CL:R', N'Feed', N'https://www.google.com/alerts/feeds/14895529404289089980/4258768296118034028', N'AllResults', N'AsItHappens', N'Spanish', N'Puente', N'Chile', CAST(0x0000A90B0150D226 AS DateTime))
INSERT [dbo].[ALERTAS] ([ID], [ID_ALERTA], [DELIVERYTO], [FEED_URL], [HOWMANY], [howOften], [language], [query], [region], [UltActualizacion]) VALUES (3, N'56389d94ac39c0f0:0daa7a2033c37535:com:es:CL:R', N'Feed', N'https://www.google.com/alerts/feeds/14895529404289089980/3764510508375583543', N'AllResults', N'AsItHappens', N'Spanish', N'puente and licitacion', N'Chile', CAST(0x0000A90B0150E05C AS DateTime))
INSERT [dbo].[ALERTAS] ([ID], [ID_ALERTA], [DELIVERYTO], [FEED_URL], [HOWMANY], [howOften], [language], [query], [region], [UltActualizacion]) VALUES (4, N'56389d94ac39c0f0:a592d9a300841f83:com:es:CL:R', N'Feed', N'https://www.google.com/alerts/feeds/14895529404289089980/13204647876924466970', N'OnlyTheBestResults', N'AsItHappens', N'Spanish', N'puente or camino', N'Chile', CAST(0x0000A90B0150E133 AS DateTime))
SET IDENTITY_INSERT [dbo].[ALERTAS] OFF
/****** Object:  Table [dbo].[MandanteArchivos]    Script Date: 06/26/2018 20:43:17 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[MandanteArchivos](
	[IdMandante] [int] NOT NULL,
	[IdArchivo] [tinyint] NOT NULL,
	[RutaArchivo] [varchar](100) NOT NULL,
	[IdUsuarioIngreso] [int] NULL,
	[FechaIngreso] [smalldatetime] NULL,
	[Descripcion] [varchar](100) NULL,
	[Nombre] [varchar](50) NULL,
 CONSTRAINT [PK_MandanteArchivos] PRIMARY KEY CLUSTERED 
(
	[IdMandante] ASC,
	[IdArchivo] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
INSERT [dbo].[MandanteArchivos] ([IdMandante], [IdArchivo], [RutaArchivo], [IdUsuarioIngreso], [FechaIngreso], [Descripcion], [Nombre]) VALUES (1, 1, N'1_Libro1.xlsx', 2, CAST(0xA90A0516 AS SmallDateTime), N'', N'Prueba')
INSERT [dbo].[MandanteArchivos] ([IdMandante], [IdArchivo], [RutaArchivo], [IdUsuarioIngreso], [FechaIngreso], [Descripcion], [Nombre]) VALUES (1000, 1, N'1000_tabla.png', 1, CAST(0xA63A0035 AS SmallDateTime), N'Contrato manantial', N'Archivo 1')
INSERT [dbo].[MandanteArchivos] ([IdMandante], [IdArchivo], [RutaArchivo], [IdUsuarioIngreso], [FechaIngreso], [Descripcion], [Nombre]) VALUES (1000, 2, N'1000_Copia de Estructura campañas RD_V1 - copia.xlsx', 1, CAST(0xA63A0035 AS SmallDateTime), N'Script del deudor', N'Archivo 2')
INSERT [dbo].[MandanteArchivos] ([IdMandante], [IdArchivo], [RutaArchivo], [IdUsuarioIngreso], [FechaIngreso], [Descripcion], [Nombre]) VALUES (1001, 1, N'1001_cv-web.zip', 2, CAST(0xA633046A AS SmallDateTime), N'PRUEBSW', N'Prueba desa')
INSERT [dbo].[MandanteArchivos] ([IdMandante], [IdArchivo], [RutaArchivo], [IdUsuarioIngreso], [FechaIngreso], [Descripcion], [Nombre]) VALUES (10010, 1, N'10010_caminaba.jpg', 1, CAST(0xA63A003C AS SmallDateTime), N'LLLLLL', N'Archivo 1')
/****** Object:  StoredProcedure [dbo].[stp_BuscarUsuarioAsignadoPorMandante]    Script Date: 06/26/2018 20:43:55 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE procedure [dbo].[stp_BuscarUsuarioAsignadoPorMandante]
(@idMandante int)
as begin
select IdUsuarioAsignado, LoginUsuario from ViUsuarioAsigMandante
where IdMandante = @idMandante

end
GO
/****** Object:  Table [dbo].[Sucursal]    Script Date: 06/26/2018 20:43:17 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Sucursal](
	[IdSucursal] [varchar](10) NOT NULL,
	[NomSucursal] [varchar](100) NOT NULL,
	[Activo] [tinyint] NULL,
 CONSTRAINT [PK_Sucursal] PRIMARY KEY CLUSTERED 
(
	[IdSucursal] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
INSERT [dbo].[Sucursal] ([IdSucursal], [NomSucursal], [Activo]) VALUES (N'A', N'CASA MATRIZZ', 1)
INSERT [dbo].[Sucursal] ([IdSucursal], [NomSucursal], [Activo]) VALUES (N'B', N'OXINOR', 1)
INSERT [dbo].[Sucursal] ([IdSucursal], [NomSucursal], [Activo]) VALUES (N'C', N'ANTOFAGASTA', 1)
INSERT [dbo].[Sucursal] ([IdSucursal], [NomSucursal], [Activo]) VALUES (N'D', N'IQUIQUE', 1)
INSERT [dbo].[Sucursal] ([IdSucursal], [NomSucursal], [Activo]) VALUES (N'E', N'CALAMA', 1)
INSERT [dbo].[Sucursal] ([IdSucursal], [NomSucursal], [Activo]) VALUES (N'F', N'JUNCAL', 1)
INSERT [dbo].[Sucursal] ([IdSucursal], [NomSucursal], [Activo]) VALUES (N'F1', N'SANTIAGO SUR', 1)
INSERT [dbo].[Sucursal] ([IdSucursal], [NomSucursal], [Activo]) VALUES (N'F2', N'CAÑAVERAL', 1)
INSERT [dbo].[Sucursal] ([IdSucursal], [NomSucursal], [Activo]) VALUES (N'G', N'CONCÓN', 1)
INSERT [dbo].[Sucursal] ([IdSucursal], [NomSucursal], [Activo]) VALUES (N'H', N'CORONEL', 1)
INSERT [dbo].[Sucursal] ([IdSucursal], [NomSucursal], [Activo]) VALUES (N'H1', N'CONCEPCIÓN', 1)
INSERT [dbo].[Sucursal] ([IdSucursal], [NomSucursal], [Activo]) VALUES (N'I', N'VITALAIRE', 1)
INSERT [dbo].[Sucursal] ([IdSucursal], [NomSucursal], [Activo]) VALUES (N'J', N'PUERTO MONTT', 1)
/****** Object:  Table [dbo].[Usuario]    Script Date: 06/26/2018 20:43:17 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Usuario](
	[IdUsuario] [int] IDENTITY(1,1) NOT NULL,
	[Rut] [varchar](12) NULL,
	[Nombre] [varchar](100) NOT NULL,
	[Email] [varchar](80) NOT NULL,
	[IdPerfil] [int] NOT NULL,
	[Login] [varchar](20) NOT NULL,
	[Clave] [varchar](20) NOT NULL,
	[AreaCargo] [varchar](25) NULL,
	[Foto] [varchar](100) NULL,
	[Activo] [tinyint] NOT NULL,
	[FechaCreacion] [smalldatetime] NULL,
	[IdUsuarioDiscador] [varchar](20) NULL,
	[IdSucursal] [varchar](10) NULL,
 CONSTRAINT [PK_Usuario] PRIMARY KEY CLUSTERED 
(
	[IdUsuario] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
SET IDENTITY_INSERT [dbo].[Usuario] ON
INSERT [dbo].[Usuario] ([IdUsuario], [Rut], [Nombre], [Email], [IdPerfil], [Login], [Clave], [AreaCargo], [Foto], [Activo], [FechaCreacion], [IdUsuarioDiscador], [IdSucursal]) VALUES (0, N'22222222-2', N'Sistema', N'denis@tkonecta.cl', 1, N'Sistema', N'Sistema', N'', NULL, 1, NULL, NULL, N'A')
INSERT [dbo].[Usuario] ([IdUsuario], [Rut], [Nombre], [Email], [IdPerfil], [Login], [Clave], [AreaCargo], [Foto], [Activo], [FechaCreacion], [IdUsuarioDiscador], [IdSucursal]) VALUES (2, N'16394005-1', N'Leonardo Diaz', N'ldiaz@getsoft.cl', 1, N'ldiaz', N'ldiaz', N'Software Developer', N'assets/img/usuario/logo_2_16394005-1_Leonardo.png', 1, CAST(0xA63A0381 AS SmallDateTime), NULL, N'A')
INSERT [dbo].[Usuario] ([IdUsuario], [Rut], [Nombre], [Email], [IdPerfil], [Login], [Clave], [AreaCargo], [Foto], [Activo], [FechaCreacion], [IdUsuarioDiscador], [IdSucursal]) VALUES (34, N'1-9', N'Harry', N'Harry@gmail.com', 1, N'Harry', N'Harry', N'Harry', NULL, 1, CAST(0xA90A057F AS SmallDateTime), NULL, NULL)
SET IDENTITY_INSERT [dbo].[Usuario] OFF
/****** Object:  StoredProcedure [dbo].[stp_InUpSucursal]    Script Date: 06/26/2018 20:44:01 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE procedure [dbo].[stp_InUpSucursal](@idSucursal varchar(10),@nombreSucursal varchar(100),@activo int)
as begin

if not exists (select * from sucursal where IdSucursal = @idSucursal)
begin

	insert into sucursal(IdSucursal,NomSucursal,Activo)
	values(@idSucursal,@nombreSucursal,@activo)

	select '0' as existe
end
else begin

	update sucursal
	set NomSucursal=@nombreSucursal,Activo=@activo
	where IdSucursal=@idSucursal

	select '1' as existe
end
end
GO
/****** Object:  StoredProcedure [dbo].[stp_InMandanteArchivo]    Script Date: 06/26/2018 20:44:00 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE procedure [dbo].[stp_InMandanteArchivo]
  (@idMandante int, @rutaArchivo varchar(100),@idUsuarioIngreso int, @descripcion varchar(250), @nombre varchar(50))
  as begin

  declare @idArchivo as int
  set @idArchivo = (select IsNull(max(IdArchivo),0) + 1 from MandanteArchivos where idMandante=@idMandante)
  

	insert into [dbo].[MandanteArchivos](idMandante,IdArchivo,rutaArchivo,IdUsuarioIngreso,FechaIngreso,Descripcion,nombre)
	values (@idMandante,@idArchivo,@rutaArchivo,@idUsuarioIngreso,getdate(),@descripcion,@nombre)

  end
GO
/****** Object:  StoredProcedure [dbo].[stp_IngresarAlerta]    Script Date: 06/26/2018 20:43:59 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE procedure [dbo].[stp_IngresarAlerta]
(
@idAlerta varchar(100),
@deliveryto varchar(50), 
@feed varchar(500),
@howMany varchar(50),
@howOften varchar(50),
@languaje varchar(50),
@query varchar(500),
@region varchar(50)
)
as begin



	--insert into dbo.alertas(ID_ALERTA,deliveryto,feed_url,howmany,howoften,language,query,region)
	--values(@idAlerta,@deliveryto,@feed,@howMany,@howOften,@languaje,@query,@region)

IF (NOT EXISTS (SELECT * FROM ALERTAS WHERE ALERTAS.ID_ALERTA = @idAlerta))
BEGIN


	insert into dbo.alertas(ID_ALERTA,deliveryto,feed_url,howmany,howoften,language,query,region,UltActualizacion)
	values(@idAlerta,@deliveryto,@feed,@howMany,@howOften,@languaje,@query,@region,GETDATE())
	--values('1','','','','','','','')

end
else begin

	update ALERTAS
	set DELIVERYTO=@deliveryto,FEED_URL=@feed,
	HOWMANY=@howMany,howOften=@howOften,
	language = @languaje, query=@query,
	region=@region,UltActualizacion=GETDATE()
	where ID_ALERTA=@idAlerta

end
end
GO
/****** Object:  StoredProcedure [dbo].[stp_DelSucursal]    Script Date: 06/26/2018 20:43:57 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create procedure [dbo].[stp_DelSucursal](@idSucursal varchar(10))
as begin

delete from sucursal
where IdSucursal=@idSucursal

end
GO
/****** Object:  StoredProcedure [dbo].[stp_DelMandanteArchivo]    Script Date: 06/26/2018 20:43:57 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE procedure [dbo].[stp_DelMandanteArchivo]
  (@idMandante int, @idArchivo int)
  as begin

    delete from MandanteArchivos
	where idmandante = @idMandante and idArchivo=@idArchivo

  end
GO
/****** Object:  Table [dbo].[Mandante]    Script Date: 06/26/2018 20:43:17 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Mandante](
	[IdMandante] [int] NOT NULL,
	[NomMandante] [varchar](30) NOT NULL,
	[RazonSocial] [varchar](100) NOT NULL,
	[Giro] [varchar](50) NULL,
	[Rut] [varchar](12) NULL,
	[Direccion] [varchar](80) NULL,
	[IdComuna] [varchar](10) NULL,
	[Telefono] [varchar](12) NULL,
	[RepLegalNombre] [varchar](80) NULL,
	[RepLegalRut] [varchar](12) NULL,
	[ContactoNombre] [varchar](80) NULL,
	[ContactoEmail] [varchar](80) NULL,
	[DeudaNomAdic1] [varchar](25) NULL,
	[DeudaNomAdic2] [varchar](25) NULL,
	[DeudaNomAdic3] [varchar](25) NULL,
	[DeudaNomAdic4] [varchar](25) NULL,
	[DeudaNomAdic5] [varchar](25) NULL,
	[DeudaNomAdic6] [varchar](25) NULL,
	[DeudaNomAdic7] [varchar](25) NULL,
	[DeudaNomAdic8] [varchar](25) NULL,
	[DeudaNomAdic9] [varchar](25) NULL,
	[DeudaNomAdic10] [varchar](25) NULL,
	[DeudorNomAdic1] [varchar](25) NULL,
	[DeudorNomAdic2] [varchar](25) NULL,
	[DeudorNomAdic3] [varchar](25) NULL,
	[DeudorNomAdic4] [varchar](25) NULL,
	[DeudorNomAdic5] [varchar](25) NULL,
	[TasaMaxConv] [money] NULL,
	[IdTipoInteres] [tinyint] NULL,
	[IdTipoCliente] [tinyint] NULL,
	[InteresMora] [money] NULL,
	[IdMoneda] [tinyint] NULL,
	[Activo] [tinyint] NULL,
	[RutaLogo] [varchar](100) NULL,
	[Skin] [varchar](20) NULL,
	[NivelGestion] [tinyint] NULL,
	[IdTipoTipificacion] [tinyint] NULL,
 CONSTRAINT [PK_Mandante] PRIMARY KEY CLUSTERED 
(
	[IdMandante] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
INSERT [dbo].[Mandante] ([IdMandante], [NomMandante], [RazonSocial], [Giro], [Rut], [Direccion], [IdComuna], [Telefono], [RepLegalNombre], [RepLegalRut], [ContactoNombre], [ContactoEmail], [DeudaNomAdic1], [DeudaNomAdic2], [DeudaNomAdic3], [DeudaNomAdic4], [DeudaNomAdic5], [DeudaNomAdic6], [DeudaNomAdic7], [DeudaNomAdic8], [DeudaNomAdic9], [DeudaNomAdic10], [DeudorNomAdic1], [DeudorNomAdic2], [DeudorNomAdic3], [DeudorNomAdic4], [DeudorNomAdic5], [TasaMaxConv], [IdTipoInteres], [IdTipoCliente], [InteresMora], [IdMoneda], [Activo], [RutaLogo], [Skin], [NivelGestion], [IdTipoTipificacion]) VALUES (0, N'Cliente Sistema', N'Cliente Sistema', N'', N'111111111-1', N'', NULL, N'', N'', N'', N'', N'', N'', N'', N'', N'', N'', N'', N'', N'', N'', N'', N'', N'', N'', N'', N'', 0.0000, NULL, NULL, 0.0000, NULL, 0, NULL, N'skin-blue', 3, NULL)
INSERT [dbo].[Mandante] ([IdMandante], [NomMandante], [RazonSocial], [Giro], [Rut], [Direccion], [IdComuna], [Telefono], [RepLegalNombre], [RepLegalRut], [ContactoNombre], [ContactoEmail], [DeudaNomAdic1], [DeudaNomAdic2], [DeudaNomAdic3], [DeudaNomAdic4], [DeudaNomAdic5], [DeudaNomAdic6], [DeudaNomAdic7], [DeudaNomAdic8], [DeudaNomAdic9], [DeudaNomAdic10], [DeudorNomAdic1], [DeudorNomAdic2], [DeudorNomAdic3], [DeudorNomAdic4], [DeudorNomAdic5], [TasaMaxConv], [IdTipoInteres], [IdTipoCliente], [InteresMora], [IdMoneda], [Activo], [RutaLogo], [Skin], [NivelGestion], [IdTipoTipificacion]) VALUES (1, N'Air Liquide', N'Air Liquide', N'', N'11111111-1', N'', N'13101', N'', N'', N'', N'', N'', N'', N'', N'', N'', N'', N'', N'', N'', N'', N'', N'', N'', N'', N'', N'', 0.0000, NULL, NULL, 0.0000, NULL, 1, N'assets/img/mandante/logo_1_HERE_logo.svg.png', N'skin-yellow', 3, NULL)
/****** Object:  StoredProcedure [dbo].[stp_BuscarSucursal]    Script Date: 06/26/2018 20:43:54 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE procedure [dbo].[stp_BuscarSucursal](@activo int)
as begin

select * ,case when activo=1 then 'Si' else 'No' end as activo2
from sucursal
where ((@activo is null) or (activo = @activo))

end
GO
/****** Object:  StoredProcedure [dbo].[stp_BuscarPerfil]    Script Date: 06/26/2018 20:43:54 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE procedure [dbo].[stp_BuscarPerfil](@idPerfil int)
as begin

select * from perfil
where ((@idPerfil = 0) or (IdPerfil = @idPerfil))
end
GO
/****** Object:  StoredProcedure [dbo].[stp_BuscarComuna]    Script Date: 06/26/2018 20:43:52 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE procedure [dbo].[stp_BuscarComuna]
(@idComuna varchar(10))
as begin

select * from comuna
where ((@idComuna is null) or (IdComuna = @idComuna))
order by nomcomuna asc
end
GO
/****** Object:  StoredProcedure [dbo].[stp_BuscarAlerta]    Script Date: 06/26/2018 20:43:52 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create procedure [dbo].[stp_BuscarAlerta]
as begin

select * from alertas

end
GO
/****** Object:  Table [dbo].[NOTICIAS]    Script Date: 06/26/2018 20:43:17 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[NOTICIAS](
	[ID] [varchar](100) NOT NULL,
	[ID_ALERT] [varchar](100) NULL,
	[TITULO] [varchar](max) NULL,
	[AUTOR] [varchar](200) NULL,
	[DESCRIPCION] [varchar](max) NULL,
	[URL] [varchar](max) NULL,
	[URLTOIMAGE] [varchar](max) NULL,
	[PUBLICADO] [datetime] NULL,
	[FUENTE_ID] [varchar](max) NULL,
	[FUENTE_NOMBRE] [varchar](max) NULL,
	[IdEstado] [int] NULL,
	[Relevante] [bit] NULL,
	[IdComuna] [varchar](10) NULL,
	[IdUsuarioAsignado] [int] NULL,
	[UltimaFechaModificacion] [datetime] NULL,
	[IdUsuarioAsignadoPor] [int] NULL,
	[IdSubCategoria] [int] NULL,
 CONSTRAINT [PK_NOTICIAS] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
INSERT [dbo].[NOTICIAS] ([ID], [ID_ALERT], [TITULO], [AUTOR], [DESCRIPCION], [URL], [URLTOIMAGE], [PUBLICADO], [FUENTE_ID], [FUENTE_NOMBRE], [IdEstado], [Relevante], [IdComuna], [IdUsuarioAsignado], [UltimaFechaModificacion], [IdUsuarioAsignadoPor], [IdSubCategoria]) VALUES (N'tag:google.com,2013:googlealerts/feed:10155221238735894330', N'56389d94ac39c0f0:1290533965a38521:com:es:CL:R', N'Las ocho bandas delictuales que Carabineros detectó en la comuna de Santiago', N'', N'... peruana, quienes se dedicaban a realizar robos con intimidación y violencia durante la noche en el sector de Mapocho y Paseo <b>Puente</b>. La banda&nbsp;...', N'https://www.google.com/url?rct=j&sa=t&url=http://www.ahoranoticias.cl/noticias/nacional/228218-las-ocho-bandas-delictuales-que-carabineros-detecto-en-la-comuna-de-santiago.html&ct=ga&cd=CAIyHDEyOTA1MzM5NjVhMzg1MjE6Y29tOmVzOkNMOlI&usg=AFQjCNF7OQQ5dGmjhP2yh-le-vP2b5UrIQ', N'https://www.google.com/url?rct=j&sa=t&url=http://www.ahoranoticias.cl/noticias/nacional/228218-las-ocho-bandas-delictuales-que-carabineros-detecto-en-la-comuna-de-santiago.html&ct=ga&cd=CAIyHDEyOTA1MzM5NjVhMzg1MjE6Y29tOmVzOkNMOlI&usg=AFQjCNF7OQQ5dGmjhP2yh-le-vP2b5UrIQ', CAST(0x0000A90700000000 AS DateTime), NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[NOTICIAS] ([ID], [ID_ALERT], [TITULO], [AUTOR], [DESCRIPCION], [URL], [URLTOIMAGE], [PUBLICADO], [FUENTE_ID], [FUENTE_NOMBRE], [IdEstado], [Relevante], [IdComuna], [IdUsuarioAsignado], [UltimaFechaModificacion], [IdUsuarioAsignadoPor], [IdSubCategoria]) VALUES (N'tag:google.com,2013:googlealerts/feed:10156962950914689737', N'56389d94ac39c0f0:1290533965a38521:com:es:CL:R', N'Piñera dice que críticas de dirigentes de Chile Vamos responden a “cuoteo político”', N'', N'El Presidente Piñera ayer en <b>Puente</b> Alto junto al alcalde Codina, el senador Ossandón y el ministro Monckeberg.', N'https://www.google.com/url?rct=j&sa=t&url=http://www.latercera.com/politica/noticia/pinera-dice-criticas-dirigentes-chile-responden-cuoteo-politico/217924/&ct=ga&cd=CAIyHDEyOTA1MzM5NjVhMzg1MjE6Y29tOmVzOkNMOlI&usg=AFQjCNF-sRSipLiMgNyAVkvAAaEChAVy5A', N'https://www.google.com/url?rct=j&sa=t&url=http://www.latercera.com/politica/noticia/pinera-dice-criticas-dirigentes-chile-responden-cuoteo-politico/217924/&ct=ga&cd=CAIyHDEyOTA1MzM5NjVhMzg1MjE6Y29tOmVzOkNMOlI&usg=AFQjCNF-sRSipLiMgNyAVkvAAaEChAVy5A', CAST(0x0000A90800000000 AS DateTime), NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[NOTICIAS] ([ID], [ID_ALERT], [TITULO], [AUTOR], [DESCRIPCION], [URL], [URLTOIMAGE], [PUBLICADO], [FUENTE_ID], [FUENTE_NOMBRE], [IdEstado], [Relevante], [IdComuna], [IdUsuarioAsignado], [UltimaFechaModificacion], [IdUsuarioAsignadoPor], [IdSubCategoria]) VALUES (N'tag:google.com,2013:googlealerts/feed:10175960229056070029', N'56389d94ac39c0f0:1290533965a38521:com:es:CL:R', N'Viña del Mar repondrá <b>puente</b> destruido en 1984 para descongestionar la ciudad', N'', N'La estructura estará lista el segundo semestre de 2020 y tendrá un costo de seis mil millones de pesos. La estructura irá en reemplazo del antiguo&nbsp;...', N'https://www.google.com/url?rct=j&sa=t&url=https://www.cooperativa.cl/noticias/pais/region-de-valparaiso/vina-del-mar-repondra-puente-destruido-en-1984-para-descongestionar-la/2018-06-20/180926.html&ct=ga&cd=CAIyHDEyOTA1MzM5NjVhMzg1MjE6Y29tOmVzOkNMOlI&usg=AFQjCNGnp4KTF0EtO7Z-ZnbCQsYsI-sjjw', N'https://www.google.com/url?rct=j&sa=t&url=https://www.cooperativa.cl/noticias/pais/region-de-valparaiso/vina-del-mar-repondra-puente-destruido-en-1984-para-descongestionar-la/2018-06-20/180926.html&ct=ga&cd=CAIyHDEyOTA1MzM5NjVhMzg1MjE6Y29tOmVzOkNMOlI&usg=AFQjCNGnp4KTF0EtO7Z-ZnbCQsYsI-sjjw', CAST(0x0000A90500000000 AS DateTime), NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[NOTICIAS] ([ID], [ID_ALERT], [TITULO], [AUTOR], [DESCRIPCION], [URL], [URLTOIMAGE], [PUBLICADO], [FUENTE_ID], [FUENTE_NOMBRE], [IdEstado], [Relevante], [IdComuna], [IdUsuarioAsignado], [UltimaFechaModificacion], [IdUsuarioAsignadoPor], [IdSubCategoria]) VALUES (N'tag:google.com,2013:googlealerts/feed:10194245137270581405', N'56389d94ac39c0f0:1290533965a38521:com:es:CL:R', N'Entrevista dia miercoles operarios produccion san bernardo 360mil', N'', N'Importante fábrica del rubro automotriz ubicada en sector industrial de San Bernardo, requiere para su planta operarios producción.Pr... - <b>Puente</b> Alto.', N'https://www.google.com/url?rct=j&sa=t&url=https://www.mipleo.cl/ofertas-de-trabajo/oferta-de-trabajo-en-rmetropolitana/entrevista-dia-miercoles-operarios-produccion-san-bernardo-360mil-331269.html&ct=ga&cd=CAIyHDEyOTA1MzM5NjVhMzg1MjE6Y29tOmVzOkNMOlI&usg=AFQjCNHDalYeQZJpah9Cj19MIIKFPUS-RA', N'https://www.google.com/url?rct=j&sa=t&url=https://www.mipleo.cl/ofertas-de-trabajo/oferta-de-trabajo-en-rmetropolitana/entrevista-dia-miercoles-operarios-produccion-san-bernardo-360mil-331269.html&ct=ga&cd=CAIyHDEyOTA1MzM5NjVhMzg1MjE6Y29tOmVzOkNMOlI&usg=AFQjCNHDalYeQZJpah9Cj19MIIKFPUS-RA', CAST(0x0000A90700000000 AS DateTime), NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[NOTICIAS] ([ID], [ID_ALERT], [TITULO], [AUTOR], [DESCRIPCION], [URL], [URLTOIMAGE], [PUBLICADO], [FUENTE_ID], [FUENTE_NOMBRE], [IdEstado], [Relevante], [IdComuna], [IdUsuarioAsignado], [UltimaFechaModificacion], [IdUsuarioAsignadoPor], [IdSubCategoria]) VALUES (N'tag:google.com,2013:googlealerts/feed:10231140707381274243', N'56389d94ac39c0f0:1290533965a38521:com:es:CL:R', N'Colegio Particular Politécnico Eyzaguirre', N'', N'', N'https://www.google.com/url?rct=j&sa=t&url=https://www.colegioeyzaguirre.cl/&ct=ga&cd=CAIyHDEyOTA1MzM5NjVhMzg1MjE6Y29tOmVzOkNMOlI&usg=AFQjCNGlqcDf05KgXraWRoLuhkWDT9QsFA', N'https://www.google.com/url?rct=j&sa=t&url=https://www.colegioeyzaguirre.cl/&ct=ga&cd=CAIyHDEyOTA1MzM5NjVhMzg1MjE6Y29tOmVzOkNMOlI&usg=AFQjCNGlqcDf05KgXraWRoLuhkWDT9QsFA', CAST(0x0000A90500000000 AS DateTime), NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[NOTICIAS] ([ID], [ID_ALERT], [TITULO], [AUTOR], [DESCRIPCION], [URL], [URLTOIMAGE], [PUBLICADO], [FUENTE_ID], [FUENTE_NOMBRE], [IdEstado], [Relevante], [IdComuna], [IdUsuarioAsignado], [UltimaFechaModificacion], [IdUsuarioAsignadoPor], [IdSubCategoria]) VALUES (N'tag:google.com,2013:googlealerts/feed:10235653426849913850', N'56389d94ac39c0f0:1290533965a38521:com:es:CL:R', N'Vecinos repudian ataque al cuartel de Bomberos de Bajos de Mena', N'', N'Una acción reprochable tuvieron algunas personas del sector Bajos de Mena, luego que efectuaran un ataque en contra del cuartel de Bomberos&nbsp;...', N'https://www.google.com/url?rct=j&sa=t&url=http://puentealtoaldia.cl/2018/06/20/vecinos-repudian-ataque-al-cuartel-de-bomberos-de-bajos-de-mena/&ct=ga&cd=CAIyHDEyOTA1MzM5NjVhMzg1MjE6Y29tOmVzOkNMOlI&usg=AFQjCNGiOyKzSPcxmzPdngeFI8Jq0q2K5Q', N'https://www.google.com/url?rct=j&sa=t&url=http://puentealtoaldia.cl/2018/06/20/vecinos-repudian-ataque-al-cuartel-de-bomberos-de-bajos-de-mena/&ct=ga&cd=CAIyHDEyOTA1MzM5NjVhMzg1MjE6Y29tOmVzOkNMOlI&usg=AFQjCNGiOyKzSPcxmzPdngeFI8Jq0q2K5Q', CAST(0x0000A90500000000 AS DateTime), NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[NOTICIAS] ([ID], [ID_ALERT], [TITULO], [AUTOR], [DESCRIPCION], [URL], [URLTOIMAGE], [PUBLICADO], [FUENTE_ID], [FUENTE_NOMBRE], [IdEstado], [Relevante], [IdComuna], [IdUsuarioAsignado], [UltimaFechaModificacion], [IdUsuarioAsignadoPor], [IdSubCategoria]) VALUES (N'tag:google.com,2013:googlealerts/feed:10489242404098274194', N'56389d94ac39c0f0:1290533965a38521:com:es:CL:R', N'Quema de camioneta tras ataque a Carabineros en Ercilla será investigada por la PDI', N'', N'... de Control del Orden Público que al trasladarse al lugar encontraron una camioneta envuelta en llamas y atravesada sobre un <b>puente</b> en Collico.', N'https://www.google.com/url?rct=j&sa=t&url=https://www.biobiochile.cl/noticias/nacional/region-de-la-araucania/2018/06/25/quema-de-camioneta-tras-ataque-a-carabineros-en-ercilla-sera-investigada-por-la-pdi.shtml&ct=ga&cd=CAIyHDEyOTA1MzM5NjVhMzg1MjE6Y29tOmVzOkNMOlI&usg=AFQjCNFBCIsly8VNa91_7XfV1dr6M3siUQ', N'https://www.google.com/url?rct=j&sa=t&url=https://www.biobiochile.cl/noticias/nacional/region-de-la-araucania/2018/06/25/quema-de-camioneta-tras-ataque-a-carabineros-en-ercilla-sera-investigada-por-la-pdi.shtml&ct=ga&cd=CAIyHDEyOTA1MzM5NjVhMzg1MjE6Y29tOmVzOkNMOlI&usg=AFQjCNFBCIsly8VNa91_7XfV1dr6M3siUQ', CAST(0x0000A90B00000000 AS DateTime), NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[NOTICIAS] ([ID], [ID_ALERT], [TITULO], [AUTOR], [DESCRIPCION], [URL], [URLTOIMAGE], [PUBLICADO], [FUENTE_ID], [FUENTE_NOMBRE], [IdEstado], [Relevante], [IdComuna], [IdUsuarioAsignado], [UltimaFechaModificacion], [IdUsuarioAsignadoPor], [IdSubCategoria]) VALUES (N'tag:google.com,2013:googlealerts/feed:10721847219815310607', N'56389d94ac39c0f0:1290533965a38521:com:es:CL:R', N'Teatro del <b>Puente</b> estrena obra que pone en tensión la política habitacional a lo largo de la historia ...', N'', N'El montaje estará en temporada del 29 de junio al 22 de julio en el Teatro del <b>Puente</b>, de viernes a sábado a las 21 hrs. y domingo a las 20 hrs., como&nbsp;...', N'https://www.google.com/url?rct=j&sa=t&url=http://www.cultura.gob.cl/agendacultural/teatro-del-puente-estrena-obra-que-pone-en-tension-la-politica-habitacional-a-lo-largo-de-la-historia-de-chile/&ct=ga&cd=CAIyHDEyOTA1MzM5NjVhMzg1MjE6Y29tOmVzOkNMOlI&usg=AFQjCNFJwlbpJ71jmNJpsOBSxB9xswcTRQ', N'https://www.google.com/url?rct=j&sa=t&url=http://www.cultura.gob.cl/agendacultural/teatro-del-puente-estrena-obra-que-pone-en-tension-la-politica-habitacional-a-lo-largo-de-la-historia-de-chile/&ct=ga&cd=CAIyHDEyOTA1MzM5NjVhMzg1MjE6Y29tOmVzOkNMOlI&usg=AFQjCNFJwlbpJ71jmNJpsOBSxB9xswcTRQ', CAST(0x0000A90600000000 AS DateTime), NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[NOTICIAS] ([ID], [ID_ALERT], [TITULO], [AUTOR], [DESCRIPCION], [URL], [URLTOIMAGE], [PUBLICADO], [FUENTE_ID], [FUENTE_NOMBRE], [IdEstado], [Relevante], [IdComuna], [IdUsuarioAsignado], [UltimaFechaModificacion], [IdUsuarioAsignadoPor], [IdSubCategoria]) VALUES (N'tag:google.com,2013:googlealerts/feed:10740808410749708450', N'56389d94ac39c0f0:1290533965a38521:com:es:CL:R', N'arriendo hermosa casa en <b>puente</b> alto', N'', N'ARRIENDO EXCELENTE CASA EN <b>PUENTE</b> ALTO, VILLA SAN ALBERTO DE CASAS VIEJAS. Micro barrio residencial con parque, juegos infantiles&nbsp;...', N'https://www.google.com/url?rct=j&sa=t&url=https://www.economicos.cl/search/propiedades/arriendo-hermosa-casa-en-puente-alto-codAAMHUDY.html&ct=ga&cd=CAIyHDEyOTA1MzM5NjVhMzg1MjE6Y29tOmVzOkNMOlI&usg=AFQjCNErrfpIqTW-l5upMQNMwsxoYkGgBg', N'https://www.google.com/url?rct=j&sa=t&url=https://www.economicos.cl/search/propiedades/arriendo-hermosa-casa-en-puente-alto-codAAMHUDY.html&ct=ga&cd=CAIyHDEyOTA1MzM5NjVhMzg1MjE6Y29tOmVzOkNMOlI&usg=AFQjCNErrfpIqTW-l5upMQNMwsxoYkGgBg', CAST(0x0000A90700000000 AS DateTime), NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[NOTICIAS] ([ID], [ID_ALERT], [TITULO], [AUTOR], [DESCRIPCION], [URL], [URLTOIMAGE], [PUBLICADO], [FUENTE_ID], [FUENTE_NOMBRE], [IdEstado], [Relevante], [IdComuna], [IdUsuarioAsignado], [UltimaFechaModificacion], [IdUsuarioAsignadoPor], [IdSubCategoria]) VALUES (N'tag:google.com,2013:googlealerts/feed:10810111205959416644', N'56389d94ac39c0f0:1290533965a38521:com:es:CL:R', N'1989 Scania 112 H 310 Doble <b>puente</b>', N'', N'Vehículo, 1989 Scania 112 H 310 Doble <b>puente</b>. Precio, $ 3.000.000. Combustible, Diesel (petróleo). Región, OHiggins. Ciudad, Graneros&nbsp;...', N'https://www.google.com/url?rct=j&sa=t&url=https://www.chileautos.cl/otras/usado/details/CL-AD-7015062&ct=ga&cd=CAIyHDEyOTA1MzM5NjVhMzg1MjE6Y29tOmVzOkNMOlI&usg=AFQjCNH0PPYiTIARD9PcgzARYgi1UT_HfQ', N'https://www.google.com/url?rct=j&sa=t&url=https://www.chileautos.cl/otras/usado/details/CL-AD-7015062&ct=ga&cd=CAIyHDEyOTA1MzM5NjVhMzg1MjE6Y29tOmVzOkNMOlI&usg=AFQjCNH0PPYiTIARD9PcgzARYgi1UT_HfQ', CAST(0x0000A90600000000 AS DateTime), NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[NOTICIAS] ([ID], [ID_ALERT], [TITULO], [AUTOR], [DESCRIPCION], [URL], [URLTOIMAGE], [PUBLICADO], [FUENTE_ID], [FUENTE_NOMBRE], [IdEstado], [Relevante], [IdComuna], [IdUsuarioAsignado], [UltimaFechaModificacion], [IdUsuarioAsignadoPor], [IdSubCategoria]) VALUES (N'tag:google.com,2013:googlealerts/feed:11113897827333211782', N'56389d94ac39c0f0:1290533965a38521:com:es:CL:R', N'Incautan documentos que podrían ser clave respecto a caída del <b>puente</b> Cancura', N'', N'El Ministerio Público investiga las causas en Osorno.', N'https://www.google.com/url?rct=j&sa=t&url=http://envivo.adnradio.cl/audio/3766689/&ct=ga&cd=CAIyHDEyOTA1MzM5NjVhMzg1MjE6Y29tOmVzOkNMOlI&usg=AFQjCNGDqOiM_PcdGwG2c4Th73zdBdUpCg', N'https://www.google.com/url?rct=j&sa=t&url=http://envivo.adnradio.cl/audio/3766689/&ct=ga&cd=CAIyHDEyOTA1MzM5NjVhMzg1MjE6Y29tOmVzOkNMOlI&usg=AFQjCNGDqOiM_PcdGwG2c4Th73zdBdUpCg', CAST(0x0000A90B00000000 AS DateTime), NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[NOTICIAS] ([ID], [ID_ALERT], [TITULO], [AUTOR], [DESCRIPCION], [URL], [URLTOIMAGE], [PUBLICADO], [FUENTE_ID], [FUENTE_NOMBRE], [IdEstado], [Relevante], [IdComuna], [IdUsuarioAsignado], [UltimaFechaModificacion], [IdUsuarioAsignadoPor], [IdSubCategoria]) VALUES (N'tag:google.com,2013:googlealerts/feed:11600468434919855102', N'56389d94ac39c0f0:1290533965a38521:com:es:CL:R', N'Se vende hermosa propiedad con 2 casas sólidas', N'', N'Detalles del Anuncio. Ciudad: <b>Puente</b> Alto, Metropolitana. Operación: Venta. Precio: 150.000.000$. Metros Cuadrados de Terreno:725&nbsp;...', N'https://www.google.com/url?rct=j&sa=t&url=http://puentealto.avisos-chile.com/item/179920/&ct=ga&cd=CAIyHDEyOTA1MzM5NjVhMzg1MjE6Y29tOmVzOkNMOlI&usg=AFQjCNHmiecZaIJbQ310aQzceUciFoxzEg', N'https://www.google.com/url?rct=j&sa=t&url=http://puentealto.avisos-chile.com/item/179920/&ct=ga&cd=CAIyHDEyOTA1MzM5NjVhMzg1MjE6Y29tOmVzOkNMOlI&usg=AFQjCNHmiecZaIJbQ310aQzceUciFoxzEg', CAST(0x0000A90600000000 AS DateTime), NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[NOTICIAS] ([ID], [ID_ALERT], [TITULO], [AUTOR], [DESCRIPCION], [URL], [URLTOIMAGE], [PUBLICADO], [FUENTE_ID], [FUENTE_NOMBRE], [IdEstado], [Relevante], [IdComuna], [IdUsuarioAsignado], [UltimaFechaModificacion], [IdUsuarioAsignadoPor], [IdSubCategoria]) VALUES (N'tag:google.com,2013:googlealerts/feed:12122499689360019615', N'56389d94ac39c0f0:a592d9a300841f83:com:es:CL:R', N'MOP reparará por tramos el <b>camino</b> a Confluencia', N'', N'MOP reparará por tramos el <b>camino</b> a Confluencia ... Pese a que el año 2014 el <b>camino</b> fue repavimentado por completo en una extensión ... 5 Chillán-El Huape-Quinchamalí-Cruce N-620 <b>puente</b> Confluencia; desde el kilómetro 0.0&nbsp;...', N'https://www.google.com/url?rct=j&sa=t&url=http://www.ladiscusion.cl/detalle/23909/MOP-reparar%25C3%25A1-por-tramos-el-camino-a-Confluencia&ct=ga&cd=CAIyHGE1OTJkOWEzMDA4NDFmODM6Y29tOmVzOkNMOlI&usg=AFQjCNF1JrGKhJOMfl-R3de_9eIjf_WvKg', N'https://www.google.com/url?rct=j&sa=t&url=http://www.ladiscusion.cl/detalle/23909/MOP-reparar%25C3%25A1-por-tramos-el-camino-a-Confluencia&ct=ga&cd=CAIyHGE1OTJkOWEzMDA4NDFmODM6Y29tOmVzOkNMOlI&usg=AFQjCNF1JrGKhJOMfl-R3de_9eIjf_WvKg', CAST(0x0000A90500000000 AS DateTime), NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[NOTICIAS] ([ID], [ID_ALERT], [TITULO], [AUTOR], [DESCRIPCION], [URL], [URLTOIMAGE], [PUBLICADO], [FUENTE_ID], [FUENTE_NOMBRE], [IdEstado], [Relevante], [IdComuna], [IdUsuarioAsignado], [UltimaFechaModificacion], [IdUsuarioAsignadoPor], [IdSubCategoria]) VALUES (N'tag:google.com,2013:googlealerts/feed:12264108140476304907', N'56389d94ac39c0f0:1290533965a38521:com:es:CL:R', N'Finalizó el Torneo de Apertura de Talleres de Fútbol Municipal', N'', N'Una gran concurrencia de padres y apoderados llegaron a presenciar el pasado sábado en la cancha del Complejo Estadio Santa Elvira de <b>Puente</b>&nbsp;...', N'https://www.google.com/url?rct=j&sa=t&url=http://puentealtoaldia.cl/2018/06/20/finalizo-el-torneo-de-apertura-de-talleres-de-futbol-municipal/&ct=ga&cd=CAIyHDEyOTA1MzM5NjVhMzg1MjE6Y29tOmVzOkNMOlI&usg=AFQjCNEcOO7KVC89h9zzVHikMggeaVi-lg', N'https://www.google.com/url?rct=j&sa=t&url=http://puentealtoaldia.cl/2018/06/20/finalizo-el-torneo-de-apertura-de-talleres-de-futbol-municipal/&ct=ga&cd=CAIyHDEyOTA1MzM5NjVhMzg1MjE6Y29tOmVzOkNMOlI&usg=AFQjCNEcOO7KVC89h9zzVHikMggeaVi-lg', CAST(0x0000A90500000000 AS DateTime), NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[NOTICIAS] ([ID], [ID_ALERT], [TITULO], [AUTOR], [DESCRIPCION], [URL], [URLTOIMAGE], [PUBLICADO], [FUENTE_ID], [FUENTE_NOMBRE], [IdEstado], [Relevante], [IdComuna], [IdUsuarioAsignado], [UltimaFechaModificacion], [IdUsuarioAsignadoPor], [IdSubCategoria]) VALUES (N'tag:google.com,2013:googlealerts/feed:12462207314200928023', N'56389d94ac39c0f0:1290533965a38521:com:es:CL:R', N'Dos muertos tras choque entre taxi y camión en la Ruta 68', N'', N'Al menos dos personas murieron a raíz de un choque entre un taxi y un camión en la Ruta 68, en la altura del <b>Puente</b> Pudahuel. Según la información&nbsp;...', N'https://www.google.com/url?rct=j&sa=t&url=http://www.chvnoticias.cl/nacional/dos-muertos-tras-choque-entre-taxi-y-camion-en-la-ruta-68/2018-06-21/020107.html&ct=ga&cd=CAIyHDEyOTA1MzM5NjVhMzg1MjE6Y29tOmVzOkNMOlI&usg=AFQjCNF08d6WEGFVaUxEV8TxG-yt9s3qBQ', N'https://www.google.com/url?rct=j&sa=t&url=http://www.chvnoticias.cl/nacional/dos-muertos-tras-choque-entre-taxi-y-camion-en-la-ruta-68/2018-06-21/020107.html&ct=ga&cd=CAIyHDEyOTA1MzM5NjVhMzg1MjE6Y29tOmVzOkNMOlI&usg=AFQjCNF08d6WEGFVaUxEV8TxG-yt9s3qBQ', CAST(0x0000A90600000000 AS DateTime), NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[NOTICIAS] ([ID], [ID_ALERT], [TITULO], [AUTOR], [DESCRIPCION], [URL], [URLTOIMAGE], [PUBLICADO], [FUENTE_ID], [FUENTE_NOMBRE], [IdEstado], [Relevante], [IdComuna], [IdUsuarioAsignado], [UltimaFechaModificacion], [IdUsuarioAsignadoPor], [IdSubCategoria]) VALUES (N'tag:google.com,2013:googlealerts/feed:13138902558898764614', N'56389d94ac39c0f0:1290533965a38521:com:es:CL:R', N'Independencia Esquina Malebrán, Otoñales', N'', N'Independencia Esquina Malebrán, Otoñales, Casas en Venta. Mercado Libre Chile - Donde comprar y vender de todo.', N'https://www.google.com/url?rct=j&sa=t&url=https://casa.mercadolibre.cl/MLC-461441963-independencia-esquina-malebran-otonales-_JM&ct=ga&cd=CAIyHDEyOTA1MzM5NjVhMzg1MjE6Y29tOmVzOkNMOlI&usg=AFQjCNFSjveU9dE2sDvLdTF5qreJBdsgNw', N'https://www.google.com/url?rct=j&sa=t&url=https://casa.mercadolibre.cl/MLC-461441963-independencia-esquina-malebran-otonales-_JM&ct=ga&cd=CAIyHDEyOTA1MzM5NjVhMzg1MjE6Y29tOmVzOkNMOlI&usg=AFQjCNFSjveU9dE2sDvLdTF5qreJBdsgNw', CAST(0x0000A90700000000 AS DateTime), NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[NOTICIAS] ([ID], [ID_ALERT], [TITULO], [AUTOR], [DESCRIPCION], [URL], [URLTOIMAGE], [PUBLICADO], [FUENTE_ID], [FUENTE_NOMBRE], [IdEstado], [Relevante], [IdComuna], [IdUsuarioAsignado], [UltimaFechaModificacion], [IdUsuarioAsignadoPor], [IdSubCategoria]) VALUES (N'tag:google.com,2013:googlealerts/feed:1319242098547159334', N'56389d94ac39c0f0:1290533965a38521:com:es:CL:R', N'se vende casa en <b>puente</b> alto', N'', N'Se vende hermosa y cómoda casa con pareo simple, sólido en primer y segundo piso, en San Juan de las Pircas, <b>Puente</b> Alto, casa ubicada en calle&nbsp;...', N'https://www.google.com/url?rct=j&sa=t&url=https://www.economicos.cl/search/propiedades/se-vende-casa-en-puente-alto-codAAMJTTQ.html&ct=ga&cd=CAIyHDEyOTA1MzM5NjVhMzg1MjE6Y29tOmVzOkNMOlI&usg=AFQjCNE5jKQZRaGGKmmId3fGP_5WiP4G5g', N'https://www.google.com/url?rct=j&sa=t&url=https://www.economicos.cl/search/propiedades/se-vende-casa-en-puente-alto-codAAMJTTQ.html&ct=ga&cd=CAIyHDEyOTA1MzM5NjVhMzg1MjE6Y29tOmVzOkNMOlI&usg=AFQjCNE5jKQZRaGGKmmId3fGP_5WiP4G5g', CAST(0x0000A90700000000 AS DateTime), NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[NOTICIAS] ([ID], [ID_ALERT], [TITULO], [AUTOR], [DESCRIPCION], [URL], [URLTOIMAGE], [PUBLICADO], [FUENTE_ID], [FUENTE_NOMBRE], [IdEstado], [Relevante], [IdComuna], [IdUsuarioAsignado], [UltimaFechaModificacion], [IdUsuarioAsignadoPor], [IdSubCategoria]) VALUES (N'tag:google.com,2013:googlealerts/feed:13228327203801526180', N'56389d94ac39c0f0:1290533965a38521:com:es:CL:R', N'Ruta Costa Arauco', N'', N'Mucho menos preocupación por la autoridad (MOP), la cual en 2016 condicionó el aumento del cobro en el peaje, a la finalización de un <b>puente</b>&nbsp;...', N'https://www.google.com/url?rct=j&sa=t&url=https://www.diarioconcepcion.cl/carta-al-director/2018/06/26/ruta-costa-arauco.html&ct=ga&cd=CAIyHDEyOTA1MzM5NjVhMzg1MjE6Y29tOmVzOkNMOlI&usg=AFQjCNFS1WOJZO3cBtVxm5jiW4Y3Ov-Ffw', N'https://www.google.com/url?rct=j&sa=t&url=https://www.diarioconcepcion.cl/carta-al-director/2018/06/26/ruta-costa-arauco.html&ct=ga&cd=CAIyHDEyOTA1MzM5NjVhMzg1MjE6Y29tOmVzOkNMOlI&usg=AFQjCNFS1WOJZO3cBtVxm5jiW4Y3Ov-Ffw', CAST(0x0000A90B00000000 AS DateTime), NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[NOTICIAS] ([ID], [ID_ALERT], [TITULO], [AUTOR], [DESCRIPCION], [URL], [URLTOIMAGE], [PUBLICADO], [FUENTE_ID], [FUENTE_NOMBRE], [IdEstado], [Relevante], [IdComuna], [IdUsuarioAsignado], [UltimaFechaModificacion], [IdUsuarioAsignadoPor], [IdSubCategoria]) VALUES (N'tag:google.com,2013:googlealerts/feed:1326296260963156762', N'56389d94ac39c0f0:1290533965a38521:com:es:CL:R', N'Bulling, Maltrato Y Vista Gorda', N'', N'Estoy cansada de ver como mi hermana llega a enfermarse del estomago por el miedo que en ocasiones a tenido al ir a clases. El último numerito se&nbsp;...', N'https://www.google.com/url?rct=j&sa=t&url=https://www.reclamos.cl/reclamo/2018/jun/colegio_senda_del_saber_puente_alto_bulling_maltrato_y_vista_gorda&ct=ga&cd=CAIyHDEyOTA1MzM5NjVhMzg1MjE6Y29tOmVzOkNMOlI&usg=AFQjCNG7v2mBBWQnHnJuumUOR2ytsp55IA', N'https://www.google.com/url?rct=j&sa=t&url=https://www.reclamos.cl/reclamo/2018/jun/colegio_senda_del_saber_puente_alto_bulling_maltrato_y_vista_gorda&ct=ga&cd=CAIyHDEyOTA1MzM5NjVhMzg1MjE6Y29tOmVzOkNMOlI&usg=AFQjCNG7v2mBBWQnHnJuumUOR2ytsp55IA', CAST(0x0000A90600000000 AS DateTime), NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[NOTICIAS] ([ID], [ID_ALERT], [TITULO], [AUTOR], [DESCRIPCION], [URL], [URLTOIMAGE], [PUBLICADO], [FUENTE_ID], [FUENTE_NOMBRE], [IdEstado], [Relevante], [IdComuna], [IdUsuarioAsignado], [UltimaFechaModificacion], [IdUsuarioAsignadoPor], [IdSubCategoria]) VALUES (N'tag:google.com,2013:googlealerts/feed:13409917633449952357', N'56389d94ac39c0f0:0daa7a2033c37535:com:es:CL:R', N'MOP revisará las bases de <b>licitación</b> de <b>puentes</b> en reparación tras accidente', N'', N'Además, incautó documentos relacionados con la obra. Una revisión a todas las bases de <b>licitación</b> de reparación de <b>puentes</b> y el estudio de una&nbsp;...', N'https://www.google.com/url?rct=j&sa=t&url=http://www.infraestructurapublica.cl/mop-revisara-las-bases-de-licitacion-de-puentes-en-reparacion-tras-accidente/&ct=ga&cd=CAIyHDBkYWE3YTIwMzNjMzc1MzU6Y29tOmVzOkNMOlI&usg=AFQjCNEQvHusSEJFvX-eqg2L0I8UgDuqYg', N'https://www.google.com/url?rct=j&sa=t&url=http://www.infraestructurapublica.cl/mop-revisara-las-bases-de-licitacion-de-puentes-en-reparacion-tras-accidente/&ct=ga&cd=CAIyHDBkYWE3YTIwMzNjMzc1MzU6Y29tOmVzOkNMOlI&usg=AFQjCNEQvHusSEJFvX-eqg2L0I8UgDuqYg', CAST(0x0000A90A00000000 AS DateTime), NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[NOTICIAS] ([ID], [ID_ALERT], [TITULO], [AUTOR], [DESCRIPCION], [URL], [URLTOIMAGE], [PUBLICADO], [FUENTE_ID], [FUENTE_NOMBRE], [IdEstado], [Relevante], [IdComuna], [IdUsuarioAsignado], [UltimaFechaModificacion], [IdUsuarioAsignadoPor], [IdSubCategoria]) VALUES (N'tag:google.com,2013:googlealerts/feed:13801349252102089165', N'56389d94ac39c0f0:1290533965a38521:com:es:CL:R', N'Diego Betancourt, director de Dirección de Desarrollo Comunitario: “Desde la administración ...', N'', N'Luego de eso pasó mucha agua bajo el <b>puente</b>, y con mucho esfuerzo, dudas e ideas que se plantearon, la capital regional recupero el cine&nbsp;...', N'https://www.google.com/url?rct=j&sa=t&url=http://www.diarioaysen.cl/sitio/2018/06/22/diego-betancourt-director-de-direccion-de-desarrollo-comunitario-desde-la-administracion-municipal-se-ha-decidido-suspender-las-funciones-de-cine/&ct=ga&cd=CAIyHDEyOTA1MzM5NjVhMzg1MjE6Y29tOmVzOkNMOlI&usg=AFQjCNEdGL5_lrjCNPetXY8ypC51LbOHIA', N'https://www.google.com/url?rct=j&sa=t&url=http://www.diarioaysen.cl/sitio/2018/06/22/diego-betancourt-director-de-direccion-de-desarrollo-comunitario-desde-la-administracion-municipal-se-ha-decidido-suspender-las-funciones-de-cine/&ct=ga&cd=CAIyHDEyOTA1MzM5NjVhMzg1MjE6Y29tOmVzOkNMOlI&usg=AFQjCNEdGL5_lrjCNPetXY8ypC51LbOHIA', CAST(0x0000A90700000000 AS DateTime), NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[NOTICIAS] ([ID], [ID_ALERT], [TITULO], [AUTOR], [DESCRIPCION], [URL], [URLTOIMAGE], [PUBLICADO], [FUENTE_ID], [FUENTE_NOMBRE], [IdEstado], [Relevante], [IdComuna], [IdUsuarioAsignado], [UltimaFechaModificacion], [IdUsuarioAsignadoPor], [IdSubCategoria]) VALUES (N'tag:google.com,2013:googlealerts/feed:13972303875989310750', N'56389d94ac39c0f0:1290533965a38521:com:es:CL:R', N'Caída del <b>puente</b> Cancura: Revelan dramático relato minutos después del colapso', N'', N'Mientras avanzan las investigaciones para determinar causas y responsabilidades del colapso de la estructura, la familia de la víctima evalúa las&nbsp;...', N'https://www.google.com/url?rct=j&sa=t&url=http://www.24horas.cl/nacional/caida-del-puente-cancura-revelan-dramatico-relato-minutos-despues-del-colapso-2749540&ct=ga&cd=CAIyHDEyOTA1MzM5NjVhMzg1MjE6Y29tOmVzOkNMOlI&usg=AFQjCNFcjovas5mb5B9jjOivoPVnurH_bQ', N'https://www.google.com/url?rct=j&sa=t&url=http://www.24horas.cl/nacional/caida-del-puente-cancura-revelan-dramatico-relato-minutos-despues-del-colapso-2749540&ct=ga&cd=CAIyHDEyOTA1MzM5NjVhMzg1MjE6Y29tOmVzOkNMOlI&usg=AFQjCNFcjovas5mb5B9jjOivoPVnurH_bQ', CAST(0x0000A90B00000000 AS DateTime), NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[NOTICIAS] ([ID], [ID_ALERT], [TITULO], [AUTOR], [DESCRIPCION], [URL], [URLTOIMAGE], [PUBLICADO], [FUENTE_ID], [FUENTE_NOMBRE], [IdEstado], [Relevante], [IdComuna], [IdUsuarioAsignado], [UltimaFechaModificacion], [IdUsuarioAsignadoPor], [IdSubCategoria]) VALUES (N'tag:google.com,2013:googlealerts/feed:14180134073590880278', N'56389d94ac39c0f0:0daa7a2033c37535:com:es:CL:R', N'Colapso del viaducto Cancura, en la ruta Osorno-Puerto Octay: MOP revisará las bases de ...', N'', N'MOP revisará las bases de <b>licitación</b> de <b>puentes</b> en reparación tras ... Contreras, quien en 2017 aseguró que el <b>puente</b> no tenía daño estructural.', N'https://www.google.com/url?rct=j&sa=t&url=http://www.economiaynegocios.cl/noticias/noticias.asp%3Fid%3D481667&ct=ga&cd=CAIyHDBkYWE3YTIwMzNjMzc1MzU6Y29tOmVzOkNMOlI&usg=AFQjCNG2SJ6Ir9g47iODzATH7gbvUyevng', N'https://www.google.com/url?rct=j&sa=t&url=http://www.economiaynegocios.cl/noticias/noticias.asp%3Fid%3D481667&ct=ga&cd=CAIyHDBkYWE3YTIwMzNjMzc1MzU6Y29tOmVzOkNMOlI&usg=AFQjCNG2SJ6Ir9g47iODzATH7gbvUyevng', CAST(0x0000A90A00000000 AS DateTime), NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[NOTICIAS] ([ID], [ID_ALERT], [TITULO], [AUTOR], [DESCRIPCION], [URL], [URLTOIMAGE], [PUBLICADO], [FUENTE_ID], [FUENTE_NOMBRE], [IdEstado], [Relevante], [IdComuna], [IdUsuarioAsignado], [UltimaFechaModificacion], [IdUsuarioAsignadoPor], [IdSubCategoria]) VALUES (N'tag:google.com,2013:googlealerts/feed:14296533269820529630', N'56389d94ac39c0f0:1290533965a38521:com:es:CL:R', N'Choque en <b>Puente</b> de México deja tres lesionados', N'', N'Choque en <b>Puente</b> de México deja tres lesionados. 20 Jun, 2018; NOTICIAS LOCALES. Puebla, Pue. 20 de junio de 2018. Tres lesionados deja&nbsp;...', N'https://www.google.com/url?rct=j&sa=t&url=http://televisapuebla.tv/noticia/choque-en-puente-de-mexico-deja-tres-lesionados&ct=ga&cd=CAIyHDEyOTA1MzM5NjVhMzg1MjE6Y29tOmVzOkNMOlI&usg=AFQjCNHSHx_dUpFJTbSDXz-1NP3nbmAjuw', N'https://www.google.com/url?rct=j&sa=t&url=http://televisapuebla.tv/noticia/choque-en-puente-de-mexico-deja-tres-lesionados&ct=ga&cd=CAIyHDEyOTA1MzM5NjVhMzg1MjE6Y29tOmVzOkNMOlI&usg=AFQjCNHSHx_dUpFJTbSDXz-1NP3nbmAjuw', CAST(0x0000A90500000000 AS DateTime), NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[NOTICIAS] ([ID], [ID_ALERT], [TITULO], [AUTOR], [DESCRIPCION], [URL], [URLTOIMAGE], [PUBLICADO], [FUENTE_ID], [FUENTE_NOMBRE], [IdEstado], [Relevante], [IdComuna], [IdUsuarioAsignado], [UltimaFechaModificacion], [IdUsuarioAsignadoPor], [IdSubCategoria]) VALUES (N'tag:google.com,2013:googlealerts/feed:14365975885964029958', N'56389d94ac39c0f0:1290533965a38521:com:es:CL:R', N'Auto se incendia en medio del <b>puente</b> Juan Pablo II tras accidente', N'', N'Una gran congestión vehicular se produjo en el <b>puente</b> Juan Pablo II la tarde de este lunes, tras una colisión de vehículos y el posterior incendio en&nbsp;...', N'https://www.google.com/url?rct=j&sa=t&url=http://sabes.cl/2018/06/25/auto-se-incendia-en-medio-del-puente-juan-pablo-ii-tras-accidente/&ct=ga&cd=CAIyHDEyOTA1MzM5NjVhMzg1MjE6Y29tOmVzOkNMOlI&usg=AFQjCNG7xweZhxlmu3VFYfp721EnVv9a6Q', N'https://www.google.com/url?rct=j&sa=t&url=http://sabes.cl/2018/06/25/auto-se-incendia-en-medio-del-puente-juan-pablo-ii-tras-accidente/&ct=ga&cd=CAIyHDEyOTA1MzM5NjVhMzg1MjE6Y29tOmVzOkNMOlI&usg=AFQjCNG7xweZhxlmu3VFYfp721EnVv9a6Q', CAST(0x0000A90B00000000 AS DateTime), NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[NOTICIAS] ([ID], [ID_ALERT], [TITULO], [AUTOR], [DESCRIPCION], [URL], [URLTOIMAGE], [PUBLICADO], [FUENTE_ID], [FUENTE_NOMBRE], [IdEstado], [Relevante], [IdComuna], [IdUsuarioAsignado], [UltimaFechaModificacion], [IdUsuarioAsignadoPor], [IdSubCategoria]) VALUES (N'tag:google.com,2013:googlealerts/feed:14454279113370787400', N'56389d94ac39c0f0:0daa7a2033c37535:com:es:CL:R', N'Fiscalía indaga incidencia de peso de vehículos en caída de <b>puente</b>', N'', N'Fiscalía indaga incidencia de peso de vehículos en caída de <b>puente</b> ... La incidencia del peso de los vehículos sobre el <b>puente</b> Cancura, en la Región de ... También hay procesos de adjudicación en Quillota y dos en <b>licitación</b> en la&nbsp;...', N'https://www.google.com/url?rct=j&sa=t&url=http://www.latercera.com/nacional/noticia/fiscalia-indaga-incidencia-peso-vehiculos-caida-puente/220374/&ct=ga&cd=CAIyHDBkYWE3YTIwMzNjMzc1MzU6Y29tOmVzOkNMOlI&usg=AFQjCNG05lDlbO3o-_ZfI2A8lvdMUwocng', N'https://www.google.com/url?rct=j&sa=t&url=http://www.latercera.com/nacional/noticia/fiscalia-indaga-incidencia-peso-vehiculos-caida-puente/220374/&ct=ga&cd=CAIyHDBkYWE3YTIwMzNjMzc1MzU6Y29tOmVzOkNMOlI&usg=AFQjCNG05lDlbO3o-_ZfI2A8lvdMUwocng', CAST(0x0000A90B00000000 AS DateTime), NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[NOTICIAS] ([ID], [ID_ALERT], [TITULO], [AUTOR], [DESCRIPCION], [URL], [URLTOIMAGE], [PUBLICADO], [FUENTE_ID], [FUENTE_NOMBRE], [IdEstado], [Relevante], [IdComuna], [IdUsuarioAsignado], [UltimaFechaModificacion], [IdUsuarioAsignadoPor], [IdSubCategoria]) VALUES (N'tag:google.com,2013:googlealerts/feed:14525540329335997328', N'56389d94ac39c0f0:1290533965a38521:com:es:CL:R', N'1 fallecido y 4 lesionados deja derrumbe de <b>puente</b> en la comuna de Osorno', N'', N'En horas de la madrugada de este sábado 23 de junio, parte del <b>puente</b> Cancura - ubicado en el kilómetro 25 la ruta U55 que une las comunas de&nbsp;...', N'https://www.google.com/url?rct=j&sa=t&url=https://www.paislobo.cl/2018/06/1-fallecido-y-4-lesionados-deja.html&ct=ga&cd=CAIyHDEyOTA1MzM5NjVhMzg1MjE6Y29tOmVzOkNMOlI&usg=AFQjCNEt970FaSWIr5r2P1Ga3hn-7Qd22A', N'https://www.google.com/url?rct=j&sa=t&url=https://www.paislobo.cl/2018/06/1-fallecido-y-4-lesionados-deja.html&ct=ga&cd=CAIyHDEyOTA1MzM5NjVhMzg1MjE6Y29tOmVzOkNMOlI&usg=AFQjCNEt970FaSWIr5r2P1Ga3hn-7Qd22A', CAST(0x0000A90800000000 AS DateTime), NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[NOTICIAS] ([ID], [ID_ALERT], [TITULO], [AUTOR], [DESCRIPCION], [URL], [URLTOIMAGE], [PUBLICADO], [FUENTE_ID], [FUENTE_NOMBRE], [IdEstado], [Relevante], [IdComuna], [IdUsuarioAsignado], [UltimaFechaModificacion], [IdUsuarioAsignadoPor], [IdSubCategoria]) VALUES (N'tag:google.com,2013:googlealerts/feed:14613021275423781279', N'56389d94ac39c0f0:1290533965a38521:com:es:CL:R', N'En octubre debería estar desocupada faja por donde pasará el <b>Puente</b> Chacabuco a Concepción.', N'', N'Foto: Ulma Construction. El plazo fue dado a conocer por el seremi de Vivienda, Emilio Armstrong, y da plazo hasta mediados de julio para que se&nbsp;...', N'https://www.google.com/url?rct=j&sa=t&url=http://www.elconquistadorconcepcion.cl/2018/06/20/en-octubre-deberia-estar-desocupada-faja-por-donde-pasara-el-puente-chacabuco-a-concepcion/&ct=ga&cd=CAIyHDEyOTA1MzM5NjVhMzg1MjE6Y29tOmVzOkNMOlI&usg=AFQjCNE5XKw7FUXsXfcwG5AtE6ksJZVpuw', N'https://www.google.com/url?rct=j&sa=t&url=http://www.elconquistadorconcepcion.cl/2018/06/20/en-octubre-deberia-estar-desocupada-faja-por-donde-pasara-el-puente-chacabuco-a-concepcion/&ct=ga&cd=CAIyHDEyOTA1MzM5NjVhMzg1MjE6Y29tOmVzOkNMOlI&usg=AFQjCNE5XKw7FUXsXfcwG5AtE6ksJZVpuw', CAST(0x0000A90500000000 AS DateTime), NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[NOTICIAS] ([ID], [ID_ALERT], [TITULO], [AUTOR], [DESCRIPCION], [URL], [URLTOIMAGE], [PUBLICADO], [FUENTE_ID], [FUENTE_NOMBRE], [IdEstado], [Relevante], [IdComuna], [IdUsuarioAsignado], [UltimaFechaModificacion], [IdUsuarioAsignadoPor], [IdSubCategoria]) VALUES (N'tag:google.com,2013:googlealerts/feed:14907180460204824694', N'56389d94ac39c0f0:1290533965a38521:com:es:CL:R', N'Educador(A) Diferencial - <b>Puente</b> Alto', N'', N'Postula hoy a Educador(a) Diferencial (40 horas) en Colegio Cardenal Raúl Silva Henríquez ubicado en la comuna de <b>Puente</b> Alto el año académico&nbsp;...', N'https://www.google.com/url?rct=j&sa=t&url=https://www.buscojobs.cl/educadora-diferencial-puente-alto-ID-5601522&ct=ga&cd=CAIyHDEyOTA1MzM5NjVhMzg1MjE6Y29tOmVzOkNMOlI&usg=AFQjCNHDZawor_D2Sus5KIMXnChNwCNfmw', N'https://www.google.com/url?rct=j&sa=t&url=https://www.buscojobs.cl/educadora-diferencial-puente-alto-ID-5601522&ct=ga&cd=CAIyHDEyOTA1MzM5NjVhMzg1MjE6Y29tOmVzOkNMOlI&usg=AFQjCNHDZawor_D2Sus5KIMXnChNwCNfmw', CAST(0x0000A90600000000 AS DateTime), NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[NOTICIAS] ([ID], [ID_ALERT], [TITULO], [AUTOR], [DESCRIPCION], [URL], [URLTOIMAGE], [PUBLICADO], [FUENTE_ID], [FUENTE_NOMBRE], [IdEstado], [Relevante], [IdComuna], [IdUsuarioAsignado], [UltimaFechaModificacion], [IdUsuarioAsignadoPor], [IdSubCategoria]) VALUES (N'tag:google.com,2013:googlealerts/feed:15149485588605092936', N'56389d94ac39c0f0:1290533965a38521:com:es:CL:R', N'MUDANZAS FLETES <b>Puente</b> Alto', N'', N'SERVICIOS DE FLETES Y MUDANZAS DENTRO Y FUERA DE SANTIAGO CAMIÓN DISPONIBLE INMEDIATO 30 MT3 whatsa...MUDANZAS&nbsp;...', N'https://www.google.com/url?rct=j&sa=t&url=http://www.vivastreet.cl/traslados/puente-alto/mudanzas-fletes/186767868&ct=ga&cd=CAIyHDEyOTA1MzM5NjVhMzg1MjE6Y29tOmVzOkNMOlI&usg=AFQjCNEtkyj3tBhl4IU3rjcxml6j75h5EQ', N'https://www.google.com/url?rct=j&sa=t&url=http://www.vivastreet.cl/traslados/puente-alto/mudanzas-fletes/186767868&ct=ga&cd=CAIyHDEyOTA1MzM5NjVhMzg1MjE6Y29tOmVzOkNMOlI&usg=AFQjCNEtkyj3tBhl4IU3rjcxml6j75h5EQ', CAST(0x0000A90B00000000 AS DateTime), NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[NOTICIAS] ([ID], [ID_ALERT], [TITULO], [AUTOR], [DESCRIPCION], [URL], [URLTOIMAGE], [PUBLICADO], [FUENTE_ID], [FUENTE_NOMBRE], [IdEstado], [Relevante], [IdComuna], [IdUsuarioAsignado], [UltimaFechaModificacion], [IdUsuarioAsignadoPor], [IdSubCategoria]) VALUES (N'tag:google.com,2013:googlealerts/feed:1523076395935754740', N'56389d94ac39c0f0:1290533965a38521:com:es:CL:R', N'MOP comienza a saldar compromisos viales', N'', N'Especial énfasis se puso en la necesidad de lograr una solución definitiva de reparación o reconstrucción de dos <b>puentes</b> (Meco-Gallipavo), que se&nbsp;...', N'https://www.google.com/url?rct=j&sa=t&url=http://www.ladiscusion.cl/detalle/23952/MOP-comienza-a-saldar-compromisos-viales-&ct=ga&cd=CAIyHDEyOTA1MzM5NjVhMzg1MjE6Y29tOmVzOkNMOlI&usg=AFQjCNFCwEf_2kQoeRnDKJIgqHA2UnXELw', N'https://www.google.com/url?rct=j&sa=t&url=http://www.ladiscusion.cl/detalle/23952/MOP-comienza-a-saldar-compromisos-viales-&ct=ga&cd=CAIyHDEyOTA1MzM5NjVhMzg1MjE6Y29tOmVzOkNMOlI&usg=AFQjCNFCwEf_2kQoeRnDKJIgqHA2UnXELw', CAST(0x0000A90600000000 AS DateTime), NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[NOTICIAS] ([ID], [ID_ALERT], [TITULO], [AUTOR], [DESCRIPCION], [URL], [URLTOIMAGE], [PUBLICADO], [FUENTE_ID], [FUENTE_NOMBRE], [IdEstado], [Relevante], [IdComuna], [IdUsuarioAsignado], [UltimaFechaModificacion], [IdUsuarioAsignadoPor], [IdSubCategoria]) VALUES (N'tag:google.com,2013:googlealerts/feed:15333059996930294085', N'56389d94ac39c0f0:1290533965a38521:com:es:CL:R', N'Presentan proyecto millonario para renovar histórico hotel de Punta del Este', N'', N'Asimismo, el diseño proponía construir un <b>puente</b> para asegurar el acceso a la playa -que queda frente al predio-, así como reconstruir el antiguo&nbsp;...', N'https://www.google.com/url?rct=j&sa=t&url=http://www.latercera.com/pulso/noticia/presentan-proyecto-millonario-renovar-historico-hotel-punta-del-este/217386/&ct=ga&cd=CAIyHDEyOTA1MzM5NjVhMzg1MjE6Y29tOmVzOkNMOlI&usg=AFQjCNF0IqX4ZT7pLuEnoAFcVUAP-AnKlA', N'https://www.google.com/url?rct=j&sa=t&url=http://www.latercera.com/pulso/noticia/presentan-proyecto-millonario-renovar-historico-hotel-punta-del-este/217386/&ct=ga&cd=CAIyHDEyOTA1MzM5NjVhMzg1MjE6Y29tOmVzOkNMOlI&usg=AFQjCNF0IqX4ZT7pLuEnoAFcVUAP-AnKlA', CAST(0x0000A90700000000 AS DateTime), NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[NOTICIAS] ([ID], [ID_ALERT], [TITULO], [AUTOR], [DESCRIPCION], [URL], [URLTOIMAGE], [PUBLICADO], [FUENTE_ID], [FUENTE_NOMBRE], [IdEstado], [Relevante], [IdComuna], [IdUsuarioAsignado], [UltimaFechaModificacion], [IdUsuarioAsignadoPor], [IdSubCategoria]) VALUES (N'tag:google.com,2013:googlealerts/feed:1534813059412943022', N'56389d94ac39c0f0:1290533965a38521:com:es:CL:R', N'Incautan documentos que podrían ser clave respecto a caída del <b>puente</b> Cancura', N'', N'Lo anterior en el marco de las indagatorias para esclarecer las causas de la caída del <b>puente</b> Cancura, en la comuna de Puerto Octay, hecho que&nbsp;...', N'https://www.google.com/url?rct=j&sa=t&url=http://www.adnradio.cl/noticias/nacional/incautan-documentos-que-podrian-ser-clave-respecto-a-caida-del-puente-cancura/20180625/nota/3766689.aspx&ct=ga&cd=CAIyHDEyOTA1MzM5NjVhMzg1MjE6Y29tOmVzOkNMOlI&usg=AFQjCNHhauwIffwS5TkequYDxh3Xuktlgw', N'https://www.google.com/url?rct=j&sa=t&url=http://www.adnradio.cl/noticias/nacional/incautan-documentos-que-podrian-ser-clave-respecto-a-caida-del-puente-cancura/20180625/nota/3766689.aspx&ct=ga&cd=CAIyHDEyOTA1MzM5NjVhMzg1MjE6Y29tOmVzOkNMOlI&usg=AFQjCNHhauwIffwS5TkequYDxh3Xuktlgw', CAST(0x0000A90B00000000 AS DateTime), NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[NOTICIAS] ([ID], [ID_ALERT], [TITULO], [AUTOR], [DESCRIPCION], [URL], [URLTOIMAGE], [PUBLICADO], [FUENTE_ID], [FUENTE_NOMBRE], [IdEstado], [Relevante], [IdComuna], [IdUsuarioAsignado], [UltimaFechaModificacion], [IdUsuarioAsignadoPor], [IdSubCategoria]) VALUES (N'tag:google.com,2013:googlealerts/feed:15695995086704068804', N'56389d94ac39c0f0:1290533965a38521:com:es:CL:R', N'colegio monte olivo de <b>puente</b> alto', N'', N'COLEGIO MONTE OLIVO DE <b>PUENTE</b> ALTO. PROPUESTA EDUCATIVA Y CARACTERISTICAS. COMENTARIOS, COMPARTIR EXPERIENCIAS Y&nbsp;...', N'https://www.google.com/url?rct=j&sa=t&url=https://guia-metropolitana-de-santiago.colegiosenchile.cl/dificultades-especificas-del-aprendizaje/COLEGIO-MONTE-OLIVO-DE-PUENTE-ALTO-puente-alto-metropolitana-de-santiago-i25540.htm&ct=ga&cd=CAIyHDEyOTA1MzM5NjVhMzg1MjE6Y29tOmVzOkNMOlI&usg=AFQjCNHhkW0WtCZFtdmwpIt_UbtfyoWgWg', N'https://www.google.com/url?rct=j&sa=t&url=https://guia-metropolitana-de-santiago.colegiosenchile.cl/dificultades-especificas-del-aprendizaje/COLEGIO-MONTE-OLIVO-DE-PUENTE-ALTO-puente-alto-metropolitana-de-santiago-i25540.htm&ct=ga&cd=CAIyHDEyOTA1MzM5NjVhMzg1MjE6Y29tOmVzOkNMOlI&usg=AFQjCNHhkW0WtCZFtdmwpIt_UbtfyoWgWg', CAST(0x0000A90700000000 AS DateTime), NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[NOTICIAS] ([ID], [ID_ALERT], [TITULO], [AUTOR], [DESCRIPCION], [URL], [URLTOIMAGE], [PUBLICADO], [FUENTE_ID], [FUENTE_NOMBRE], [IdEstado], [Relevante], [IdComuna], [IdUsuarioAsignado], [UltimaFechaModificacion], [IdUsuarioAsignadoPor], [IdSubCategoria]) VALUES (N'tag:google.com,2013:googlealerts/feed:15818151933440060595', N'56389d94ac39c0f0:1290533965a38521:com:es:CL:R', N'Arriendo casa 2 pisos <b>Puente</b> Alto', N'', N'Arriendo casa dos pisos. ubicada en barrio tranquilo (Villa Los Evangelistas, <b>Puente</b> Alto). Supermercados, acceso rápido autopista y avenida Santa&nbsp;...', N'https://www.google.com/url?rct=j&sa=t&url=https://www.economicos.cl/propiedades/arriendo-casa-2-pisos-puente-alto-codAAMKE3A.html&ct=ga&cd=CAIyHDEyOTA1MzM5NjVhMzg1MjE6Y29tOmVzOkNMOlI&usg=AFQjCNFPAfiz4CNORiHsFZRXjfhQsC_0yA', N'https://www.google.com/url?rct=j&sa=t&url=https://www.economicos.cl/propiedades/arriendo-casa-2-pisos-puente-alto-codAAMKE3A.html&ct=ga&cd=CAIyHDEyOTA1MzM5NjVhMzg1MjE6Y29tOmVzOkNMOlI&usg=AFQjCNFPAfiz4CNORiHsFZRXjfhQsC_0yA', CAST(0x0000A90A00000000 AS DateTime), NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[NOTICIAS] ([ID], [ID_ALERT], [TITULO], [AUTOR], [DESCRIPCION], [URL], [URLTOIMAGE], [PUBLICADO], [FUENTE_ID], [FUENTE_NOMBRE], [IdEstado], [Relevante], [IdComuna], [IdUsuarioAsignado], [UltimaFechaModificacion], [IdUsuarioAsignadoPor], [IdSubCategoria]) VALUES (N'tag:google.com,2013:googlealerts/feed:17104005987978886213', N'56389d94ac39c0f0:1290533965a38521:com:es:CL:R', N'Presidente Piñera por fuego amigo: &quot;Críticas son por cuoteo político&quot;', N'', N'Al punto de que ayer, temprano en una actividad en <b>Puente</b> Alto, el Presidente Sebastián Piñera, consultado por el &quot;desorden&quot; en la casa debido a&nbsp;...', N'https://www.google.com/url?rct=j&sa=t&url=http://www.economiaynegocios.cl/noticias/noticias.asp%3Fid%3D480921&ct=ga&cd=CAIyHDEyOTA1MzM5NjVhMzg1MjE6Y29tOmVzOkNMOlI&usg=AFQjCNEEFGJCNv2cVpyGjIqMvtfMlZ-hwQ', N'https://www.google.com/url?rct=j&sa=t&url=http://www.economiaynegocios.cl/noticias/noticias.asp%3Fid%3D480921&ct=ga&cd=CAIyHDEyOTA1MzM5NjVhMzg1MjE6Y29tOmVzOkNMOlI&usg=AFQjCNEEFGJCNv2cVpyGjIqMvtfMlZ-hwQ', CAST(0x0000A90800000000 AS DateTime), NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[NOTICIAS] ([ID], [ID_ALERT], [TITULO], [AUTOR], [DESCRIPCION], [URL], [URLTOIMAGE], [PUBLICADO], [FUENTE_ID], [FUENTE_NOMBRE], [IdEstado], [Relevante], [IdComuna], [IdUsuarioAsignado], [UltimaFechaModificacion], [IdUsuarioAsignadoPor], [IdSubCategoria]) VALUES (N'tag:google.com,2013:googlealerts/feed:17181053562665535261', N'56389d94ac39c0f0:1290533965a38521:com:es:CL:R', N'Digitador - <b>Puente</b> Alto', N'', N'Detalles de la oferta de empleo:Digitador - <b>Puente</b> AltoR.Metropolitana.', N'https://www.google.com/url?rct=j&sa=t&url=https://www.computrabajo.cl/ofertas-de-trabajo/oferta-de-trabajo-de-digitador-puente-alto-en-puente-alto-4E8351A020DBE683&ct=ga&cd=CAIyHDEyOTA1MzM5NjVhMzg1MjE6Y29tOmVzOkNMOlI&usg=AFQjCNEl7_0HnrsKwOJ4NznY7TbOd8a7zQ', N'https://www.google.com/url?rct=j&sa=t&url=https://www.computrabajo.cl/ofertas-de-trabajo/oferta-de-trabajo-de-digitador-puente-alto-en-puente-alto-4E8351A020DBE683&ct=ga&cd=CAIyHDEyOTA1MzM5NjVhMzg1MjE6Y29tOmVzOkNMOlI&usg=AFQjCNEl7_0HnrsKwOJ4NznY7TbOd8a7zQ', CAST(0x0000A90700000000 AS DateTime), NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[NOTICIAS] ([ID], [ID_ALERT], [TITULO], [AUTOR], [DESCRIPCION], [URL], [URLTOIMAGE], [PUBLICADO], [FUENTE_ID], [FUENTE_NOMBRE], [IdEstado], [Relevante], [IdComuna], [IdUsuarioAsignado], [UltimaFechaModificacion], [IdUsuarioAsignadoPor], [IdSubCategoria]) VALUES (N'tag:google.com,2013:googlealerts/feed:17186387616221171462', N'56389d94ac39c0f0:1290533965a38521:com:es:CL:R', N'La Ligua: Diputada Camila Flores celebra futura construcción del nuevo <b>puente</b> Illalolén, que unirá ...', N'', N'La parlamentaria de RN Camila Flores llegó hasta el sector en que se encuentra el viaducto en que será reemplazado el esperado <b>puente</b>, junto al&nbsp;...', N'https://www.google.com/url?rct=j&sa=t&url=http://www.masnoticia.cl/2018/06/20/la-ligua-diputada-camila-flores-celebra-futura-construccion-del-nuevo-puente-illalolen-que-unira-la-ligua-y-valle-hermoso/&ct=ga&cd=CAIyHDEyOTA1MzM5NjVhMzg1MjE6Y29tOmVzOkNMOlI&usg=AFQjCNGGSibKR_fKh6c1HVpXP6663HmxZw', N'https://www.google.com/url?rct=j&sa=t&url=http://www.masnoticia.cl/2018/06/20/la-ligua-diputada-camila-flores-celebra-futura-construccion-del-nuevo-puente-illalolen-que-unira-la-ligua-y-valle-hermoso/&ct=ga&cd=CAIyHDEyOTA1MzM5NjVhMzg1MjE6Y29tOmVzOkNMOlI&usg=AFQjCNGGSibKR_fKh6c1HVpXP6663HmxZw', CAST(0x0000A90600000000 AS DateTime), NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[NOTICIAS] ([ID], [ID_ALERT], [TITULO], [AUTOR], [DESCRIPCION], [URL], [URLTOIMAGE], [PUBLICADO], [FUENTE_ID], [FUENTE_NOMBRE], [IdEstado], [Relevante], [IdComuna], [IdUsuarioAsignado], [UltimaFechaModificacion], [IdUsuarioAsignadoPor], [IdSubCategoria]) VALUES (N'tag:google.com,2013:googlealerts/feed:17312921365895353891', N'56389d94ac39c0f0:1290533965a38521:com:es:CL:R', N'Joven de 21, con lugar y ganas.', N'', N'21 años Mido 1,80 Busco algo para hoy, lo que sea para hoy, gente sin muchos rodeos, puedo toda l noche tengo lugar en … ¡Ver este anuncio&nbsp;...', N'https://www.google.com/url?rct=j&sa=t&url=https://laflorida.locanto.cl/ID_2556665940/Joven-de-21-con-lugar-y-ganas-21.html&ct=ga&cd=CAIyHDEyOTA1MzM5NjVhMzg1MjE6Y29tOmVzOkNMOlI&usg=AFQjCNHRCFlPPNL23tUYefNGu2ztqkJ3XA', N'https://www.google.com/url?rct=j&sa=t&url=https://laflorida.locanto.cl/ID_2556665940/Joven-de-21-con-lugar-y-ganas-21.html&ct=ga&cd=CAIyHDEyOTA1MzM5NjVhMzg1MjE6Y29tOmVzOkNMOlI&usg=AFQjCNHRCFlPPNL23tUYefNGu2ztqkJ3XA', CAST(0x0000A90700000000 AS DateTime), NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[NOTICIAS] ([ID], [ID_ALERT], [TITULO], [AUTOR], [DESCRIPCION], [URL], [URLTOIMAGE], [PUBLICADO], [FUENTE_ID], [FUENTE_NOMBRE], [IdEstado], [Relevante], [IdComuna], [IdUsuarioAsignado], [UltimaFechaModificacion], [IdUsuarioAsignadoPor], [IdSubCategoria]) VALUES (N'tag:google.com,2013:googlealerts/feed:17318904269956960873', N'56389d94ac39c0f0:1290533965a38521:com:es:CL:R', N'Fiscalía indaga incidencia de peso de vehículos en caída de <b>puente</b>', N'', N'La incidencia del peso de los vehículos sobre el <b>puente</b> Cancura, en la Región de Los Lagos, podría haber sido una posible causa de la caída del&nbsp;...', N'https://www.google.com/url?rct=j&sa=t&url=http://www.latercera.com/nacional/noticia/fiscalia-indaga-incidencia-peso-vehiculos-caida-puente/220374/&ct=ga&cd=CAIyHDEyOTA1MzM5NjVhMzg1MjE6Y29tOmVzOkNMOlI&usg=AFQjCNG05lDlbO3o-_ZfI2A8lvdMUwocng', N'https://www.google.com/url?rct=j&sa=t&url=http://www.latercera.com/nacional/noticia/fiscalia-indaga-incidencia-peso-vehiculos-caida-puente/220374/&ct=ga&cd=CAIyHDEyOTA1MzM5NjVhMzg1MjE6Y29tOmVzOkNMOlI&usg=AFQjCNG05lDlbO3o-_ZfI2A8lvdMUwocng', CAST(0x0000A90B00000000 AS DateTime), NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[NOTICIAS] ([ID], [ID_ALERT], [TITULO], [AUTOR], [DESCRIPCION], [URL], [URLTOIMAGE], [PUBLICADO], [FUENTE_ID], [FUENTE_NOMBRE], [IdEstado], [Relevante], [IdComuna], [IdUsuarioAsignado], [UltimaFechaModificacion], [IdUsuarioAsignadoPor], [IdSubCategoria]) VALUES (N'tag:google.com,2013:googlealerts/feed:17392661653933547176', N'56389d94ac39c0f0:1290533965a38521:com:es:CL:R', N'MOP espera fin de indagación por desplome de <b>puente</b> Cancura para habilitar nuevo enlace', N'', N'La fiscal jefe de Río Negro, Leyla Chain, confirmó que inicialmente se investiga un cuasidelito de homicidio y lesiones tras la tragedia del <b>Puente</b>&nbsp;...', N'https://www.google.com/url?rct=j&sa=t&url=https://www.biobiochile.cl/noticias/nacional/region-de-los-lagos/2018/06/25/mop-espera-fin-de-indagacion-por-desplome-de-puente-cancura-para-habilitar-puente-mecano.shtml&ct=ga&cd=CAIyHDEyOTA1MzM5NjVhMzg1MjE6Y29tOmVzOkNMOlI&usg=AFQjCNGdPNGFSDxXQiajndj286KVO7xrXA', N'https://www.google.com/url?rct=j&sa=t&url=https://www.biobiochile.cl/noticias/nacional/region-de-los-lagos/2018/06/25/mop-espera-fin-de-indagacion-por-desplome-de-puente-cancura-para-habilitar-puente-mecano.shtml&ct=ga&cd=CAIyHDEyOTA1MzM5NjVhMzg1MjE6Y29tOmVzOkNMOlI&usg=AFQjCNGdPNGFSDxXQiajndj286KVO7xrXA', CAST(0x0000A90B00000000 AS DateTime), NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[NOTICIAS] ([ID], [ID_ALERT], [TITULO], [AUTOR], [DESCRIPCION], [URL], [URLTOIMAGE], [PUBLICADO], [FUENTE_ID], [FUENTE_NOMBRE], [IdEstado], [Relevante], [IdComuna], [IdUsuarioAsignado], [UltimaFechaModificacion], [IdUsuarioAsignadoPor], [IdSubCategoria]) VALUES (N'tag:google.com,2013:googlealerts/feed:17500341963507115723', N'56389d94ac39c0f0:1290533965a38521:com:es:CL:R', N'La otra opción en <b>Puente</b> Alto', N'', N'2 empresas de la otra opción en <b>Puente</b> Alto, Comuna Región Metropolitana con mapa, videos y datos de contacto.', N'https://www.google.com/url?rct=j&sa=t&url=https://amarillas.emol.com/la-otra-opci%25C3%25B3n/puente-alto&ct=ga&cd=CAIyHDEyOTA1MzM5NjVhMzg1MjE6Y29tOmVzOkNMOlI&usg=AFQjCNH0n6HcLvi8dubhguvRrGSSSiflGA', N'https://www.google.com/url?rct=j&sa=t&url=https://amarillas.emol.com/la-otra-opci%25C3%25B3n/puente-alto&ct=ga&cd=CAIyHDEyOTA1MzM5NjVhMzg1MjE6Y29tOmVzOkNMOlI&usg=AFQjCNH0n6HcLvi8dubhguvRrGSSSiflGA', CAST(0x0000A90600000000 AS DateTime), NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[NOTICIAS] ([ID], [ID_ALERT], [TITULO], [AUTOR], [DESCRIPCION], [URL], [URLTOIMAGE], [PUBLICADO], [FUENTE_ID], [FUENTE_NOMBRE], [IdEstado], [Relevante], [IdComuna], [IdUsuarioAsignado], [UltimaFechaModificacion], [IdUsuarioAsignadoPor], [IdSubCategoria]) VALUES (N'tag:google.com,2013:googlealerts/feed:18028669697728565566', N'56389d94ac39c0f0:1290533965a38521:com:es:CL:R', N'Ministro de Minería Baldo Prokurica en UST Santiago: “Tenemos que avanzar en hacer <b>puente</b> ...', N'', N'El secretario de Estado hizo hincapié en las altas tasas de empleabilidad de los ingenieros, geólogos y abogados que se desempeñan en la industria&nbsp;...', N'https://www.google.com/url?rct=j&sa=t&url=http://enlinea.santotomas.cl/actualidad-institucional/mundo-santo-tomas/ministro-de-mineria-baldo-prokurica-en-ust-santiago-tenemos-que-avanzar-en-hacer-puente-directo-con-la-industria/103583/&ct=ga&cd=CAIyHDEyOTA1MzM5NjVhMzg1MjE6Y29tOmVzOkNMOlI&usg=AFQjCNF-soNGesJYQBG6AV5UFIRl_DT0IA', N'https://www.google.com/url?rct=j&sa=t&url=http://enlinea.santotomas.cl/actualidad-institucional/mundo-santo-tomas/ministro-de-mineria-baldo-prokurica-en-ust-santiago-tenemos-que-avanzar-en-hacer-puente-directo-con-la-industria/103583/&ct=ga&cd=CAIyHDEyOTA1MzM5NjVhMzg1MjE6Y29tOmVzOkNMOlI&usg=AFQjCNF-soNGesJYQBG6AV5UFIRl_DT0IA', CAST(0x0000A90600000000 AS DateTime), NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[NOTICIAS] ([ID], [ID_ALERT], [TITULO], [AUTOR], [DESCRIPCION], [URL], [URLTOIMAGE], [PUBLICADO], [FUENTE_ID], [FUENTE_NOMBRE], [IdEstado], [Relevante], [IdComuna], [IdUsuarioAsignado], [UltimaFechaModificacion], [IdUsuarioAsignadoPor], [IdSubCategoria]) VALUES (N'tag:google.com,2013:googlealerts/feed:18309563817706767077', N'56389d94ac39c0f0:1290533965a38521:com:es:CL:R', N'Brillante premiación del Torneo de Apertura Cachorros', N'', N'... solamente el representante de la Corporación de Deportes de <b>Puente</b> Alto, Oscar Plaza Flores (Encargado de Talleres de Fútbol de <b>Puente</b> Alto),&nbsp;...', N'https://www.google.com/url?rct=j&sa=t&url=http://puentealtoaldia.cl/2018/06/20/brillante-premiacion-del-torneo-de-apertura-cachorros/&ct=ga&cd=CAIyHDEyOTA1MzM5NjVhMzg1MjE6Y29tOmVzOkNMOlI&usg=AFQjCNHQVEutbQgRx3FtvjTOAX8FIm6JYA', N'https://www.google.com/url?rct=j&sa=t&url=http://puentealtoaldia.cl/2018/06/20/brillante-premiacion-del-torneo-de-apertura-cachorros/&ct=ga&cd=CAIyHDEyOTA1MzM5NjVhMzg1MjE6Y29tOmVzOkNMOlI&usg=AFQjCNHQVEutbQgRx3FtvjTOAX8FIm6JYA', CAST(0x0000A90500000000 AS DateTime), NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[NOTICIAS] ([ID], [ID_ALERT], [TITULO], [AUTOR], [DESCRIPCION], [URL], [URLTOIMAGE], [PUBLICADO], [FUENTE_ID], [FUENTE_NOMBRE], [IdEstado], [Relevante], [IdComuna], [IdUsuarioAsignado], [UltimaFechaModificacion], [IdUsuarioAsignadoPor], [IdSubCategoria]) VALUES (N'tag:google.com,2013:googlealerts/feed:1979218119308356986', N'56389d94ac39c0f0:1290533965a38521:com:es:CL:R', N'Casas en venta, solamente la comuna de <b>Puente</b> Alto', N'', N'Necesitas vender tu propiedad de forma segura, eficiente y rapida? Nosotros nos encargamos de administrar su propiedad, realizando todas las&nbsp;...', N'https://www.google.com/url?rct=j&sa=t&url=https://www.economicos.cl/search/propiedades/casas-en-venta-solamente-la-comuna-de-puente-alto-codAAMJSYQ.html&ct=ga&cd=CAIyHDEyOTA1MzM5NjVhMzg1MjE6Y29tOmVzOkNMOlI&usg=AFQjCNFgwU52wxNFylFc3G9HKHbTGVb8Pw', N'https://www.google.com/url?rct=j&sa=t&url=https://www.economicos.cl/search/propiedades/casas-en-venta-solamente-la-comuna-de-puente-alto-codAAMJSYQ.html&ct=ga&cd=CAIyHDEyOTA1MzM5NjVhMzg1MjE6Y29tOmVzOkNMOlI&usg=AFQjCNFgwU52wxNFylFc3G9HKHbTGVb8Pw', CAST(0x0000A90700000000 AS DateTime), NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[NOTICIAS] ([ID], [ID_ALERT], [TITULO], [AUTOR], [DESCRIPCION], [URL], [URLTOIMAGE], [PUBLICADO], [FUENTE_ID], [FUENTE_NOMBRE], [IdEstado], [Relevante], [IdComuna], [IdUsuarioAsignado], [UltimaFechaModificacion], [IdUsuarioAsignadoPor], [IdSubCategoria]) VALUES (N'tag:google.com,2013:googlealerts/feed:2037375759837114149', N'56389d94ac39c0f0:1290533965a38521:com:es:CL:R', N'<b>PUENTE</b> ALTO: Participa del 6° Encuentro de Comerciantes y Feriantes', N'', N'Gimnasio Municipal Irene Velásquez de <b>Puente</b> Alto. ¡Participa del 6to. Encuentro de Comerciantes y Feriantes a realizarse el próximo Lunes 25 de&nbsp;...', N'https://www.google.com/url?rct=j&sa=t&url=https://www.crecemujer.cl/actividad/comienzo-un-negocio/puente-alto-participa-del-6deg-encuentro-de-comerciantes-y-feriantes&ct=ga&cd=CAIyHDEyOTA1MzM5NjVhMzg1MjE6Y29tOmVzOkNMOlI&usg=AFQjCNFSr9upf9K0pdNqS6_CzOq68eBozQ', N'https://www.google.com/url?rct=j&sa=t&url=https://www.crecemujer.cl/actividad/comienzo-un-negocio/puente-alto-participa-del-6deg-encuentro-de-comerciantes-y-feriantes&ct=ga&cd=CAIyHDEyOTA1MzM5NjVhMzg1MjE6Y29tOmVzOkNMOlI&usg=AFQjCNFSr9upf9K0pdNqS6_CzOq68eBozQ', CAST(0x0000A90700000000 AS DateTime), NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[NOTICIAS] ([ID], [ID_ALERT], [TITULO], [AUTOR], [DESCRIPCION], [URL], [URLTOIMAGE], [PUBLICADO], [FUENTE_ID], [FUENTE_NOMBRE], [IdEstado], [Relevante], [IdComuna], [IdUsuarioAsignado], [UltimaFechaModificacion], [IdUsuarioAsignadoPor], [IdSubCategoria]) VALUES (N'tag:google.com,2013:googlealerts/feed:211586791528342175', N'56389d94ac39c0f0:1290533965a38521:com:es:CL:R', N'El partido de vida o muerte para Argentina, la caída del <b>Puente</b> Cancura y la compleja situación ...', N'', N'Junto A Dante Poli, Matilde Burgos y Gonzalo Ramírez analizaron lo que será el encuentro entre la Albiceleste y Nigeria y conversaron con el Seremi&nbsp;...', N'https://www.google.com/url?rct=j&sa=t&url=http://www.duna.cl/podcasts/el-partido-de-vida-o-muerte-para-argentina-la-caida-del-puente-cancura-y-la-compleja-situacion-que-enfrenta-mauricio-macri/&ct=ga&cd=CAIyHDEyOTA1MzM5NjVhMzg1MjE6Y29tOmVzOkNMOlI&usg=AFQjCNFUUmUYfpw49I-eINvEP44lc5rhkQ', N'https://www.google.com/url?rct=j&sa=t&url=http://www.duna.cl/podcasts/el-partido-de-vida-o-muerte-para-argentina-la-caida-del-puente-cancura-y-la-compleja-situacion-que-enfrenta-mauricio-macri/&ct=ga&cd=CAIyHDEyOTA1MzM5NjVhMzg1MjE6Y29tOmVzOkNMOlI&usg=AFQjCNFUUmUYfpw49I-eINvEP44lc5rhkQ', CAST(0x0000A90B00000000 AS DateTime), NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[NOTICIAS] ([ID], [ID_ALERT], [TITULO], [AUTOR], [DESCRIPCION], [URL], [URLTOIMAGE], [PUBLICADO], [FUENTE_ID], [FUENTE_NOMBRE], [IdEstado], [Relevante], [IdComuna], [IdUsuarioAsignado], [UltimaFechaModificacion], [IdUsuarioAsignadoPor], [IdSubCategoria]) VALUES (N'tag:google.com,2013:googlealerts/feed:2176448103485163844', N'56389d94ac39c0f0:1290533965a38521:com:es:CL:R', N'Ex Seremi de Obras Públicas por caída del <b>puente</b> Cancura: &quot;Hicimos un trabajo que correspondía ...', N'', N'Tras la caída del <b>puente</b> Cancura en la región de Los Lagos, se ha generado una gran controversia en cuanto a la asignación de responsabilidades&nbsp;...', N'https://www.google.com/url?rct=j&sa=t&url=http://www.24horas.cl/nacional/ex-seremi-de-obras-publicas-por-caida-del-puente-cancura-hicimos-un-trabajo-que-correspondia-en-su-momento-2749557&ct=ga&cd=CAIyHDEyOTA1MzM5NjVhMzg1MjE6Y29tOmVzOkNMOlI&usg=AFQjCNE4uuagoxDq6NCb5ULOLCCNyJXvkw', N'https://www.google.com/url?rct=j&sa=t&url=http://www.24horas.cl/nacional/ex-seremi-de-obras-publicas-por-caida-del-puente-cancura-hicimos-un-trabajo-que-correspondia-en-su-momento-2749557&ct=ga&cd=CAIyHDEyOTA1MzM5NjVhMzg1MjE6Y29tOmVzOkNMOlI&usg=AFQjCNE4uuagoxDq6NCb5ULOLCCNyJXvkw', CAST(0x0000A90B00000000 AS DateTime), NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[NOTICIAS] ([ID], [ID_ALERT], [TITULO], [AUTOR], [DESCRIPCION], [URL], [URLTOIMAGE], [PUBLICADO], [FUENTE_ID], [FUENTE_NOMBRE], [IdEstado], [Relevante], [IdComuna], [IdUsuarioAsignado], [UltimaFechaModificacion], [IdUsuarioAsignadoPor], [IdSubCategoria]) VALUES (N'tag:google.com,2013:googlealerts/feed:2334111217818559814', N'56389d94ac39c0f0:1290533965a38521:com:es:CL:R', N'Aclaran que en la RM se podría prohibir la leña, pero no los pellets', N'', N'... estén o no provistos de sistemas de doble cámara de combustión, en la Provincia de Santiago y en las comunas de <b>Puente</b> Alto y San Bernardo.', N'https://www.google.com/url?rct=j&sa=t&url=https://www.publimetro.cl/cl/noticias/2018/06/21/prohibicion-lena-no-pellets.html&ct=ga&cd=CAIyHDEyOTA1MzM5NjVhMzg1MjE6Y29tOmVzOkNMOlI&usg=AFQjCNFi_ZJunYCwTEDShg2C_7NbNCuo5Q', N'https://www.google.com/url?rct=j&sa=t&url=https://www.publimetro.cl/cl/noticias/2018/06/21/prohibicion-lena-no-pellets.html&ct=ga&cd=CAIyHDEyOTA1MzM5NjVhMzg1MjE6Y29tOmVzOkNMOlI&usg=AFQjCNFi_ZJunYCwTEDShg2C_7NbNCuo5Q', CAST(0x0000A90600000000 AS DateTime), NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[NOTICIAS] ([ID], [ID_ALERT], [TITULO], [AUTOR], [DESCRIPCION], [URL], [URLTOIMAGE], [PUBLICADO], [FUENTE_ID], [FUENTE_NOMBRE], [IdEstado], [Relevante], [IdComuna], [IdUsuarioAsignado], [UltimaFechaModificacion], [IdUsuarioAsignadoPor], [IdSubCategoria]) VALUES (N'tag:google.com,2013:googlealerts/feed:3262852444185438937', N'56389d94ac39c0f0:07f0aa2d59cdbfa7:com:es:CL:R', N'MOP declara Carretera del Cobre como “camino público” y compromete inicio de obras de ...', N'', N'Cabe consignar que la iniciativa de obras de <b>ampliación</b> de la <b>ruta</b> que une Rancagua con el Mineral El Teniente, comprende el tramo entre el km 3 y&nbsp;...', N'https://www.google.com/url?rct=j&sa=t&url=http://eltipografo.cl/2018/06/mop-declara-carretera-del-cobre-como-camino-publico-y-compromete-inicio-de-obras-de-ampliacion-a-fines-de-2019/&ct=ga&cd=CAIyHDA3ZjBhYTJkNTljZGJmYTc6Y29tOmVzOkNMOlI&usg=AFQjCNEyecvUp2FPiMyPkFfMMotKUdQSCw', N'https://www.google.com/url?rct=j&sa=t&url=http://eltipografo.cl/2018/06/mop-declara-carretera-del-cobre-como-camino-publico-y-compromete-inicio-de-obras-de-ampliacion-a-fines-de-2019/&ct=ga&cd=CAIyHDA3ZjBhYTJkNTljZGJmYTc6Y29tOmVzOkNMOlI&usg=AFQjCNEyecvUp2FPiMyPkFfMMotKUdQSCw', CAST(0x0000A90800000000 AS DateTime), NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[NOTICIAS] ([ID], [ID_ALERT], [TITULO], [AUTOR], [DESCRIPCION], [URL], [URLTOIMAGE], [PUBLICADO], [FUENTE_ID], [FUENTE_NOMBRE], [IdEstado], [Relevante], [IdComuna], [IdUsuarioAsignado], [UltimaFechaModificacion], [IdUsuarioAsignadoPor], [IdSubCategoria]) VALUES (N'tag:google.com,2013:googlealerts/feed:3392657167136255603', N'56389d94ac39c0f0:1290533965a38521:com:es:CL:R', N'Palta hass vieja chilena', N'', N'**Visita nuestro local en <b>Puente</b> Alto**?   **Visita nuestro local en <b>Puente</b> Alto**?   **Visita nuestro local en <b>Puente</b> Alto**?   **Visita nuestro local en&nbsp;...', N'https://www.google.com/url?rct=j&sa=t&url=https://www.yapo.cl/region_metropolitana/otros_productos/palta_hass_vieja_chilena_54367571.htm&ct=ga&cd=CAIyHDEyOTA1MzM5NjVhMzg1MjE6Y29tOmVzOkNMOlI&usg=AFQjCNFoarGgc1X5H6DeTHri0rX0sVWvfw', N'https://www.google.com/url?rct=j&sa=t&url=https://www.yapo.cl/region_metropolitana/otros_productos/palta_hass_vieja_chilena_54367571.htm&ct=ga&cd=CAIyHDEyOTA1MzM5NjVhMzg1MjE6Y29tOmVzOkNMOlI&usg=AFQjCNFoarGgc1X5H6DeTHri0rX0sVWvfw', CAST(0x0000A90600000000 AS DateTime), NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[NOTICIAS] ([ID], [ID_ALERT], [TITULO], [AUTOR], [DESCRIPCION], [URL], [URLTOIMAGE], [PUBLICADO], [FUENTE_ID], [FUENTE_NOMBRE], [IdEstado], [Relevante], [IdComuna], [IdUsuarioAsignado], [UltimaFechaModificacion], [IdUsuarioAsignadoPor], [IdSubCategoria]) VALUES (N'tag:google.com,2013:googlealerts/feed:3725449383549557886', N'56389d94ac39c0f0:1290533965a38521:com:es:CL:R', N'Gobierno afina nuevo plan para enfrentar emergencias en el Metro', N'', N'La Línea 4 tuvo que operar sólo entre Estación Colón y <b>Puente</b> Alto, mientras que la Línea 1 suspendió el trayecto entre Alcántara y Salvador. Incluso&nbsp;...', N'https://www.google.com/url?rct=j&sa=t&url=http://www.latercera.com/nacional/noticia/gobierno-afina-nuevo-plan-enfrentar-emergencias-metro/214467/&ct=ga&cd=CAIyHDEyOTA1MzM5NjVhMzg1MjE6Y29tOmVzOkNMOlI&usg=AFQjCNFHYzqxGTNB6EWKn9EcQQNNmmkHFg', N'https://www.google.com/url?rct=j&sa=t&url=http://www.latercera.com/nacional/noticia/gobierno-afina-nuevo-plan-enfrentar-emergencias-metro/214467/&ct=ga&cd=CAIyHDEyOTA1MzM5NjVhMzg1MjE6Y29tOmVzOkNMOlI&usg=AFQjCNFHYzqxGTNB6EWKn9EcQQNNmmkHFg', CAST(0x0000A90600000000 AS DateTime), NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[NOTICIAS] ([ID], [ID_ALERT], [TITULO], [AUTOR], [DESCRIPCION], [URL], [URLTOIMAGE], [PUBLICADO], [FUENTE_ID], [FUENTE_NOMBRE], [IdEstado], [Relevante], [IdComuna], [IdUsuarioAsignado], [UltimaFechaModificacion], [IdUsuarioAsignadoPor], [IdSubCategoria]) VALUES (N'tag:google.com,2013:googlealerts/feed:4100880949398810383', N'56389d94ac39c0f0:1290533965a38521:com:es:CL:R', N'Dos fallecidos dejó accidente entre camión y taxi en Ruta 68', N'', N'[  CORTE DE RUTA] continúa por accidente Km. 11 sector <b>Puente</b> Pudahuel en dirección a Santiago  Prefiera alternativas #VíasChile??  Conduzca&nbsp;...', N'https://www.google.com/url?rct=j&sa=t&url=http://www.ahoranoticias.cl/noticias/nacional/228029-dos-fallecidos-dejo-accidente-entre-camion-y-taxi-en-ruta-68.html&ct=ga&cd=CAIyHDEyOTA1MzM5NjVhMzg1MjE6Y29tOmVzOkNMOlI&usg=AFQjCNGqGZe3uqVhAdu04yxgxMABs5iEBQ', N'https://www.google.com/url?rct=j&sa=t&url=http://www.ahoranoticias.cl/noticias/nacional/228029-dos-fallecidos-dejo-accidente-entre-camion-y-taxi-en-ruta-68.html&ct=ga&cd=CAIyHDEyOTA1MzM5NjVhMzg1MjE6Y29tOmVzOkNMOlI&usg=AFQjCNGqGZe3uqVhAdu04yxgxMABs5iEBQ', CAST(0x0000A90600000000 AS DateTime), NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[NOTICIAS] ([ID], [ID_ALERT], [TITULO], [AUTOR], [DESCRIPCION], [URL], [URLTOIMAGE], [PUBLICADO], [FUENTE_ID], [FUENTE_NOMBRE], [IdEstado], [Relevante], [IdComuna], [IdUsuarioAsignado], [UltimaFechaModificacion], [IdUsuarioAsignadoPor], [IdSubCategoria]) VALUES (N'tag:google.com,2013:googlealerts/feed:4147556670570551765', N'56389d94ac39c0f0:1290533965a38521:com:es:CL:R', N'Evalúan habilitar albergues por actividad volcánica en Los Ríos', N'', N'Mejoramiento de <b>puente</b> en sector Huishue para Rupumeica Alto (Dirección de Vialidad). Coordinación. Se informó que este sábado se realizará un&nbsp;...', N'https://www.google.com/url?rct=j&sa=t&url=http://www.elnaveghable.cl/noticia/corfo/evaluan-habilitar-albergues-por-actividad-volcanica-en-los-rios&ct=ga&cd=CAIyHDEyOTA1MzM5NjVhMzg1MjE6Y29tOmVzOkNMOlI&usg=AFQjCNGWm3wPPeVg4E5xI2OBeAChhmRRdg', N'https://www.google.com/url?rct=j&sa=t&url=http://www.elnaveghable.cl/noticia/corfo/evaluan-habilitar-albergues-por-actividad-volcanica-en-los-rios&ct=ga&cd=CAIyHDEyOTA1MzM5NjVhMzg1MjE6Y29tOmVzOkNMOlI&usg=AFQjCNGWm3wPPeVg4E5xI2OBeAChhmRRdg', CAST(0x0000A90700000000 AS DateTime), NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[NOTICIAS] ([ID], [ID_ALERT], [TITULO], [AUTOR], [DESCRIPCION], [URL], [URLTOIMAGE], [PUBLICADO], [FUENTE_ID], [FUENTE_NOMBRE], [IdEstado], [Relevante], [IdComuna], [IdUsuarioAsignado], [UltimaFechaModificacion], [IdUsuarioAsignadoPor], [IdSubCategoria]) VALUES (N'tag:google.com,2013:googlealerts/feed:4191692436694587271', N'56389d94ac39c0f0:1290533965a38521:com:es:CL:R', N'Ante la duda sobre si habrá o no&quot;ULoL&quot;, estudiantes del Inacap organizan campeonato de ...', N'', N'... que podría durar hasta altas horas de la tarde, ya que terminará con la final presencial de Inacap Apoquindo, <b>Puente</b> Alto y Santiago Centro.', N'https://www.google.com/url?rct=j&sa=t&url=https://www.publimetro.cl/cl/estilo-vida/2018/06/22/league-legends.html&ct=ga&cd=CAIyHDEyOTA1MzM5NjVhMzg1MjE6Y29tOmVzOkNMOlI&usg=AFQjCNGoIya2I32E3ICtPFEsKFreHs1Eiw', N'https://www.google.com/url?rct=j&sa=t&url=https://www.publimetro.cl/cl/estilo-vida/2018/06/22/league-legends.html&ct=ga&cd=CAIyHDEyOTA1MzM5NjVhMzg1MjE6Y29tOmVzOkNMOlI&usg=AFQjCNGoIya2I32E3ICtPFEsKFreHs1Eiw', CAST(0x0000A90700000000 AS DateTime), NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[NOTICIAS] ([ID], [ID_ALERT], [TITULO], [AUTOR], [DESCRIPCION], [URL], [URLTOIMAGE], [PUBLICADO], [FUENTE_ID], [FUENTE_NOMBRE], [IdEstado], [Relevante], [IdComuna], [IdUsuarioAsignado], [UltimaFechaModificacion], [IdUsuarioAsignadoPor], [IdSubCategoria]) VALUES (N'tag:google.com,2013:googlealerts/feed:4345379290480631940', N'56389d94ac39c0f0:1290533965a38521:com:es:CL:R', N'Instalar sistemas de riego automático', N'', N'Presupuesto cotizar matencion jardin ... cotizar mantención de jardín edificio núcleo <b>puente</b> alto. Adjunto fotos y medidas jardín. Detalle: 1- patio de&nbsp;...', N'https://www.google.com/url?rct=j&sa=t&url=https://www.habitissimo.cl/presupuesto/cordillera/puente-alto/presio-unitario-de-una&ct=ga&cd=CAIyHDEyOTA1MzM5NjVhMzg1MjE6Y29tOmVzOkNMOlI&usg=AFQjCNERS9EbzPM_GkLH-yMisfPKaBMsFw', N'https://www.google.com/url?rct=j&sa=t&url=https://www.habitissimo.cl/presupuesto/cordillera/puente-alto/presio-unitario-de-una&ct=ga&cd=CAIyHDEyOTA1MzM5NjVhMzg1MjE6Y29tOmVzOkNMOlI&usg=AFQjCNERS9EbzPM_GkLH-yMisfPKaBMsFw', CAST(0x0000A90600000000 AS DateTime), NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[NOTICIAS] ([ID], [ID_ALERT], [TITULO], [AUTOR], [DESCRIPCION], [URL], [URLTOIMAGE], [PUBLICADO], [FUENTE_ID], [FUENTE_NOMBRE], [IdEstado], [Relevante], [IdComuna], [IdUsuarioAsignado], [UltimaFechaModificacion], [IdUsuarioAsignadoPor], [IdSubCategoria]) VALUES (N'tag:google.com,2013:googlealerts/feed:4386665049550088331', N'56389d94ac39c0f0:07f0aa2d59cdbfa7:com:es:CL:R', N'MOP descarta subir subsidio, pero prevé más gatillos de inversión para viabilizar <b>Ruta</b> de la Fruta', N'', N'... el Aeropuerto Arturo Merino Benítez de Santiago (AMB), donde una segunda <b>ampliación</b> quedó condicionada a un número de pasajeros definido.', N'https://www.google.com/url?rct=j&sa=t&url=http://www.economiaynegocios.cl/noticias/noticias.asp%3Fid%3D481990&ct=ga&cd=CAIyHDA3ZjBhYTJkNTljZGJmYTc6Y29tOmVzOkNMOlI&usg=AFQjCNEWgyDMJxRKi-O56h2rkZuXY014kQ', N'https://www.google.com/url?rct=j&sa=t&url=http://www.economiaynegocios.cl/noticias/noticias.asp%3Fid%3D481990&ct=ga&cd=CAIyHDA3ZjBhYTJkNTljZGJmYTc6Y29tOmVzOkNMOlI&usg=AFQjCNEWgyDMJxRKi-O56h2rkZuXY014kQ', CAST(0x0000A90B00000000 AS DateTime), NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[NOTICIAS] ([ID], [ID_ALERT], [TITULO], [AUTOR], [DESCRIPCION], [URL], [URLTOIMAGE], [PUBLICADO], [FUENTE_ID], [FUENTE_NOMBRE], [IdEstado], [Relevante], [IdComuna], [IdUsuarioAsignado], [UltimaFechaModificacion], [IdUsuarioAsignadoPor], [IdSubCategoria]) VALUES (N'tag:google.com,2013:googlealerts/feed:4523792373102293993', N'56389d94ac39c0f0:1290533965a38521:com:es:CL:R', N'[VIDEO] Accidente en ruta 68 deja dos fallecidos tras colisión entre taxi y un camión', N'', N'Según la concesionaria el tránsito se encuentra suspendido en la ruta en el kilómetro 11 sector <b>Puente</b> Pudahuel en dirección a Santiago.', N'https://www.google.com/url?rct=j&sa=t&url=http://www.t13.cl/noticia/nacional/accidente-ruta-68-deja-dos-fallecidos-colision-taxi-camion&ct=ga&cd=CAIyHDEyOTA1MzM5NjVhMzg1MjE6Y29tOmVzOkNMOlI&usg=AFQjCNGbDfXcrOfnJ_6wufjO1FCwxac7wQ', N'https://www.google.com/url?rct=j&sa=t&url=http://www.t13.cl/noticia/nacional/accidente-ruta-68-deja-dos-fallecidos-colision-taxi-camion&ct=ga&cd=CAIyHDEyOTA1MzM5NjVhMzg1MjE6Y29tOmVzOkNMOlI&usg=AFQjCNGbDfXcrOfnJ_6wufjO1FCwxac7wQ', CAST(0x0000A90600000000 AS DateTime), NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[NOTICIAS] ([ID], [ID_ALERT], [TITULO], [AUTOR], [DESCRIPCION], [URL], [URLTOIMAGE], [PUBLICADO], [FUENTE_ID], [FUENTE_NOMBRE], [IdEstado], [Relevante], [IdComuna], [IdUsuarioAsignado], [UltimaFechaModificacion], [IdUsuarioAsignadoPor], [IdSubCategoria]) VALUES (N'tag:google.com,2013:googlealerts/feed:4867350462889294074', N'56389d94ac39c0f0:07f0aa2d59cdbfa7:com:es:CL:R', N'Carretera El Cobre es declarada como “camino público”y autoridades comprometen inicio de ...', N'', N'El proyecto de obras de <b>ampliación</b> de la <b>ruta</b> que une Rancagua con el Mineral El Teniente, comprende el tramo entre el km 3 y el km 10 a la altura&nbsp;...', N'https://www.google.com/url?rct=j&sa=t&url=http://elurbanorural.cl/carretera-el-cobre-es-declarada-como-camino-publicoy-autoridades-comprometen-inicio-de-obras-para-fines-de-2019/&ct=ga&cd=CAIyHDA3ZjBhYTJkNTljZGJmYTc6Y29tOmVzOkNMOlI&usg=AFQjCNEvC-d945QeDU4Mbg4-I4P7a9d4Iw', N'https://www.google.com/url?rct=j&sa=t&url=http://elurbanorural.cl/carretera-el-cobre-es-declarada-como-camino-publicoy-autoridades-comprometen-inicio-de-obras-para-fines-de-2019/&ct=ga&cd=CAIyHDA3ZjBhYTJkNTljZGJmYTc6Y29tOmVzOkNMOlI&usg=AFQjCNEvC-d945QeDU4Mbg4-I4P7a9d4Iw', CAST(0x0000A90700000000 AS DateTime), NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[NOTICIAS] ([ID], [ID_ALERT], [TITULO], [AUTOR], [DESCRIPCION], [URL], [URLTOIMAGE], [PUBLICADO], [FUENTE_ID], [FUENTE_NOMBRE], [IdEstado], [Relevante], [IdComuna], [IdUsuarioAsignado], [UltimaFechaModificacion], [IdUsuarioAsignadoPor], [IdSubCategoria]) VALUES (N'tag:google.com,2013:googlealerts/feed:5018167031148813044', N'56389d94ac39c0f0:1290533965a38521:com:es:CL:R', N'Los Lagos: Diputada Jenny Álvarez (PS) “El derrumbe del <b>Puente</b> Cancura es consecuencia de ...', N'', N'La Presidenta de la Comisión de Obras Públicas, Transportes y Telecomunicaciones, Jenny Álvarez, lamentó lo ocurrido con el <b>Puente</b> Cancura en&nbsp;...', N'https://www.google.com/url?rct=j&sa=t&url=https://radioallen.cl/2018/dip-341/&ct=ga&cd=CAIyHDEyOTA1MzM5NjVhMzg1MjE6Y29tOmVzOkNMOlI&usg=AFQjCNEx5lLbfs498Kuevop5DvIGuFH8FQ', N'https://www.google.com/url?rct=j&sa=t&url=https://radioallen.cl/2018/dip-341/&ct=ga&cd=CAIyHDEyOTA1MzM5NjVhMzg1MjE6Y29tOmVzOkNMOlI&usg=AFQjCNEx5lLbfs498Kuevop5DvIGuFH8FQ', CAST(0x0000A90B00000000 AS DateTime), NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[NOTICIAS] ([ID], [ID_ALERT], [TITULO], [AUTOR], [DESCRIPCION], [URL], [URLTOIMAGE], [PUBLICADO], [FUENTE_ID], [FUENTE_NOMBRE], [IdEstado], [Relevante], [IdComuna], [IdUsuarioAsignado], [UltimaFechaModificacion], [IdUsuarioAsignadoPor], [IdSubCategoria]) VALUES (N'tag:google.com,2013:googlealerts/feed:5292286545004773695', N'56389d94ac39c0f0:1290533965a38521:com:es:CL:R', N'Pink Floyd nunca muere', N'', N'Pero más allá del <b>puente</b> familiar, las performances del cantante se siguen publicitando bajo el anzuelo de montajes espectaculares, verdaderos&nbsp;...', N'https://www.google.com/url?rct=j&sa=t&url=http://culto.latercera.com/2018/06/22/pink-floyd-nunca-muere/&ct=ga&cd=CAIyHDEyOTA1MzM5NjVhMzg1MjE6Y29tOmVzOkNMOlI&usg=AFQjCNHMc_NDbFhFqDKfZk9YfIsMx0pefg', N'https://www.google.com/url?rct=j&sa=t&url=http://culto.latercera.com/2018/06/22/pink-floyd-nunca-muere/&ct=ga&cd=CAIyHDEyOTA1MzM5NjVhMzg1MjE6Y29tOmVzOkNMOlI&usg=AFQjCNHMc_NDbFhFqDKfZk9YfIsMx0pefg', CAST(0x0000A90700000000 AS DateTime), NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[NOTICIAS] ([ID], [ID_ALERT], [TITULO], [AUTOR], [DESCRIPCION], [URL], [URLTOIMAGE], [PUBLICADO], [FUENTE_ID], [FUENTE_NOMBRE], [IdEstado], [Relevante], [IdComuna], [IdUsuarioAsignado], [UltimaFechaModificacion], [IdUsuarioAsignadoPor], [IdSubCategoria]) VALUES (N'tag:google.com,2013:googlealerts/feed:5320744486781788985', N'56389d94ac39c0f0:1290533965a38521:com:es:CL:R', N'En octubre partirían obras de nuevo <b>puente</b> Los Castaños', N'', N'El nuevo <b>puente</b> Los Castaños de Viña del Mar ya tendría los recursos comprometidos para iniciar los trabajos en octubre próximo. Obra que ayudará&nbsp;...', N'https://www.google.com/url?rct=j&sa=t&url=http://www.24horas.cl/regiones/valparaiso/en-octubre-partirian-obras-de-nuevo-puente-los-castanos--2745802&ct=ga&cd=CAIyHDEyOTA1MzM5NjVhMzg1MjE6Y29tOmVzOkNMOlI&usg=AFQjCNGAuMEHHTedYchtbipG6dPamul9Iw', N'https://www.google.com/url?rct=j&sa=t&url=http://www.24horas.cl/regiones/valparaiso/en-octubre-partirian-obras-de-nuevo-puente-los-castanos--2745802&ct=ga&cd=CAIyHDEyOTA1MzM5NjVhMzg1MjE6Y29tOmVzOkNMOlI&usg=AFQjCNGAuMEHHTedYchtbipG6dPamul9Iw', CAST(0x0000A90600000000 AS DateTime), NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[NOTICIAS] ([ID], [ID_ALERT], [TITULO], [AUTOR], [DESCRIPCION], [URL], [URLTOIMAGE], [PUBLICADO], [FUENTE_ID], [FUENTE_NOMBRE], [IdEstado], [Relevante], [IdComuna], [IdUsuarioAsignado], [UltimaFechaModificacion], [IdUsuarioAsignadoPor], [IdSubCategoria]) VALUES (N'tag:google.com,2013:googlealerts/feed:5363230133257727761', N'56389d94ac39c0f0:1290533965a38521:com:es:CL:R', N'CORES realizan primer acercamiento para concretar instalación de <b>puente</b> mecano en el sector el ...', N'', N'Sin lugar a dudas los <b>puentes</b> mecano son infraestructuras vitales para conectar un sinnúmero de valles productivos de la Región de Aysén, que tras&nbsp;...', N'https://www.google.com/url?rct=j&sa=t&url=http://www.vientopatagon.cl/2018/06/cores-realizan-primer-acercamiento-para-concretar-instalacion-de-puente-mecano-en-el-sector-el-engano/&ct=ga&cd=CAIyHDEyOTA1MzM5NjVhMzg1MjE6Y29tOmVzOkNMOlI&usg=AFQjCNFltESY-fwnWydTbu6Rzzy75arE_A', N'https://www.google.com/url?rct=j&sa=t&url=http://www.vientopatagon.cl/2018/06/cores-realizan-primer-acercamiento-para-concretar-instalacion-de-puente-mecano-en-el-sector-el-engano/&ct=ga&cd=CAIyHDEyOTA1MzM5NjVhMzg1MjE6Y29tOmVzOkNMOlI&usg=AFQjCNFltESY-fwnWydTbu6Rzzy75arE_A', CAST(0x0000A90B00000000 AS DateTime), NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[NOTICIAS] ([ID], [ID_ALERT], [TITULO], [AUTOR], [DESCRIPCION], [URL], [URLTOIMAGE], [PUBLICADO], [FUENTE_ID], [FUENTE_NOMBRE], [IdEstado], [Relevante], [IdComuna], [IdUsuarioAsignado], [UltimaFechaModificacion], [IdUsuarioAsignadoPor], [IdSubCategoria]) VALUES (N'tag:google.com,2013:googlealerts/feed:5441312341463758216', N'56389d94ac39c0f0:1290533965a38521:com:es:CL:R', N'Arriendo Oficina Centro <b>Puente</b> Alto', N'', N'Oficina de Plaza <b>Puente</b> Alto: Pleno centro de Plaza <b>Puente</b> Alto, cercano a centros comerciales, bancos, notarias, juzgados etc,. Posee: Recepción 2&nbsp;...', N'https://www.google.com/url?rct=j&sa=t&url=https://www.yapo.cl/region_metropolitana/arrendar/arriendo_oficina_centro_puente_alto_54337851.htm&ct=ga&cd=CAIyHDEyOTA1MzM5NjVhMzg1MjE6Y29tOmVzOkNMOlI&usg=AFQjCNF0Fab7epTndGoaU06hnq_DbJpS8g', N'https://www.google.com/url?rct=j&sa=t&url=https://www.yapo.cl/region_metropolitana/arrendar/arriendo_oficina_centro_puente_alto_54337851.htm&ct=ga&cd=CAIyHDEyOTA1MzM5NjVhMzg1MjE6Y29tOmVzOkNMOlI&usg=AFQjCNF0Fab7epTndGoaU06hnq_DbJpS8g', CAST(0x0000A90600000000 AS DateTime), NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[NOTICIAS] ([ID], [ID_ALERT], [TITULO], [AUTOR], [DESCRIPCION], [URL], [URLTOIMAGE], [PUBLICADO], [FUENTE_ID], [FUENTE_NOMBRE], [IdEstado], [Relevante], [IdComuna], [IdUsuarioAsignado], [UltimaFechaModificacion], [IdUsuarioAsignadoPor], [IdSubCategoria]) VALUES (N'tag:google.com,2013:googlealerts/feed:5733969687139163367', N'56389d94ac39c0f0:1290533965a38521:com:es:CL:R', N'Definen las obras viales que mejorarán accesos a la Villa Barcelona', N'', N'Villa Universitaria se unirá inicialmente con la villa Barcelona a través de un <b>puente</b> de hormigón sobre el estero Las Toscas, el que está actualmente&nbsp;...', N'https://www.google.com/url?rct=j&sa=t&url=http://www.ladiscusion.cl/detalle/23993/Definen-las-obras-viales-que-mejorar%25C3%25A1n-accesos-a-la-Villa-Barcelona&ct=ga&cd=CAIyHDEyOTA1MzM5NjVhMzg1MjE6Y29tOmVzOkNMOlI&usg=AFQjCNHnXI1OU51nWfpLuwOGv3pqAfn4KQ', N'https://www.google.com/url?rct=j&sa=t&url=http://www.ladiscusion.cl/detalle/23993/Definen-las-obras-viales-que-mejorar%25C3%25A1n-accesos-a-la-Villa-Barcelona&ct=ga&cd=CAIyHDEyOTA1MzM5NjVhMzg1MjE6Y29tOmVzOkNMOlI&usg=AFQjCNHnXI1OU51nWfpLuwOGv3pqAfn4KQ', CAST(0x0000A90700000000 AS DateTime), NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[NOTICIAS] ([ID], [ID_ALERT], [TITULO], [AUTOR], [DESCRIPCION], [URL], [URLTOIMAGE], [PUBLICADO], [FUENTE_ID], [FUENTE_NOMBRE], [IdEstado], [Relevante], [IdComuna], [IdUsuarioAsignado], [UltimaFechaModificacion], [IdUsuarioAsignadoPor], [IdSubCategoria]) VALUES (N'tag:google.com,2013:googlealerts/feed:6119235127933917897', N'56389d94ac39c0f0:1290533965a38521:com:es:CL:R', N'Vendo Casa, Canal Las Perdices, <b>Puente</b> Alto.', N'', N'CANAL LAS PERDICES N° 4475. DIEGO PORTALES A LA CORDILLERA PASAR CIUDAD DEL ESTE. CERCA DE MALL TOBALABA,&nbsp;...', N'https://www.google.com/url?rct=j&sa=t&url=http://millspropiedades.cl/propiedades/vendo-casa-canal-las-perdices-puente-alto/&ct=ga&cd=CAIyHDEyOTA1MzM5NjVhMzg1MjE6Y29tOmVzOkNMOlI&usg=AFQjCNFoW_v1JhFwi3LfEAEb3zEGUaB7EA', N'https://www.google.com/url?rct=j&sa=t&url=http://millspropiedades.cl/propiedades/vendo-casa-canal-las-perdices-puente-alto/&ct=ga&cd=CAIyHDEyOTA1MzM5NjVhMzg1MjE6Y29tOmVzOkNMOlI&usg=AFQjCNFoW_v1JhFwi3LfEAEb3zEGUaB7EA', CAST(0x0000A90700000000 AS DateTime), NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[NOTICIAS] ([ID], [ID_ALERT], [TITULO], [AUTOR], [DESCRIPCION], [URL], [URLTOIMAGE], [PUBLICADO], [FUENTE_ID], [FUENTE_NOMBRE], [IdEstado], [Relevante], [IdComuna], [IdUsuarioAsignado], [UltimaFechaModificacion], [IdUsuarioAsignadoPor], [IdSubCategoria]) VALUES (N'tag:google.com,2013:googlealerts/feed:6180232523833319718', N'56389d94ac39c0f0:1290533965a38521:com:es:CL:R', N'<b>PUENTE</b> ALTO (REEMPLAZO)', N'', N'Grafton está en búsqueda de Asistentes de Atención al Cliente para Banco con presencia a nivel nacional ubicado en <b>Puente</b> Alto.', N'https://www.google.com/url?rct=j&sa=t&url=https://www.trabajando.cl/empleos/ofertas/3479498/ASISTENTE-ATENCION-CLIENTES-CON-EXPERIENCIA-BANCARIA---PUENTE-ALTO--REEMPLAZO-.html&ct=ga&cd=CAIyHDEyOTA1MzM5NjVhMzg1MjE6Y29tOmVzOkNMOlI&usg=AFQjCNEmHz7EoEQ71Z5Ry--XAhHRbp1lfw', N'https://www.google.com/url?rct=j&sa=t&url=https://www.trabajando.cl/empleos/ofertas/3479498/ASISTENTE-ATENCION-CLIENTES-CON-EXPERIENCIA-BANCARIA---PUENTE-ALTO--REEMPLAZO-.html&ct=ga&cd=CAIyHDEyOTA1MzM5NjVhMzg1MjE6Y29tOmVzOkNMOlI&usg=AFQjCNEmHz7EoEQ71Z5Ry--XAhHRbp1lfw', CAST(0x0000A90B00000000 AS DateTime), NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[NOTICIAS] ([ID], [ID_ALERT], [TITULO], [AUTOR], [DESCRIPCION], [URL], [URLTOIMAGE], [PUBLICADO], [FUENTE_ID], [FUENTE_NOMBRE], [IdEstado], [Relevante], [IdComuna], [IdUsuarioAsignado], [UltimaFechaModificacion], [IdUsuarioAsignadoPor], [IdSubCategoria]) VALUES (N'tag:google.com,2013:googlealerts/feed:6281417401049258936', N'56389d94ac39c0f0:1290533965a38521:com:es:CL:R', N'Fiscal ha tomado declaraciones a cuatro imputados por desplome del <b>puente</b> Cancura', N'', N'&quot;No se ha llegado a la convicción de que ellos sean responsables de este delito&quot;, explicó la persecutora Leyla Chahín. Se investiga un cuasidelito de&nbsp;...', N'https://www.google.com/url?rct=j&sa=t&url=https://www.cooperativa.cl/noticias/pais/region-de-los-lagos/fiscal-ha-tomado-declaraciones-a-cuatro-imputados-por-desplome-del/2018-06-25/234359.html&ct=ga&cd=CAIyHDEyOTA1MzM5NjVhMzg1MjE6Y29tOmVzOkNMOlI&usg=AFQjCNGfUI1uSPQKvMie3qkHQxIetp556A', N'https://www.google.com/url?rct=j&sa=t&url=https://www.cooperativa.cl/noticias/pais/region-de-los-lagos/fiscal-ha-tomado-declaraciones-a-cuatro-imputados-por-desplome-del/2018-06-25/234359.html&ct=ga&cd=CAIyHDEyOTA1MzM5NjVhMzg1MjE6Y29tOmVzOkNMOlI&usg=AFQjCNGfUI1uSPQKvMie3qkHQxIetp556A', CAST(0x0000A90B00000000 AS DateTime), NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[NOTICIAS] ([ID], [ID_ALERT], [TITULO], [AUTOR], [DESCRIPCION], [URL], [URLTOIMAGE], [PUBLICADO], [FUENTE_ID], [FUENTE_NOMBRE], [IdEstado], [Relevante], [IdComuna], [IdUsuarioAsignado], [UltimaFechaModificacion], [IdUsuarioAsignadoPor], [IdSubCategoria]) VALUES (N'tag:google.com,2013:googlealerts/feed:6403752594074187106', N'56389d94ac39c0f0:0daa7a2033c37535:com:es:CL:R', N'Diecisiete <b>licitaciones</b> de contratos de obras se han iniciado en los primeros 100 días del gobierno ...', N'', N'Diecisiete <b>licitaciones</b> de contratos de obras se han iniciado en los ... de 17 contratos de obra, entre los que sobresale la reposición del <b>puente</b> Chiloé. ... Además, se dará comienzo a la <b>licitación</b> del proyecto de autogeneración&nbsp;...', N'https://www.google.com/url?rct=j&sa=t&url=https://laprensaaustral.cl/cronica/diecisiete-licitaciones-de-contratos-de-obras-se-han-iniciado-en-los-primeros-100-dias-del-gobierno-de-sebastian-pinera/&ct=ga&cd=CAIyHDBkYWE3YTIwMzNjMzc1MzU6Y29tOmVzOkNMOlI&usg=AFQjCNFCJTeHAeKh_LRGewyRYXimFnhJYQ', N'https://www.google.com/url?rct=j&sa=t&url=https://laprensaaustral.cl/cronica/diecisiete-licitaciones-de-contratos-de-obras-se-han-iniciado-en-los-primeros-100-dias-del-gobierno-de-sebastian-pinera/&ct=ga&cd=CAIyHDBkYWE3YTIwMzNjMzc1MzU6Y29tOmVzOkNMOlI&usg=AFQjCNFCJTeHAeKh_LRGewyRYXimFnhJYQ', CAST(0x0000A90700000000 AS DateTime), NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[NOTICIAS] ([ID], [ID_ALERT], [TITULO], [AUTOR], [DESCRIPCION], [URL], [URLTOIMAGE], [PUBLICADO], [FUENTE_ID], [FUENTE_NOMBRE], [IdEstado], [Relevante], [IdComuna], [IdUsuarioAsignado], [UltimaFechaModificacion], [IdUsuarioAsignadoPor], [IdSubCategoria]) VALUES (N'tag:google.com,2013:googlealerts/feed:6445211084800944668', N'56389d94ac39c0f0:1290533965a38521:com:es:CL:R', N'Manuel José Ossandón: el inesperado aliado de La Moneda', N'', N'El senador de RN fue convocado a la actividad pública junto al Mandatario en <b>Puente</b> Alto e incluso, luego de dar &#39;el vamos&#39; a la demolición de la&nbsp;...', N'https://www.google.com/url?rct=j&sa=t&url=http://www.economiaynegocios.cl/noticias/noticias.asp%3Fid%3D480925&ct=ga&cd=CAIyHDEyOTA1MzM5NjVhMzg1MjE6Y29tOmVzOkNMOlI&usg=AFQjCNFsm_AzB3yih7qJfDoFXhf2WOlqOg', N'https://www.google.com/url?rct=j&sa=t&url=http://www.economiaynegocios.cl/noticias/noticias.asp%3Fid%3D480925&ct=ga&cd=CAIyHDEyOTA1MzM5NjVhMzg1MjE6Y29tOmVzOkNMOlI&usg=AFQjCNFsm_AzB3yih7qJfDoFXhf2WOlqOg', CAST(0x0000A90800000000 AS DateTime), NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[NOTICIAS] ([ID], [ID_ALERT], [TITULO], [AUTOR], [DESCRIPCION], [URL], [URLTOIMAGE], [PUBLICADO], [FUENTE_ID], [FUENTE_NOMBRE], [IdEstado], [Relevante], [IdComuna], [IdUsuarioAsignado], [UltimaFechaModificacion], [IdUsuarioAsignadoPor], [IdSubCategoria]) VALUES (N'tag:google.com,2013:googlealerts/feed:6631923109229161928', N'56389d94ac39c0f0:1290533965a38521:com:es:CL:R', N'Sin acuerdo terminó reunión por alzas en el Peaje Chivilingo: llaman a paro para el martes', N'', N'La recepción por parte del Ejecutivo anterior del <b>Puente</b> Ramadillas faculta a la concesionaria a realizar esta alza en el peaje a pesar de que el&nbsp;...', N'https://www.google.com/url?rct=j&sa=t&url=https://www.biobiochile.cl/noticias/nacional/region-del-bio-bio/2018/06/21/sin-acuerdo-termino-reunion-por-alzas-en-el-peaje-chivilingo-llaman-a-paro-para-el-martes.shtml&ct=ga&cd=CAIyHDEyOTA1MzM5NjVhMzg1MjE6Y29tOmVzOkNMOlI&usg=AFQjCNGfWeN2sxL73bAP-h6i07WGR6jgeA', N'https://www.google.com/url?rct=j&sa=t&url=https://www.biobiochile.cl/noticias/nacional/region-del-bio-bio/2018/06/21/sin-acuerdo-termino-reunion-por-alzas-en-el-peaje-chivilingo-llaman-a-paro-para-el-martes.shtml&ct=ga&cd=CAIyHDEyOTA1MzM5NjVhMzg1MjE6Y29tOmVzOkNMOlI&usg=AFQjCNGfWeN2sxL73bAP-h6i07WGR6jgeA', CAST(0x0000A90600000000 AS DateTime), NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[NOTICIAS] ([ID], [ID_ALERT], [TITULO], [AUTOR], [DESCRIPCION], [URL], [URLTOIMAGE], [PUBLICADO], [FUENTE_ID], [FUENTE_NOMBRE], [IdEstado], [Relevante], [IdComuna], [IdUsuarioAsignado], [UltimaFechaModificacion], [IdUsuarioAsignadoPor], [IdSubCategoria]) VALUES (N'tag:google.com,2013:googlealerts/feed:7373734353233874694', N'56389d94ac39c0f0:1290533965a38521:com:es:CL:R', N'Una buena noticia para el Bajo Traiguén: En julio parten las obras del nuevo <b>puente</b> en calle Tacna', N'', N'Un sueño que por años han buscado los vecinos del sector Bajo Traiguén comienza, por fin, a hacerse realidad. La construcción del nuevo <b>puente</b> en&nbsp;...', N'https://www.google.com/url?rct=j&sa=t&url=http://somos9.cl/2018/06/21/una-buena-noticia-para-el-bajo-traiguen-en-julio-parten-las-obras-del-nuevo-puente-en-calle-tacna/&ct=ga&cd=CAIyHDEyOTA1MzM5NjVhMzg1MjE6Y29tOmVzOkNMOlI&usg=AFQjCNH8lxfEBEh8kckJtWGY9LOcO5IU8Q', N'https://www.google.com/url?rct=j&sa=t&url=http://somos9.cl/2018/06/21/una-buena-noticia-para-el-bajo-traiguen-en-julio-parten-las-obras-del-nuevo-puente-en-calle-tacna/&ct=ga&cd=CAIyHDEyOTA1MzM5NjVhMzg1MjE6Y29tOmVzOkNMOlI&usg=AFQjCNH8lxfEBEh8kckJtWGY9LOcO5IU8Q', CAST(0x0000A90600000000 AS DateTime), NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[NOTICIAS] ([ID], [ID_ALERT], [TITULO], [AUTOR], [DESCRIPCION], [URL], [URLTOIMAGE], [PUBLICADO], [FUENTE_ID], [FUENTE_NOMBRE], [IdEstado], [Relevante], [IdComuna], [IdUsuarioAsignado], [UltimaFechaModificacion], [IdUsuarioAsignadoPor], [IdSubCategoria]) VALUES (N'tag:google.com,2013:googlealerts/feed:7415559196398891143', N'56389d94ac39c0f0:07f0aa2d59cdbfa7:com:es:CL:R', N'Nuevo femicidio en Renca: Autor confeso fue detenido tras fugarse a Mulchén', N'', N'Un nuevo femicidio se registró en <b>calle</b> Baquedano 4139, Renca. Mujer de ... <b>AMPLIACION</b> FEMICIDIO renca: relación había terminado hace 1 año.', N'https://www.google.com/url?rct=j&sa=t&url=https://www.cooperativa.cl/noticias/pais/policial/femicidio/nuevo-femicidio-en-renca-autor-confeso-fue-detenido-tras-fugarse-a/2018-06-21/062843.html&ct=ga&cd=CAIyHDA3ZjBhYTJkNTljZGJmYTc6Y29tOmVzOkNMOlI&usg=AFQjCNGcF3Ffd8ZqlqpnQf8WiUBTT_DsuQ', N'https://www.google.com/url?rct=j&sa=t&url=https://www.cooperativa.cl/noticias/pais/policial/femicidio/nuevo-femicidio-en-renca-autor-confeso-fue-detenido-tras-fugarse-a/2018-06-21/062843.html&ct=ga&cd=CAIyHDA3ZjBhYTJkNTljZGJmYTc6Y29tOmVzOkNMOlI&usg=AFQjCNGcF3Ffd8ZqlqpnQf8WiUBTT_DsuQ', CAST(0x0000A90600000000 AS DateTime), NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[NOTICIAS] ([ID], [ID_ALERT], [TITULO], [AUTOR], [DESCRIPCION], [URL], [URLTOIMAGE], [PUBLICADO], [FUENTE_ID], [FUENTE_NOMBRE], [IdEstado], [Relevante], [IdComuna], [IdUsuarioAsignado], [UltimaFechaModificacion], [IdUsuarioAsignadoPor], [IdSubCategoria]) VALUES (N'tag:google.com,2013:googlealerts/feed:766468765878757365', N'56389d94ac39c0f0:1290533965a38521:com:es:CL:R', N'Abogado(A)-Tramitador(A) <b>Puente</b> Alto', N'', N'Empresa de servicios jurídicos requiere contratar a ABOGADO(A) que sea responsable, pro activo (a), dinámico(a) y comprometido(a), para&nbsp;...', N'https://www.google.com/url?rct=j&sa=t&url=https://www.buscojobs.cl/abogadoa-tramitadora-puente-alto-ID-5605523&ct=ga&cd=CAIyHDEyOTA1MzM5NjVhMzg1MjE6Y29tOmVzOkNMOlI&usg=AFQjCNGVGRe5yBCYI05FIRHNZjbaWlfIuw', N'https://www.google.com/url?rct=j&sa=t&url=https://www.buscojobs.cl/abogadoa-tramitadora-puente-alto-ID-5605523&ct=ga&cd=CAIyHDEyOTA1MzM5NjVhMzg1MjE6Y29tOmVzOkNMOlI&usg=AFQjCNGVGRe5yBCYI05FIRHNZjbaWlfIuw', CAST(0x0000A90800000000 AS DateTime), NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[NOTICIAS] ([ID], [ID_ALERT], [TITULO], [AUTOR], [DESCRIPCION], [URL], [URLTOIMAGE], [PUBLICADO], [FUENTE_ID], [FUENTE_NOMBRE], [IdEstado], [Relevante], [IdComuna], [IdUsuarioAsignado], [UltimaFechaModificacion], [IdUsuarioAsignadoPor], [IdSubCategoria]) VALUES (N'tag:google.com,2013:googlealerts/feed:7817363462368654649', N'56389d94ac39c0f0:1290533965a38521:com:es:CL:R', N'Presidente Piñera visita Bajos de Mena en <b>Puente</b> Alto y da el vamos a nuevo conjunto ...', N'', N'Presidente en Bajos de Mena. 22 JUN 2018. Descargar foto. Fotógrafo: Alex Ibañez. Descripción: Presidente en Bajos de Mena. Descargar galería', N'https://www.google.com/url?rct=j&sa=t&url=https://prensa.presidencia.cl/fotografia.aspx%3Fid%3D77399&ct=ga&cd=CAIyHDEyOTA1MzM5NjVhMzg1MjE6Y29tOmVzOkNMOlI&usg=AFQjCNHsL-RW16dAONHurSeJ6XXPgslAVg', N'https://www.google.com/url?rct=j&sa=t&url=https://prensa.presidencia.cl/fotografia.aspx%3Fid%3D77399&ct=ga&cd=CAIyHDEyOTA1MzM5NjVhMzg1MjE6Y29tOmVzOkNMOlI&usg=AFQjCNHsL-RW16dAONHurSeJ6XXPgslAVg', CAST(0x0000A90700000000 AS DateTime), NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[NOTICIAS] ([ID], [ID_ALERT], [TITULO], [AUTOR], [DESCRIPCION], [URL], [URLTOIMAGE], [PUBLICADO], [FUENTE_ID], [FUENTE_NOMBRE], [IdEstado], [Relevante], [IdComuna], [IdUsuarioAsignado], [UltimaFechaModificacion], [IdUsuarioAsignadoPor], [IdSubCategoria]) VALUES (N'tag:google.com,2013:googlealerts/feed:7838553032459934216', N'56389d94ac39c0f0:1290533965a38521:com:es:CL:R', N'Ex seremi por colapso del <b>puente</b> Cancura: &quot;Hicimos la pega de acuerdo a lo que indicaban los ...', N'', N'Luego de que la Intendencia de Los Lagos anunciara que se investigará a las autoridades del Gobierno de Michelle Bachelet, como también a las&nbsp;...', N'https://www.google.com/url?rct=j&sa=t&url=https://cambio21.cl/pais/ex-seremi-por-colapso-del-puente-cancura-hicimos-la-pega-de-acuerdo-a-lo-que-indicaban-los-informes-5b3185dfcd49b01f0208d1d5&ct=ga&cd=CAIyHDEyOTA1MzM5NjVhMzg1MjE6Y29tOmVzOkNMOlI&usg=AFQjCNFWHHUX7I9S7vbA4zu42jFPAWKg9g', N'https://www.google.com/url?rct=j&sa=t&url=https://cambio21.cl/pais/ex-seremi-por-colapso-del-puente-cancura-hicimos-la-pega-de-acuerdo-a-lo-que-indicaban-los-informes-5b3185dfcd49b01f0208d1d5&ct=ga&cd=CAIyHDEyOTA1MzM5NjVhMzg1MjE6Y29tOmVzOkNMOlI&usg=AFQjCNFWHHUX7I9S7vbA4zu42jFPAWKg9g', CAST(0x0000A90B00000000 AS DateTime), NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[NOTICIAS] ([ID], [ID_ALERT], [TITULO], [AUTOR], [DESCRIPCION], [URL], [URLTOIMAGE], [PUBLICADO], [FUENTE_ID], [FUENTE_NOMBRE], [IdEstado], [Relevante], [IdComuna], [IdUsuarioAsignado], [UltimaFechaModificacion], [IdUsuarioAsignadoPor], [IdSubCategoria]) VALUES (N'tag:google.com,2013:googlealerts/feed:784969100003635861', N'56389d94ac39c0f0:a592d9a300841f83:com:es:CL:R', N'Anuncian suspensión de tránsito en <b>Puente</b> Huepil de Pucón para trabajos de mantenimiento', N'', N'Suspenderán el tránsito vehicular sobre el <b>Puente</b> Huepil en Pucón para ... de mejoramiento del viaducto, ubicado en el <b>camino</b> Huife Caburgua.', N'https://www.google.com/url?rct=j&sa=t&url=https://www.biobiochile.cl/noticias/nacional/region-de-la-araucania/2018/06/19/anuncian-suspension-de-transito-en-puente-huepil-de-pucon-para-trabajos-de-mantenimiento.shtml&ct=ga&cd=CAIyHGE1OTJkOWEzMDA4NDFmODM6Y29tOmVzOkNMOlI&usg=AFQjCNFbsE8J52bQ7q4q56u1GQpNGDmt2g', N'https://www.google.com/url?rct=j&sa=t&url=https://www.biobiochile.cl/noticias/nacional/region-de-la-araucania/2018/06/19/anuncian-suspension-de-transito-en-puente-huepil-de-pucon-para-trabajos-de-mantenimiento.shtml&ct=ga&cd=CAIyHGE1OTJkOWEzMDA4NDFmODM6Y29tOmVzOkNMOlI&usg=AFQjCNFbsE8J52bQ7q4q56u1GQpNGDmt2g', CAST(0x0000A90500000000 AS DateTime), NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[NOTICIAS] ([ID], [ID_ALERT], [TITULO], [AUTOR], [DESCRIPCION], [URL], [URLTOIMAGE], [PUBLICADO], [FUENTE_ID], [FUENTE_NOMBRE], [IdEstado], [Relevante], [IdComuna], [IdUsuarioAsignado], [UltimaFechaModificacion], [IdUsuarioAsignadoPor], [IdSubCategoria]) VALUES (N'tag:google.com,2013:googlealerts/feed:7891381997360056728', N'56389d94ac39c0f0:07f0aa2d59cdbfa7:com:es:CL:R', N'Un fallecido y nueve heridos deja volcamiento de bus en Taltal', N'', N'El fatal accidente de tránsito se registró en el kilómetro 1.090 de la <b>ruta</b> 5 Norte, en la región de Antofagasta. ... #Samu #Taltal, <b>ampliación</b> de información, volcamiento de un bus con 33 pasajeros en el km 1095, lamentablemente 1&nbsp;...', N'https://www.google.com/url?rct=j&sa=t&url=http://www.24horas.cl/nacional/un-fallecido-y-nueve-heridos-deja-volcamiento-de-bus-en-taltal-2749739&ct=ga&cd=CAIyHDA3ZjBhYTJkNTljZGJmYTc6Y29tOmVzOkNMOlI&usg=AFQjCNEeLwjW5Lvtl_fN1iwRj0LUiGPz9w', N'https://www.google.com/url?rct=j&sa=t&url=http://www.24horas.cl/nacional/un-fallecido-y-nueve-heridos-deja-volcamiento-de-bus-en-taltal-2749739&ct=ga&cd=CAIyHDA3ZjBhYTJkNTljZGJmYTc6Y29tOmVzOkNMOlI&usg=AFQjCNEeLwjW5Lvtl_fN1iwRj0LUiGPz9w', CAST(0x0000A90B00000000 AS DateTime), NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[NOTICIAS] ([ID], [ID_ALERT], [TITULO], [AUTOR], [DESCRIPCION], [URL], [URLTOIMAGE], [PUBLICADO], [FUENTE_ID], [FUENTE_NOMBRE], [IdEstado], [Relevante], [IdComuna], [IdUsuarioAsignado], [UltimaFechaModificacion], [IdUsuarioAsignadoPor], [IdSubCategoria]) VALUES (N'tag:google.com,2013:googlealerts/feed:7896511895258949198', N'56389d94ac39c0f0:1290533965a38521:com:es:CL:R', N'Linares: un adulto mayor muere tras atropello de motociclista', N'', N'Los hechos se produjeron poco antes de las 20:00 horas del martes, en camino al sector Huapi, pasado el <b>Puente</b> Ancoa. Hasta el lugar concurrió&nbsp;...', N'https://www.google.com/url?rct=j&sa=t&url=http://www.diarioelheraldo.cl/noticia/linares-un-adulto-mayor-muere-tras-atropello-de-motociclista&ct=ga&cd=CAIyHDEyOTA1MzM5NjVhMzg1MjE6Y29tOmVzOkNMOlI&usg=AFQjCNFlv-C8zrB8yDqbkP9roFNDOcJfYg', N'https://www.google.com/url?rct=j&sa=t&url=http://www.diarioelheraldo.cl/noticia/linares-un-adulto-mayor-muere-tras-atropello-de-motociclista&ct=ga&cd=CAIyHDEyOTA1MzM5NjVhMzg1MjE6Y29tOmVzOkNMOlI&usg=AFQjCNFlv-C8zrB8yDqbkP9roFNDOcJfYg', CAST(0x0000A90600000000 AS DateTime), NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[NOTICIAS] ([ID], [ID_ALERT], [TITULO], [AUTOR], [DESCRIPCION], [URL], [URLTOIMAGE], [PUBLICADO], [FUENTE_ID], [FUENTE_NOMBRE], [IdEstado], [Relevante], [IdComuna], [IdUsuarioAsignado], [UltimaFechaModificacion], [IdUsuarioAsignadoPor], [IdSubCategoria]) VALUES (N'tag:google.com,2013:googlealerts/feed:7987085240610416005', N'56389d94ac39c0f0:1290533965a38521:com:es:CL:R', N'Puerto Aysén: Se amplió plazo de investigación del “Caso Mañao”', N'', N'... donde la noche del domingo 18 de marzo, luego de un llamado telefónico alertando posibles disparos en cercanías del <b>Puente</b> Presidente Ibáñez,&nbsp;...', N'https://www.google.com/url?rct=j&sa=t&url=http://www.diarioaysen.cl/sitio/2018/06/26/puerto-aysen-se-amplio-plazo-de-investigacion-del-caso-manao/&ct=ga&cd=CAIyHDEyOTA1MzM5NjVhMzg1MjE6Y29tOmVzOkNMOlI&usg=AFQjCNEyfrokwVCZsl0t6FH3zBy70CQovg', N'https://www.google.com/url?rct=j&sa=t&url=http://www.diarioaysen.cl/sitio/2018/06/26/puerto-aysen-se-amplio-plazo-de-investigacion-del-caso-manao/&ct=ga&cd=CAIyHDEyOTA1MzM5NjVhMzg1MjE6Y29tOmVzOkNMOlI&usg=AFQjCNEyfrokwVCZsl0t6FH3zBy70CQovg', CAST(0x0000A90B00000000 AS DateTime), NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[NOTICIAS] ([ID], [ID_ALERT], [TITULO], [AUTOR], [DESCRIPCION], [URL], [URLTOIMAGE], [PUBLICADO], [FUENTE_ID], [FUENTE_NOMBRE], [IdEstado], [Relevante], [IdComuna], [IdUsuarioAsignado], [UltimaFechaModificacion], [IdUsuarioAsignadoPor], [IdSubCategoria]) VALUES (N'tag:google.com,2013:googlealerts/feed:8301690981028227953', N'56389d94ac39c0f0:1290533965a38521:com:es:CL:R', N'Minvu confirma la expropiación de la casona patrimonial más antigua de Valdivia', N'', N'Según precisó el titular de la cartera, las obras del <b>Puente</b> Los Pelúes que se instalará en el lugar presentan un retraso en su construcción.', N'https://www.google.com/url?rct=j&sa=t&url=https://www.biobiochile.cl/noticias/nacional/region-de-los-rios/2018/06/21/minvu-confirma-la-expropiacion-de-la-casona-patrimonial-mas-antigua-de-valdivia.shtml&ct=ga&cd=CAIyHDEyOTA1MzM5NjVhMzg1MjE6Y29tOmVzOkNMOlI&usg=AFQjCNFP_A7L4ahJ1ilOto8Q4oDtJ3dr7A', N'https://www.google.com/url?rct=j&sa=t&url=https://www.biobiochile.cl/noticias/nacional/region-de-los-rios/2018/06/21/minvu-confirma-la-expropiacion-de-la-casona-patrimonial-mas-antigua-de-valdivia.shtml&ct=ga&cd=CAIyHDEyOTA1MzM5NjVhMzg1MjE6Y29tOmVzOkNMOlI&usg=AFQjCNFP_A7L4ahJ1ilOto8Q4oDtJ3dr7A', CAST(0x0000A90700000000 AS DateTime), NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[NOTICIAS] ([ID], [ID_ALERT], [TITULO], [AUTOR], [DESCRIPCION], [URL], [URLTOIMAGE], [PUBLICADO], [FUENTE_ID], [FUENTE_NOMBRE], [IdEstado], [Relevante], [IdComuna], [IdUsuarioAsignado], [UltimaFechaModificacion], [IdUsuarioAsignadoPor], [IdSubCategoria]) VALUES (N'tag:google.com,2013:googlealerts/feed:8477312081465787252', N'56389d94ac39c0f0:1290533965a38521:com:es:CL:R', N'derrumbe de un <b>puente</b> en el sur deja un muerto y seis heridos', N'', N'Según Carabineros, la estructura del <b>puente</b> Cancura, en el kilómetro 25 de la Ruta U-55, que une Osorno con Puerto Octay, cedió durante la&nbsp;...', N'https://www.google.com/url?rct=j&sa=t&url=http://www.anfavial.cl/index.php/noticias/49-infraestructura/865-derrumbe-de-un-puente-en-el-sur-deja-un-muerto-y-seis&ct=ga&cd=CAIyHDEyOTA1MzM5NjVhMzg1MjE6Y29tOmVzOkNMOlI&usg=AFQjCNEdZ426UXToVaIa0Qc4mQM1HaHk4w', N'https://www.google.com/url?rct=j&sa=t&url=http://www.anfavial.cl/index.php/noticias/49-infraestructura/865-derrumbe-de-un-puente-en-el-sur-deja-un-muerto-y-seis&ct=ga&cd=CAIyHDEyOTA1MzM5NjVhMzg1MjE6Y29tOmVzOkNMOlI&usg=AFQjCNEdZ426UXToVaIa0Qc4mQM1HaHk4w', CAST(0x0000A90B00000000 AS DateTime), NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[NOTICIAS] ([ID], [ID_ALERT], [TITULO], [AUTOR], [DESCRIPCION], [URL], [URLTOIMAGE], [PUBLICADO], [FUENTE_ID], [FUENTE_NOMBRE], [IdEstado], [Relevante], [IdComuna], [IdUsuarioAsignado], [UltimaFechaModificacion], [IdUsuarioAsignadoPor], [IdSubCategoria]) VALUES (N'tag:google.com,2013:googlealerts/feed:8524726593452415007', N'56389d94ac39c0f0:1290533965a38521:com:es:CL:R', N'Hermosa Casa Villa Los Olivos, <b>Puente</b> Alto', N'', N'Reyes Propiedades Vende Casa de 2 pisos ubicada en Villa Los Olivos ( Monte Sinaí / Piscis) comuna de <b>Puente</b> Alto, consta de recibos amplios y&nbsp;...', N'https://www.google.com/url?rct=j&sa=t&url=http://www.vivastreet.cl/compra-casas/puente-alto/hermosa-casa-villa-los-olivos--puente-alto/186654542&ct=ga&cd=CAIyHDEyOTA1MzM5NjVhMzg1MjE6Y29tOmVzOkNMOlI&usg=AFQjCNGIRHjSC-nR8dB1ywSb8zlRKFd8dw', N'https://www.google.com/url?rct=j&sa=t&url=http://www.vivastreet.cl/compra-casas/puente-alto/hermosa-casa-villa-los-olivos--puente-alto/186654542&ct=ga&cd=CAIyHDEyOTA1MzM5NjVhMzg1MjE6Y29tOmVzOkNMOlI&usg=AFQjCNGIRHjSC-nR8dB1ywSb8zlRKFd8dw', CAST(0x0000A90700000000 AS DateTime), NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[NOTICIAS] ([ID], [ID_ALERT], [TITULO], [AUTOR], [DESCRIPCION], [URL], [URLTOIMAGE], [PUBLICADO], [FUENTE_ID], [FUENTE_NOMBRE], [IdEstado], [Relevante], [IdComuna], [IdUsuarioAsignado], [UltimaFechaModificacion], [IdUsuarioAsignadoPor], [IdSubCategoria]) VALUES (N'tag:google.com,2013:googlealerts/feed:881916035571938941', N'56389d94ac39c0f0:1290533965a38521:com:es:CL:R', N'Derrumbe del <b>puente</b> Cancura deja un muerto y 6 heridos en Puerto Octay', N'', N'La estructura del <b>puente</b> Cancura, en el kilómetro 25 de la ruta U-55, que une Osorno con Puerto Octay, cedió durante la madrugada de este sábado.', N'https://www.google.com/url?rct=j&sa=t&url=https://www.biobiochile.cl/noticias/nacional/region-de-los-lagos/2018/06/23/derrumbe-del-puente-cancura-deja-un-muerto-y-6-heridos-en-puerto-octay.shtml&ct=ga&cd=CAIyHDEyOTA1MzM5NjVhMzg1MjE6Y29tOmVzOkNMOlI&usg=AFQjCNH6hjHB9oW5jbbdp9wO7cqwbHgVMg', N'https://www.google.com/url?rct=j&sa=t&url=https://www.biobiochile.cl/noticias/nacional/region-de-los-lagos/2018/06/23/derrumbe-del-puente-cancura-deja-un-muerto-y-6-heridos-en-puerto-octay.shtml&ct=ga&cd=CAIyHDEyOTA1MzM5NjVhMzg1MjE6Y29tOmVzOkNMOlI&usg=AFQjCNH6hjHB9oW5jbbdp9wO7cqwbHgVMg', CAST(0x0000A90800000000 AS DateTime), NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[NOTICIAS] ([ID], [ID_ALERT], [TITULO], [AUTOR], [DESCRIPCION], [URL], [URLTOIMAGE], [PUBLICADO], [FUENTE_ID], [FUENTE_NOMBRE], [IdEstado], [Relevante], [IdComuna], [IdUsuarioAsignado], [UltimaFechaModificacion], [IdUsuarioAsignadoPor], [IdSubCategoria]) VALUES (N'tag:google.com,2013:googlealerts/feed:9192632430301189879', N'56389d94ac39c0f0:1290533965a38521:com:es:CL:R', N'Expropiarán emblemática casona de Valdivia para construcción de un <b>puente</b>', N'', N'En su lugar se construirá un <b>puente</b> que una a Valdivia con Isla Teja, ... será expropiada la emblemática casona Lopetegui para construir el <b>puente</b>&nbsp;...', N'https://www.google.com/url?rct=j&sa=t&url=https://www.cooperativa.cl/noticias/pais/region-de-los-rios/expropiaran-emblematica-casona-de-valdivia-para-construccion-de-un/2018-06-21/172420.html&ct=ga&cd=CAIyHDEyOTA1MzM5NjVhMzg1MjE6Y29tOmVzOkNMOlI&usg=AFQjCNGPDu9B_1bI2VNJZpfZqbG-YOiZyg', N'https://www.google.com/url?rct=j&sa=t&url=https://www.cooperativa.cl/noticias/pais/region-de-los-rios/expropiaran-emblematica-casona-de-valdivia-para-construccion-de-un/2018-06-21/172420.html&ct=ga&cd=CAIyHDEyOTA1MzM5NjVhMzg1MjE6Y29tOmVzOkNMOlI&usg=AFQjCNGPDu9B_1bI2VNJZpfZqbG-YOiZyg', CAST(0x0000A90600000000 AS DateTime), NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[NOTICIAS] ([ID], [ID_ALERT], [TITULO], [AUTOR], [DESCRIPCION], [URL], [URLTOIMAGE], [PUBLICADO], [FUENTE_ID], [FUENTE_NOMBRE], [IdEstado], [Relevante], [IdComuna], [IdUsuarioAsignado], [UltimaFechaModificacion], [IdUsuarioAsignadoPor], [IdSubCategoria]) VALUES (N'tag:google.com,2013:googlealerts/feed:9226780821044479029', N'56389d94ac39c0f0:1290533965a38521:com:es:CL:R', N'Buscan fórmulas para subvencionar peaje', N'', N'“Esta es una situación que se veía venir, se sabía que la normalización del peaje estaba sujeta a la entrega del <b>puente</b>, sin embargo lo que no&nbsp;...', N'https://www.google.com/url?rct=j&sa=t&url=https://www.diarioconcepcion.cl/ciudad/2018/06/22/buscan-formulas-para-subvencionar-peaje.html&ct=ga&cd=CAIyHDEyOTA1MzM5NjVhMzg1MjE6Y29tOmVzOkNMOlI&usg=AFQjCNEoXCy--Fb9Ia-gXpPgW7Iv6vMggg', N'https://www.google.com/url?rct=j&sa=t&url=https://www.diarioconcepcion.cl/ciudad/2018/06/22/buscan-formulas-para-subvencionar-peaje.html&ct=ga&cd=CAIyHDEyOTA1MzM5NjVhMzg1MjE6Y29tOmVzOkNMOlI&usg=AFQjCNEoXCy--Fb9Ia-gXpPgW7Iv6vMggg', CAST(0x0000A90700000000 AS DateTime), NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[NOTICIAS] ([ID], [ID_ALERT], [TITULO], [AUTOR], [DESCRIPCION], [URL], [URLTOIMAGE], [PUBLICADO], [FUENTE_ID], [FUENTE_NOMBRE], [IdEstado], [Relevante], [IdComuna], [IdUsuarioAsignado], [UltimaFechaModificacion], [IdUsuarioAsignadoPor], [IdSubCategoria]) VALUES (N'tag:google.com,2013:googlealerts/feed:9446772137805753464', N'56389d94ac39c0f0:1290533965a38521:com:es:CL:R', N'Potent Pairings: El sonido de Tom Morello y Rage Against The Machine', N'', N'«La guitarra también tiene un <b>puente</b> Edge de Ibanez cual le permite a Morello manipular notas muted sin jalones de las cuerdas del trem bar.»&nbsp;...', N'https://www.google.com/url?rct=j&sa=t&url=https://www.futuro.cl/2018/06/potent-pairings-el-sonido-de-tom-morello-y-rage-against-the-machine/&ct=ga&cd=CAIyHDEyOTA1MzM5NjVhMzg1MjE6Y29tOmVzOkNMOlI&usg=AFQjCNG6fIcYXoPDdMP4nBoW2w4GP0DsTw', N'https://www.google.com/url?rct=j&sa=t&url=https://www.futuro.cl/2018/06/potent-pairings-el-sonido-de-tom-morello-y-rage-against-the-machine/&ct=ga&cd=CAIyHDEyOTA1MzM5NjVhMzg1MjE6Y29tOmVzOkNMOlI&usg=AFQjCNG6fIcYXoPDdMP4nBoW2w4GP0DsTw', CAST(0x0000A90600000000 AS DateTime), NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[NOTICIAS] ([ID], [ID_ALERT], [TITULO], [AUTOR], [DESCRIPCION], [URL], [URLTOIMAGE], [PUBLICADO], [FUENTE_ID], [FUENTE_NOMBRE], [IdEstado], [Relevante], [IdComuna], [IdUsuarioAsignado], [UltimaFechaModificacion], [IdUsuarioAsignadoPor], [IdSubCategoria]) VALUES (N'tag:google.com,2013:googlealerts/feed:9521288073186335633', N'56389d94ac39c0f0:1290533965a38521:com:es:CL:R', N'Ex seremi por colapso del <b>puente</b> Cancura: &quot;Hicimos la pega de acuerdo a lo que indicaban los ...', N'', N'Carlos Contreras habló con Cooperativa y aludió a estudios que indicaban la necesidad de reforzar el <b>puente</b>. El intendente Jürgensen aseguró que&nbsp;...', N'https://www.google.com/url?rct=j&sa=t&url=https://www.cooperativa.cl/noticias/pais/region-de-los-lagos/ex-seremi-por-colapso-del-puente-cancura-hicimos-la-pega-de-acuerdo-a/2018-06-25/171603.html&ct=ga&cd=CAIyHDEyOTA1MzM5NjVhMzg1MjE6Y29tOmVzOkNMOlI&usg=AFQjCNHeoKDDRlkzJVAs3RbJxQFJHlXoOA', N'https://www.google.com/url?rct=j&sa=t&url=https://www.cooperativa.cl/noticias/pais/region-de-los-lagos/ex-seremi-por-colapso-del-puente-cancura-hicimos-la-pega-de-acuerdo-a/2018-06-25/171603.html&ct=ga&cd=CAIyHDEyOTA1MzM5NjVhMzg1MjE6Y29tOmVzOkNMOlI&usg=AFQjCNHeoKDDRlkzJVAs3RbJxQFJHlXoOA', CAST(0x0000A90A00000000 AS DateTime), NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[NOTICIAS] ([ID], [ID_ALERT], [TITULO], [AUTOR], [DESCRIPCION], [URL], [URLTOIMAGE], [PUBLICADO], [FUENTE_ID], [FUENTE_NOMBRE], [IdEstado], [Relevante], [IdComuna], [IdUsuarioAsignado], [UltimaFechaModificacion], [IdUsuarioAsignadoPor], [IdSubCategoria]) VALUES (N'tag:google.com,2013:googlealerts/feed:9521857412247736431', N'56389d94ac39c0f0:1290533965a38521:com:es:CL:R', N'Sello Azul “humilla” a Akhand en Básquetbol Asociado', N'', N'... vez no fue la excepción, lo que quedó demostrado en el encuentro jugado en el Gimnasio Municipal “Irene Velásquez Valencia” de <b>Puente</b> Alto.', N'https://www.google.com/url?rct=j&sa=t&url=http://puentealtoaldia.cl/2018/06/20/sello-azul-humilla-a-akhand-en-basquetbol-asociado/&ct=ga&cd=CAIyHDEyOTA1MzM5NjVhMzg1MjE6Y29tOmVzOkNMOlI&usg=AFQjCNEmSaCpJGlwuJTqqG5tR_0PvSwncw', N'https://www.google.com/url?rct=j&sa=t&url=http://puentealtoaldia.cl/2018/06/20/sello-azul-humilla-a-akhand-en-basquetbol-asociado/&ct=ga&cd=CAIyHDEyOTA1MzM5NjVhMzg1MjE6Y29tOmVzOkNMOlI&usg=AFQjCNEmSaCpJGlwuJTqqG5tR_0PvSwncw', CAST(0x0000A90500000000 AS DateTime), NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[NOTICIAS] ([ID], [ID_ALERT], [TITULO], [AUTOR], [DESCRIPCION], [URL], [URLTOIMAGE], [PUBLICADO], [FUENTE_ID], [FUENTE_NOMBRE], [IdEstado], [Relevante], [IdComuna], [IdUsuarioAsignado], [UltimaFechaModificacion], [IdUsuarioAsignadoPor], [IdSubCategoria]) VALUES (N'tag:google.com,2013:googlealerts/feed:9591915897173456112', N'56389d94ac39c0f0:0daa7a2033c37535:com:es:CL:R', N'<b>Licitación</b>: &quot;Conservación de la red vial, mantenimiento varios <b>puentes</b> menores, región de Los Ríos&quot;', N'', N'DIRECCIÓN DE VIALIDAD REGIÓN DE LOS RIOS <b>LICITACIÓN</b> PÚBLICA DIGITAL &quot;Conservación de la red vial, mantenimiento varios <b>puentes</b>&nbsp;...', N'https://www.google.com/url?rct=j&sa=t&url=http://www.diariodelaconstruccion.cl/50100-2/&ct=ga&cd=CAIyHDBkYWE3YTIwMzNjMzc1MzU6Y29tOmVzOkNMOlI&usg=AFQjCNHX0f3n5vAuEy3ugGVy68swfZNrjg', N'https://www.google.com/url?rct=j&sa=t&url=http://www.diariodelaconstruccion.cl/50100-2/&ct=ga&cd=CAIyHDBkYWE3YTIwMzNjMzc1MzU6Y29tOmVzOkNMOlI&usg=AFQjCNHX0f3n5vAuEy3ugGVy68swfZNrjg', CAST(0x0000A90600000000 AS DateTime), NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[NOTICIAS] ([ID], [ID_ALERT], [TITULO], [AUTOR], [DESCRIPCION], [URL], [URLTOIMAGE], [PUBLICADO], [FUENTE_ID], [FUENTE_NOMBRE], [IdEstado], [Relevante], [IdComuna], [IdUsuarioAsignado], [UltimaFechaModificacion], [IdUsuarioAsignadoPor], [IdSubCategoria]) VALUES (N'tag:google.com,2013:googlealerts/feed:9598897809579070068', N'56389d94ac39c0f0:07f0aa2d59cdbfa7:com:es:CL:R', N'O&#39;Higgins: Carretera El Cobre es declarada como <b>ruta</b> pública y obras en el lugar comenzarán a ...', N'', N'... están terminado los diseños del proyecto, por lo cual se pretende iniciar a fines de 2019 las obras de <b>ampliación</b> de la <b>ruta</b> que une Rancagua con&nbsp;...', N'https://www.google.com/url?rct=j&sa=t&url=https://www.cooperativa.cl/noticias/pais/region-de-ohiggins/o-higgins-carretera-el-cobre-es-declarada-como-ruta-publica-y-obras-en/2018-06-21/190441.html&ct=ga&cd=CAIyHDA3ZjBhYTJkNTljZGJmYTc6Y29tOmVzOkNMOlI&usg=AFQjCNFMVxCdoQ0efZiLYJq06nOq0Ti26A', N'https://www.google.com/url?rct=j&sa=t&url=https://www.cooperativa.cl/noticias/pais/region-de-ohiggins/o-higgins-carretera-el-cobre-es-declarada-como-ruta-publica-y-obras-en/2018-06-21/190441.html&ct=ga&cd=CAIyHDA3ZjBhYTJkNTljZGJmYTc6Y29tOmVzOkNMOlI&usg=AFQjCNFMVxCdoQ0efZiLYJq06nOq0Ti26A', CAST(0x0000A90700000000 AS DateTime), NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[NOTICIAS] ([ID], [ID_ALERT], [TITULO], [AUTOR], [DESCRIPCION], [URL], [URLTOIMAGE], [PUBLICADO], [FUENTE_ID], [FUENTE_NOMBRE], [IdEstado], [Relevante], [IdComuna], [IdUsuarioAsignado], [UltimaFechaModificacion], [IdUsuarioAsignadoPor], [IdSubCategoria]) VALUES (N'tag:google.com,2013:googlealerts/feed:9688901378791208972', N'56389d94ac39c0f0:0daa7a2033c37535:com:es:CL:R', N'<b>Licitación</b>: &quot;Reposición <b>puente</b> Baguales n° 2, en ruta 240, sector Alto Baguales – túnel el Farellón ...', N'', N'DIRECCIÓN DE VIALIDAD REGIÓN DE AYSÉN <b>LICITACIÓN</b> PÚBLICA DIGITAL &quot;Reposición <b>puente</b> Baguales n° 2, en ruta 240, sector Alto Baguales&nbsp;...', N'https://www.google.com/url?rct=j&sa=t&url=http://www.diariodelaconstruccion.cl/licitacion-reposicion-puente-baguales-n-2-en-ruta-240-sector-alto-baguales-tunel-el-farellon-tramo-puente-baguales-n-2-km-2386-comuna-coyhaique-provincia-coy/&ct=ga&cd=CAIyHDBkYWE3YTIwMzNjMzc1MzU6Y29tOmVzOkNMOlI&usg=AFQjCNH-cNyN7aNiIiM8TqtZW2_y79gSww', N'https://www.google.com/url?rct=j&sa=t&url=http://www.diariodelaconstruccion.cl/licitacion-reposicion-puente-baguales-n-2-en-ruta-240-sector-alto-baguales-tunel-el-farellon-tramo-puente-baguales-n-2-km-2386-comuna-coyhaique-provincia-coy/&ct=ga&cd=CAIyHDBkYWE3YTIwMzNjMzc1MzU6Y29tOmVzOkNMOlI&usg=AFQjCNH-cNyN7aNiIiM8TqtZW2_y79gSww', CAST(0x0000A90500000000 AS DateTime), NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[NOTICIAS] ([ID], [ID_ALERT], [TITULO], [AUTOR], [DESCRIPCION], [URL], [URLTOIMAGE], [PUBLICADO], [FUENTE_ID], [FUENTE_NOMBRE], [IdEstado], [Relevante], [IdComuna], [IdUsuarioAsignado], [UltimaFechaModificacion], [IdUsuarioAsignadoPor], [IdSubCategoria]) VALUES (N'tag:google.com,2013:googlealerts/feed:9727823416906360999', N'56389d94ac39c0f0:1290533965a38521:com:es:CL:R', N'Jefe Aseguramiento Calidad', N'', N'... en búsqueda de un Jefe de Aseguramiento de Calidad para desempeñarse en el departamento de Control Calidad ubicado en <b>Puente</b> Alto. Misión', N'https://www.google.com/url?rct=j&sa=t&url=https://cl.linkedin.com/jobs/view/jefe-aseguramiento-calidad-at-cmpc-725003383&ct=ga&cd=CAIyHDEyOTA1MzM5NjVhMzg1MjE6Y29tOmVzOkNMOlI&usg=AFQjCNE-CnnTsMcrIqelhsnSO-x4p6GeDw', N'https://www.google.com/url?rct=j&sa=t&url=https://cl.linkedin.com/jobs/view/jefe-aseguramiento-calidad-at-cmpc-725003383&ct=ga&cd=CAIyHDEyOTA1MzM5NjVhMzg1MjE6Y29tOmVzOkNMOlI&usg=AFQjCNE-CnnTsMcrIqelhsnSO-x4p6GeDw', CAST(0x0000A90700000000 AS DateTime), NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[NOTICIAS] ([ID], [ID_ALERT], [TITULO], [AUTOR], [DESCRIPCION], [URL], [URLTOIMAGE], [PUBLICADO], [FUENTE_ID], [FUENTE_NOMBRE], [IdEstado], [Relevante], [IdComuna], [IdUsuarioAsignado], [UltimaFechaModificacion], [IdUsuarioAsignadoPor], [IdSubCategoria]) VALUES (N'tag:google.com,2013:googlealerts/feed:9747205606155060102', N'56389d94ac39c0f0:0daa7a2033c37535:com:es:CL:R', N'Licitan el primer proyecto vial compensatorio por La Punilla', N'', N'La obra en <b>licitación</b> considera la pavimentación total del camino, en base a TSD con polímero, apoyado sobre ... Carabineros hasta el sector del <b>Puente</b> Inglés no registra ningún grado de pavimentación y es lo que en conjunto con&nbsp;...', N'https://www.google.com/url?rct=j&sa=t&url=http://www.ladiscusion.cl/detalle/24078/Licitan-el-primer-proyecto-vial-compensatorio-por-La-Punilla&ct=ga&cd=CAIyHDBkYWE3YTIwMzNjMzc1MzU6Y29tOmVzOkNMOlI&usg=AFQjCNGcs4fYGqsWdaK-jER7IAHnKBIVNQ', N'https://www.google.com/url?rct=j&sa=t&url=http://www.ladiscusion.cl/detalle/24078/Licitan-el-primer-proyecto-vial-compensatorio-por-La-Punilla&ct=ga&cd=CAIyHDBkYWE3YTIwMzNjMzc1MzU6Y29tOmVzOkNMOlI&usg=AFQjCNGcs4fYGqsWdaK-jER7IAHnKBIVNQ', CAST(0x0000A90A00000000 AS DateTime), NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[NOTICIAS] ([ID], [ID_ALERT], [TITULO], [AUTOR], [DESCRIPCION], [URL], [URLTOIMAGE], [PUBLICADO], [FUENTE_ID], [FUENTE_NOMBRE], [IdEstado], [Relevante], [IdComuna], [IdUsuarioAsignado], [UltimaFechaModificacion], [IdUsuarioAsignadoPor], [IdSubCategoria]) VALUES (N'tag:google.com,2013:googlealerts/feed:9915341271039696056', N'56389d94ac39c0f0:07f0aa2d59cdbfa7:com:es:CL:R', N'Volcamiento de bus deja al menos un fallecido en Antofagasta', N'', N'... socorrer a un grupo de pasajeros tras el volcamiento de un bus en la <b>Ruta</b> 5 Norte a la altura de Taltal en el kilómetro 1090, en la región de Antofagasta. ... #Samu #Taltal, <b>ampliación</b> de información, volcamiento de un bus con 33&nbsp;...', N'https://www.google.com/url?rct=j&sa=t&url=http://www.t13.cl/noticia/nacional/volcamiento-bus-deja-al-menos-fallecido-antofagasta&ct=ga&cd=CAIyHDA3ZjBhYTJkNTljZGJmYTc6Y29tOmVzOkNMOlI&usg=AFQjCNEY1WZejes1qaCXY6a8hIHx_cZArQ', N'https://www.google.com/url?rct=j&sa=t&url=http://www.t13.cl/noticia/nacional/volcamiento-bus-deja-al-menos-fallecido-antofagasta&ct=ga&cd=CAIyHDA3ZjBhYTJkNTljZGJmYTc6Y29tOmVzOkNMOlI&usg=AFQjCNEY1WZejes1qaCXY6a8hIHx_cZArQ', CAST(0x0000A90B00000000 AS DateTime), NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[NOTICIAS] ([ID], [ID_ALERT], [TITULO], [AUTOR], [DESCRIPCION], [URL], [URLTOIMAGE], [PUBLICADO], [FUENTE_ID], [FUENTE_NOMBRE], [IdEstado], [Relevante], [IdComuna], [IdUsuarioAsignado], [UltimaFechaModificacion], [IdUsuarioAsignadoPor], [IdSubCategoria]) VALUES (N'tag:google.com,2013:googlealerts/feed:9932278729566867462', N'56389d94ac39c0f0:07f0aa2d59cdbfa7:com:es:CL:R', N'Coquimbo: Nueva <b>ruta</b> comenzará a operar en julio y el valor del peaje ya genera molestia', N'', N'El próximo 8 de julio comenzará a funcionar la <b>ampliación</b> de la <b>ruta</b> D43, que conecta Coquimbo con Ovalle y que desde el año 2013 fue sometida a&nbsp;...', N'https://www.google.com/url?rct=j&sa=t&url=https://www.cooperativa.cl/noticias/pais/region-de-coquimbo/coquimbo-nueva-ruta-comenzara-a-operar-en-julio-y-el-valor-del-peaje-ya/2018-06-24/101429.html&ct=ga&cd=CAIyHDA3ZjBhYTJkNTljZGJmYTc6Y29tOmVzOkNMOlI&usg=AFQjCNFkCKSCHHry7A1UDpKwoyg3_TMMWQ', N'https://www.google.com/url?rct=j&sa=t&url=https://www.cooperativa.cl/noticias/pais/region-de-coquimbo/coquimbo-nueva-ruta-comenzara-a-operar-en-julio-y-el-valor-del-peaje-ya/2018-06-24/101429.html&ct=ga&cd=CAIyHDA3ZjBhYTJkNTljZGJmYTc6Y29tOmVzOkNMOlI&usg=AFQjCNFkCKSCHHry7A1UDpKwoyg3_TMMWQ', CAST(0x0000A90A00000000 AS DateTime), NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[NOTICIAS] ([ID], [ID_ALERT], [TITULO], [AUTOR], [DESCRIPCION], [URL], [URLTOIMAGE], [PUBLICADO], [FUENTE_ID], [FUENTE_NOMBRE], [IdEstado], [Relevante], [IdComuna], [IdUsuarioAsignado], [UltimaFechaModificacion], [IdUsuarioAsignadoPor], [IdSubCategoria]) VALUES (N'tag:google.com,2013:googlealerts/feed:9954311361562699966', N'56389d94ac39c0f0:1290533965a38521:com:es:CL:R', N'Último minuto: Colapsa el <b>puente</b> Cancura y cobra la vida de una persona que cayó en su vehículo', N'', N'De acuerdo a información emanada desde Bomberos de Osorno, fue cerca de las 03.30am cuando se registró el sorpresivo colapso del <b>puente</b>&nbsp;...', N'https://www.google.com/url?rct=j&sa=t&url=https://www.radiosago.cl/ultimo-minuto-colapsa-el-puente-cancura-y-cobra-la-vida-de-una-persona-que-cayo-en-su-vehiculo/&ct=ga&cd=CAIyHDEyOTA1MzM5NjVhMzg1MjE6Y29tOmVzOkNMOlI&usg=AFQjCNGaA_8t0Qbpic_FY3OBiuMfXxLbAA', N'https://www.google.com/url?rct=j&sa=t&url=https://www.radiosago.cl/ultimo-minuto-colapsa-el-puente-cancura-y-cobra-la-vida-de-una-persona-que-cayo-en-su-vehiculo/&ct=ga&cd=CAIyHDEyOTA1MzM5NjVhMzg1MjE6Y29tOmVzOkNMOlI&usg=AFQjCNGaA_8t0Qbpic_FY3OBiuMfXxLbAA', CAST(0x0000A90800000000 AS DateTime), NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
/****** Object:  StoredProcedure [dbo].[stp_InUpUsuario]    Script Date: 06/26/2018 20:44:01 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE procedure [dbo].[stp_InUpUsuario]
(@idUsuario int, @Rut varchar(12), @Nombre varchar(100),@Email varchar(80),
@IdPerfil int,@Login varchar(20),@Clave varchar(20),@AreaCargo varchar(25),@Foto varchar(100),
@Activo int, @idUsuarioDiscador int)
as begin

if not exists (select IdUsuario from Usuario where LOGIN = @login)
begin

	INSERT INTO [dbo].[Usuario]
           ([Rut]
           ,[Nombre]
           ,[Email]
           ,[IdPerfil]
           ,[Login]
           ,[Clave]
           ,[AreaCargo]
           ,[Foto]
           ,[Activo],FechaCreacion,IdUsuarioDiscador)
     VALUES
           (@Rut
           ,@Nombre
           ,@Email
           ,@IdPerfil
           ,@Login
           ,@Clave
           ,@AreaCargo
           ,@Foto
           ,@Activo,getdate(),@idUsuarioDiscador)

   select Max(idUsuario) idUsuario from usuario

end
else
begin

	UPDATE [dbo].[Usuario]
	set [Rut] = @Rut
           ,[Nombre] = @nombre
           ,[Email] = @Email
           ,[IdPerfil] = @IdPerfil
           ,[Login] = @Login
           ,[Clave] = @Clave
           ,[AreaCargo] = @AreaCargo
           --,[Foto] = @Foto
           ,[Activo] = @Activo
		   ,IdUsuarioDiscador=@idUsuarioDiscador
		  
	where IdUsuario = @IdUsuario

	select idUsuario from usuario where IdUsuario = @IdUsuario
end
end


--select * from usuario
GO
/****** Object:  Table [dbo].[UsuarioSucursal]    Script Date: 06/26/2018 20:43:17 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[UsuarioSucursal](
	[IdUsuario] [int] NOT NULL,
	[IdSucursal] [varchar](10) NOT NULL,
 CONSTRAINT [PK_UsuarioSucursal] PRIMARY KEY CLUSTERED 
(
	[IdUsuario] ASC,
	[IdSucursal] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
INSERT [dbo].[UsuarioSucursal] ([IdUsuario], [IdSucursal]) VALUES (0, N'A')
INSERT [dbo].[UsuarioSucursal] ([IdUsuario], [IdSucursal]) VALUES (2, N'A')
/****** Object:  Table [dbo].[UsuarioMandante]    Script Date: 06/26/2018 20:43:17 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[UsuarioMandante](
	[IdUsuario] [int] NOT NULL,
	[IdMandante] [int] NOT NULL,
 CONSTRAINT [PK_UsuarioMandante] PRIMARY KEY CLUSTERED 
(
	[IdUsuario] ASC,
	[IdMandante] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
INSERT [dbo].[UsuarioMandante] ([IdUsuario], [IdMandante]) VALUES (2, 1)
INSERT [dbo].[UsuarioMandante] ([IdUsuario], [IdMandante]) VALUES (34, 1)
/****** Object:  Table [dbo].[Mensaje]    Script Date: 06/26/2018 20:43:17 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Mensaje](
	[IdMensaje] [int] IDENTITY(1,1) NOT NULL,
	[Asunto] [varchar](40) NULL,
	[Mensaje] [varchar](300) NOT NULL,
	[IdUsuarioPara] [int] NOT NULL,
	[IdUsuarioDe] [int] NOT NULL,
	[FechaIngreso] [smalldatetime] NOT NULL,
	[Leido] [tinyint] NULL,
 CONSTRAINT [PK_Mensajes] PRIMARY KEY CLUSTERED 
(
	[IdMensaje] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
SET IDENTITY_INSERT [dbo].[Mensaje] ON
INSERT [dbo].[Mensaje] ([IdMensaje], [Asunto], [Mensaje], [IdUsuarioPara], [IdUsuarioDe], [FechaIngreso], [Leido]) VALUES (22, N'sasksasaks', N'sssssssssss', 34, 2, CAST(0xA90A057F AS SmallDateTime), 0)
SET IDENTITY_INSERT [dbo].[Mensaje] OFF
/****** Object:  StoredProcedure [dbo].[stp_BuscarMandanteArchivo]    Script Date: 06/26/2018 20:43:53 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE procedure [dbo].[stp_BuscarMandanteArchivo]
  (@idMandante int)
  as begin

    select * from [dbo].[MandanteArchivos] ma
	inner join usuario u on u.IdUsuario = ma.IdUsuarioIngreso
	where idMandante=@idMandante

  end
GO
/****** Object:  StoredProcedure [dbo].[stp_BuscarMandante]    Script Date: 06/26/2018 20:43:53 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE procedure [dbo].[stp_BuscarMandante]
(@idMandante int, @nomMandante varchar(30), @razonSocial varchar(100), @giro varchar(50), @rut varchar(12), @activo int)
as begin


SELECT [IdMandante]
      ,[NomMandante]
      ,[RazonSocial]
      ,[Giro]
      ,[Rut]
      ,[Direccion]
      ,[NomComuna]
	  ,m.[IdComuna]
      ,[Telefono]
      ,[RepLegalNombre]
      ,[RepLegalRut]
      ,[ContactoNombre]
      ,[ContactoEmail]
      ,[DeudaNomAdic1]
      ,[DeudaNomAdic2]
      ,[DeudaNomAdic3]
      ,[DeudaNomAdic4]
      ,[DeudaNomAdic5]
      ,[DeudaNomAdic6]
      ,[DeudaNomAdic7]
      ,[DeudaNomAdic8]
      ,[DeudaNomAdic9]
      ,[DeudaNomAdic10]
      ,[DeudorNomAdic1]
      ,[DeudorNomAdic2]
      ,[DeudorNomAdic3]
      ,[DeudorNomAdic4]
      ,[DeudorNomAdic5]
      ,[TasaMaxConv]
      ,[IdTipoInteres]
      ,[IdTipoCliente]
      ,[InteresMora]
      ,[IdMoneda]
      ,[Activo]

	  ,case when activo = 1 then 'SI' else 'NO' end as activo2

	  ,rutalogo,
	  skin,NivelGestion,IdTipoTipificacion
  FROM [dbo].[Mandante] m
  left join comuna c on m.IdComuna = c.IdComuna
  WHERE ((@idMandante = 0) or (IdMandante = @idMandante)) 
  AND ((@nomMandante is null) or ([NomMandante] LIKE '%' + @nomMandante + '%'))
  AND ((@razonSocial is null) or ([RazonSocial] LIKE '%' + @razonSocial + '%'))
  AND ((@giro is null) or ([Giro] LIKE '%' + @giro + '%'))
  AND ((@rut is null) or ([Rut] = @rut))
  AND ((@activo = 0) or ([Activo] = @activo))

end
GO
/****** Object:  StoredProcedure [dbo].[stp_DelMandante]    Script Date: 06/26/2018 20:43:57 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE procedure [dbo].[stp_DelMandante]
(@idMandante int)
as begin

delete from mandante
where idMandante = @idMandante

end
GO
/****** Object:  StoredProcedure [dbo].[stp_BuscarUsuarioPorPerfil]    Script Date: 06/26/2018 20:43:56 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE procedure [dbo].[stp_BuscarUsuarioPorPerfil]
(@idPerfil varchar(20),@activo int)
as begin

select * from usuario u
left join PERFIL p on u.idPerfil = p.idPerfil
where

 ((@idPerfil is null) or (u.[IdPerfil] in (SELECT value FROM dbo.f_params_to_list(@idPerfil))))
and ((@activo = 0) or (u.[Activo] = @activo))
--((@idEstado is null) or (s.ID_ESTADO in(SELECT value FROM dbo.f_params_to_list(@idEstado))))

end
GO
/****** Object:  StoredProcedure [dbo].[stp_BuscarUsuario]    Script Date: 06/26/2018 20:43:55 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE procedure [dbo].[stp_BuscarUsuario]
(@idUsuario int, @rut varchar(12), @nombre varchar(100), @idPerfil int, @login varchar(20), @clave varchar(20), @areaCargo varchar(25), @activo int)
as begin

SELECT [IdUsuario]
      ,[Rut]
      ,[Nombre]
      ,[Email]
      ,u.[IdPerfil]
      ,[Login]
      ,[Clave]
      ,[AreaCargo]
      ,u.[Activo]
	  ,foto
	  ,p.nomPerfil
	  ,case when u.activo = 1 then 'SI' else 'NO' end as activo2,FechaCreacion
	  ,IdSucursal
FROM [dbo].[Usuario] u
left join PERFIL p on u.idPerfil = p.idPerfil
WHERE ((@idUsuario = 0) or ([IdUsuario] = @idUsuario))
and ((@rut is null) or ([Rut] = @rut))
and ((@nombre is null) or ([Nombre] LIKE '%' + @nombre + '%'))
and ((@idPerfil = 0) or (u.[IdPerfil] = @idPerfil))
and ((@login is null) or ([Login] = @login))
and ((@clave is null) or ([Clave] = @clave))
and ((@areaCargo is null) or ([AreaCargo] LIKE '%' + @areaCargo + '%'))
and ((@activo = 0) or (u.[Activo] = @activo))

and IdUsuario <> 0 and IdUsuario < 10000


end
GO
/****** Object:  StoredProcedure [dbo].[stp_DelUsuario]    Script Date: 06/26/2018 20:43:58 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE procedure [dbo].[stp_DelUsuario](@IdUsuario int)
as begin
delete from usuario where IdUsuario=@Idusuario
end
GO
/****** Object:  StoredProcedure [dbo].[stp_BuscarUsuarioExporte]    Script Date: 06/26/2018 20:43:56 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE procedure [dbo].[stp_BuscarUsuarioExporte]

as begin

SELECT [IdUsuario]
      ,[Rut]
      ,[Nombre]
      ,[Email]
      ,[Login]
      ,[AreaCargo]
      ,u.[Activo]
	  ,p.nomPerfil
FROM [dbo].[Usuario] u
left join PERFIL p on u.idPerfil = p.idPerfil
WHERE IdUsuario <> 0 and IdUsuario < 10000


end
GO
/****** Object:  StoredProcedure [dbo].[stp_InMandante]    Script Date: 06/26/2018 20:43:59 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE procedure [dbo].[stp_InMandante]
       (@IdMandante int,
       @NomMandante varchar(30),
       @RazonSocial varchar(100),
       @Giro varchar(50),
       @Rut varchar(12),
       @Direccion varchar(80),
       @Comuna varchar(50),
       @Telefono varchar(12),
       @RepLegalNombre varchar(80),
       @RepLegalRut varchar(12),
       @ContactoNombre varchar(80),
       @ContactoEmail varchar(80),
       @DeudaNomAdic1 varchar(25),
       @DeudaNomAdic2 varchar(25),
       @DeudaNomAdic3 varchar(25),
       @DeudaNomAdic4 varchar(25),
       @DeudaNomAdic5 varchar(25),
       @DeudaNomAdic6 varchar(25),
       @DeudaNomAdic7 varchar(25),
       @DeudaNomAdic8 varchar(25),
       @DeudaNomAdic9 varchar(25),
       @DeudaNomAdic10 varchar(25),
       @DeudorNomAdic1 varchar(25),
       @DeudorNomAdic2 varchar(25),
       @DeudorNomAdic3 varchar(25),
       @DeudorNomAdic4 varchar(25),
       @DeudorNomAdic5 varchar(25),
       @TasaMaxConv money,
       @IdTipoInteres tinyint,
       @IdTipoCliente tinyint,
       @InteresMora money,
       @IdMoneda tinyint,
       @Activo tinyint,
       @RutaLogo varchar(100),
       @Skin varchar(20)
       )
as begin

INSERT INTO [dbo].[Mandante]
           ([IdMandante]
           ,[NomMandante]
           ,[RazonSocial]
           ,[Giro]
           ,[Rut]
           ,[Direccion]
           ,[IdComuna]
           ,[Telefono]
           ,[RepLegalNombre]
           ,[RepLegalRut]
           ,[ContactoNombre]
           ,[ContactoEmail]
           ,[DeudaNomAdic1]
           ,[DeudaNomAdic2]
           ,[DeudaNomAdic3]
           ,[DeudaNomAdic4]
           ,[DeudaNomAdic5]
           ,[DeudaNomAdic6]
           ,[DeudaNomAdic7]
           ,[DeudaNomAdic8]
           ,[DeudaNomAdic9]
           ,[DeudaNomAdic10]
           ,[DeudorNomAdic1]
           ,[DeudorNomAdic2]
           ,[DeudorNomAdic3]
           ,[DeudorNomAdic4]
           ,[DeudorNomAdic5]
           ,[TasaMaxConv]
           ,[IdTipoInteres]
           ,[IdTipoCliente]
           ,[InteresMora]
           ,[IdMoneda]
           ,[Activo]
           ,[RutaLogo]
           ,[Skin])
     VALUES
          (@IdMandante,
       @NomMandante,
       @RazonSocial,
       @Giro,
       @Rut,
       @Direccion,
       @Comuna,
       @Telefono,
       @RepLegalNombre,
       @RepLegalRut,
       @ContactoNombre,
       @ContactoEmail ,
       @DeudaNomAdic1 ,
       @DeudaNomAdic2 ,
       @DeudaNomAdic3 ,
       @DeudaNomAdic4 ,
       @DeudaNomAdic5 ,
       @DeudaNomAdic6 ,
       @DeudaNomAdic7 ,
       @DeudaNomAdic8 ,
       @DeudaNomAdic9 ,
       @DeudaNomAdic10 ,
       @DeudorNomAdic1 ,
       @DeudorNomAdic2 ,
       @DeudorNomAdic3 ,
       @DeudorNomAdic4 ,
       @DeudorNomAdic5 ,
       @TasaMaxConv ,
       @IdTipoInteres ,
       @IdTipoCliente ,
       @InteresMora ,
       @IdMoneda ,
       @Activo ,
       @RutaLogo,
       @Skin
       )
end



select * from mandante
GO
/****** Object:  StoredProcedure [dbo].[stp_IngresoNoticia]    Script Date: 06/26/2018 20:43:59 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create procedure [dbo].[stp_IngresoNoticia]
  (@id varchar(100),@idAlert varchar(100),@titulo varchar(max),@autor varchar(200),@descripcion varchar(max),
  @url varchar(max),@urlToImage varchar(max),@publicado varchar(100))
  as begin

  if not exists(select * from NOTICIAS where id = @id)
  begin
	insert into NOTICIAS(ID,ID_ALERT,TITULO,AUTOR,DESCRIPCION,URL,URLTOIMAGE,PUBLICADO)
	values(@id,@idAlert,@titulo,@autor,@descripcion,@url,@urlToImage,@publicado)

  end

  end
GO
/****** Object:  StoredProcedure [dbo].[stp_InUpMandante]    Script Date: 06/26/2018 20:44:00 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE procedure [dbo].[stp_InUpMandante]
       (@IdMandante int,
       @NomMandante varchar(30),
       @RazonSocial varchar(100),
       @Giro varchar(50),
       @Rut varchar(12),
       @Direccion varchar(80),
       @IdComuna varchar(10),
       @Telefono varchar(12),
       @RepLegalNombre varchar(80),
       @RepLegalRut varchar(12),
       @ContactoNombre varchar(80),
       @ContactoEmail varchar(80),
       @DeudaNomAdic1 varchar(25),
       @DeudaNomAdic2 varchar(25),
       @DeudaNomAdic3 varchar(25),
       @DeudaNomAdic4 varchar(25),
       @DeudaNomAdic5 varchar(25),
       @DeudaNomAdic6 varchar(25),
       @DeudaNomAdic7 varchar(25),
       @DeudaNomAdic8 varchar(25),
       @DeudaNomAdic9 varchar(25),
       @DeudaNomAdic10 varchar(25),
       @DeudorNomAdic1 varchar(25),
       @DeudorNomAdic2 varchar(25),
       @DeudorNomAdic3 varchar(25),
       @DeudorNomAdic4 varchar(25),
       @DeudorNomAdic5 varchar(25),
       @TasaMaxConv money,
       @IdTipoInteres tinyint,
       @IdTipoCliente tinyint,
       @InteresMora money,
       @IdMoneda tinyint,
       @Activo tinyint,
       @RutaLogo varchar(100),
       @Skin varchar(20),
	   @IdTipoTipificacion int
       )
as begin


if not exists (select idmandante from Mandante where idmandante = @IdMandante)
begin

INSERT INTO [dbo].[Mandante]
           ([IdMandante]
           ,[NomMandante]
           ,[RazonSocial]
           ,[Giro]
           ,[Rut]
           ,[Direccion]
           ,[IdComuna]
           ,[Telefono]
           ,[RepLegalNombre]
           ,[RepLegalRut]
           ,[ContactoNombre]
           ,[ContactoEmail]
           ,[DeudaNomAdic1]
           ,[DeudaNomAdic2]
           ,[DeudaNomAdic3]
           ,[DeudaNomAdic4]
           ,[DeudaNomAdic5]
           ,[DeudaNomAdic6]
           ,[DeudaNomAdic7]
           ,[DeudaNomAdic8]
           ,[DeudaNomAdic9]
           ,[DeudaNomAdic10]
           ,[DeudorNomAdic1]
           ,[DeudorNomAdic2]
           ,[DeudorNomAdic3]
           ,[DeudorNomAdic4]
           ,[DeudorNomAdic5]
           ,[TasaMaxConv]
           ,[IdTipoInteres]
           ,[IdTipoCliente]
           ,[InteresMora]
           ,[IdMoneda]
           ,[Activo]
           ,[RutaLogo]
           ,[Skin]
		   ,[IdTipoTipificacion])
     VALUES
          (@IdMandante,
       @NomMandante,
       @RazonSocial,
       @Giro,
       @Rut,
       @Direccion,
       @IdComuna,
       @Telefono,
       @RepLegalNombre,
       @RepLegalRut,
       @ContactoNombre,
       @ContactoEmail ,
       @DeudaNomAdic1 ,
       @DeudaNomAdic2 ,
       @DeudaNomAdic3 ,
       @DeudaNomAdic4 ,
       @DeudaNomAdic5 ,
       @DeudaNomAdic6 ,
       @DeudaNomAdic7 ,
       @DeudaNomAdic8 ,
       @DeudaNomAdic9 ,
       @DeudaNomAdic10 ,
       @DeudorNomAdic1 ,
       @DeudorNomAdic2 ,
       @DeudorNomAdic3 ,
       @DeudorNomAdic4 ,
       @DeudorNomAdic5 ,
       @TasaMaxConv ,
       @IdTipoInteres ,
       @IdTipoCliente ,
       @InteresMora ,
       @IdMoneda ,
       @Activo ,
       @RutaLogo,
       @Skin,@IdTipoTipificacion
       )
end
else
begin

UPDATE [dbo].[Mandante]
   SET 
      [NomMandante] = @NomMandante
      ,[RazonSocial] = @RazonSocial
      ,[Giro] = @Giro
      ,[Rut] = @Rut
      ,[Direccion] = @Direccion
      ,[IdComuna] = @IdComuna
      ,[Telefono] = @Telefono
      ,[RepLegalNombre] = @RepLegalNombre
      ,[RepLegalRut] = @RepLegalRut
      ,[ContactoNombre] = @ContactoNombre
      ,[ContactoEmail] = @ContactoEmail 
      ,[DeudaNomAdic1] = @DeudaNomAdic1
      ,[DeudaNomAdic2] = @DeudaNomAdic2
      ,[DeudaNomAdic3] = @DeudaNomAdic3
      ,[DeudaNomAdic4] = @DeudaNomAdic4
      ,[DeudaNomAdic5] = @DeudaNomAdic5
      ,[DeudaNomAdic6] = @DeudaNomAdic6
      ,[DeudaNomAdic7] = @DeudaNomAdic7
      ,[DeudaNomAdic8] = @DeudaNomAdic8
      ,[DeudaNomAdic9] = @DeudaNomAdic9
      ,[DeudaNomAdic10] = @DeudaNomAdic10
      ,[DeudorNomAdic1] = @DeudorNomAdic1
      ,[DeudorNomAdic2] = @DeudorNomAdic2
      ,[DeudorNomAdic3] = @DeudorNomAdic3
      ,[DeudorNomAdic4] = @DeudorNomAdic4
      ,[DeudorNomAdic5] = @DeudorNomAdic5
      ,[TasaMaxConv] = @TasaMaxConv
      ,[IdTipoInteres] = @IdTipoInteres
      ,[IdTipoCliente] = @IdTipoCliente
      ,[InteresMora] = @InteresMora
      ,[IdMoneda] = @IdMoneda
      ,[Activo] = @Activo
      --,[RutaLogo] = @RutaLogo
      ,[Skin] = @Skin
	  ,[IdTipoTipificacion] = @IdTipoTipificacion
 WHERE [IdMandante] = @IdMandante

end
end
GO
/****** Object:  StoredProcedure [dbo].[stp_ValUsuario]    Script Date: 06/26/2018 20:44:03 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE procedure [dbo].[stp_ValUsuario]
(@login varchar(100))
as begin

select * from [Usuario]
where login=@login

end
GO
/****** Object:  StoredProcedure [dbo].[stp_ValMandante]    Script Date: 06/26/2018 20:44:03 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE procedure [dbo].[stp_ValMandante]
(@idMandante int)
as begin

	select * from mandante
	where IdMandante=@idMandante

end
GO
/****** Object:  StoredProcedure [dbo].[stp_UpPassword]    Script Date: 06/26/2018 20:44:03 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE procedure [dbo].[stp_UpPassword]
(@idUsuario int, @clave varchar(20))
as begin

update usuario
set clave=@clave
where idUsuario=@idUsuario

end
GO
/****** Object:  StoredProcedure [dbo].[stp_UpLogoMandante]    Script Date: 06/26/2018 20:44:02 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE procedure [dbo].[stp_UpLogoMandante]
(@idMandante int, @logo varchar(100))
as begin

update mandante
set rutaLogo=@logo
where idMandante=@idMandante

end
GO
/****** Object:  StoredProcedure [dbo].[stp_UpFotoUsuario]    Script Date: 06/26/2018 20:44:02 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE procedure [dbo].[stp_UpFotoUsuario]
(@idUsuario int, @Foto varchar(100))
as begin

update usuario
set foto=@foto
where IdUsuario=@idusuario

end
GO
/****** Object:  StoredProcedure [dbo].[stp_InUsuarioPorSucursal]    Script Date: 06/26/2018 20:44:02 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE procedure [dbo].[stp_InUsuarioPorSucursal]
(@idUsuario int, @idSucursal varchar(10))
as begin

insert into UsuarioSucursal(IdUsuario,IdSucursal)
values(@idUsuario,@idSucursal)

end
GO
/****** Object:  StoredProcedure [dbo].[stp_InUsuarioMandante]    Script Date: 06/26/2018 20:44:01 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE procedure [dbo].[stp_InUsuarioMandante]
(@IdUsuario int, @IdMandante int)
as begin

insert into [dbo].[UsuarioMandante](IdUsuario,IdMandante)
values (@IdUsuario, @IdMandante)

end
GO
/****** Object:  StoredProcedure [dbo].[stp_InMensaje]    Script Date: 06/26/2018 20:44:00 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create procedure [dbo].[stp_InMensaje](@asunto varchar(10),@mensaje varchar(300),@idUsuarioPara int, @idUsuarioDe int)
  as begin

  insert into [dbo].[Mensaje](Asunto,Mensaje,IdusuarioPara,IdUsuarioDe,FechaIngreso,Leido)
  values(@asunto,@mensaje,@idUsuarioPara,@idUsuarioDe,getdate(),0)

  end
GO
/****** Object:  StoredProcedure [dbo].[stp_DelUsuarioSucursal]    Script Date: 06/26/2018 20:43:58 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create procedure [dbo].[stp_DelUsuarioSucursal]
(@idUsuario int)
as begin

delete from UsuarioSucursal
where IdUsuario = @idUsuario

end
GO
/****** Object:  StoredProcedure [dbo].[stp_DelUsuarioMandante]    Script Date: 06/26/2018 20:43:58 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE procedure [dbo].[stp_DelUsuarioMandante]
(@idUsuario int)
as begin

delete from UsuarioMandante
where IdUsuario = @idUsuario
end
GO
/****** Object:  StoredProcedure [dbo].[stp_DelMensaje]    Script Date: 06/26/2018 20:43:57 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE procedure [dbo].[stp_DelMensaje]
(@idUsuario int)
as begin

delete from [dbo].[Mensaje]
where IDUsuarioDe=@idUsuario 

delete from [dbo].[Mensaje] 
where IdUsuarioPara=@idUsuario

delete from [dbo].[UsuarioSucursal]
where idUsuario=@idUsuario
end
GO
/****** Object:  StoredProcedure [dbo].[stp_BuscarSucursalPorUsuario]    Script Date: 06/26/2018 20:43:55 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create procedure [dbo].[stp_BuscarSucursalPorUsuario]
(@idUsuario int)
as begin


select * from sucursal s
inner join UsuarioSucursal us on s.IdSucursal=us.IdSucursal
where idUsuario=@idUsuario

end
GO
/****** Object:  StoredProcedure [dbo].[stp_BuscarUsuarioMandante]    Script Date: 06/26/2018 20:43:56 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE procedure [dbo].[stp_BuscarUsuarioMandante]
(@idUsuario int)
as begin

select * from usuarioMandante um
inner join Mandante m on um.IdMandante = m.IdMandante
where idUsuario=@idUsuario
and activo=1

end
GO
/****** Object:  StoredProcedure [dbo].[stp_BuscarMensajes]    Script Date: 06/26/2018 20:43:54 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE procedure [dbo].[stp_BuscarMensajes](@idUsuario int, @leido int)
  as begin

  select *,'~/'+foto as fotografia, Substring(Mensaje,0,60) as Msj,datediff(DAY,m.FechaIngreso,getdate()) as dias
  from [dbo].[Mensaje] m
  inner join Usuario u on m.IdUsuarioDe=u.IdUsuario

  where IdUsuarioPara=@idUsuario
  and ((@leido is null) or (Leido = @leido))

  
  order by fechaIngreso desc 

  end
GO
/****** Object:  StoredProcedure [dbo].[stp_BuscarMensajePorId]    Script Date: 06/26/2018 20:43:54 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create procedure [dbo].[stp_BuscarMensajePorId]
  (@idMensaje int)
  as begin

  select *,'~/'+foto as fotografia, Substring(Mensaje,0,60) as Msj,datediff(DAY,m.FechaIngreso,getdate()) as dias
  from [dbo].[Mensaje] m
  inner join Usuario u on m.IdUsuarioDe=u.IdUsuario
  where idMensaje=@idMensaje

  end
GO
/****** Object:  StoredProcedure [dbo].[stp_BuscarMandantesGeneral]    Script Date: 06/26/2018 20:43:53 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
--stp_BuscarMandantesGeneral 1,null
CREATE procedure [dbo].[stp_BuscarMandantesGeneral]
(@activo int, @idUsuario int)
as begin

select distinct(m.IdSucursal),m.NomSucursal,--m.RutaLogo,
(select count(distinct RUTDEUDOR) AS RUT_ASIGNADO
from Deuda D
where D.idSucursal = m.IdSucursal) as RUT_ASIGNADOS
,
ISNULL((select Round(SUM(DeudaOriginal)/1000,0) AS MONTO_ASIGNADO
from Deuda D
where D.idSucursal = m.IdSucursal),0) as Monto_Asignado
/*,
ISNULL((select Round(SUM(DeudaOriginal-Saldo)/1000,0) AS MONTO_PAGOS_ABONOS from Deuda
where idSucursal = m.IdSucursal and IdEstadoDeuda in (3,4,5,6)),0) AS PAGOS_ABONO

select * from PagosAirLiquide
*/
,
ISNULL((SELECT Round(SUM(VALOR_BAJA)/1000,0) AS MONTO_PAGOS_ABONOS 
FROM PagosAirLiquide where Cod_Sucursal = m.IdSucursal
and datediff(day,FECHA_REFERENCIA,getdate()) < 30
-- and FECHA_REFERENCIA=month(getdate()) and FECHA_REFERENCIA = year(getdate())
--select * from PagosAirLiquide where datediff(day,FECHA_REFERENCIA,getdate()) < 30
),0) AS PAGOS_ABONO
,
ISNULL((select COUNT(distinct rutdeudor) from deuda d
where D.idSucursal = m.IdSucursal),0) as Saldo_Activo
,
ISNULL((select Round(SUM(Saldo)/1000,0) AS MONTO_RETIROS from Deuda
where idSucursal = m.IdSucursal and 
DATEDIFF(day,FechaVencimiento,GETDATE()) > 272),0) as RETIRO

from sucursal m
--inner join UsuarioSucursal us on s.IdSucursal=us.IdSucursal
inner join UsuarioSucursal um on m.IdSucursal = um.IdSucursal
where m.activo=@activo
and ((@idUsuario is null) or (um.IdUsuario=@idUsuario))









end

--Round(SUM(DeudaOriginal)/1000,0) AS MONTO_ASIGNADO, Round(SUM(SALDO)/1000,0) as SALDO_ACTIVO 

--select * from estadoDeuda
--
/*
select * from Sucursal m inner join UsuarioSucursal um on m.IdSucursal = um.IdSucursal
where um.IdUsuario=4
select * from [dbo].[UsuarioSucursal]

select * from Usuario
*/
GO
/****** Object:  ForeignKey [FK_Mandante_Comuna]    Script Date: 06/26/2018 20:43:17 ******/
ALTER TABLE [dbo].[Mandante]  WITH CHECK ADD  CONSTRAINT [FK_Mandante_Comuna] FOREIGN KEY([IdComuna])
REFERENCES [dbo].[Comuna] ([IdComuna])
GO
ALTER TABLE [dbo].[Mandante] CHECK CONSTRAINT [FK_Mandante_Comuna]
GO
/****** Object:  ForeignKey [FK_Mensaje_Usuario]    Script Date: 06/26/2018 20:43:17 ******/
ALTER TABLE [dbo].[Mensaje]  WITH CHECK ADD  CONSTRAINT [FK_Mensaje_Usuario] FOREIGN KEY([IdUsuarioDe])
REFERENCES [dbo].[Usuario] ([IdUsuario])
GO
ALTER TABLE [dbo].[Mensaje] CHECK CONSTRAINT [FK_Mensaje_Usuario]
GO
/****** Object:  ForeignKey [FK_Mensaje_Usuario1]    Script Date: 06/26/2018 20:43:17 ******/
ALTER TABLE [dbo].[Mensaje]  WITH CHECK ADD  CONSTRAINT [FK_Mensaje_Usuario1] FOREIGN KEY([IdUsuarioPara])
REFERENCES [dbo].[Usuario] ([IdUsuario])
GO
ALTER TABLE [dbo].[Mensaje] CHECK CONSTRAINT [FK_Mensaje_Usuario1]
GO
/****** Object:  ForeignKey [FK_NOTICIAS_Estado]    Script Date: 06/26/2018 20:43:17 ******/
ALTER TABLE [dbo].[NOTICIAS]  WITH CHECK ADD  CONSTRAINT [FK_NOTICIAS_Estado] FOREIGN KEY([IdEstado])
REFERENCES [dbo].[Estado] ([IdEstado])
GO
ALTER TABLE [dbo].[NOTICIAS] CHECK CONSTRAINT [FK_NOTICIAS_Estado]
GO
/****** Object:  ForeignKey [FK_Usuario_Perfil]    Script Date: 06/26/2018 20:43:17 ******/
ALTER TABLE [dbo].[Usuario]  WITH CHECK ADD  CONSTRAINT [FK_Usuario_Perfil] FOREIGN KEY([IdPerfil])
REFERENCES [dbo].[Perfil] ([IdPerfil])
GO
ALTER TABLE [dbo].[Usuario] CHECK CONSTRAINT [FK_Usuario_Perfil]
GO
/****** Object:  ForeignKey [FK_UsuarioMandante_MANDANTE]    Script Date: 06/26/2018 20:43:17 ******/
ALTER TABLE [dbo].[UsuarioMandante]  WITH CHECK ADD  CONSTRAINT [FK_UsuarioMandante_MANDANTE] FOREIGN KEY([IdMandante])
REFERENCES [dbo].[Mandante] ([IdMandante])
GO
ALTER TABLE [dbo].[UsuarioMandante] CHECK CONSTRAINT [FK_UsuarioMandante_MANDANTE]
GO
/****** Object:  ForeignKey [FK_UsuarioMandante_Usuario]    Script Date: 06/26/2018 20:43:17 ******/
ALTER TABLE [dbo].[UsuarioMandante]  WITH CHECK ADD  CONSTRAINT [FK_UsuarioMandante_Usuario] FOREIGN KEY([IdUsuario])
REFERENCES [dbo].[Usuario] ([IdUsuario])
GO
ALTER TABLE [dbo].[UsuarioMandante] CHECK CONSTRAINT [FK_UsuarioMandante_Usuario]
GO
/****** Object:  ForeignKey [FK_UsuarioSucursal_Sucursal]    Script Date: 06/26/2018 20:43:17 ******/
ALTER TABLE [dbo].[UsuarioSucursal]  WITH CHECK ADD  CONSTRAINT [FK_UsuarioSucursal_Sucursal] FOREIGN KEY([IdSucursal])
REFERENCES [dbo].[Sucursal] ([IdSucursal])
GO
ALTER TABLE [dbo].[UsuarioSucursal] CHECK CONSTRAINT [FK_UsuarioSucursal_Sucursal]
GO
/****** Object:  ForeignKey [FK_UsuarioSucursal_Usuario]    Script Date: 06/26/2018 20:43:17 ******/
ALTER TABLE [dbo].[UsuarioSucursal]  WITH CHECK ADD  CONSTRAINT [FK_UsuarioSucursal_Usuario] FOREIGN KEY([IdUsuario])
REFERENCES [dbo].[Usuario] ([IdUsuario])
GO
ALTER TABLE [dbo].[UsuarioSucursal] CHECK CONSTRAINT [FK_UsuarioSucursal_Usuario]
GO
