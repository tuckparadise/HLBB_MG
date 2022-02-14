CREATE TABLE [dbo].[SolPDFPasswordSetting](
	[sol_op1_firstXchar] [int] NULL,
	[sol_op1_static] [int] NULL,
	[sol_op1_static_text] [nvarchar](max) NULL,
	[sol_op1_fieldname] [nvarchar](max) NULL,
	[sol_op1_enabled] [int] NULL,
	[sol_op2_firstXchar] [int] NULL,
	[sol_op2_static] [int] NULL,
	[sol_op2_static_text] [nvarchar](max) NULL,
	[sol_op2_fieldname] [nvarchar](max) NULL,
	[sol_op2_enabled] [int] NULL,
	[sol_op3_firstXchar] [int] NULL,
	[sol_op3_static] [int] NULL,
	[sol_op3_static_text] [nvarchar](max) NULL,
	[sol_op3_fieldname] [nvarchar](max) NULL,
	[sol_op3_enabled] [int] NULL,
	[passwordhint] [nvarchar](max) NULL
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]