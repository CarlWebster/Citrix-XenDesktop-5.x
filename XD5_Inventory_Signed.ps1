﻿#Requires -Version 3.0
#This File is in Unicode format.  Do not edit in an ASCII editor.

#region help text

<#
.SYNOPSIS
	Creates an inventory of a Citrix XenDesktop 5.x Site.
.DESCRIPTION
	Creates an inventory of a Citrix XenDesktop 5.x Site using Microsoft PowerShell, Word,
	plain text or HTML.

	By default, only gives summary information for:
		Machines
		Assignments
		Applications
		Policies
		Hosts

	The Summary information is what is shown in the top half of Citrix Studio for:
		Machines
		Assignments
		Applications
		Policies
		Hosts

	Using the MachineCatalogs parameter can cause the report to take a very long time to 
	complete and can generate an extremely long report.
	
	Using the DeliveryGroups parameter can cause the report to take a very long time to 
	complete and can generate an extremely long report.

	Using both the MachineCatalogs and DeliveryGroups parameters can cause the report to 
	take an extremely long time to complete and generate an exceptionally long report.

	Creates an output file named after the XenDesktop 5.x Site.
	Word and PDF Documents include a Cover Page, Table of Contents and Footer.
	Includes support for the following language versions of Microsoft Word:
		Catalan
		Chinese
		Danish
		Dutch
		English
		Finnish
		French
		German
		Norwegian
		Portuguese
		Spanish
		Swedish
		
.PARAMETER HTML
	Creates an HTML file with an .html extension.
	This parameter is disabled by default.
.PARAMETER MSWord
	SaveAs DOCX file
	This parameter is set True if no other output format is selected.
.PARAMETER PDF
	SaveAs PDF file instead of DOCX file.
	This parameter is disabled by default.
	The PDF file is roughly 5X to 10X larger than the DOCX file.
	This parameter requires Microsoft Word to be installed.
	This parameter uses the Word SaveAs PDF capability.
.PARAMETER Text
	Creates a formatted text file with a .txt extension.
	This parameter is disabled by default.
.PARAMETER AddDateTime
	Adds a date time stamp to the end of the file name.
	Time stamp is in the format of yyyy-MM-dd_HHmm.
	June 1, 2022 at 6PM is 2022-06-01_1800.
	Output filename will be ReportName_2022-06-01_1800.docx (or .pdf).
	This parameter is disabled by default.
	This parameter has an alias of ADT.
.PARAMETER AdminAddress
	Specifies the address of a XenDesktop controller the PowerShell snapins will connect 
	to. 
	This can be provided as a host name or an IP address. 
	This parameter defaults to LocalHost.
	This parameter has an alias of AA.
.PARAMETER Applications
	Gives detailed information for all applications.
	This parameter is disabled by default.
	This parameter has an alias of Apps.
.PARAMETER CompanyAddress
	Company Address to use for the Cover Page, if the Cover Page has the Address field.  
		The following Cover Pages have an Address field:
			Banded (Word 2013/2016)
			Contrast (Word 2010)
			Exposure (Word 2010)
			Filigree (Word 2013/2016)
			Ion (Dark) (Word 2013/2016)
			Retrospect (Word 2013/2016)
			Semaphore (Word 2013/2016)
			Tiles (Word 2010)
			ViewMaster (Word 2013/2016)
	This parameter is only valid with the MSWORD and PDF output parameters.
	This parameter has an alias of CA.
.PARAMETER CompanyEmail
	Company Email to use for the Cover Page, if the Cover Page has the Email field.  
		The following Cover Pages have an Email field:
			Facet (Word 2013/2016)
	This parameter is only valid with the MSWORD and PDF output parameters.
	This parameter has an alias of CE.
.PARAMETER CompanyFax
	Company Fax to use for the Cover Page, if the Cover Page has the Fax field.  
		The following Cover Pages have a Fax field:
			Contrast (Word 2010)
			Exposure (Word 2010)
	This parameter is only valid with the MSWORD and PDF output parameters.
	This parameter has an alias of CF.
.PARAMETER CompanyName
	Company Name to use for the Cover Page.  
	Default value is contained in 
	HKCU:\Software\Microsoft\Office\Common\UserInfo\CompanyName or
	HKCU:\Software\Microsoft\Office\Common\UserInfo\Company, whichever is populated 
	on the computer running the script.
	This parameter has an alias of CN.
	If either registry key does not exist and this parameter is not specified, the report 
	will not contain a Company Name on the cover page.
	This parameter is only valid with the MSWORD and PDF output parameters.
.PARAMETER CompanyPhone
	Company Phone to use for the Cover Page, if the Cover Page has the Phone field.  
		The following Cover Pages have a Phone field:
			Contrast (Word 2010)
			Exposure (Word 2010)
	This parameter is only valid with the MSWORD and PDF output parameters.
	This parameter has an alias of CPh.
.PARAMETER CoverPage
	What Microsoft Word Cover Page to use.
	Only Word 2010, 2013 and 2016 are supported.
	(default cover pages in Word en-US)

	Valid input is:
		Alphabet (Word 2010. Works)
		Annual (Word 2010. Doesn't work well for this report)
		Austere (Word 2010. Works)
		Austin (Word 2010/2013/2016. Doesn't work in 2013 or 2016, mostly 
		works in 2010 but Subtitle/Subject & Author fields need to be moved 
		after title box is moved up)
		Banded (Word 2013/2016. Works)
		Conservative (Word 2010. Works)
		Contrast (Word 2010. Works)
		Cubicles (Word 2010. Works)
		Exposure (Word 2010. Works if you like looking sideways)
		Facet (Word 2013/2016. Works)
		Filigree (Word 2013/2016. Works)
		Grid (Word 2010/2013/2016. Works in 2010)
		Integral (Word 2013/2016. Works)
		Ion (Dark) (Word 2013/2016. Top date doesn't fit; box needs to be 
		manually resized or font changed to 8 point)
		Ion (Light) (Word 2013/2016. Top date doesn't fit; box needs to be 
		manually resized or font changed to 8 point)
		Mod (Word 2010. Works)
		Motion (Word 2010/2013/2016. Works if top date is manually changed to 
		36 point)
		Newsprint (Word 2010. Works but date is not populated)
		Perspective (Word 2010. Works)
		Pinstripes (Word 2010. Works)
		Puzzle (Word 2010. Top date doesn't fit; box needs to be manually 
		resized or font changed to 14 point)
		Retrospect (Word 2013/2016. Works)
		Semaphore (Word 2013/2016. Works)
		Sideline (Word 2010/2013/2016. Doesn't work in 2013 or 2016, works in 
		2010)
		Slice (Dark) (Word 2013/2016. Doesn't work)
		Slice (Light) (Word 2013/2016. Doesn't work)
		Stacks (Word 2010. Works)
		Tiles (Word 2010. Date doesn't fit unless changed to 26 point)
		Transcend (Word 2010. Works)
		ViewMaster (Word 2013/2016. Works)
		Whisp (Word 2013/2016. Works)

	The default value is Sideline.
	This parameter has an alias of CP.
	This parameter is only valid with the MSWORD and PDF output parameters.
.PARAMETER Folder
	Specifies the optional output folder to save the output report. 
.PARAMETER DeliveryGroups
	Gives detailed information for all desktops in all Desktop (Delivery) Groups.
	
	Using the DeliveryGroups parameter can cause the report to take a very long 
	time to complete and can generate an extremely long report.
	
	Using both the MachineCatalogs and DeliveryGroups parameters can cause the 
	report to take an extremely long time to complete and generate an 
	exceptionally long report.
	
	This parameter is disabled by default.
	This parameter has an alias of DG.
.PARAMETER DeliveryGroupsUtilization
	Gives a chart with the delivery group utilization for however much 
	utilization data is stored in the database.
	
	The help text for Get-BrokerDesktopUsage says 
	"Desktop usage information is automatically deleted after 7 days" 
	but my lab has almost 60 days of data.
	
	This option is only available when the report is generated in Word or PDF 
	and requires Excel to be locally installed.
	
	Using the DeliveryGroupsUtilization parameter causes the report to take a 
	longer time to complete and generates a longer report.
	
	This parameter is disabled by default.
	This parameter has an alias of DGU.
.PARAMETER Hardware
	Use WMI to gather hardware information on: Computer System, Disks, Processor and 
	Network Interface Cards
	This parameter may require the script be run from an elevated PowerShell session 
	using an account with permission to retrieve hardware information (i.e., Domain 
	Admin or Local Administrator).
	Selecting this parameter will add to both the time it takes to run the script and 
	size of the report.
	This parameter is disabled by default.
	This parameter has an alias of HW.
.PARAMETER Hosting
	Give detailed information for Hosts.
	This parameter is disabled by default.
	This parameter has an alias of Host.
.PARAMETER MachineCatalogs
	Gives detailed information for all machines in all Machine Catalogs.
	
	Using the MachineCatalogs parameter can cause the report to take a very 
	long time to complete and can generate an extremely long report.
	
	Using both the MachineCatalogs and DeliveryGroups parameters can cause 
	the report to take an extremely long time to complete and generate an 
	exceptionally long report.
	
	This parameter is disabled by default.
	This parameter has an alias of MC.
.PARAMETER NoADPolicies
	Excludes all Citrix AD based policy information from the output document.
	Includes only Site policies created in Studio.
	
	This switch is useful in large AD environments, where there may be thousands
	of policies, to keep SYSVOL from being searched.
	
	This parameter is disabled by default.
	This parameter has an alias of NoAD.
.PARAMETER NoPolicies
	Excludes all Site and Citrix AD based policy information from the output document.
	
	Using the NoPolicies parameter will cause the Policies parameter to be set to False.
	
	This parameter is disabled by default.
	This parameter has an alias of NP.
.PARAMETER Policies
	Give detailed information for both Site and Citrix AD based Policies.
	
	Note: The Citrix Group Policy PowerShell module will not load from an elevated 
	PowerShell session. 
	If the module is manually imported, the module is not detected from an elevated 
	PowerShell session.

	Using the Policies parameter can cause the report to take a very long time 
	to complete and can generate an extremely long report.
	
	There are three related parameters: Policies, NoPolicies and NoADPolicies.
	
	Policies and NoPolicies are mutually exclusive and priority is given to NoPolicies.
	
	Using both Policies and NoADPolicies results in only policies created in Studio
	being in the output document.
	
	This parameter is disabled by default.
	This parameter has an alias of Pol.
.PARAMETER UserName
	Username to use for the Cover Page and Footer.
	The default value is contained in $env:username
	This parameter has an alias of UN.
	This parameter is only valid with the MSWORD and PDF output parameters.
.PARAMETER SmtpServer
	Specifies the optional email server to send the output report. 
.PARAMETER SmtpPort
	Specifies the SMTP port. 
	The default is 25.
.PARAMETER UseSSL
	Specifies whether to use SSL for the SmtpServer.
	The default is False.
.PARAMETER From
	Specifies the username for the From email address.
	If SmtpServer is used, this is a required parameter.
.PARAMETER To
	Specifies the username for the To email address.
	If SmtpServer is used, this is a required parameter.
.EXAMPLE
	PS C:\PSScript > .\XD5_Inventory.ps1
	
	Will use all default values.
	HKEY_CURRENT_USER\Software\Microsoft\Office\Common\UserInfo\CompanyName="Carl 
	Webster" or
	HKEY_CURRENT_USER\Software\Microsoft\Office\Common\UserInfo\Company="Carl Webster"
	$env:username = Administrator

	Carl Webster for the Company Name.
	Sideline for the Cover Page format.
	Administrator for the User Name.
	The computer running the script for the AdminAddress.
.EXAMPLE
	PS C:\PSScript > .\XD5_Inventory.ps1 -PDF
	
	Will use all default values and save the document as a PDF file.
	HKEY_CURRENT_USER\Software\Microsoft\Office\Common\UserInfo\CompanyName="Carl 
	Webster" or
	HKEY_CURRENT_USER\Software\Microsoft\Office\Common\UserInfo\Company="Carl Webster"
	$env:username = Administrator

	Carl Webster for the Company Name.
	Sideline for the Cover Page format.
	Administrator for the User Name.
	The computer running the script for the AdminAddress.
.EXAMPLE
	PS C:\PSScript > .\XD5_Inventory.ps1 -TEXT

	This parameter is reserved for a future update and no output is created at this time.
	
	Will use all default values and save the document as a formatted text file.
	HKEY_CURRENT_USER\Software\Microsoft\Office\Common\UserInfo\CompanyName="Carl 
	Webster" or
	HKEY_CURRENT_USER\Software\Microsoft\Office\Common\UserInfo\Company="Carl Webster"
	$env:username = Administrator

	Carl Webster for the Company Name.
	Sideline for the Cover Page format.
	Administrator for the User Name.
.EXAMPLE
	PS C:\PSScript > .\XD5_Inventory.ps1 -HTML

	This parameter is reserved for a future update and no output is created at this time.
	
	Will use all default values and save the document as an HTML file.
	HKEY_CURRENT_USER\Software\Microsoft\Office\Common\UserInfo\CompanyName="Carl 
	Webster" or
	HKEY_CURRENT_USER\Software\Microsoft\Office\Common\UserInfo\Company="Carl Webster"
	$env:username = Administrator

	Carl Webster for the Company Name.
	Sideline for the Cover Page format.
	Administrator for the User Name.
.EXAMPLE
	PS C:\PSScript > .\XD5_Inventory.ps1 -MachineCatalogs
	
	Creates a report with full details for all machines in all Machine Catalogs.
	Will use all Default values.
	HKEY_CURRENT_USER\Software\Microsoft\Office\Common\UserInfo\CompanyName="Carl 
	Webster" or
	HKEY_CURRENT_USER\Software\Microsoft\Office\Common\UserInfo\Company="Carl Webster"
	$env:username = Administrator

	Carl Webster for the Company Name.
	Sideline for the Cover Page format.
	Administrator for the User Name.
.EXAMPLE
	PS C:\PSScript > .\XD5_Inventory.ps1 -DeliveryGroups
	
	Creates a report with full details for all desktops in all Desktop (Delivery) Groups.
	Will use all Default values.
	HKEY_CURRENT_USER\Software\Microsoft\Office\Common\UserInfo\CompanyName="Carl 
	Webster" or
	HKEY_CURRENT_USER\Software\Microsoft\Office\Common\UserInfo\Company="Carl Webster"
	$env:username = Administrator

	Carl Webster for the Company Name.
	Sideline for the Cover Page format.
	Administrator for the User Name.
.EXAMPLE
	PS C:\PSScript > .\XD5_Inventory.ps1 -DeliveryGroupsUtilization
	
	Creates a report with utilization details for all Desktop (Delivery) Groups.
	Will use all Default values.
	HKEY_CURRENT_USER\Software\Microsoft\Office\Common\UserInfo\CompanyName="Carl 
	Webster" or
	HKEY_CURRENT_USER\Software\Microsoft\Office\Common\UserInfo\Company="Carl Webster"
	$env:username = Administrator

	Carl Webster for the Company Name.
	Sideline for the Cover Page format.
	Administrator for the User Name.
.EXAMPLE
	PS C:\PSScript > .\XD5_Inventory.ps1 -DeliveryGroups -MachineCatalogs
	
	Creates a report with full details for all machines in all Machine Catalogs and 
	all desktops in all Desktop (Delivery) Groups.
	Will use all Default values.
	HKEY_CURRENT_USER\Software\Microsoft\Office\Common\UserInfo\CompanyName="Carl 
	Webster" or
	HKEY_CURRENT_USER\Software\Microsoft\Office\Common\UserInfo\Company="Carl Webster"
	$env:username = Administrator

	Carl Webster for the Company Name.
	Sideline for the Cover Page format.
	Administrator for the User Name.
.EXAMPLE
	PS C:\PSScript > .\XD5_Inventory.ps1 -Hosting
	
	Creates a report with full details for Hosts.
	Will use all Default values.
	HKEY_CURRENT_USER\Software\Microsoft\Office\Common\UserInfo\CompanyName="Carl 
	Webster" or
	HKEY_CURRENT_USER\Software\Microsoft\Office\Common\UserInfo\Company="Carl Webster"
	$env:username = Administrator

	Carl Webster for the Company Name.
	Sideline for the Cover Page format.
	Administrator for the User Name.
.EXAMPLE
	PS C:\PSScript > .\XD5_Inventory.ps1 -Policies
	
	Creates a report with full details for HDX Policies.
	Will use all Default values.
	HKEY_CURRENT_USER\Software\Microsoft\Office\Common\UserInfo\CompanyName="Carl 
	Webster" or
	HKEY_CURRENT_USER\Software\Microsoft\Office\Common\UserInfo\Company="Carl Webster"
	$env:username = Administrator

	Carl Webster for the Company Name.
	Sideline for the Cover Page format.
	Administrator for the User Name.
.EXAMPLE
	PS C:\PSScript > .\XD5_Inventory.ps1 -NoPolicies
	
	Creates a report with no HDX Policy information.
	Will use all Default values.
	HKEY_CURRENT_USER\Software\Microsoft\Office\Common\UserInfo\CompanyName="Carl 
	Webster" or
	HKEY_CURRENT_USER\Software\Microsoft\Office\Common\UserInfo\Company="Carl Webster"
	$env:username = Administrator

	Carl Webster for the Company Name.
	Sideline for the Cover Page format.
	Administrator for the User Name.
.EXAMPLE
	PS C:\PSScript > .\XD5_Inventory.ps1 -NoADPolicies
	
	Creates a report with no Citrix AD based Policy information.
	Will use all Default values.
	HKEY_CURRENT_USER\Software\Microsoft\Office\Common\UserInfo\CompanyName="Carl 
	Webster" or
	HKEY_CURRENT_USER\Software\Microsoft\Office\Common\UserInfo\Company="Carl Webster"
	$env:username = Administrator

	Carl Webster for the Company Name.
	Sideline for the Cover Page format.
	Administrator for the User Name.
.EXAMPLE
	PS C:\PSScript > .\XD5_Inventory.ps1 -Policies -NoADPolicies
	
	Creates a report with full details on Site policies created in Studio but 
	no Citrix AD based Policy information.
	
	Will use all Default values.
	HKEY_CURRENT_USER\Software\Microsoft\Office\Common\UserInfo\CompanyName="Carl 
	Webster" or
	HKEY_CURRENT_USER\Software\Microsoft\Office\Common\UserInfo\Company="Carl Webster"
	$env:username = Administrator

	Carl Webster for the Company Name.
	Sideline for the Cover Page format.
	Administrator for the User Name.
.EXAMPLE
	PS C:\PSScript > .\XD5_Inventory.ps1 -DeliveryGroups -MachineCatalogs -Hosting 
	-Policies
	
	Creates a report with full details for all:
		Machines in all Machine Catalogs
		Desktops in all Desktop (Delivery) Groups
		Hosts
		Policies
	Will use all Default values.
	HKEY_CURRENT_USER\Software\Microsoft\Office\Common\UserInfo\CompanyName="Carl 
	Webster" or
	HKEY_CURRENT_USER\Software\Microsoft\Office\Common\UserInfo\Company="Carl Webster"
	$env:username = Administrator

	Carl Webster for the Company Name.
	Sideline for the Cover Page format.
	Administrator for the User Name.
.EXAMPLE
	PS C:\PSScript > .\XD5_Inventory.ps1 -Applications
	
	Creates a report with full details for all applications.
	Will use all Default values.
	HKEY_CURRENT_USER\Software\Microsoft\Office\Common\UserInfo\CompanyName="Carl 
	Webster" or
	HKEY_CURRENT_USER\Software\Microsoft\Office\Common\UserInfo\Company="Carl Webster"
	$env:username = Administrator

	Carl Webster for the Company Name.
	Sideline for the Cover Page format.
	Administrator for the User Name.
.EXAMPLE
	PS C:\PSScript .\XD5_Inventory.ps1 -CompanyName "Carl Webster Consulting" 
	-CoverPage "Mod" -UserName "Carl Webster" -AdminAddress DDC01

	Will use:
		Carl Webster Consulting for the Company Name.
		Mod for the Cover Page format.
		Carl Webster for the User Name.
		Controller named DDC01 for the AdminAddress.
.EXAMPLE
	PS C:\PSScript .\XD5_Inventory.ps1 -CN "Carl Webster Consulting" -CP "Mod" -UN 
	"Carl Webster"

	Will use:
		Carl Webster Consulting for the Company Name (alias CN).
		Mod for the Cover Page format (alias CP).
		Carl Webster for the User Name (alias UN).
		The computer running the script for the AdminAddress.
.EXAMPLE
	PS C:\PSScript .\XD5_Inventory.ps1 -CompanyName "Sherlock Holmes Consulting" 
	-CoverPage Exposure -UserName "Dr. Watson" -CompanyAddress "221B Baker Street, London, 
	England" -CompanyFax "+44 1753 276600" -CompanyPhone "+44 1753 276200"

	Will use:
		Sherlock Holmes Consulting for the Company Name.
		Exposure for the Cover Page format.
		Dr. Watson for the User Name.
		221B Baker Street, London, England for the Company Address.
		+44 1753 276600 for the Company Fax.
		+44 1753 276200 for the Company Phone.
.EXAMPLE
	PS C:\PSScript .\XD5_Inventory.ps1 -CompanyName "Sherlock Holmes Consulting" -CoverPage Facet -UserName "Dr. Watson" -CompanyEmail SuperSleuth@SherlockHolmes.com

	Will use:
		Sherlock Holmes Consulting for the Company Name.
		Facet for the Cover Page format.
		Dr. Watson for the User Name.
		SuperSleuth@SherlockHolmes.com for the Company Email.
.EXAMPLE
	PS C:\PSScript > .\XD5_Inventory.ps1 -AddDateTime
	
	Will use all Default values.
	HKEY_CURRENT_USER\Software\Microsoft\Office\Common\UserInfo\CompanyName="Carl 
	Webster" or
	HKEY_CURRENT_USER\Software\Microsoft\Office\Common\UserInfo\Company="Carl Webster"
	$env:username = Administrator

	Carl Webster for the Company Name.
	Sideline for the Cover Page format.
	Administrator for the User Name.

	Adds a date time stamp to the end of the file name.
	The timestamp is in the format of yyyy-MM-dd_HHmm.
	June 1, 2022, at 6PM is 2022-06-01_1800.
	The output filename will be XD5SiteName_2022-06-01_1800.docx
.EXAMPLE
	PS C:\PSScript > .\XD5_Inventory.ps1 -PDF -AddDateTime
	
	Will use all Default values and save the document as a PDF file.
	HKEY_CURRENT_USER\Software\Microsoft\Office\Common\UserInfo\CompanyName="Carl 
	Webster" or
	HKEY_CURRENT_USER\Software\Microsoft\Office\Common\UserInfo\Company="Carl Webster"
	$env:username = Administrator

	Carl Webster for the Company Name.
	Sideline for the Cover Page format.
	Administrator for the User Name.

	Adds a date time stamp to the end of the file name.
	The timestamp is in the format of yyyy-MM-dd_HHmm.
	June 1, 2022, at 6PM is 2022-06-01_1800.
	The output filename will be XD5SiteName_2022-06-01_1800.pdf
.EXAMPLE
	PS C:\PSScript > .\XD5_Inventory.ps1 -Hardware
	
	Will use all default values.
	HKEY_CURRENT_USER\Software\Microsoft\Office\Common\UserInfo\CompanyName="Carl 
	Webster" or
	HKEY_CURRENT_USER\Software\Microsoft\Office\Common\UserInfo\Company="Carl Webster"
	$env:username = Administrator

	Carl Webster for the Company Name.
	Sideline for the Cover Page format.
	Administrator for the User Name.
.EXAMPLE
	PS C:\PSScript > .\XD5_Inventory.ps1 -Folder \\FileServer\ShareName
	
	Will use all default values.
	HKEY_CURRENT_USER\Software\Microsoft\Office\Common\UserInfo\CompanyName="Carl 
	Webster" or
	HKEY_CURRENT_USER\Software\Microsoft\Office\Common\UserInfo\Company="Carl Webster"
	$env:username = Administrator

	Carl Webster for the Company Name.
	Sideline for the Cover Page format.
	Administrator for the User Name.
	
	The output file will be saved in the path \\FileServer\ShareName
.EXAMPLE
	PS C:\PSScript > .\XD5_Inventory.ps1 -SmtpServer mail.domain.tld -From XDAdmin@domain.tld -To ITGroup@domain.tld	

	The script will use the email server mail.domain.tld, sending from XDAdmin@domain.tld, 
	sending to ITGroup@domain.tld.

	The script will use the default SMTP port 25 and will not use SSL.

	If the current user's credentials are not valid to send an email, the script prompts 
	the user to enter valid credentials.
.EXAMPLE
	PS C:\PSScript > .\XD5_Inventory.ps1 -SmtpServer mailrelay.domain.tld -From 
	Anonymous@domain.tld -To ITGroup@domain.tld	

	***SENDING UNAUTHENTICATED EMAIL***

	The script will use the email server mailrelay.domain.tld, sending from 
	anonymous@domain.tld, sending to ITGroup@domain.tld.

	To send unauthenticated email using an email relay server requires the From email account 
	to use the name Anonymous.

	The script will use the default SMTP port 25 and will not use SSL.
	
	***GMAIL/G SUITE SMTP RELAY***
	https://support.google.com/a/answer/2956491?hl=en
	https://support.google.com/a/answer/176600?hl=en

	To send an email using a Gmail or g-suite account, you may have to turn ON the "Less 
	secure app access" option on your account.
	***GMAIL/G SUITE SMTP RELAY***

	The script will generate an anonymous secure password for the anonymous@domain.tld 
	account.
.EXAMPLE
	PS C:\PSScript > .\XD5_Inventory.ps1 -SmtpServer 
	labaddomain-com.mail.protection.outlook.com -UseSSL -From 
	SomeEmailAddress@labaddomain.com -To ITGroupDL@labaddomain.com	

	***OFFICE 365 Example***

	https://docs.microsoft.com/en-us/exchange/mail-flow-best-practices/how-to-set-up-a-multifunction-device-or-application-to-send-email-using-office-3
	
	This uses Option 2 from the above link.
	
	***OFFICE 365 Example***

	The script will use the email server labaddomain-com.mail.protection.outlook.com, 
	sending from SomeEmailAddress@labaddomain.com, sending to ITGroupDL@labaddomain.com.

	The script will use the default SMTP port 25 and will use SSL.
.EXAMPLE
	PS C:\PSScript > .\XD5_Inventory.ps1 -SmtpServer smtp.office365.com -SmtpPort 587 
	-UseSSL -From Webster@CarlWebster.com -To ITGroup@CarlWebster.com	

	The script will use the email server smtp.office365.com on port 587 using SSL, 
	sending from webster@carlwebster.com, sending to ITGroup@carlwebster.com.

	If the current user's credentials are not valid to send an email, the script prompts 
	the user to enter valid credentials.
.EXAMPLE
	PS C:\PSScript > .\XD5_Inventory.ps1 -SmtpServer smtp.gmail.com -SmtpPort 587 
	-UseSSL -From Webster@CarlWebster.com -To ITGroup@CarlWebster.com	

	*** NOTE ***
	To send an email using a Gmail or g-suite account, you may have to turn ON the "Less 
	secure app access" option on your account.
	*** NOTE ***
	
	The script will use the email server smtp.gmail.com on port 587 using SSL, 
	sending from webster@gmail.com, sending to ITGroup@carlwebster.com.

	If the current user's credentials are not valid to send an email, the script prompts 
	the user to enter valid credentials.
.INPUTS
	None.  You cannot pipe objects to this script.
.OUTPUTS
	No objects are output from this script.  This script creates a Word, PDF, formatted text,
	or HTML document.
.NOTES
	NAME: XD5_Inventory.ps1
	VERSION: 1.27
	AUTHOR: Carl Webster
	LASTEDIT: July 15, 2022
#>

#endregion

#region script parameters
#thanks to @jeffwouters and Michael B. Smith for helping me with these parameters
[CmdletBinding(SupportsShouldProcess = $False, ConfirmImpact = "None", DefaultParameterSetName = "Word") ]

Param(
	[parameter(ParameterSetName="HTML",Mandatory=$False)] 
	[Switch]$HTML=$False,

	[parameter(ParameterSetName="Word",Mandatory=$False)] 
	[Switch]$MSWord=$False,

	[parameter(ParameterSetName="PDF",Mandatory=$False)] 
	[Switch]$PDF=$False,

	[parameter(ParameterSetName="Text",Mandatory=$False)] 
	[Switch]$Text=$False,

	[parameter(Mandatory=$False)] 
	[Alias("ADT")]
	[Switch]$AddDateTime=$False,
	
	[parameter(Mandatory=$False)] 
	[ValidateNotNullOrEmpty()]
	[Alias("AA")]
	[string]$AdminAddress="LocalHost",

	[parameter(Mandatory=$False)] 
	[Alias("Apps")]
	[Switch]$Applications=$False,	
	
	[parameter(ParameterSetName="Word",Mandatory=$False)] 
	[parameter(ParameterSetName="PDF",Mandatory=$False)] 
	[Alias("CA")]
	[ValidateNotNullOrEmpty()]
	[string]$CompanyAddress="",
    
	[parameter(ParameterSetName="Word",Mandatory=$False)] 
	[parameter(ParameterSetName="PDF",Mandatory=$False)] 
	[Alias("CE")]
	[ValidateNotNullOrEmpty()]
	[string]$CompanyEmail="",
    
	[parameter(ParameterSetName="Word",Mandatory=$False)] 
	[parameter(ParameterSetName="PDF",Mandatory=$False)] 
	[Alias("CF")]
	[ValidateNotNullOrEmpty()]
	[string]$CompanyFax="",
    
	[parameter(ParameterSetName="Word",Mandatory=$False)] 
	[parameter(ParameterSetName="PDF",Mandatory=$False)] 
	[Alias("CN")]
	[ValidateNotNullOrEmpty()]
	[string]$CompanyName="",
    
	[parameter(ParameterSetName="Word",Mandatory=$False)] 
	[parameter(ParameterSetName="PDF",Mandatory=$False)] 
	[Alias("CPh")]
	[ValidateNotNullOrEmpty()]
	[string]$CompanyPhone="",
    
	[parameter(ParameterSetName="Word",Mandatory=$False)] 
	[parameter(ParameterSetName="PDF",Mandatory=$False)] 
	[Alias("CP")]
	[ValidateNotNullOrEmpty()]
	[string]$CoverPage="Sideline", 

	[parameter(Mandatory=$False)] 
	[Alias("DG")]
	[Switch]$DeliveryGroups=$False,	
	
	[parameter(Mandatory=$False)] 
	[Alias("DGU")]
	[Switch]$DeliveryGroupsUtilization=$False,	
	
	[parameter(Mandatory=$False)] 
	[string]$Folder="",
	
	[parameter(Mandatory=$False)] 
	[Alias("HW")]
	[Switch]$Hardware=$False,

	[parameter(Mandatory=$False)] 
	[Alias("Host")]
	[Switch]$Hosting=$False,	
	
	[parameter(Mandatory=$False)] 
	[Alias("MC")]
	[Switch]$MachineCatalogs=$False,	
	
	[parameter(Mandatory=$False)] 
	[Alias("NoAD")]
	[Switch]$NoADPolicies=$False,	
	
	[parameter(Mandatory=$False)] 
	[Alias("NP")]
	[Switch]$NoPolicies=$False,	
	
	[parameter(Mandatory=$False)] 
	[Alias("Pol")]
	[Switch]$Policies=$False,	
	
	[parameter(ParameterSetName="Word",Mandatory=$False)] 
	[parameter(ParameterSetName="PDF",Mandatory=$False)] 
	[Alias("UN")]
	[ValidateNotNullOrEmpty()]
	[string]$UserName=$env:username,

	[parameter(Mandatory=$False)] 
	[string]$SmtpServer="",

	[parameter(Mandatory=$False)] 
	[int]$SmtpPort=25,

	[parameter(Mandatory=$False)] 
	[switch]$UseSSL=$False,

	[parameter(Mandatory=$False)] 
	[string]$From="",

	[parameter(Mandatory=$False)] 
	[string]$To=""
	
	)
#endregion


#region script change log	
#webster@carlwebster.com
#@carlwebster on Twitter
#http://www.CarlWebster.com
# Created on April 1, 2013, 2013

# Version 1.0 released to the community on March 2, 2015

#Version 1.27 15-Jul-2022
#	Changed all Write-Verbose $(Get-Date) to add -Format G to put the dates in the user's locale
#	Fixed numerous issues reported by Visual Studio Code
#	Fixed typo found by Guy Leech "PerparingSession" should be "PreparingSession"
#	Replaced the following functions with the most current version
#		CheckExcelPrereq
#		Check-LoadedModule
#		Check-NeededPSSnapins
#		CheckWordPrereq
#		GetCtxGPOsInAD
#		UpdateDocumentProperties
#		validStateProp
#	Updated the help text
#	Updated the ReadMe file
#
#Version 1.26 9-May-2020
#	Add checking for a Word version of 0, which indicates the Office installation needs repairing
#	Add Receive Side Scaling setting to Function OutputNICItem
#	Change color variables $wdColorGray15 and $wdColorGray05 from [long] to [int]
#	Change Text output to use [System.Text.StringBuilder]
#		Updated Functions Line and SaveAndCloseTextDocument
#	Fix bug in HTML output when using -AddDateTime from creating two HTML files
#	Reformatted the terminating Write-Error messages to make them more visible and readable in the console
#	Remove the SMTP parameterset and manually verify the parameters
#	Reorder the parameters
#	Update Function SendEmail to handle anonymous unauthenticated email
#	Update Function SetWordCellFormat to change parameter $BackgroundColor to [int]
#	Update Functions GetComputerWMIInfo and OutputNicInfo to fix two bugs in NIC Power Management settings
#	Update Help Text
#
#Version 1.25 17-Dec-2019
#	Fix Swedish Table of Contents (Thanks to Johan Kallio)
#		From 
#			'sv-'	{ 'Automatisk innehållsförteckning2'; Break }
#		To
#			'sv-'	{ 'Automatisk innehållsförteckn2'; Break }
#	Updated help text
#
#Version 1.24 21-Apr-2019
#	If Policies parameter is used, check to see if PowerShell session is elevated. If it is,
#		abort the script. This is the #2 support email.
#		Added a Note to the Help Text and ReadMe file about the Citrix.GroupPolicy.Commands module:
#		Note: The Citrix Group Policy PowerShell module will not load from an elevated PowerShell session. 
#		If the module is manually imported, the module is not detected from an elevated PowerShell session.
#
#Version 1.23 8-Dec-2017
#	Updated Function WriteHTMLLine with fixes from the script template
#
#Version 1.22 14-Jun-2017
#	Add four new Cover Page properties
#		Company Address
#		Company Email
#		Company Fax
#		Company Phone
#	Added back the WorkerGroup policy filter for XenApp 6.x
#	Fix bug when retrieving Filters for a Policy that "applies to all objects in the Site"
#	Fix Function Check-LoadedModule
#	Fix several typos
#	Fix Switch blocks by adding Break statements
#	Remove code (168 lines) that made sure all Parameters were set to default values if for some reason they did exist or values were $Null
#	Replace _SetDocumentProperty function with Jim Moyle's Set-DocumentProperty function
#	Update Function ShowScriptOptions for the new Cover Page properties
#	Update Function UpdateDocumentProperties for the new Cover Page properties
#	Update help text
#
#Version 1.21 13-Feb-2017
#	Fixed French wording for Table of Contents 2 (Thanks to David Rouquier)
#
#Version 1.20 7-Feb-2017
#	Fix typos
#	Removed snapin citrix.common.commands as it is no longer used and no cmdlets are used from that snapin
#	Update help text
#
#Version 1.18 1-Dec-2016
#	Added Catalog and Machine types Permanent and PvsPvd for "Streamed with personal vDisk"
#	Fixed $Var -eq $Null to $Null -eq $Var
#	Fixed $XDSite. to $Script:XDSite.
#
#Version 1.17 7-Nov-2016
#	Added Chinese language support
#
#Version 1.16 22-Oct-2016
#	More refinement of HTML output
#
#Version 1.15 19-Oct-2016
#	Fixed formatting issues with HTML headings output
#
#Version 1.14 9-Feb-2016
#	Added specifying an optional output folder
#	Added the option to email the output file
#	Fixed several spacing and typo errors
#
#Version 1.13 5-Oct-2015
#	Added support for Word 2016
#
#Version 1.11
#	Add in updated hardware inventory code
#	Updated help text
#
# Version 1.1
# Add four new parameters
#	-NoPolicies
#	-NoAdPolicies
#	-Hardware
#	-DeliveryGroupUtilization
# Add Aliases for the following parameters
#	Policies (Pol)
# 	NoPolicies (NP)
#	NoADPolicies (NoAD)
#	Hosting (Host)
#	Hardware (HW)
#	AddDateTime (ADT)
#	DeliveryGroupUtilization (DGU)
# update the help text with the above and examples
# NoPolicies excludes all policy information from the output document
# NoAdPolicies excludes only Citrix based AD policy information from the output document.
# If both Policies and NoPolicies are used, preference is given to NoPolicies
# Hardware givens hardware information on each Controller.
# Cleanup verbose screen output by redirecting some output to Null
# End the script if the Policies parameter is used but the citrix.grouppolicy.commands module cannot be loaded
# Add a DeliveryGroupUtilization function that ceates an Excel graph and inserts it into the Word document.
# DeliveryGroupUtilization function code was contributed by Eduardo Molina
#
#endregion

#region initial variable testing and setup
Set-StrictMode -Version 2

#force verbose on
$PSDefaultParameterValues = @{"*:Verbose"=$True}
$SaveEAPreference = $ErrorActionPreference
$ErrorActionPreference = 'SilentlyContinue'

If($Null -eq $MSWord)
{
	If($Text -or $HTML -or $PDF)
	{
		$MSWord = $False
	}
	Else
	{
		$MSWord = $True
	}
}

If($MSWord -eq $False -and $PDF -eq $False -and $Text -eq $False -and $HTML -eq $False)
{
	$MSWord = $True
}

Write-Verbose "$(Get-Date -Format G): Testing output parameters"

If($MSWord)
{
	Write-Verbose "$(Get-Date -Format G): MSWord is set"
}
ElseIf($PDF)
{
	Write-Verbose "$(Get-Date -Format G): PDF is set"
}
ElseIf($Text)
{
	Write-Verbose "$(Get-Date -Format G): Text is set"
}
ElseIf($HTML)
{
	Write-Verbose "$(Get-Date -Format G): HTML is set"
}
Else
{
	$ErrorActionPreference = $SaveEAPreference
	Write-Verbose "$(Get-Date -Format G): Unable to determine output parameter"
	If($Null -eq $MSWord)
	{
		Write-Verbose "$(Get-Date -Format G): MSWord is Null"
	}
	ElseIf($Null -eq $PDF)
	{
		Write-Verbose "$(Get-Date -Format G): PDF is Null"
	}
	ElseIf($Null -eq $Text)
	{
		Write-Verbose "$(Get-Date -Format G): Text is Null"
	}
	ElseIf($Null -eq $HTML)
	{
		Write-Verbose "$(Get-Date -Format G): HTML is Null"
	}
	Else
	{
		Write-Verbose "$(Get-Date -Format G): MSWord is $($MSWord)"
		Write-Verbose "$(Get-Date -Format G): PDF is $($PDF)"
		Write-Verbose "$(Get-Date -Format G): Text is $($Text)"
		Write-Verbose "$(Get-Date -Format G): HTML is $($HTML)"
	}
	Write-Error "
	`n`n
	`t`t
	Unable to determine output parameter.
	`n`n
	`t`t
	Script cannot continue.
	`n`n
	"
	Exit
}
If($NoPolicies)
{
	$Policies = $False
}

If($Folder -ne "")
{
	Write-Verbose "$(Get-Date -Format G): Testing folder path"
	#does it exist
	If(Test-Path $Folder -EA 0)
	{
		#it exists, now check to see if it is a folder and not a file
		If(Test-Path $Folder -pathType Container -EA 0)
		{
			#it exists and it is a folder
			Write-Verbose "$(Get-Date -Format G): Folder path $Folder exists and is a folder"
		}
		Else
		{
			#it exists but it is a file not a folder
			Write-Error "
			`n`n
			`t`t
			Folder $Folder is a file, not a folder.
			`n`n
			`t`t
			Script cannot continue.
			`n`n
			"
			Exit
		}
	}
	Else
	{
		#does not exist
		Write-Error "
		`n`n
		`t`t
		Folder $Folder does not exist.
		`n`n
		Script cannot continue.
		`n`n
		"
		Exit
	}
}

If(![String]::IsNullOrEmpty($SmtpServer) -and [String]::IsNullOrEmpty($From) -and [String]::IsNullOrEmpty($To))
{
	Write-Error "
	`n`n
	`t`t
	You specified an SmtpServer but did not include a From or To email address.
	`n`n
	`t`t
	Script cannot continue.
	`n`n"
	Exit
}
If(![String]::IsNullOrEmpty($SmtpServer) -and [String]::IsNullOrEmpty($From) -and ![String]::IsNullOrEmpty($To))
{
	Write-Error "
	`n`n
	`t`t
	You specified an SmtpServer and a To email address but did not include a From email address.
	`n`n
	`t`t
	Script cannot continue.
	`n`n"
	Exit
}
If(![String]::IsNullOrEmpty($SmtpServer) -and [String]::IsNullOrEmpty($To) -and ![String]::IsNullOrEmpty($From))
{
	Write-Error "
	`n`n
	`t`t
	You specified an SmtpServer and a From email address but did not include a To email address.
	`n`n
	`t`t
	Script cannot continue.
	`n`n"
	Exit
}
If(![String]::IsNullOrEmpty($From) -and ![String]::IsNullOrEmpty($To) -and [String]::IsNullOrEmpty($SmtpServer))
{
	Write-Error "
	`n`n
	`t`t
	You specified From and To email addresses but did not include the SmtpServer.
	`n`n
	`t`t
	Script cannot continue.
	`n`n"
	Exit
}
If(![String]::IsNullOrEmpty($From) -and [String]::IsNullOrEmpty($SmtpServer))
{
	Write-Error "
	`n`n
	`t`t
	You specified a From email address but did not include the SmtpServer.
	`n`n
	`t`t
	Script cannot continue.
	`n`n"
	Exit
}
If(![String]::IsNullOrEmpty($To) -and [String]::IsNullOrEmpty($SmtpServer))
{
	Write-Error "
	`n`n
	`t`t
	You specified a To email address but did not include the SmtpServer.
	`n`n
	`t`t
	Script cannot continue.
	`n`n"
	Exit
}

#V1.24  Add check if $Policies -eq $True, see if PowerShell session is elevated
#		If session is elevated, abort the script
Function ElevatedSession
{
	#added in V1.24
	$currentPrincipal = New-Object Security.Principal.WindowsPrincipal( [Security.Principal.WindowsIdentity]::GetCurrent() )

	If($currentPrincipal.IsInRole( [Security.Principal.WindowsBuiltInRole]::Administrator ))
	{
		Write-Verbose "$(Get-Date -Format G): This is an elevated PowerShell session"
		Return $True
	}
	Else
	{
		Write-Verbose "$(Get-Date -Format G): This is NOT an elevated PowerShell session" -Foreground White
		Return $False
	}
}

If($Policies -eq $True)
{
	Write-Verbose "$(Get-Date -Format G): Testing for elevated PowerShell session."
	#see if session is elevated
	$Elevated = ElevatedSession
	
	If($Elevated -eq $True)
	{
		#abort script
		Write-Error "
		`n`n
		`t`t
		The Citrix Group Policy module cannot be loaded or found in an elevated PowerShell session.
		`n`n
		`t`t
		The Policies parameter was used and this is an elevated PowerShell session.
		`n`n
		`t`t
		Rerun the script from a non-elevated PowerShell session. The script will now close.
		`n`n
		"
		Write-Verbose "$(Get-Date -Format G): "
		Exit
	}
}

[string]$Script:RunningOS = (Get-WmiObject -class Win32_OperatingSystem -EA 0).Caption
#endregion

#region initialize variables for word html and text
If($MSWord -or $PDF)
{
	#try and fix the issue with the $CompanyName variable
	$Script:CoName = $CompanyName
	Write-Verbose "$(Get-Date -Format G): CoName is $($Script:CoName)"
	
	#the following values were attained from 
	#http://groovy.codehaus.org/modules/scriptom/1.6.0/scriptom-office-2K3-tlb/apidocs/
	#http://msdn.microsoft.com/en-us/library/office/aa211923(v=office.11).aspx
	[int]$wdAlignPageNumberRight = 2
	[int]$wdColorGray15 = 14277081
	#[int]$wdColorGray05 = 15987699 
	[int]$wdMove = 0
	[int]$wdSeekMainDocument = 0
	[int]$wdSeekPrimaryFooter = 4
	[int]$wdStory = 6
	#[int]$wdColorRed = 255
	#[int]$wdColorBlack = 0
	[int]$wdWord2007 = 12
	[int]$wdWord2010 = 14
	[int]$wdWord2013 = 15
	[int]$wdWord2016 = 16
	[int]$wdFormatDocumentDefault = 16
	[int]$wdFormatPDF = 17
	#http://blogs.technet.com/b/heyscriptingguy/archive/2006/03/01/how-can-i-right-align-a-single-column-in-a-word-table.aspx
	#http://msdn.microsoft.com/en-us/library/office/ff835817%28v=office.15%29.aspx
	#[int]$wdAlignParagraphLeft = 0
	#[int]$wdAlignParagraphCenter = 1
	#[int]$wdAlignParagraphRight = 2
	#http://msdn.microsoft.com/en-us/library/office/ff193345%28v=office.15%29.aspx
	#[int]$wdCellAlignVerticalTop = 0
	#[int]$wdCellAlignVerticalCenter = 1
	#[int]$wdCellAlignVerticalBottom = 2
	#http://msdn.microsoft.com/en-us/library/office/ff844856%28v=office.15%29.aspx
	[int]$wdAutoFitFixed = 0
	[int]$wdAutoFitContent = 1
	#[int]$wdAutoFitWindow = 2
	#http://msdn.microsoft.com/en-us/library/office/ff821928%28v=office.15%29.aspx
	[int]$wdAdjustNone = 0
	[int]$wdAdjustProportional = 1
	#[int]$wdAdjustFirstColumn = 2
	#[int]$wdAdjustSameWidth = 3

	[int]$PointsPerTabStop = 36
	[int]$Indent0TabStops = 0 * $PointsPerTabStop
	[int]$Indent1TabStops = 1 * $PointsPerTabStop
	[int]$Indent2TabStops = 2 * $PointsPerTabStop
	#[int]$Indent3TabStops = 3 * $PointsPerTabStop
	#[int]$Indent4TabStops = 4 * $PointsPerTabStop

	# http://www.thedoctools.com/index.php?show=wt_style_names_english_danish_german_french
	[int]$wdStyleHeading1 = -2
	[int]$wdStyleHeading2 = -3
	[int]$wdStyleHeading3 = -4
	[int]$wdStyleHeading4 = -5
	[int]$wdStyleNoSpacing = -158
	[int]$wdTableGrid = -155

	#http://groovy.codehaus.org/modules/scriptom/1.6.0/scriptom-office-2K3-tlb/apidocs/org/codehaus/groovy/scriptom/tlb/office/word/WdLineStyle.html
	#[int]$wdLineStyleNone = 0
	[int]$wdLineStyleSingle = 1

	[int]$wdHeadingFormatTrue = -1
	#[int]$wdHeadingFormatFalse = 0 
}

If($HTML)
{
    Set-Variable htmlredmask         -Option AllScope -Value "#FF0000" 4>$Null
    Set-Variable htmlcyanmask        -Option AllScope -Value "#00FFFF" 4>$Null
    Set-Variable htmlbluemask        -Option AllScope -Value "#0000FF" 4>$Null
    Set-Variable htmldarkbluemask    -Option AllScope -Value "#0000A0" 4>$Null
    Set-Variable htmllightbluemask   -Option AllScope -Value "#ADD8E6" 4>$Null
    Set-Variable htmlpurplemask      -Option AllScope -Value "#800080" 4>$Null
    Set-Variable htmlyellowmask      -Option AllScope -Value "#FFFF00" 4>$Null
    Set-Variable htmllimemask        -Option AllScope -Value "#00FF00" 4>$Null
    Set-Variable htmlmagentamask     -Option AllScope -Value "#FF00FF" 4>$Null
    Set-Variable htmlwhitemask       -Option AllScope -Value "#FFFFFF" 4>$Null
    Set-Variable htmlsilvermask      -Option AllScope -Value "#C0C0C0" 4>$Null
    Set-Variable htmlgraymask        -Option AllScope -Value "#808080" 4>$Null
    Set-Variable htmlblackmask       -Option AllScope -Value "#000000" 4>$Null
    Set-Variable htmlorangemask      -Option AllScope -Value "#FFA500" 4>$Null
    Set-Variable htmlmaroonmask      -Option AllScope -Value "#800000" 4>$Null
    Set-Variable htmlgreenmask       -Option AllScope -Value "#008000" 4>$Null
    Set-Variable htmlolivemask       -Option AllScope -Value "#808000" 4>$Null

    Set-Variable htmlbold        -Option AllScope -Value 1 4>$Null
    Set-Variable htmlitalics     -Option AllScope -Value 2 4>$Null
    Set-Variable htmlred         -Option AllScope -Value 4 4>$Null
    Set-Variable htmlcyan        -Option AllScope -Value 8 4>$Null
    Set-Variable htmlblue        -Option AllScope -Value 16 4>$Null
    Set-Variable htmldarkblue    -Option AllScope -Value 32 4>$Null
    Set-Variable htmllightblue   -Option AllScope -Value 64 4>$Null
    Set-Variable htmlpurple      -Option AllScope -Value 128 4>$Null
    Set-Variable htmlyellow      -Option AllScope -Value 256 4>$Null
    Set-Variable htmllime        -Option AllScope -Value 512 4>$Null
    Set-Variable htmlmagenta     -Option AllScope -Value 1024 4>$Null
    Set-Variable htmlwhite       -Option AllScope -Value 2048 4>$Null
    Set-Variable htmlsilver      -Option AllScope -Value 4096 4>$Null
    Set-Variable htmlgray        -Option AllScope -Value 8192 4>$Null
    Set-Variable htmlolive       -Option AllScope -Value 16384 4>$Null
    Set-Variable htmlorange      -Option AllScope -Value 32768 4>$Null
    Set-Variable htmlmaroon      -Option AllScope -Value 65536 4>$Null
    Set-Variable htmlgreen       -Option AllScope -Value 131072 4>$Null
    Set-Variable htmlblack       -Option AllScope -Value 262144 4>$Null
}

If($TEXT)
{
	[System.Text.StringBuilder] $global:Output = New-Object System.Text.StringBuilder( 16384 )
}
#endregion

#region code for -hardware switch
Function GetComputerWMIInfo
{
	Param([string]$RemoteComputerName)
	
	# original work by Kees Baggerman, 
	# Senior Technical Consultant @ Inter Access
	# k.baggerman@myvirtualvision.com
	# @kbaggerman on Twitter
	# http://blog.myvirtualvision.com
	# modified 1-May-2014 to work in trusted AD Forests and using different domain admin credentials	
	# modified 17-Aug-2016 to fix a few issues with Text and HTML output

	#Get Computer info
	Write-Verbose "$(Get-Date -Format G): `t`tProcessing WMI Computer information"
	Write-Verbose "$(Get-Date -Format G): `t`t`tHardware information"
	If($MSWord -or $PDF)
	{
		WriteWordLine 3 0 "Computer Information: $($RemoteComputerName)"
		WriteWordLine 4 0 "General Computer"
	}
	ElseIf($Text)
	{
		Line 0 "Computer Information: $($RemoteComputerName)"
		Line 1 "General Computer"
	}
	ElseIf($HTML)
	{
		WriteHTMLLine 3 0 "Computer Information: $($RemoteComputerName)"
		WriteHTMLLine 4 0 "General Computer"
	}
	
	Try
	{
		$Results = Get-WmiObject -computername $RemoteComputerName win32_computersystem
	}
	
	Catch
	{
		$Results = $Null
	}
	
	If($? -and $Null -ne $Results)
	{
		$ComputerItems = $Results | Select-Object Manufacturer, Model, Domain, `
		@{N="TotalPhysicalRam"; E={[math]::round(($_.TotalPhysicalMemory / 1GB),0)}}, `
		NumberOfProcessors, NumberOfLogicalProcessors
		$Results = $Null

		ForEach($Item in $ComputerItems)
		{
			OutputComputerItem $Item
		}
	}
	ElseIf(!$?)
	{
		Write-Verbose "$(Get-Date -Format G): Get-WmiObject win32_computersystem failed for $($RemoteComputerName)"
		Write-Warning "Get-WmiObject win32_computersystem failed for $($RemoteComputerName)"
		If($MSWORD -or $PDF)
		{
			WriteWordLine 0 2 "Get-WmiObject win32_computersystem failed for $($RemoteComputerName)" "" $Null 0 $False $True
			WriteWordLine 0 2 "On $($RemoteComputerName) you may need to run winmgmt /verifyrepository" "" $Null 0 $False $True
			WriteWordLine 0 2 "and winmgmt /salvagerepository.  If this is a trusted Forest, you may" "" $Null 0 $False $True
			WriteWordLine 0 2 "need to rerun the script with Domain Admin credentials from the trusted Forest." "" $Null 0 $False $True
		}
		ElseIf($Text)
		{
			Line 2 "Get-WmiObject win32_computersystem failed for $($RemoteComputerName)"
			Line 2 "On $($RemoteComputerName) you may need to run winmgmt /verifyrepository"
			Line 2 "and winmgmt /salvagerepository.  If this is a trusted Forest, you may"
			Line 2 "need to rerun the script with Domain Admin credentials from the trusted Forest."
			Line 2 ""
		}
		ElseIf($HTML)
		{
			WriteHTMLLine 0 2 "Get-WmiObject win32_computersystem failed for $($RemoteComputerName)" "" $Null 0 $False $True
			WriteHTMLLine 0 2 "On $($RemoteComputerName) you may need to run winmgmt /verifyrepository" "" $Null 0 $False $True
			WriteHTMLLine 0 2 "and winmgmt /salvagerepository.  If this is a trusted Forest, you may" "" $Null 0 $False $True
			WriteHTMLLine 0 2 "need to rerun the script with Domain Admin credentials from the trusted Forest." "" $Null 0 $False $True
		}
	}
	Else
	{
		Write-Verbose "$(Get-Date -Format G): No results Returned for Computer information"
		If($MSWORD -or $PDF)
		{
			WriteWordLine 0 2 "No results Returned for Computer information" "" $Null 0 $False $True
		}
		ElseIf($Text)
		{
			Line 2 "No results Returned for Computer information"
		}
		ElseIf($HTML)
		{
			WriteHTMLLine 0 2 "No results Returned for Computer information" "" $Null 0 $False $True
		}
	}
	
	#Get Disk info
	Write-Verbose "$(Get-Date -Format G): `t`t`tDrive information"

	If($MSWord -or $PDF)
	{
		WriteWordLine 4 0 "Drive(s)"
	}
	ElseIf($Text)
	{
		Line 1 "Drive(s)"
	}
	ElseIf($HTML)
	{
		WriteHTMLLine 4 0 "Drive(s)"
	}

	Try
	{
		$Results = Get-WmiObject -computername $RemoteComputerName Win32_LogicalDisk
	}
	
	Catch
	{
		$Results = $Null
	}

	If($? -and $Null -ne $Results)
	{
		$drives = $Results | Select-Object caption, @{N="drivesize"; E={[math]::round(($_.size / 1GB),0)}}, 
		filesystem, @{N="drivefreespace"; E={[math]::round(($_.freespace / 1GB),0)}}, 
		volumename, drivetype, volumedirty, volumeserialnumber
		$Results = $Null
		ForEach($drive in $drives)
		{
			If($drive.caption -ne "A:" -and $drive.caption -ne "B:")
			{
				OutputDriveItem $drive
			}
		}
	}
	ElseIf(!$?)
	{
		Write-Verbose "$(Get-Date -Format G): Get-WmiObject Win32_LogicalDisk failed for $($RemoteComputerName)"
		Write-Warning "Get-WmiObject Win32_LogicalDisk failed for $($RemoteComputerName)"
		If($MSWORD -or $PDF)
		{
			WriteWordLine 0 2 "Get-WmiObject Win32_LogicalDisk failed for $($RemoteComputerName)" "" $Null 0 $False $True
			WriteWordLine 0 2 "On $($RemoteComputerName) you may need to run winmgmt /verifyrepository" "" $Null 0 $False $True
			WriteWordLine 0 2 "and winmgmt /salvagerepository.  If this is a trusted Forest, you may" "" $Null 0 $False $True
			WriteWordLine 0 2 "need to rerun the script with Domain Admin credentials from the trusted Forest." "" $Null 0 $False $True
		}
		ElseIf($Text)
		{
			Line 2 "Get-WmiObject Win32_LogicalDisk failed for $($RemoteComputerName)"
			Line 2 "On $($RemoteComputerName) you may need to run winmgmt /verifyrepository"
			Line 2 "and winmgmt /salvagerepository.  If this is a trusted Forest, you may"
			Line 2 "need to rerun the script with Domain Admin credentials from the trusted Forest."
		}
		ElseIf($HTML)
		{
			WriteHTMLLine 0 2 "Get-WmiObject Win32_LogicalDisk failed for $($RemoteComputerName)" "" $Null 0 $False $True
			WriteHTMLLine 0 2 "On $($RemoteComputerName) you may need to run winmgmt /verifyrepository" "" $Null 0 $False $True
			WriteHTMLLine 0 2 "and winmgmt /salvagerepository.  If this is a trusted Forest, you may" "" $Null 0 $False $True
			WriteHTMLLine 0 2 "need to rerun the script with Domain Admin credentials from the trusted Forest." "" $Null 0 $False $True
		}
	}
	Else
	{
		Write-Verbose "$(Get-Date -Format G): No results Returned for Drive information"
		If($MSWORD -or $PDF)
		{
			WriteWordLine 0 2 "No results Returned for Drive information" "" $Null 0 $False $True
		}
		ElseIf($Text)
		{
			Line 2 "No results Returned for Drive information"
		}
		ElseIf($HTML)
		{
			WriteHTMLLine 0 2 "No results Returned for Drive information" "" $Null 0 $False $True
		}
	}
	

	#Get CPU's and stepping
	Write-Verbose "$(Get-Date -Format G): `t`t`tProcessor information"

	If($MSWord -or $PDF)
	{
		WriteWordLine 4 0 "Processor(s)"
	}
	ElseIf($Text)
	{
		Line 1 "Processor(s)"
	}
	ElseIf($HTML)
	{
		WriteHTMLLine 4 0 "Processor(s)"
	}

	Try
	{
		$Results = Get-WmiObject -computername $RemoteComputerName win32_Processor
	}
	
	Catch
	{
		$Results = $Null
	}

	If($? -and $Null -ne $Results)
	{
		$Processors = $Results | Select-Object availability, name, description, maxclockspeed, 
		l2cachesize, l3cachesize, numberofcores, numberoflogicalprocessors
		$Results = $Null
		ForEach($processor in $processors)
		{
			OutputProcessorItem $processor
		}
	}
	ElseIf(!$?)
	{
		Write-Verbose "$(Get-Date -Format G): Get-WmiObject win32_Processor failed for $($RemoteComputerName)"
		Write-Warning "Get-WmiObject win32_Processor failed for $($RemoteComputerName)"
		If($MSWORD -or $PDF)
		{
			WriteWordLine 0 2 "Get-WmiObject win32_Processor failed for $($RemoteComputerName)" "" $Null 0 $False $True
			WriteWordLine 0 2 "On $($RemoteComputerName) you may need to run winmgmt /verifyrepository" "" $Null 0 $False $True
			WriteWordLine 0 2 "and winmgmt /salvagerepository.  If this is a trusted Forest, you may" "" $Null 0 $False $True
			WriteWordLine 0 2 "need to rerun the script with Domain Admin credentials from the trusted Forest." "" $Null 0 $False $True
		}
		ElseIf($Text)
		{
			Line 2 "Get-WmiObject win32_Processor failed for $($RemoteComputerName)"
			Line 2 "On $($RemoteComputerName) you may need to run winmgmt /verifyrepository"
			Line 2 "and winmgmt /salvagerepository.  If this is a trusted Forest, you may"
			Line 2 "need to rerun the script with Domain Admin credentials from the trusted Forest."
		}
		ElseIf($HTML)
		{
			WriteHTMLLine 0 2 "Get-WmiObject win32_Processor failed for $($RemoteComputerName)" "" $Null 0 $False $True
			WriteHTMLLine 0 2 "On $($RemoteComputerName) you may need to run winmgmt /verifyrepository" "" $Null 0 $False $True
			WriteHTMLLine 0 2 "and winmgmt /salvagerepository.  If this is a trusted Forest, you may" "" $Null 0 $False $True
			WriteHTMLLine 0 2 "need to rerun the script with Domain Admin credentials from the trusted Forest." "" $Null 0 $False $True
		}
	}
	Else
	{
		Write-Verbose "$(Get-Date -Format G): No results Returned for Processor information"
		If($MSWORD -or $PDF)
		{
			WriteWordLine 0 2 "No results Returned for Processor information" "" $Null 0 $False $True
		}
		ElseIf($Text)
		{
			Line 2 "No results Returned for Processor information"
		}
		ElseIf($HTML)
		{
			WriteHTMLLine 0 2 "No results Returned for Processor information" "" $Null 0 $False $True
		}
	}

	#Get Nics
	Write-Verbose "$(Get-Date -Format G): `t`t`tNIC information"

	If($MSWord -or $PDF)
	{
		WriteWordLine 4 0 "Network Interface(s)"
	}
	ElseIf($Text)
	{
		Line 1 "Network Interface(s)"
	}
	ElseIf($HTML)
	{
		WriteHTMLLine 4 0 "Network Interface(s)"
	}

	[bool]$GotNics = $True
	
	Try
	{
		$Results = Get-WmiObject -computername $RemoteComputerName win32_networkadapterconfiguration
	}
	
	Catch
	{
		$Results = $Null
	}

	If($? -and $Null -ne $Results)
	{
		$Nics = $Results | Where-Object {$Null -ne $_.ipaddress}
		$Results = $Null

		If($Null -eq $Nics) 
		{ 
			$GotNics = $False 
		} 
		Else 
		{ 
			$GotNics = !($Nics.__PROPERTY_COUNT -eq 0) 
		} 
	
		If($GotNics)
		{
			ForEach($nic in $nics)
			{
				Try
				{
					$ThisNic = Get-WmiObject -computername $RemoteComputerName win32_networkadapter | Where-Object {$_.index -eq $nic.index}
				}
				
				Catch 
				{
					$ThisNic = $Null
				}
				
				If($? -and $Null -ne $ThisNic)
				{
					OutputNicItem $Nic $ThisNic $RemoteComputerName
				}
				ElseIf(!$?)
				{
					Write-Warning "$(Get-Date): Error retrieving NIC information"
					Write-Verbose "$(Get-Date -Format G): Get-WmiObject win32_networkadapterconfiguration failed for $($RemoteComputerName)"
					Write-Warning "Get-WmiObject win32_networkadapterconfiguration failed for $($RemoteComputerName)"
					If($MSWORD -or $PDF)
					{
						WriteWordLine 0 2 "Error retrieving NIC information" "" $Null 0 $False $True
						WriteWordLine 0 2 "Get-WmiObject win32_networkadapterconfiguration failed for $($RemoteComputerName)" "" $Null 0 $False $True
						WriteWordLine 0 2 "On $($RemoteComputerName) you may need to run winmgmt /verifyrepository" "" $Null 0 $False $True
						WriteWordLine 0 2 "and winmgmt /salvagerepository.  If this is a trusted Forest, you may" "" $Null 0 $False $True
						WriteWordLine 0 2 "need to rerun the script with Domain Admin credentials from the trusted Forest." "" $Null 0 $False $True
					}
					ElseIf($Text)
					{
						Line 2 "Error retrieving NIC information"
						Line 2 "Get-WmiObject win32_networkadapterconfiguration failed for $($RemoteComputerName)"
						Line 2 "On $($RemoteComputerName) you may need to run winmgmt /verifyrepository"
						Line 2 "and winmgmt /salvagerepository.  If this is a trusted Forest, you may"
						Line 2 "need to rerun the script with Domain Admin credentials from the trusted Forest."
					}
					ElseIf($HTML)
					{
						WriteHTMLLine 0 2 "Error retrieving NIC information" "" $Null 0 $False $True
						WriteHTMLLine 0 2 "Get-WmiObject win32_networkadapterconfiguration failed for $($RemoteComputerName)" "" $Null 0 $False $True
						WriteHTMLLine 0 2 "On $($RemoteComputerName) you may need to run winmgmt /verifyrepository" "" $Null 0 $False $True
						WriteHTMLLine 0 2 "and winmgmt /salvagerepository.  If this is a trusted Forest, you may" "" $Null 0 $False $True
						WriteHTMLLine 0 2 "need to rerun the script with Domain Admin credentials from the trusted Forest." "" $Null 0 $False $True
					}
				}
				Else
				{
					Write-Verbose "$(Get-Date -Format G): No results Returned for NIC information"
					If($MSWORD -or $PDF)
					{
						WriteWordLine 0 2 "No results Returned for NIC information" "" $Null 0 $False $True
					}
					ElseIf($Text)
					{
						Line 2 "No results Returned for NIC information"
					}
					ElseIf($HTML)
					{
						WriteHTMLLine 0 2 "No results Returned for NIC information" "" $Null 0 $False $True
					}
				}
			}
		}	
	}
	ElseIf(!$?)
	{
		Write-Warning "$(Get-Date): Error retrieving NIC configuration information"
		Write-Verbose "$(Get-Date -Format G): Get-WmiObject win32_networkadapterconfiguration failed for $($RemoteComputerName)"
		Write-Warning "Get-WmiObject win32_networkadapterconfiguration failed for $($RemoteComputerName)"
		If($MSWORD -or $PDF)
		{
			WriteWordLine 0 2 "Error retrieving NIC configuration information" "" $Null 0 $False $True
			WriteWordLine 0 2 "Get-WmiObject win32_networkadapterconfiguration failed for $($RemoteComputerName)" "" $Null 0 $False $True
			WriteWordLine 0 2 "On $($RemoteComputerName) you may need to run winmgmt /verifyrepository" "" $Null 0 $False $True
			WriteWordLine 0 2 "and winmgmt /salvagerepository.  If this is a trusted Forest, you may" "" $Null 0 $False $True
			WriteWordLine 0 2 "need to rerun the script with Domain Admin credentials from the trusted Forest." "" $Null 0 $False $True
		}
		ElseIf($Text)
		{
			Line 2 "Error retrieving NIC configuration information"
			Line 2 "Get-WmiObject win32_networkadapterconfiguration failed for $($RemoteComputerName)"
			Line 2 "On $($RemoteComputerName) you may need to run winmgmt /verifyrepository"
			Line 2 "and winmgmt /salvagerepository.  If this is a trusted Forest, you may"
			Line 2 "need to rerun the script with Domain Admin credentials from the trusted Forest."
		}
		ElseIf($HTML)
		{
			WriteHTMLLine 0 2 "Error retrieving NIC configuration information" "" $Null 0 $False $True
			WriteHTMLLine 0 2 "Get-WmiObject win32_networkadapterconfiguration failed for $($RemoteComputerName)" "" $Null 0 $False $True
			WriteHTMLLine 0 2 "On $($RemoteComputerName) you may need to run winmgmt /verifyrepository" "" $Null 0 $False $True
			WriteHTMLLine 0 2 "and winmgmt /salvagerepository.  If this is a trusted Forest, you may" "" $Null 0 $False $True
			WriteHTMLLine 0 2 "need to rerun the script with Domain Admin credentials from the trusted Forest." "" $Null 0 $False $True
		}
	}
	Else
	{
		Write-Verbose "$(Get-Date -Format G): No results Returned for NIC configuration information"
		If($MSWORD -or $PDF)
		{
			WriteWordLine 0 2 "No results Returned for NIC configuration information" "" $Null 0 $False $True
		}
		ElseIf($Text)
		{
			Line 2 "No results Returned for NIC configuration information"
		}
		ElseIf($HTML)
		{
			WriteHTMLLine 0 2 "No results Returned for NIC configuration information" "" $Null 0 $False $True
		}
	}
	
	If($MSWORD -or $PDF)
	{
		WriteWordLine 0 0 ""
	}
	ElseIf($Text)
	{
		Line 0 ""
	}
	ElseIf($HTML)
	{
		WriteHTMLLine 0 0 " "
	}
}

Function OutputComputerItem
{
	Param([object]$Item)
	If($MSWord -or $PDF)
	{
		[System.Collections.Hashtable[]] $ItemInformation = @()
		$ItemInformation += @{ Data = "Manufacturer"; Value = $Item.manufacturer; }
		$ItemInformation += @{ Data = "Model"; Value = $Item.model; }
		$ItemInformation += @{ Data = "Domain"; Value = $Item.domain; }
		$ItemInformation += @{ Data = "Total Ram"; Value = "$($Item.totalphysicalram) GB"; }
		$ItemInformation += @{ Data = "Physical Processors (sockets)"; Value = $Item.NumberOfProcessors; }
		$ItemInformation += @{ Data = "Logical Processors (cores w/HT)"; Value = $Item.NumberOfLogicalProcessors; }
		$Table = AddWordTable -Hashtable $ItemInformation `
		-Columns Data,Value `
		-List `
		-AutoFit $wdAutoFitFixed;

		## Set first column format
		SetWordCellFormat -Collection $Table.Columns.Item(1).Cells -Bold -BackgroundColor $wdColorGray15;

		## IB - set column widths without recursion
		$Table.Columns.Item(1).Width = 150;
		$Table.Columns.Item(2).Width = 200;

		$Table.Rows.SetLeftIndent($Indent0TabStops,$wdAdjustNone)

		FindWordDocumentEnd
		$Table = $Null
		WriteWordLine 0 0 ""
	}
	ElseIf($Text)
	{
		Line 2 "Manufacturer`t`t`t: " $Item.manufacturer
		Line 2 "Model`t`t`t`t: " $Item.model
		Line 2 "Domain`t`t`t`t: " $Item.domain
		Line 2 "Total Ram`t`t`t: $($Item.totalphysicalram) GB"
		Line 2 "Physical Processors (sockets)`t: " $Item.NumberOfProcessors
		Line 2 "Logical Processors (cores w/HT)`t: " $Item.NumberOfLogicalProcessors
		Line 2 ""
	}
	ElseIf($HTML)
	{
		$rowdata = @()
		$columnHeaders = @("Manufacturer",($htmlsilver -bor $htmlbold),$Item.manufacturer,$htmlwhite)
		$rowdata += @(,('Model',($htmlsilver -bor $htmlbold),$Item.model,$htmlwhite))
		$rowdata += @(,('Domain',($htmlsilver -bor $htmlbold),$Item.domain,$htmlwhite))
		$rowdata += @(,('Total Ram',($htmlsilver -bor $htmlbold),"$($Item.totalphysicalram) GB",$htmlwhite))
		$rowdata += @(,('Physical Processors (sockets)',($htmlsilver -bor $htmlbold),$Item.NumberOfProcessors,$htmlwhite))
		$rowdata += @(,('Logical Processors (cores w/HT)',($htmlsilver -bor $htmlbold),$Item.NumberOfLogicalProcessors,$htmlwhite))

		$msg = ""
		$columnWidths = @("150px","200px")
		FormatHTMLTable $msg -rowarray $rowdata -columnArray $columnheaders -fixedWidth $columnWidths -tablewidth "350"
		WriteHTMLLine 0 0 " "
	}
}

Function OutputDriveItem
{
	Param([object]$Drive)
	
	$xDriveType = ""
	Switch ($drive.drivetype)
	{
		0	{$xDriveType = "Unknown"; Break}
		1	{$xDriveType = "No Root Directory"; Break}
		2	{$xDriveType = "Removable Disk"; Break}
		3	{$xDriveType = "Local Disk"; Break}
		4	{$xDriveType = "Network Drive"; Break}
		5	{$xDriveType = "Compact Disc"; Break}
		6	{$xDriveType = "RAM Disk"; Break}
		Default {$xDriveType = "Unknown"; Break}
	}
	
	$xVolumeDirty = ""
	If(![String]::IsNullOrEmpty($drive.volumedirty))
	{
		If($drive.volumedirty)
		{
			$xVolumeDirty = "Yes"
		}
		Else
		{
			$xVolumeDirty = "No"
		}
	}

	If($MSWORD -or $PDF)
	{
		[System.Collections.Hashtable[]] $DriveInformation = @()
		$DriveInformation += @{ Data = "Caption"; Value = $Drive.caption; }
		$DriveInformation += @{ Data = "Size"; Value = "$($drive.drivesize) GB"; }
		If(![String]::IsNullOrEmpty($drive.filesystem))
		{
			$DriveInformation += @{ Data = "File System"; Value = $Drive.filesystem; }
		}
		$DriveInformation += @{ Data = "Free Space"; Value = "$($drive.drivefreespace) GB"; }
		If(![String]::IsNullOrEmpty($drive.volumename))
		{
			$DriveInformation += @{ Data = "Volume Name"; Value = $Drive.volumename; }
		}
		If(![String]::IsNullOrEmpty($drive.volumedirty))
		{
			$DriveInformation += @{ Data = "Volume is Dirty"; Value = $xVolumeDirty; }
		}
		If(![String]::IsNullOrEmpty($drive.volumeserialnumber))
		{
			$DriveInformation += @{ Data = "Volume Serial Number"; Value = $Drive.volumeserialnumber; }
		}
		$DriveInformation += @{ Data = "Drive Type"; Value = $xDriveType; }
		$Table = AddWordTable -Hashtable $DriveInformation `
		-Columns Data,Value `
		-List `
		-AutoFit $wdAutoFitFixed;

		## Set first column format
		SetWordCellFormat -Collection $Table.Columns.Item(1).Cells `
		-Bold `
		-BackgroundColor $wdColorGray15;

		## IB - set column widths without recursion
		$Table.Columns.Item(1).Width = 150;
		$Table.Columns.Item(2).Width = 200;

		$Table.Rows.SetLeftIndent($Indent0TabStops,$wdAdjustProportional)

		FindWordDocumentEnd
		$Table = $Null
		WriteWordLine 0 2 ""
	}
	ElseIf($Text)
	{
		Line 2 "Caption`t`t: " $drive.caption
		Line 2 "Size`t`t: $($drive.drivesize) GB"
		If(![String]::IsNullOrEmpty($drive.filesystem))
		{
			Line 2 "File System`t: " $drive.filesystem
		}
		Line 2 "Free Space`t: $($drive.drivefreespace) GB"
		If(![String]::IsNullOrEmpty($drive.volumename))
		{
			Line 2 "Volume Name`t: " $drive.volumename
		}
		If(![String]::IsNullOrEmpty($drive.volumedirty))
		{
			Line 2 "Volume is Dirty`t: " $xVolumeDirty
		}
		If(![String]::IsNullOrEmpty($drive.volumeserialnumber))
		{
			Line 2 "Volume Serial #`t: " $drive.volumeserialnumber
		}
		Line 2 "Drive Type`t: " $xDriveType
		Line 2 ""
	}
	ElseIf($HTML)
	{
		$rowdata = @()
		$columnHeaders = @("Caption",($htmlsilver -bor $htmlbold),$Drive.caption,$htmlwhite)
		$rowdata += @(,('Size',($htmlsilver -bor $htmlbold),"$($drive.drivesize) GB",$htmlwhite))

		If(![String]::IsNullOrEmpty($drive.filesystem))
		{
			$rowdata += @(,('File System',($htmlsilver -bor $htmlbold),$Drive.filesystem,$htmlwhite))
		}
		$rowdata += @(,('Free Space',($htmlsilver -bor $htmlbold),"$($drive.drivefreespace) GB",$htmlwhite))
		If(![String]::IsNullOrEmpty($drive.volumename))
		{
			$rowdata += @(,('Volume Name',($htmlsilver -bor $htmlbold),$Drive.volumename,$htmlwhite))
		}
		If(![String]::IsNullOrEmpty($drive.volumedirty))
		{
			$rowdata += @(,('Volume is Dirty',($htmlsilver -bor $htmlbold),$xVolumeDirty,$htmlwhite))
		}
		If(![String]::IsNullOrEmpty($drive.volumeserialnumber))
		{
			$rowdata += @(,('Volume Serial Number',($htmlsilver -bor $htmlbold),$Drive.volumeserialnumber,$htmlwhite))
		}
		$rowdata += @(,('Drive Type',($htmlsilver -bor $htmlbold),$xDriveType,$htmlwhite))

		$msg = ""
		$columnWidths = @("150px","200px")
		FormatHTMLTable $msg -rowarray $rowdata -columnArray $columnheaders -fixedWidth $columnWidths -tablewidth "350"
		WriteHTMLLine 0 0 " "
	}
}

Function OutputProcessorItem
{
	Param([object]$Processor)
	
	$xAvailability = ""
	Switch ($processor.availability)
	{
		1	{$xAvailability = "Other"; Break}
		2	{$xAvailability = "Unknown"; Break}
		3	{$xAvailability = "Running or Full Power"; Break}
		4	{$xAvailability = "Warning"; Break}
		5	{$xAvailability = "In Test"; Break}
		6	{$xAvailability = "Not Applicable"; Break}
		7	{$xAvailability = "Power Off"; Break}
		8	{$xAvailability = "Off Line"; Break}
		9	{$xAvailability = "Off Duty"; Break}
		10	{$xAvailability = "Degraded"; Break}
		11	{$xAvailability = "Not Installed"; Break}
		12	{$xAvailability = "Install Error"; Break}
		13	{$xAvailability = "Power Save - Unknown"; Break}
		14	{$xAvailability = "Power Save - Low Power Mode"; Break}
		15	{$xAvailability = "Power Save - Standby"; Break}
		16	{$xAvailability = "Power Cycle"; Break}
		17	{$xAvailability = "Power Save - Warning"; Break}
		Default	{$xAvailability = "Unknown"; Break}
	}

	If($MSWORD -or $PDF)
	{
		[System.Collections.Hashtable[]] $ProcessorInformation = @()
		$ProcessorInformation += @{ Data = "Name"; Value = $Processor.name; }
		$ProcessorInformation += @{ Data = "Description"; Value = $Processor.description; }
		$ProcessorInformation += @{ Data = "Max Clock Speed"; Value = "$($processor.maxclockspeed) MHz"; }
		If($processor.l2cachesize -gt 0)
		{
			$ProcessorInformation += @{ Data = "L2 Cache Size"; Value = "$($processor.l2cachesize) KB"; }
		}
		If($processor.l3cachesize -gt 0)
		{
			$ProcessorInformation += @{ Data = "L3 Cache Size"; Value = "$($processor.l3cachesize) KB"; }
		}
		If($processor.numberofcores -gt 0)
		{
			$ProcessorInformation += @{ Data = "Number of Cores"; Value = $Processor.numberofcores; }
		}
		If($processor.numberoflogicalprocessors -gt 0)
		{
			$ProcessorInformation += @{ Data = "Number of Logical Processors (cores w/HT)"; Value = $Processor.numberoflogicalprocessors; }
		}
		$ProcessorInformation += @{ Data = "Availability"; Value = $xAvailability; }
		$Table = AddWordTable -Hashtable $ProcessorInformation `
		-Columns Data,Value `
		-List `
		-AutoFit $wdAutoFitFixed;

		## Set first column format
		SetWordCellFormat -Collection $Table.Columns.Item(1).Cells -Bold -BackgroundColor $wdColorGray15;

		## IB - set column widths without recursion
		$Table.Columns.Item(1).Width = 150;
		$Table.Columns.Item(2).Width = 200;

		$Table.Rows.SetLeftIndent($Indent0TabStops,$wdAdjustProportional)

		FindWordDocumentEnd
		$Table = $Null
		WriteWordLine 0 0 ""
	}
	ElseIf($Text)
	{
		Line 2 "Name`t`t`t`t: " $processor.name
		Line 2 "Description`t`t`t: " $processor.description
		Line 2 "Max Clock Speed`t`t`t: $($processor.maxclockspeed) MHz"
		If($processor.l2cachesize -gt 0)
		{
			Line 2 "L2 Cache Size`t`t`t: $($processor.l2cachesize) KB"
		}
		If($processor.l3cachesize -gt 0)
		{
			Line 2 "L3 Cache Size`t`t`t: $($processor.l3cachesize) KB"
		}
		If($processor.numberofcores -gt 0)
		{
			Line 2 "# of Cores`t`t`t: " $processor.numberofcores
		}
		If($processor.numberoflogicalprocessors -gt 0)
		{
			Line 2 "# of Logical Procs (cores w/HT)`t: " $processor.numberoflogicalprocessors
		}
		Line 2 "Availability`t`t`t: " $xAvailability
		Line 2 ""
	}
	ElseIf($HTML)
	{
		$rowdata = @()
		$columnHeaders = @("Name",($htmlsilver -bor $htmlbold),$Processor.name,$htmlwhite)
		$rowdata += @(,('Description',($htmlsilver -bor $htmlbold),$Processor.description,$htmlwhite))

		$rowdata += @(,('Max Clock Speed',($htmlsilver -bor $htmlbold),"$($processor.maxclockspeed) MHz",$htmlwhite))
		If($processor.l2cachesize -gt 0)
		{
			$rowdata += @(,('L2 Cache Size',($htmlsilver -bor $htmlbold),"$($processor.l2cachesize) KB",$htmlwhite))
		}
		If($processor.l3cachesize -gt 0)
		{
			$rowdata += @(,('L3 Cache Size',($htmlsilver -bor $htmlbold),"$($processor.l3cachesize) KB",$htmlwhite))
		}
		If($processor.numberofcores -gt 0)
		{
			$rowdata += @(,('Number of Cores',($htmlsilver -bor $htmlbold),$Processor.numberofcores,$htmlwhite))
		}
		If($processor.numberoflogicalprocessors -gt 0)
		{
			$rowdata += @(,('Number of Logical Processors (cores w/HT)',($htmlsilver -bor $htmlbold),$Processor.numberoflogicalprocessors,$htmlwhite))
		}
		$rowdata += @(,('Availability',($htmlsilver -bor $htmlbold),$xAvailability,$htmlwhite))

		$msg = ""
		$columnWidths = @("150px","200px")
		FormatHTMLTable $msg -rowarray $rowdata -columnArray $columnheaders -fixedWidth $columnWidths -tablewidth "350"
		WriteHTMLLine 0 0 " "
	}
}

Function OutputNicItem
{
	Param([object]$Nic, [object]$ThisNic, [string]$RemoteComputerName)
	
	$powerMgmt = Get-WmiObject -computername $RemoteComputerName MSPower_DeviceEnable -Namespace root\wmi | Where-Object{$_.InstanceName -match [regex]::Escape($ThisNic.PNPDeviceID)}

	If($? -and $Null -ne $powerMgmt)
	{
		If($powerMgmt.Enable -eq $True)
		{
			$PowerSaving = "Enabled"
		}
		Else
		{
			$PowerSaving = "Disabled"
		}
	}
	Else
	{
        $PowerSaving = "N/A"
	}
	
	$xAvailability = ""
	Switch ($ThisNic.availability)
	{
		1		{$xAvailability = "Other"; Break}
		2		{$xAvailability = "Unknown"; Break}
		3		{$xAvailability = "Running or Full Power"; Break}
		4		{$xAvailability = "Warning"; Break}
		5		{$xAvailability = "In Test"; Break}
		6		{$xAvailability = "Not Applicable"; Break}
		7		{$xAvailability = "Power Off"; Break}
		8		{$xAvailability = "Off Line"; Break}
		9		{$xAvailability = "Off Duty"; Break}
		10		{$xAvailability = "Degraded"; Break}
		11		{$xAvailability = "Not Installed"; Break}
		12		{$xAvailability = "Install Error"; Break}
		13		{$xAvailability = "Power Save - Unknown"; Break}
		14		{$xAvailability = "Power Save - Low Power Mode"; Break}
		15		{$xAvailability = "Power Save - Standby"; Break}
		16		{$xAvailability = "Power Cycle"; Break}
		17		{$xAvailability = "Power Save - Warning"; Break}
		Default	{$xAvailability = "Unknown"; Break}
	}

	#attempt to get Receive Side Scaling setting
	$RSSEnabled = "N/A"
	Try
	{
		#https://ios.developreference.com/article/10085450/How+do+I+enable+VRSS+(Virtual+Receive+Side+Scaling)+for+a+Windows+VM+without+relying+on+Enable-NetAdapterRSS%3F
		$RSSEnabled = (Get-WmiObject -ComputerName $RemoteComputerName MSFT_NetAdapterRssSettingData -Namespace "root\StandardCimV2" -ea 0).Enabled

		If($RSSEnabled)
		{
			$RSSEnabled = "Enabled"
		}
		ELse
		{
			$RSSEnabled = "Disabled"
		}
	}
	
	Catch
	{
		$RSSEnabled = "Not available on $Script:RunningOS"
	}

	$xIPAddress = @()
	ForEach($IPAddress in $Nic.ipaddress)
	{
		$xIPAddress += "$($IPAddress)"
	}

	$xIPSubnet = @()
	ForEach($IPSubnet in $Nic.ipsubnet)
	{
		$xIPSubnet += "$($IPSubnet)"
	}

	If($Null -ne $nic.dnsdomainsuffixsearchorder -and $nic.dnsdomainsuffixsearchorder.length -gt 0)
	{
		$nicdnsdomainsuffixsearchorder = $nic.dnsdomainsuffixsearchorder
		$xnicdnsdomainsuffixsearchorder = @()
		ForEach($DNSDomain in $nicdnsdomainsuffixsearchorder)
		{
			$xnicdnsdomainsuffixsearchorder += "$($DNSDomain)"
		}
	}
	
	If($Null -ne $nic.dnsserversearchorder -and $nic.dnsserversearchorder.length -gt 0)
	{
		$nicdnsserversearchorder = $nic.dnsserversearchorder
		$xnicdnsserversearchorder = @()
		ForEach($DNSServer in $nicdnsserversearchorder)
		{
			$xnicdnsserversearchorder += "$($DNSServer)"
		}
	}

	$xdnsenabledforwinsresolution = ""
	If($nic.dnsenabledforwinsresolution)
	{
		$xdnsenabledforwinsresolution = "Yes"
	}
	Else
	{
		$xdnsenabledforwinsresolution = "No"
	}
	
	$xTcpipNetbiosOptions = ""
	Switch ($nic.TcpipNetbiosOptions)
	{
		0	{$xTcpipNetbiosOptions = "Use NetBIOS setting from DHCP Server"; Break}
		1	{$xTcpipNetbiosOptions = "Enable NetBIOS"; Break}
		2	{$xTcpipNetbiosOptions = "Disable NetBIOS"; Break}
		Default	{$xTcpipNetbiosOptions = "Unknown"; Break}
	}
	
	$xwinsenablelmhostslookup = ""
	If($nic.winsenablelmhostslookup)
	{
		$xwinsenablelmhostslookup = "Yes"
	}
	Else
	{
		$xwinsenablelmhostslookup = "No"
	}

	If($MSWORD -or $PDF)
	{
		[System.Collections.Hashtable[]] $NicInformation = @()
		$NicInformation += @{ Data = "Name"; Value = $ThisNic.Name; }
		If($ThisNic.Name -ne $nic.description)
		{
			$NicInformation += @{ Data = "Description"; Value = $Nic.description; }
		}
		$NicInformation += @{ Data = "Connection ID"; Value = $ThisNic.NetConnectionID; }
		If(validObject $Nic Manufacturer)
		{
			$NicInformation += @{ Data = "Manufacturer"; Value = $Nic.manufacturer; }
		}
		$NicInformation += @{ Data = "Availability"; Value = $xAvailability; }
		$NicInformation += @{ Data = "Allow the computer to turn off this device to save power"; Value = $PowerSaving; }
		$NicInformation += @{ Data = "Receive Side Scaling"; Value = $RSSEnabled; }
		$NicInformation += @{ Data = "Physical Address"; Value = $Nic.macaddress; }
		If($xIPAddress.Count -gt 1)
		{
			$NicInformation += @{ Data = "IP Address"; Value = $xIPAddress[0]; }
			$NicInformation += @{ Data = "Default Gateway"; Value = $Nic.Defaultipgateway; }
			$NicInformation += @{ Data = "Subnet Mask"; Value = $xIPSubnet[0]; }
			$cnt = -1
			ForEach($tmp in $xIPAddress)
			{
				$cnt++
				If($cnt -gt 0)
				{
					$NicInformation += @{ Data = "IP Address"; Value = $tmp; }
					$NicInformation += @{ Data = "Subnet Mask"; Value = $xIPSubnet[$cnt]; }
				}
			}
		}
		Else
		{
			$NicInformation += @{ Data = "IP Address"; Value = $xIPAddress; }
			$NicInformation += @{ Data = "Default Gateway"; Value = $Nic.Defaultipgateway; }
			$NicInformation += @{ Data = "Subnet Mask"; Value = $xIPSubnet; }
		}
		If($nic.dhcpenabled)
		{
			$DHCPLeaseObtainedDate = $nic.ConvertToDateTime($nic.dhcpleaseobtained)
			$DHCPLeaseExpiresDate = $nic.ConvertToDateTime($nic.dhcpleaseexpires)
			$NicInformation += @{ Data = "DHCP Enabled"; Value = $Nic.dhcpenabled; }
			$NicInformation += @{ Data = "DHCP Lease Obtained"; Value = $dhcpleaseobtaineddate; }
			$NicInformation += @{ Data = "DHCP Lease Expires"; Value = $dhcpleaseexpiresdate; }
			$NicInformation += @{ Data = "DHCP Server"; Value = $Nic.dhcpserver; }
		}
		If(![String]::IsNullOrEmpty($nic.dnsdomain))
		{
			$NicInformation += @{ Data = "DNS Domain"; Value = $Nic.dnsdomain; }
		}
		If($Null -ne $nic.dnsdomainsuffixsearchorder -and $nic.dnsdomainsuffixsearchorder.length -gt 0)
		{
			$NicInformation += @{ Data = "DNS Search Suffixes"; Value = $xnicdnsdomainsuffixsearchorder[0]; }
			$cnt = -1
			ForEach($tmp in $xnicdnsdomainsuffixsearchorder)
			{
				$cnt++
				If($cnt -gt 0)
				{
					$NicInformation += @{ Data = ""; Value = $tmp; }
				}
			}
		}
		$NicInformation += @{ Data = "DNS WINS Enabled"; Value = $xdnsenabledforwinsresolution; }
		If($Null -ne $nic.dnsserversearchorder -and $nic.dnsserversearchorder.length -gt 0)
		{
			$NicInformation += @{ Data = "DNS Servers"; Value = $xnicdnsserversearchorder[0]; }
			$cnt = -1
			ForEach($tmp in $xnicdnsserversearchorder)
			{
				$cnt++
				If($cnt -gt 0)
				{
					$NicInformation += @{ Data = ""; Value = $tmp; }
				}
			}
		}
		$NicInformation += @{ Data = "NetBIOS Setting"; Value = $xTcpipNetbiosOptions; }
		$NicInformation += @{ Data = "WINS: Enabled LMHosts"; Value = $xwinsenablelmhostslookup; }
		If(![String]::IsNullOrEmpty($nic.winshostlookupfile))
		{
			$NicInformation += @{ Data = "Host Lookup File"; Value = $Nic.winshostlookupfile; }
		}
		If(![String]::IsNullOrEmpty($nic.winsprimaryserver))
		{
			$NicInformation += @{ Data = "Primary Server"; Value = $Nic.winsprimaryserver; }
		}
		If(![String]::IsNullOrEmpty($nic.winssecondaryserver))
		{
			$NicInformation += @{ Data = "Secondary Server"; Value = $Nic.winssecondaryserver; }
		}
		If(![String]::IsNullOrEmpty($nic.winsscopeid))
		{
			$NicInformation += @{ Data = "Scope ID"; Value = $Nic.winsscopeid; }
		}
		$Table = AddWordTable -Hashtable $NicInformation -Columns Data,Value -List -AutoFit $wdAutoFitFixed;

		## Set first column format
		SetWordCellFormat -Collection $Table.Columns.Item(1).Cells -Bold -BackgroundColor $wdColorGray15;

		## IB - set column widths without recursion
		$Table.Columns.Item(1).Width = 150;
		$Table.Columns.Item(2).Width = 200;

		$Table.Rows.SetLeftIndent($Indent0TabStops,$wdAdjustProportional)

		FindWordDocumentEnd
		$Table = $Null
	}
	ElseIf($Text)
	{
		Line 2 "Name`t`t`t: " $ThisNic.Name
		If($ThisNic.Name -ne $nic.description)
		{
			Line 2 "Description`t`t: " $nic.description
		}
		Line 2 "Connection ID`t`t: " $ThisNic.NetConnectionID
		If(validObject $Nic Manufacturer)
		{
			Line 2 "Manufacturer`t`t: " $Nic.manufacturer
		}
		Line 2 "Availability`t`t: " $xAvailability
		Line 2 "Allow computer to turn "
		Line 2 "off device to save power: " $PowerSaving
		Line 2 "Receive Side Scaling`t: " $RSSEnabled
		Line 2 "Physical Address`t: " $nic.macaddress
		Line 2 "IP Address`t`t: " $xIPAddress[0]
		$cnt = -1
		ForEach($tmp in $xIPAddress)
		{
			$cnt++
			If($cnt -gt 0)
			{
				Line 5 "  " $tmp
			}
		}
		Line 2 "Default Gateway`t`t: " $Nic.Defaultipgateway
		Line 2 "Subnet Mask`t`t: " $xIPSubnet[0]
		$cnt = -1
		ForEach($tmp in $xIPSubnet)
		{
			$cnt++
			If($cnt -gt 0)
			{
				Line 5 "  " $tmp
			}
		}
		If($nic.dhcpenabled)
		{
			$DHCPLeaseObtainedDate = $nic.ConvertToDateTime($nic.dhcpleaseobtained)
			$DHCPLeaseExpiresDate = $nic.ConvertToDateTime($nic.dhcpleaseexpires)
			Line 2 "DHCP Enabled`t`t: " $nic.dhcpenabled
			Line 2 "DHCP Lease Obtained`t: " $dhcpleaseobtaineddate
			Line 2 "DHCP Lease Expires`t: " $dhcpleaseexpiresdate
			Line 2 "DHCP Server`t`t:" $nic.dhcpserver
		}
		If(![String]::IsNullOrEmpty($nic.dnsdomain))
		{
			Line 2 "DNS Domain`t`t: " $nic.dnsdomain
		}
		If($Null -ne $nic.dnsdomainsuffixsearchorder -and $nic.dnsdomainsuffixsearchorder.length -gt 0)
		{
			[int]$x = 1
			Line 2 "DNS Search Suffixes`t: " $xnicdnsdomainsuffixsearchorder[0]
			$cnt = -1
			ForEach($tmp in $xnicdnsdomainsuffixsearchorder)
			{
				$cnt++
				If($cnt -gt 0)
				{
					Line 5 "  " $tmp
				}
			}
		}
		Line 2 "DNS WINS Enabled`t: " $xdnsenabledforwinsresolution
		If($Null -ne $nic.dnsserversearchorder -and $nic.dnsserversearchorder.length -gt 0)
		{
			[int]$x = 1
			Line 2 "DNS Servers`t`t: " $xnicdnsserversearchorder[0]
			$cnt = -1
			ForEach($tmp in $xnicdnsserversearchorder)
			{
				$cnt++
				If($cnt -gt 0)
				{
					Line 5 "  " $tmp
				}
			}
		}
		Line 2 "NetBIOS Setting`t`t: " $xTcpipNetbiosOptions
		Line 2 "WINS:"
		Line 3 "Enabled LMHosts`t: " $xwinsenablelmhostslookup
		If(![String]::IsNullOrEmpty($nic.winshostlookupfile))
		{
			Line 3 "Host Lookup File`t: " $nic.winshostlookupfile
		}
		If(![String]::IsNullOrEmpty($nic.winsprimaryserver))
		{
			Line 3 "Primary Server`t: " $nic.winsprimaryserver
		}
		If(![String]::IsNullOrEmpty($nic.winssecondaryserver))
		{
			Line 3 "Secondary Server`t: " $nic.winssecondaryserver
		}
		If(![String]::IsNullOrEmpty($nic.winsscopeid))
		{
			Line 3 "Scope ID`t`t: " $nic.winsscopeid
		}
	}
	ElseIf($HTML)
	{
		$rowdata = @()
		$columnHeaders = @("Name",($htmlsilver -bor $htmlbold),$ThisNic.Name,$htmlwhite)
		If($ThisNic.Name -ne $nic.description)
		{
			$rowdata += @(,('Description',($htmlsilver -bor $htmlbold),$Nic.description,$htmlwhite))
		}
		$rowdata += @(,('Connection ID',($htmlsilver -bor $htmlbold),$ThisNic.NetConnectionID,$htmlwhite))
		If(validObject $Nic Manufacturer)
		{
			$rowdata += @(,('Manufacturer',($htmlsilver -bor $htmlbold),$Nic.manufacturer,$htmlwhite))
		}
		$rowdata += @(,('Availability',($htmlsilver -bor $htmlbold),$xAvailability,$htmlwhite))
		$rowdata += @(,('Allow the computer to turn off this device to save power',($htmlsilver -bor $htmlbold),$PowerSaving,$htmlwhite))
		$rowdata += @(,('Receive Side Scaling',($htmlsilver -bor $htmlbold),$RSSEnabled,$htmlwhite))
		$rowdata += @(,('Physical Address',($htmlsilver -bor $htmlbold),$Nic.macaddress,$htmlwhite))
		$rowdata += @(,('IP Address',($htmlsilver -bor $htmlbold),$xIPAddress[0],$htmlwhite))
		$cnt = -1
		ForEach($tmp in $xIPAddress)
		{
			$cnt++
			If($cnt -gt 0)
			{
				$rowdata += @(,('IP Address',($htmlsilver -bor $htmlbold),$tmp,$htmlwhite))
			}
		}
		$rowdata += @(,('Default Gateway',($htmlsilver -bor $htmlbold),$Nic.Defaultipgateway[0],$htmlwhite))
		$rowdata += @(,('Subnet Mask',($htmlsilver -bor $htmlbold),$xIPSubnet[0],$htmlwhite))
		$cnt = -1
		ForEach($tmp in $xIPSubnet)
		{
			$cnt++
			If($cnt -gt 0)
			{
				$rowdata += @(,('Subnet Mask',($htmlsilver -bor $htmlbold),$tmp,$htmlwhite))
			}
		}
		If($nic.dhcpenabled)
		{
			$DHCPLeaseObtainedDate = $nic.ConvertToDateTime($nic.dhcpleaseobtained)
			$DHCPLeaseExpiresDate = $nic.ConvertToDateTime($nic.dhcpleaseexpires)
			$rowdata += @(,('DHCP Enabled',($htmlsilver -bor $htmlbold),$Nic.dhcpenabled,$htmlwhite))
			$rowdata += @(,('DHCP Lease Obtained',($htmlsilver -bor $htmlbold),$dhcpleaseobtaineddate,$htmlwhite))
			$rowdata += @(,('DHCP Lease Expires',($htmlsilver -bor $htmlbold),$dhcpleaseexpiresdate,$htmlwhite))
			$rowdata += @(,('DHCP Server',($htmlsilver -bor $htmlbold),$Nic.dhcpserver,$htmlwhite))
		}
		If(![String]::IsNullOrEmpty($nic.dnsdomain))
		{
			$rowdata += @(,('DNS Domain',($htmlsilver -bor $htmlbold),$Nic.dnsdomain,$htmlwhite))
		}
		If($Null -ne $nic.dnsdomainsuffixsearchorder -and $nic.dnsdomainsuffixsearchorder.length -gt 0)
		{
			$rowdata += @(,('DNS Search Suffixes',($htmlsilver -bor $htmlbold),$xnicdnsdomainsuffixsearchorder[0],$htmlwhite))
			$cnt = -1
			ForEach($tmp in $xnicdnsdomainsuffixsearchorder)
			{
				$cnt++
				If($cnt -gt 0)
				{
					$rowdata += @(,('',($htmlsilver -bor $htmlbold),$tmp,$htmlwhite))
				}
			}
		}
		$rowdata += @(,('DNS WINS Enabled',($htmlsilver -bor $htmlbold),$xdnsenabledforwinsresolution,$htmlwhite))
		If($Null -ne $nic.dnsserversearchorder -and $nic.dnsserversearchorder.length -gt 0)
		{
			$rowdata += @(,('DNS Servers',($htmlsilver -bor $htmlbold),$xnicdnsserversearchorder[0],$htmlwhite))
			$cnt = -1
			ForEach($tmp in $xnicdnsserversearchorder)
			{
				$cnt++
				If($cnt -gt 0)
				{
					$rowdata += @(,('',($htmlsilver -bor $htmlbold),$tmp,$htmlwhite))
				}
			}
		}
		$rowdata += @(,('NetBIOS Setting',($htmlsilver -bor $htmlbold),$xTcpipNetbiosOptions,$htmlwhite))
		$rowdata += @(,('WINS: Enabled LMHosts',($htmlsilver -bor $htmlbold),$xwinsenablelmhostslookup,$htmlwhite))
		If(![String]::IsNullOrEmpty($nic.winshostlookupfile))
		{
			$rowdata += @(,('Host Lookup File',($htmlsilver -bor $htmlbold),$Nic.winshostlookupfile,$htmlwhite))
		}
		If(![String]::IsNullOrEmpty($nic.winsprimaryserver))
		{
			$rowdata += @(,('Primary Server',($htmlsilver -bor $htmlbold),$Nic.winsprimaryserver,$htmlwhite))
		}
		If(![String]::IsNullOrEmpty($nic.winssecondaryserver))
		{
			$rowdata += @(,('Secondary Server',($htmlsilver -bor $htmlbold),$Nic.winssecondaryserver,$htmlwhite))
		}
		If(![String]::IsNullOrEmpty($nic.winsscopeid))
		{
			$rowdata += @(,('Scope ID',($htmlsilver -bor $htmlbold),$Nic.winsscopeid,$htmlwhite))
		}

		$msg = ""
		$columnWidths = @("150px","200px")
		FormatHTMLTable $msg -rowarray $rowdata -columnArray $columnheaders -fixedWidth $columnWidths -tablewidth "350"
		WriteHTMLLine 0 0 " "
	}
}
#endregion

#region word specific functions
Function SetWordHashTable
{
	Param([string]$CultureCode)

	#optimized by Michael B. SMith
	
	# DE and FR translations for Word 2010 by Vladimir Radojevic
	# Vladimir.Radojevic@Commerzreal.com

	# DA translations for Word 2010 by Thomas Daugaard
	# Citrix Infrastructure Specialist at edgemo A/S

	# CA translations by Javier Sanchez 
	# CEO & Founder 101 Consulting

	#ca - Catalan
	#da - Danish
	#de - German
	#en - English
	#es - Spanish
	#fi - Finnish
	#fr - French
	#nb - Norwegian
	#nl - Dutch
	#pt - Portuguese
	#sv - Swedish
	#zh - Chinese
	
	[string]$toc = $(
		Switch ($CultureCode)
		{
			'ca-'	{ 'Taula automática 2'; Break }
			'da-'	{ 'Automatisk tabel 2'; Break }
			'de-'	{ 'Automatische Tabelle 2'; Break }
			'en-'	{ 'Automatic Table 2'; Break }
			'es-'	{ 'Tabla automática 2'; Break }
			'fi-'	{ 'Automaattinen taulukko 2'; Break }
			'fr-'	{ 'Table automatique 2'; Break } #changed 13-feb-2017 david roquier and samuel legrand
			'nb-'	{ 'Automatisk tabell 2'; Break }
			'nl-'	{ 'Automatische inhoudsopgave 2'; Break }
			'pt-'	{ 'Sumário Automático 2'; Break }
			# fix in 1.25 thanks to Johan Kallio 'sv-'	{ 'Automatisk innehållsförteckning2'; Break }
			'sv-'	{ 'Automatisk innehållsförteckn2'; Break }
			'zh-'	{ '自动目录 2'; Break }
		}
	)

	$Script:myHash                      = @{}
	$Script:myHash.Word_TableOfContents = $toc
	$Script:myHash.Word_NoSpacing       = $wdStyleNoSpacing
	$Script:myHash.Word_Heading1        = $wdStyleheading1
	$Script:myHash.Word_Heading2        = $wdStyleheading2
	$Script:myHash.Word_Heading3        = $wdStyleheading3
	$Script:myHash.Word_Heading4        = $wdStyleheading4
	$Script:myHash.Word_TableGrid       = $wdTableGrid
}

Function GetCulture
{
	Param([int]$WordValue)
	
	#codes obtained from http://support.microsoft.com/kb/221435
	#http://msdn.microsoft.com/en-us/library/bb213877(v=office.12).aspx
	$CatalanArray = 1027
	$ChineseArray = 2052,3076,5124,4100
	$DanishArray = 1030
	$DutchArray = 2067, 1043
	$EnglishArray = 3081, 10249, 4105, 9225, 6153, 8201, 5129, 13321, 7177, 11273, 2057, 1033, 12297
	$FinnishArray = 1035
	$FrenchArray = 2060, 1036, 11276, 3084, 12300, 5132, 13324, 6156, 8204, 10252, 7180, 9228, 4108
	$GermanArray = 1031, 3079, 5127, 4103, 2055
	$NorwegianArray = 1044, 2068
	$PortugueseArray = 1046, 2070
	$SpanishArray = 1034, 11274, 16394, 13322, 9226, 5130, 7178, 12298, 17418, 4106, 18442, 19466, 6154, 15370, 10250, 20490, 3082, 14346, 8202
	$SwedishArray = 1053, 2077

	#ca - Catalan
	#da - Danish
	#de - German
	#en - English
	#es - Spanish
	#fi - Finnish
	#fr - French
	#nb - Norwegian
	#nl - Dutch
	#pt - Portuguese
	#sv - Swedish
	#zh - Chinese

	Switch ($WordValue)
	{
		{$CatalanArray -contains $_} {$CultureCode = "ca-"}
		{$ChineseArray -contains $_} {$CultureCode = "zh-"}
		{$DanishArray -contains $_} {$CultureCode = "da-"}
		{$DutchArray -contains $_} {$CultureCode = "nl-"}
		{$EnglishArray -contains $_} {$CultureCode = "en-"}
		{$FinnishArray -contains $_} {$CultureCode = "fi-"}
		{$FrenchArray -contains $_} {$CultureCode = "fr-"}
		{$GermanArray -contains $_} {$CultureCode = "de-"}
		{$NorwegianArray -contains $_} {$CultureCode = "nb-"}
		{$PortugueseArray -contains $_} {$CultureCode = "pt-"}
		{$SpanishArray -contains $_} {$CultureCode = "es-"}
		{$SwedishArray -contains $_} {$CultureCode = "sv-"}
		Default {$CultureCode = "en-"}
	}
	
	Return $CultureCode
}

Function ValidateCoverPage
{
	Param([int]$xWordVersion, [string]$xCP, [string]$CultureCode)
	
	$xArray = ""
	
	Switch ($CultureCode)
	{
		'ca-'	{
				If($xWordVersion -eq $wdWord2016)
				{
					$xArray = ("Austin", "En bandes", "Faceta", "Filigrana",
					"Integral", "Ió (clar)", "Ió (fosc)", "Línia lateral",
					"Moviment", "Quadrícula", "Retrospectiu", "Sector (clar)",
					"Sector (fosc)", "Semàfor", "Visualització principal", "Whisp")
				}
				ElseIf($xWordVersion -eq $wdWord2013)
				{
					$xArray = ("Austin", "En bandes", "Faceta", "Filigrana",
					"Integral", "Ió (clar)", "Ió (fosc)", "Línia lateral",
					"Moviment", "Quadrícula", "Retrospectiu", "Sector (clar)",
					"Sector (fosc)", "Semàfor", "Visualització", "Whisp")
				}
				ElseIf($xWordVersion -eq $wdWord2010)
				{
					$xArray = ("Alfabet", "Anual", "Austin", "Conservador",
					"Contrast", "Cubicles", "Diplomàtic", "Exposició",
					"Línia lateral", "Mod", "Mosiac", "Moviment", "Paper de diari",
					"Perspectiva", "Piles", "Quadrícula", "Sobri",
					"Transcendir", "Trencaclosques")
				}
			}

		'da-'	{
				If($xWordVersion -eq $wdWord2016)
				{
					$xArray = ("Austin", "BevægElse", "Brusen", "Facet", "Filigran", 
					"Gitter", "Integral", "Ion (lys)", "Ion (mørk)", 
					"Retro", "Semafor", "Sidelinje", "Stribet", 
					"Udsnit (lys)", "Udsnit (mørk)", "Visningsmaster")
				}
				ElseIf($xWordVersion -eq $wdWord2013)
				{
					$xArray = ("BevægElse", "Brusen", "Ion (lys)", "Filigran",
					"Retro", "Semafor", "Visningsmaster", "Integral",
					"Facet", "Gitter", "Stribet", "Sidelinje", "Udsnit (lys)",
					"Udsnit (mørk)", "Ion (mørk)", "Austin")
				}
				ElseIf($xWordVersion -eq $wdWord2010)
				{
					$xArray = ("BevægElse", "Moderat", "Perspektiv", "Firkanter",
					"Overskrid", "Alfabet", "Kontrast", "Stakke", "Fliser", "Gåde",
					"Gitter", "Austin", "Eksponering", "Sidelinje", "Enkel",
					"Nålestribet", "Årlig", "Avispapir", "Tradionel")
				}
			}

		'de-'	{
				If($xWordVersion -eq $wdWord2016)
				{
					$xArray = ("Austin", "Bewegung", "Facette", "Filigran", 
					"Gebändert", "Integral", "Ion (dunkel)", "Ion (hell)", 
					"Pfiff", "Randlinie", "Raster", "Rückblick", 
					"Segment (dunkel)", "Segment (hell)", "Semaphor", 
					"ViewMaster")
				}
				ElseIf($xWordVersion -eq $wdWord2013)
				{
					$xArray = ("Semaphor", "Segment (hell)", "Ion (hell)",
					"Raster", "Ion (dunkel)", "Filigran", "Rückblick", "Pfiff",
					"ViewMaster", "Segment (dunkel)", "Verbunden", "Bewegung",
					"Randlinie", "Austin", "Integral", "Facette")
				}
				ElseIf($xWordVersion -eq $wdWord2010)
				{
					$xArray = ("Alphabet", "Austin", "Bewegung", "Durchscheinend",
					"Herausgestellt", "Jährlich", "Kacheln", "Kontrast", "Kubistisch",
					"Modern", "Nadelstreifen", "Perspektive", "Puzzle", "Randlinie",
					"Raster", "Schlicht", "Stapel", "Traditionell", "Zeitungspapier")
				}
			}

		'en-'	{
				If($xWordVersion -eq $wdWord2013 -or $xWordVersion -eq $wdWord2016)
				{
					$xArray = ("Austin", "Banded", "Facet", "Filigree", "Grid",
					"Integral", "Ion (Dark)", "Ion (Light)", "Motion", "Retrospect",
					"Semaphore", "Sideline", "Slice (Dark)", "Slice (Light)", "ViewMaster",
					"Whisp")
				}
				ElseIf($xWordVersion -eq $wdWord2010)
				{
					$xArray = ("Alphabet", "Annual", "Austere", "Austin", "Conservative",
					"Contrast", "Cubicles", "Exposure", "Grid", "Mod", "Motion", "Newsprint",
					"Perspective", "Pinstripes", "Puzzle", "Sideline", "Stacks", "Tiles", "Transcend")
				}
			}

		'es-'	{
				If($xWordVersion -eq $wdWord2016)
				{
					$xArray = ("Austin", "Con bandas", "Cortar (oscuro)", "Cuadrícula", 
					"Whisp", "Faceta", "Filigrana", "Integral", "Ion (claro)", 
					"Ion (oscuro)", "Línea lateral", "Movimiento", "Retrospectiva", 
					"Semáforo", "Slice (luz)", "Vista principal", "Whisp")
				}
				ElseIf($xWordVersion -eq $wdWord2013)
				{
					$xArray = ("Whisp", "Vista principal", "Filigrana", "Austin",
					"Slice (luz)", "Faceta", "Semáforo", "Retrospectiva", "Cuadrícula",
					"Movimiento", "Cortar (oscuro)", "Línea lateral", "Ion (oscuro)",
					"Ion (claro)", "Integral", "Con bandas")
				}
				ElseIf($xWordVersion -eq $wdWord2010)
				{
					$xArray = ("Alfabeto", "Anual", "Austero", "Austin", "Conservador",
					"Contraste", "Cuadrícula", "Cubículos", "Exposición", "Línea lateral",
					"Moderno", "Mosaicos", "Movimiento", "Papel periódico",
					"Perspectiva", "Pilas", "Puzzle", "Rayas", "Sobrepasar")
				}
			}

		'fi-'	{
				If($xWordVersion -eq $wdWord2016)
				{
					$xArray = ("Filigraani", "Integraali", "Ioni (tumma)",
					"Ioni (vaalea)", "Opastin", "Pinta", "Retro", "Sektori (tumma)",
					"Sektori (vaalea)", "Vaihtuvavärinen", "ViewMaster", "Austin",
					"Kuiskaus", "Liike", "Ruudukko", "Sivussa")
				}
				ElseIf($xWordVersion -eq $wdWord2013)
				{
					$xArray = ("Filigraani", "Integraali", "Ioni (tumma)",
					"Ioni (vaalea)", "Opastin", "Pinta", "Retro", "Sektori (tumma)",
					"Sektori (vaalea)", "Vaihtuvavärinen", "ViewMaster", "Austin",
					"Kiehkura", "Liike", "Ruudukko", "Sivussa")
				}
				ElseIf($xWordVersion -eq $wdWord2010)
				{
					$xArray = ("Aakkoset", "Askeettinen", "Austin", "Kontrasti",
					"Laatikot", "Liike", "Liituraita", "Mod", "Osittain peitossa",
					"Palapeli", "Perinteinen", "Perspektiivi", "Pinot", "Ruudukko",
					"Ruudut", "Sanomalehtipaperi", "Sivussa", "Vuotuinen", "Ylitys")
				}
			}

		'fr-'	{
				If($xWordVersion -eq $wdWord2013 -or $xWordVersion -eq $wdWord2016)
				{
					$xArray = ("À bandes", "Austin", "Facette", "Filigrane", 
					"Guide", "Intégrale", "Ion (clair)", "Ion (foncé)", 
					"Lignes latérales", "Quadrillage", "Rétrospective", "Secteur (clair)", 
					"Secteur (foncé)", "Sémaphore", "ViewMaster", "Whisp")
				}
				ElseIf($xWordVersion -eq $wdWord2010)
				{
					$xArray = ("Alphabet", "Annuel", "Austère", "Austin", 
					"Blocs empilés", "Classique", "Contraste", "Emplacements de bureau", 
					"Exposition", "Guide", "Ligne latérale", "Moderne", 
					"Mosaïques", "Mots croisés", "Papier journal", "Perspective",
					"Quadrillage", "Rayures fines", "Transcendant")
				}
			}

		'nb-'	{
				If($xWordVersion -eq $wdWord2013 -or $xWordVersion -eq $wdWord2016)
				{
					$xArray = ("Austin", "BevegElse", "Dempet", "Fasett", "Filigran",
					"Integral", "Ion (lys)", "Ion (mørk)", "Retrospekt", "Rutenett",
					"Sektor (lys)", "Sektor (mørk)", "Semafor", "Sidelinje", "Stripet",
					"ViewMaster")
				}
				ElseIf($xWordVersion -eq $wdWord2010)
				{
					$xArray = ("Alfabet", "Årlig", "Avistrykk", "Austin", "Avlukker",
					"BevegElse", "Engasjement", "Enkel", "Fliser", "Konservativ",
					"Kontrast", "Mod", "Perspektiv", "Puslespill", "Rutenett", "Sidelinje",
					"Smale striper", "Stabler", "Transcenderende")
				}
			}

		'nl-'	{
				If($xWordVersion -eq $wdWord2013 -or $xWordVersion -eq $wdWord2016)
				{
					$xArray = ("Austin", "Beweging", "Facet", "Filigraan", "Gestreept",
					"Integraal", "Ion (donker)", "Ion (licht)", "Raster",
					"Segment (Light)", "Semafoor", "Slice (donker)", "Spriet",
					"Terugblik", "Terzijde", "ViewMaster")
				}
				ElseIf($xWordVersion -eq $wdWord2010)
				{
					$xArray = ("Aantrekkelijk", "Alfabet", "Austin", "Bescheiden",
					"Beweging", "Blikvanger", "Contrast", "Eenvoudig", "Jaarlijks",
					"Krantenpapier", "Krijtstreep", "Kubussen", "Mod", "Perspectief",
					"Puzzel", "Raster", "Stapels",
					"Tegels", "Terzijde")
				}
			}

		'pt-'	{
				If($xWordVersion -eq $wdWord2013 -or $xWordVersion -eq $wdWord2016)
				{
					$xArray = ("Animação", "Austin", "Em Tiras", "Exibição Mestra",
					"Faceta", "Fatia (Clara)", "Fatia (Escura)", "Filete", "Filigrana", 
					"Grade", "Integral", "Íon (Claro)", "Íon (Escuro)", "Linha Lateral",
					"Retrospectiva", "Semáforo")
				}
				ElseIf($xWordVersion -eq $wdWord2010)
				{
					$xArray = ("Alfabeto", "Animação", "Anual", "Austero", "Austin", "Baias",
					"Conservador", "Contraste", "Exposição", "Grade", "Ladrilhos",
					"Linha Lateral", "Listras", "Mod", "Papel Jornal", "Perspectiva", "Pilhas",
					"Quebra-cabeça", "Transcend")
				}
			}

		'sv-'	{
				If($xWordVersion -eq $wdWord2013 -or $xWordVersion -eq $wdWord2016)
				{
					$xArray = ("Austin", "Band", "Fasett", "Filigran", "Integrerad", "Jon (ljust)",
					"Jon (mörkt)", "Knippe", "Rutnät", "RörElse", "Sektor (ljus)", "Sektor (mörk)",
					"Semafor", "Sidlinje", "VisaHuvudsida", "Återblick")
				}
				ElseIf($xWordVersion -eq $wdWord2010)
				{
					$xArray = ("Alfabetmönster", "Austin", "Enkelt", "Exponering", "Konservativt",
					"Kontrast", "Kritstreck", "Kuber", "Perspektiv", "Plattor", "Pussel", "Rutnät",
					"RörElse", "Sidlinje", "Sobert", "Staplat", "Tidningspapper", "Årligt",
					"Övergående")
				}
			}

		'zh-'	{
				If($xWordVersion -eq $wdWord2010 -or $xWordVersion -eq $wdWord2013 -or $xWordVersion -eq $wdWord2016)
				{
					$xArray = ('奥斯汀', '边线型', '花丝', '怀旧', '积分',
					'离子(浅色)', '离子(深色)', '母版型', '平面', '切片(浅色)',
					'切片(深色)', '丝状', '网格', '镶边', '信号灯',
					'运动型')
				}
			}

		Default	{
					If($xWordVersion -eq $wdWord2013 -or $xWordVersion -eq $wdWord2016)
					{
						$xArray = ("Austin", "Banded", "Facet", "Filigree", "Grid",
						"Integral", "Ion (Dark)", "Ion (Light)", "Motion", "Retrospect",
						"Semaphore", "Sideline", "Slice (Dark)", "Slice (Light)", "ViewMaster",
						"Whisp")
					}
					ElseIf($xWordVersion -eq $wdWord2010)
					{
						$xArray = ("Alphabet", "Annual", "Austere", "Austin", "Conservative",
						"Contrast", "Cubicles", "Exposure", "Grid", "Mod", "Motion", "Newsprint",
						"Perspective", "Pinstripes", "Puzzle", "Sideline", "Stacks", "Tiles", "Transcend")
					}
				}
	}
	
	If($xArray -contains $xCP)
	{
		$xArray = $Null
		Return $True
	}
	Else
	{
		$xArray = $Null
		Return $False
	}
}

Function CheckWordPrereq
{
	If((Test-Path  REGISTRY::HKEY_CLASSES_ROOT\Word.Application) -eq $False)
	{
		$ErrorActionPreference = $SaveEAPreference
		
		If(($MSWord -eq $False) -and ($PDF -eq $True))
		{
			Write-Host "`n`n`t`tThis script uses Microsoft Word's SaveAs PDF function, please install Microsoft Word`n`n"
			AbortScript
		}
		Else
		{
			Write-Host "`n`n`t`tThis script directly outputs to Microsoft Word, please install Microsoft Word`n`n"
			AbortScript
		}
	}

	#find out our session (usually "1" except on TS/RDC or Citrix)
	$SessionID = (Get-Process -PID $PID).SessionId
	
	#Find out if winword runsning in our session
	[bool]$wordrunning = $null –ne ((Get-Process 'WinWord' -ea 0) | Where-Object {$_.SessionId -eq $SessionID})
	If($wordrunning)
	{
		$ErrorActionPreference = $SaveEAPreference
		Write-Host "`n`n`tPlease close all instances of Microsoft Word before running this report.`n`n"
		AbortScript
	}
}

Function CheckExcelPrereq
{
	If((Test-Path  REGISTRY::HKEY_CLASSES_ROOT\Excel.Application) -eq $False)
	{
		$ErrorActionPreference = $SaveEAPreference
		Write-Host "`n`n`t`tFor the Delivery Groups Utilization option, this script directly outputs to Microsoft Excel, `n`t`tplease install Microsoft Excel or do not use the DeliveryGroupsUtilization (DGU) switch`n`n"
		AbortScript
	}

	#find out our session (usually "1" except on TS/RDC or Citrix)
	$SessionID = (Get-Process -PID $PID).SessionId
	
	#Find out if excel runsning in our session
	#[bool]$excelrunning = ((Get-Process 'Excel' -ea 0) | Where-Object {$_.SessionId -eq $SessionID}) -ne $Null
	#fix by MBS in V2.20
	[bool]$excelrunning = $null –ne ((Get-Process 'Excel' -ea 0) | Where-Object {$_.SessionId -eq $SessionID})
	
	If($excelrunning)
	{
		$ErrorActionPreference = $SaveEAPreference
		Write-Host "`n`n`tPlease close all instances of Microsoft Excel before running this report.`n`n"
		AbortScript
	}
}

Function ValidateCompanyName
{
	[bool]$xResult = Test-RegistryValue "HKCU:\Software\Microsoft\Office\Common\UserInfo" "CompanyName"
	If($xResult)
	{
		Return Get-RegistryValue "HKCU:\Software\Microsoft\Office\Common\UserInfo" "CompanyName"
	}
	Else
	{
		$xResult = Test-RegistryValue "HKCU:\Software\Microsoft\Office\Common\UserInfo" "Company"
		If($xResult)
		{
			Return Get-RegistryValue "HKCU:\Software\Microsoft\Office\Common\UserInfo" "Company"
		}
		Else
		{
			Return ""
		}
	}
}

Function Set-DocumentProperty {
    <#
	.SYNOPSIS
	Function to set the Title Page document properties in MS Word
	.DESCRIPTION
	Long description
	.PARAMETER Document
	Current Document Object
	.PARAMETER DocProperty
	Parameter description
	.PARAMETER Value
	Parameter description
	.EXAMPLE
	Set-DocumentProperty -Document $Script:Doc -DocProperty Title -Value 'MyTitle'
	.EXAMPLE
	Set-DocumentProperty -Document $Script:Doc -DocProperty Company -Value 'MyCompany'
	.EXAMPLE
	Set-DocumentProperty -Document $Script:Doc -DocProperty Author -Value 'Jim Moyle'
	.EXAMPLE
	Set-DocumentProperty -Document $Script:Doc -DocProperty Subject -Value 'MySubjectTitle'
	.NOTES
	Function Created by Jim Moyle June 2017
	Twitter : @JimMoyle
	#>
    param (
        [object]$Document,
        [String]$DocProperty,
        [string]$Value
    )
    try {
        $binding = "System.Reflection.BindingFlags" -as [type]
        $builtInProperties = $Document.BuiltInDocumentProperties
        $property = [System.__ComObject].invokemember("item", $binding::GetProperty, $null, $BuiltinProperties, $DocProperty)
        [System.__ComObject].invokemember("value", $binding::SetProperty, $null, $property, $Value)
    }
    catch {
        Write-Warning "Failed to set $DocProperty to $Value"
    }
}

Function FindWordDocumentEnd
{
	#return focus to main document    
	$Script:Doc.ActiveWindow.ActivePane.view.SeekView = $wdSeekMainDocument
	#move to the end of the current document
	$Script:Selection.EndKey($wdStory,$wdMove) | Out-Null
}

Function SetupWord
{
	Write-Verbose "$(Get-Date -Format G): Setting up Word"
    
	# Setup word for output
	Write-Verbose "$(Get-Date -Format G): Create Word comObject."
	$Script:Word = New-Object -comobject "Word.Application" -EA 0 4>$Null
	
	If(!$? -or $Null -eq $Script:Word)
	{
		Write-Warning "The Word object could not be created.  You may need to repair your Word installation."
		$ErrorActionPreference = $SaveEAPreference
		Write-Error "
		`n`n
		`t`t
		The Word object could not be created.  You may need to repair your Word installation.
		`n`n
		`t`t
		Script cannot continue.
		`n`n
		"
		Exit
	}

	Write-Verbose "$(Get-Date -Format G): Determine Word language value"
	If( ( validStateProp $Script:Word Language Value__ ) )
	{
		[int]$Script:WordLanguageValue = [int]$Script:Word.Language.Value__
	}
	Else
	{
		[int]$Script:WordLanguageValue = [int]$Script:Word.Language
	}

	If(!($Script:WordLanguageValue -gt -1))
	{
		$ErrorActionPreference = $SaveEAPreference
		Write-Error "
		`n`n
		`t`t
		Unable to determine the Word language value.
		`n`n
		`t`t
		Script cannot continue.
		`n`n
		"
		AbortScript
	}
	Write-Verbose "$(Get-Date -Format G): Word language value is $($Script:WordLanguageValue)"
	
	$Script:WordCultureCode = GetCulture $Script:WordLanguageValue
	
	SetWordHashTable $Script:WordCultureCode
	
	[int]$Script:WordVersion = [int]$Script:Word.Version
	If($Script:WordVersion -eq $wdWord2016)
	{
		$Script:WordProduct = "Word 2016"
	}
	ElseIf($Script:WordVersion -eq $wdWord2013)
	{
		$Script:WordProduct = "Word 2013"
	}
	ElseIf($Script:WordVersion -eq $wdWord2010)
	{
		$Script:WordProduct = "Word 2010"
	}
	ElseIf($Script:WordVersion -eq $wdWord2007)
	{
		$ErrorActionPreference = $SaveEAPreference
		Write-Error "
		`n`n
		`t`t
		Microsoft Word 2007 is no longer supported.
		`n`n
		`t`t
		Script will end.
		`n`n
		"
		AbortScript
	}
	ElseIf($Script:WordVersion -eq 0)
	{
		Write-Error "
		`n`n
		`t`t
		The Word Version is 0. You should run a full online repair of your Office installation.
		`n`n
		`t`t
		Script cannot continue.
		`n`n
		"
		Exit
	}
	Else
	{
		$ErrorActionPreference = $SaveEAPreference
		Write-Error "
		`n`n
		`t`t
		You are running an untested or unsupported version of Microsoft Word.
		`n`n
		`t`t
		Script will end.
		`n`n
		`t`t
		Please send info on your version of Word to webster@carlwebster.com
		`n`n
		"
		AbortScript
	}

	#only validate CompanyName if the field is blank
	If([String]::IsNullOrEmpty($Script:CoName))
	{
		Write-Verbose "$(Get-Date -Format G): Company name is blank.  Retrieve company name from registry."
		$TmpName = ValidateCompanyName
		
		If([String]::IsNullOrEmpty($TmpName))
		{
			Write-Warning "`n`n`t`tCompany Name is blank so Cover Page will not show a Company Name."
			Write-Warning "`n`t`tCheck HKCU:\Software\Microsoft\Office\Common\UserInfo for Company or CompanyName value."
			Write-Warning "`n`t`tYou may want to use the -CompanyName parameter if you need a Company Name on the cover page.`n`n"
		}
		Else
		{
			$Script:CoName = $TmpName
			Write-Verbose "$(Get-Date -Format G): Updated company name to $($Script:CoName)"
		}
	}

	If($Script:WordCultureCode -ne "en-")
	{
		Write-Verbose "$(Get-Date -Format G): Check Default Cover Page for $($WordCultureCode)"
		[bool]$CPChanged = $False
		Switch ($Script:WordCultureCode)
		{
			'ca-'	{
					If($CoverPage -eq "Sideline")
					{
						$CoverPage = "Línia lateral"
						$CPChanged = $True
					}
				}

			'da-'	{
					If($CoverPage -eq "Sideline")
					{
						$CoverPage = "Sidelinje"
						$CPChanged = $True
					}
				}

			'de-'	{
					If($CoverPage -eq "Sideline")
					{
						$CoverPage = "Randlinie"
						$CPChanged = $True
					}
				}

			'es-'	{
					If($CoverPage -eq "Sideline")
					{
						$CoverPage = "Línea lateral"
						$CPChanged = $True
					}
				}

			'fi-'	{
					If($CoverPage -eq "Sideline")
					{
						$CoverPage = "Sivussa"
						$CPChanged = $True
					}
				}

			'fr-'	{
					If($CoverPage -eq "Sideline")
					{
						If($Script:WordVersion -eq $wdWord2013 -or $Script:WordVersion -eq $wdWord2016)
						{
							$CoverPage = "Lignes latérales"
							$CPChanged = $True
						}
						Else
						{
							$CoverPage = "Ligne latérale"
							$CPChanged = $True
						}
					}
				}

			'nb-'	{
					If($CoverPage -eq "Sideline")
					{
						$CoverPage = "Sidelinje"
						$CPChanged = $True
					}
				}

			'nl-'	{
					If($CoverPage -eq "Sideline")
					{
						$CoverPage = "Terzijde"
						$CPChanged = $True
					}
				}

			'pt-'	{
					If($CoverPage -eq "Sideline")
					{
						$CoverPage = "Linha Lateral"
						$CPChanged = $True
					}
				}

			'sv-'	{
					If($CoverPage -eq "Sideline")
					{
						$CoverPage = "Sidlinje"
						$CPChanged = $True
					}
				}

			'zh-'	{
					If($CoverPage -eq "Sideline")
					{
						$CoverPage = "边线型"
						$CPChanged = $True
					}
				}
		}

		If($CPChanged)
		{
			Write-Verbose "$(Get-Date -Format G): Changed Default Cover Page from Sideline to $($CoverPage)"
		}
	}

	Write-Verbose "$(Get-Date -Format G): Validate cover page $($CoverPage) for culture code $($Script:WordCultureCode)"
	[bool]$ValidCP = $False
	
	$ValidCP = ValidateCoverPage $Script:WordVersion $CoverPage $Script:WordCultureCode
	
	If(!$ValidCP)
	{
		$ErrorActionPreference = $SaveEAPreference
		Write-Verbose "$(Get-Date -Format G): Word language value $($Script:WordLanguageValue)"
		Write-Verbose "$(Get-Date -Format G): Culture code $($Script:WordCultureCode)"
		Write-Error "
		`n`n
		`t`t
		For $($Script:WordProduct), $($CoverPage) is not a valid Cover Page option.
		`n`n
		`t`t
		Script cannot continue.
		`n`n
		"
		AbortScript
	}

	ShowScriptOptions

	$Script:Word.Visible = $False

	#http://jdhitsolutions.com/blog/2012/05/san-diego-2012-powershell-deep-dive-slides-and-demos/
	#using Jeff's Demo-WordReport.ps1 file for examples
	Write-Verbose "$(Get-Date -Format G): Load Word Templates"

	[bool]$Script:CoverPagesExist = $False
	[bool]$BuildingBlocksExist = $False

	$Script:Word.Templates.LoadBuildingBlocks()
	#word 2010/2013/2016
	$BuildingBlocksCollection = $Script:Word.Templates | Where-Object {$_.name -eq "Built-In Building Blocks.dotx"}

	Write-Verbose "$(Get-Date -Format G): Attempt to load cover page $($CoverPage)"
	$part = $Null

	$BuildingBlocksCollection | 
	ForEach-Object {
		If ($_.BuildingBlockEntries.Item($CoverPage).Name -eq $CoverPage) 
		{
			$BuildingBlocks = $_
		}
	}        

	If($Null -ne $BuildingBlocks)
	{
		$BuildingBlocksExist = $True

		Try 
		{
			$part = $BuildingBlocks.BuildingBlockEntries.Item($CoverPage)
		}

		Catch
		{
			$part = $Null
		}

		If($Null -ne $part)
		{
			$Script:CoverPagesExist = $True
		}
	}

	If(!$Script:CoverPagesExist)
	{
		Write-Verbose "$(Get-Date -Format G): Cover Pages are not installed or the Cover Page $($CoverPage) does not exist."
		Write-Warning "Cover Pages are not installed or the Cover Page $($CoverPage) does not exist."
		Write-Warning "This report will not have a Cover Page."
	}

	Write-Verbose "$(Get-Date -Format G): Create empty word doc"
	$Script:Doc = $Script:Word.Documents.Add()
	If($Null -eq $Script:Doc)
	{
		Write-Verbose "$(Get-Date -Format G): "
		$ErrorActionPreference = $SaveEAPreference
		Write-Error "
		`n`n
		`t`t
		An empty Word document could not be created.
		`n`n
		`t`t
		Script cannot continue.
		`n`n
		"
		AbortScript
	}

	$Script:Selection = $Script:Word.Selection
	If($Null -eq $Script:Selection)
	{
		Write-Verbose "$(Get-Date -Format G): "
		$ErrorActionPreference = $SaveEAPreference
		Write-Error "
		`n`n
		`t`t
		An unknown error happened selecting the entire Word document for default formatting options.
		`n`n
		`t`t
		Script cannot continue.
		`n`n
		"
		AbortScript
	}

	#set Default tab stops to 1/2 inch (this line is not from Jeff Hicks)
	#36 = .50"
	$Script:Word.ActiveDocument.DefaultTabStop = 36

	#Disable Spell and Grammar Check to resolve issue and improve performance (from Pat Coughlin)
	Write-Verbose "$(Get-Date -Format G): Disable grammar and spell checking"
	#bug reported 1-Apr-2014 by Tim Mangan
	#save current options first before turning them off
	$Script:CurrentGrammarOption = $Script:Word.Options.CheckGrammarAsYouType
	$Script:CurrentSpellingOption = $Script:Word.Options.CheckSpellingAsYouType
	$Script:Word.Options.CheckGrammarAsYouType = $False
	$Script:Word.Options.CheckSpellingAsYouType = $False

	If($BuildingBlocksExist)
	{
		#insert new page, getting ready for table of contents
		Write-Verbose "$(Get-Date -Format G): Insert new page, getting ready for table of contents"
		$part.Insert($Script:Selection.Range,$True) | Out-Null
		$Script:Selection.InsertNewPage()

		#table of contents
		Write-Verbose "$(Get-Date -Format G): Table of Contents - $($Script:MyHash.Word_TableOfContents)"
		$toc = $BuildingBlocks.BuildingBlockEntries.Item($Script:MyHash.Word_TableOfContents)
		If($Null -eq $toc)
		{
			Write-Verbose "$(Get-Date -Format G): "
			Write-Verbose "$(Get-Date -Format G): Table of Content - $($Script:MyHash.Word_TableOfContents) could not be retrieved."
			Write-Warning "This report will not have a Table of Contents."
		}
		Else
		{
			$toc.insert($Script:Selection.Range,$True) | Out-Null
		}
	}
	Else
	{
		Write-Verbose "$(Get-Date -Format G): Table of Contents are not installed."
		Write-Warning "Table of Contents are not installed so this report will not have a Table of Contents."
	}

	#set the footer
	Write-Verbose "$(Get-Date -Format G): Set the footer"
	[string]$footertext = "Report created by $username"

	#get the footer
	Write-Verbose "$(Get-Date -Format G): Get the footer and format font"
	$Script:Doc.ActiveWindow.ActivePane.view.SeekView = $wdSeekPrimaryFooter
	#get the footer and format font
	$footers = $Script:Doc.Sections.Last.Footers
	ForEach ($footer in $footers) 
	{
		If($footer.exists) 
		{
			$footer.range.Font.name = "Calibri"
			$footer.range.Font.size = 8
			$footer.range.Font.Italic = $True
			$footer.range.Font.Bold = $True
		}
	} #end ForEach
	Write-Verbose "$(Get-Date -Format G): Footer text"
	$Script:Selection.HeaderFooter.Range.Text = $footerText

	#add page numbering
	Write-Verbose "$(Get-Date -Format G): Add page numbering"
	$Script:Selection.HeaderFooter.PageNumbers.Add($wdAlignPageNumberRight) | Out-Null

	FindWordDocumentEnd
	Write-Verbose "$(Get-Date -Format G):"
	#end of Jeff Hicks 
}

Function UpdateDocumentProperties
{
	Param([string]$AbstractTitle, [string]$SubjectTitle)
	#updated 8-Jun-2017 with additional cover page fields
	#Update document properties
	If($MSWORD -or $PDF)
	{
		If($Script:CoverPagesExist)
		{
			Write-Verbose "$(Get-Date -Format G): Set Cover Page Properties"
			#8-Jun-2017 put these 4 items in alpha order
            Set-DocumentProperty -Document $Script:Doc -DocProperty Author -Value $UserName
            Set-DocumentProperty -Document $Script:Doc -DocProperty Company -Value $Script:CoName
            Set-DocumentProperty -Document $Script:Doc -DocProperty Subject -Value $SubjectTitle
            Set-DocumentProperty -Document $Script:Doc -DocProperty Title -Value $Script:title

			#Get the Coverpage XML part
			$cp = $Script:Doc.CustomXMLParts | Where-Object{$_.NamespaceURI -match "coverPageProps$"}

			#get the abstract XML part
			$ab = $cp.documentelement.ChildNodes | Where-Object{$_.basename -eq "Abstract"}
			#set the text
			If([String]::IsNullOrEmpty($Script:CoName))
			{
				[string]$abstract = $AbstractTitle
			}
			Else
			{
				[string]$abstract = "$($AbstractTitle) for $($Script:CoName)"
			}
			$ab.Text = $abstract

			#added 8-Jun-2017
			$ab = $cp.documentelement.ChildNodes | Where-Object{$_.basename -eq "CompanyAddress"}
			#set the text
			[string]$abstract = $CompanyAddress
			$ab.Text = $abstract

			#added 8-Jun-2017
			$ab = $cp.documentelement.ChildNodes | Where-Object{$_.basename -eq "CompanyEmail"}
			#set the text
			[string]$abstract = $CompanyEmail
			$ab.Text = $abstract

			#added 8-Jun-2017
			$ab = $cp.documentelement.ChildNodes | Where-Object{$_.basename -eq "CompanyFax"}
			#set the text
			[string]$abstract = $CompanyFax
			$ab.Text = $abstract

			#added 8-Jun-2017
			$ab = $cp.documentelement.ChildNodes | Where-Object{$_.basename -eq "CompanyPhone"}
			#set the text
			[string]$abstract = $CompanyPhone
			$ab.Text = $abstract

			$ab = $cp.documentelement.ChildNodes | Where-Object{$_.basename -eq "PublishDate"}
			#set the text
			[string]$abstract = (Get-Date -Format d).ToString()
			$ab.Text = $abstract

			Write-Verbose "$(Get-Date -Format G): Update the Table of Contents"
			#update the Table of Contents
			$Script:Doc.TablesOfContents.item(1).Update()
			$cp = $Null
			$ab = $Null
			$abstract = $Null
		}
	}
}
#endregion

#region registry functions
#http://stackoverflow.com/questions/5648931/test-if-registry-value-exists
# This Function just gets $True or $False
Function Test-RegistryValue($path, $name)
{
	$key = Get-Item -LiteralPath $path -EA 0
	$key -and $Null -ne $key.GetValue($name, $Null)
}

# Gets the specified registry value or $Null if it is missing
Function Get-RegistryValue($path, $name)
{
	$key = Get-Item -LiteralPath $path -EA 0
	If($key)
	{
		$key.GetValue($name, $Null)
	}
	Else
	{
		$Null
	}
}
#endregion

#region word, text and html line output functions
Function line
#function created by Michael B. Smith, Exchange MVP
#@essentialexch on Twitter
#https://essential.exchange/blog
#for creating the formatted text report
#created March 2011
#updated March 2014
# updated March 2019 to use StringBuilder (about 100 times more efficient than simple strings)
{
	Param
	(
		[Int]    $tabs = 0, 
		[String] $name = '', 
		[String] $value = '', 
		[String] $newline = [System.Environment]::NewLine, 
		[Switch] $nonewline
	)

	while( $tabs -gt 0 )
	{
		$null = $global:Output.Append( "`t" )
		$tabs--
	}

	If( $nonewline )
	{
		$null = $global:Output.Append( $name + $value )
	}
	Else
	{
		$null = $global:Output.AppendLine( $name + $value )
	}
}
	
Function WriteWordLine
#Function created by Ryan Revord
#@rsrevord on Twitter
#Function created to make output to Word easy in this script
#updated 27-Mar-2014 to include font name, font size, italics and bold options
{
	Param([int]$style=0, 
	[int]$tabs = 0, 
	[string]$name = '', 
	[string]$value = '', 
	[string]$fontName=$Null,
	[int]$fontSize=0,
	[bool]$italics=$False,
	[bool]$boldface=$False,
	[Switch]$nonewline)
	
	#Build output style
	[string]$output = ""
	Switch ($style)
	{
		0 {$Script:Selection.Style = $Script:MyHash.Word_NoSpacing; Break}
		1 {$Script:Selection.Style = $Script:MyHash.Word_Heading1; Break}
		2 {$Script:Selection.Style = $Script:MyHash.Word_Heading2; Break}
		3 {$Script:Selection.Style = $Script:MyHash.Word_Heading3; Break}
		4 {$Script:Selection.Style = $Script:MyHash.Word_Heading4; Break}
		Default {$Script:Selection.Style = $Script:MyHash.Word_NoSpacing; Break}
	}
	
	#build # of tabs
	While($tabs -gt 0)
	{ 
		$output += "`t"; $tabs--; 
	}
 
	If(![String]::IsNullOrEmpty($fontName)) 
	{
		$Script:Selection.Font.name = $fontName
	} 

	If($fontSize -ne 0) 
	{
		$Script:Selection.Font.size = $fontSize
	} 
 
	If($italics -eq $True) 
	{
		$Script:Selection.Font.Italic = $True
	} 
 
	If($boldface -eq $True) 
	{
		$Script:Selection.Font.Bold = $True
	} 

	#output the rest of the parameters.
	$output += $name + $value
	$Script:Selection.TypeText($output)
 
	#test for new WriteWordLine 0.
	If($nonewline)
	{
		# Do nothing.
	} 
	Else 
	{
		$Script:Selection.TypeParagraph()
	}
}

#***********************************************************************************************************
# WriteHTMLLine
#***********************************************************************************************************

<#
.Synopsis
	Writes a line of output for HTML output
.DESCRIPTION
	This function formats an HTML line
.USAGE
	WriteHTMLLine <Style> <Tabs> <Name> <Value> <Font Name> <Font Size> <Options>

	0 for Font Size denotes using the default font size of 2 or 10 point

.EXAMPLE
	WriteHTMLLine 0 0 " "

	Writes a blank line with no style or tab stops, obviously none needed.

.EXAMPLE
	WriteHTMLLine 0 1 "This is a regular line of text indented 1 tab stops"

	Writes a line with 1 tab stop.

.EXAMPLE
	WriteHTMLLine 0 0 "This is a regular line of text in the default font in italics" "" $Null 0 $htmlitalics

	Writes a line omitting font and font size and setting the italics attribute

.EXAMPLE
	WriteHTMLLine 0 0 "This is a regular line of text in the default font in bold" "" $Null 0 $htmlbold

	Writes a line omitting font and font size and setting the bold attribute

.EXAMPLE
	WriteHTMLLine 0 0 "This is a regular line of text in the default font in bold italics" "" $Null 0 ($htmlbold -bor $htmlitalics)

	Writes a line omitting font and font size and setting both italics and bold options

.EXAMPLE	
	WriteHTMLLine 0 0 "This is a regular line of text in the default font in 10 point" "" $Null 2  # 10 point font

	Writes a line using 10 point font

.EXAMPLE
	WriteHTMLLine 0 0 "This is a regular line of text in Courier New font" "" "Courier New" 0 

	Writes a line using Courier New Font and 0 font point size (default = 2 if set to 0)

.EXAMPLE	
	WriteHTMLLine 0 0 "This is a regular line of RED text indented 0 tab stops with the computer name as data in 10 point Courier New bold italics: " $env:computername "Courier New" 2 ($htmlbold -bor $htmlred -bor $htmlitalics)

	Writes a line using Courier New Font with first and second string values to be used, also uses 10 point font with bold, italics and red color options set.

.NOTES

	Font Size - Unlike word, there is a limited set of font sizes that can be used in HTML.  They are:
		0 - default which actually gives it a 2 or 10 point.
		1 - 7.5 point font size
		2 - 10 point
		3 - 13.5 point
		4 - 15 point
		5 - 18 point
		6 - 24 point
		7 - 36 point
	Any number larger than 7 defaults to 7

	Style - Refers to the headers that are used with output and resemble the headers in word, 
	HTML supports headers h1-h6 and h1-h4 are more commonly used.  Unlike word, H1 will not 
	give you a blue colored font, you will have to set that yourself.

	Colors and Bold/Italics Flags are:

		htmlbold       
		htmlitalics    
		htmlred        
		htmlcyan        
		htmlblue       
		htmldarkblue   
		htmllightblue   
		htmlpurple      
		htmlyellow      
		htmllime       
		htmlmagenta     
		htmlwhite       
		htmlsilver      
		htmlgray       
		htmlolive       
		htmlorange      
		htmlmaroon      
		htmlgreen       
		htmlblack       
#>

Function WriteHTMLLine
#Function created by Ken Avram
#Function created to make output to HTML easy in this script
#headings fixed 12-Oct-2016 by Webster
#errors with $HTMLStyle fixed 7-Dec-2017 by Webster
{
	Param([int]$style=0, 
	[int]$tabs = 0, 
	[string]$name = '', 
	[string]$value = '', 
	[string]$fontName="Calibri",
	[int]$fontSize=1,
	[int]$options=$htmlblack)


	#Build output style
	[string]$output = ""

	If([String]::IsNullOrEmpty($Name))	
	{
		$HTMLBody = "<p></p>"
	}
	Else
	{
		$color = CheckHTMLColor $options

		#build # of tabs

		While($tabs -gt 0)
		{ 
			$output += "&nbsp;&nbsp;&nbsp;&nbsp;"; $tabs--; 
		}

		$HTMLFontName = $fontName		

		$HTMLBody = ""

		If($options -band $htmlitalics) 
		{
			$HTMLBody += "<i>"
		} 

		If($options -band $htmlbold) 
		{
			$HTMLBody += "<b>"
		} 

		#output the rest of the parameters.
		$output += $name + $value

		Switch ($style)
		{
			1 {$HTMLStyle = "<h1>"; Break}
			2 {$HTMLStyle = "<h2>"; Break}
			3 {$HTMLStyle = "<h3>"; Break}
			4 {$HTMLStyle = "<h4>"; Break}
			Default {$HTMLStyle = ""; Break}
		}

		$HTMLBody += $HTMLStyle + $output

		Switch ($style)
		{
			1 {$HTMLStyle = "</h1>"; Break}
			2 {$HTMLStyle = "</h2>"; Break}
			3 {$HTMLStyle = "</h3>"; Break}
			4 {$HTMLStyle = "</h4>"; Break}
			Default {$HTMLStyle = ""; Break}
		}

		#added by webster 12-oct-2016
		#if a heading, don't add the <br>
		#moved to after the two switch statements on 7-Dec-2017 to fix $HTMLStyle has not been set error
		If($HTMLStyle -eq "")
		{
			$HTMLBody += "<br><font face='" + $HTMLFontName + "' " + "color='" + $color + "' size='"  + $fontsize + "'>"
		}
		Else
		{
			$HTMLBody += "<font face='" + $HTMLFontName + "' " + "color='" + $color + "' size='"  + $fontsize + "'>"
		}
		
		$HTMLBody += $HTMLStyle +  "</font>"

		If($options -band $htmlitalics) 
		{
			$HTMLBody += "</i>"
		} 

		If($options -band $htmlbold) 
		{
			$HTMLBody += "</b>"
		} 

		#added by webster 12-oct-2016
		#if a heading, don't add the <br />
		#moved to inside the Else statement on 7-Dec-2017 to fix $HTMLStyle has not been set error
		If($HTMLStyle -eq "")
		{
			$HTMLBody += "<br />"
		}
	}

	out-file -FilePath $Script:FileName1 -Append -InputObject $HTMLBody 4>$Null
}
#endregion

#region HTML table functions
#***********************************************************************************************************
# AddHTMLTable - Called from FormatHTMLTable function
#***********************************************************************************************************
Function AddHTMLTable
{
	Param([string]$fontName="Calibri",
	[int]$fontSize=2)

	For($rowidx = $RowIndex;$rowidx -le $NumRows;$rowidx++)
	{
		$rd = @($rowdata[$rowidx - 2])
		$htmlbody = $htmlbody + "<tr>"
		For($columnIndex = 0; $columnIndex -lt $NumCols; $columnindex+=2)
		{
			$fontitalics = $False
			$fontbold = $false
			$tmp = CheckHTMLColor $rd[$columnIndex+1]

			$htmlbody += "<td bgcolor='" + $tmp + "'><font face='" + $fontname + "' size='" + $fontsize + "'>"
			If($rd[$columnIndex+1] -band $htmlbold)
			{
				$htmlbody += "<b>"
			}
			If($rd[$columnIndex+1] -band $htmlitalics)
			{
				$htmlbody += "<i>"
			}
			If($Null -ne $rd[$columnIndex])
			{
				$cell = $rd[$columnIndex].tostring()
				If($cell -eq " " -or $cell.length -eq 0)
				{
					$htmlbody += "&nbsp;&nbsp;&nbsp;"
				}
				Else
				{
					For($i=0;$i -lt $cell.length;$i++)
					{
						If($cell[$i] -eq " ")
						{
							$htmlbody += "&nbsp;"
						}
						If($cell[$i] -ne " ")
						{
							Break
						}
					}
					$htmlbody += $cell
				}
			}
			Else
			{
				$htmlbody += "&nbsp;&nbsp;&nbsp;"
			}
			If($rd[$columnIndex+1] -band $htmlbold)
			{
				$htmlbody += "</b>"
			}
			If($rd[$columnIndex+1] -band $htmlitalics)
			{
				$htmlbody += "</i>"
			}
			$htmlbody += "</font></td>"
		}

		$htmlbody += "</tr>"
	}
	#echo $HTMLBody >> $FileName1
	out-file -FilePath $Script:FileName1 -Append -InputObject $HTMLBody 4>$Null
	
}

#***********************************************************************************************************
# FormatHTMLTable 
#***********************************************************************************************************

<#
.Synopsis
	Format table for HTML output document
.DESCRIPTION
	This function formats a table for HTML from an array of strings
	
	
.USAGE
	FormatHTMLTable <Table Header> <Table Format> <Font Name> <Font Size>

.EXAMPLE
	FormatHTMLTable "Table Heading" "auto" "Calibri" 3

	This example formats a table and writes it out into an html file.  All of the parameters are optional
    defaults are used if not supplied.

    for <Table format>, the default is auto which will autofit the text into the columns and adjust to the longest text in that column.  You can also use percentage i.e. 25%
    which will take only 25% of the line and will auto word wrap the text to the next line in the column.  Also, instead of using a percentage, you can use pixels i.e. 400px.

    FormatHTMLTable "Table Heading" "auto"
    FormatHTMLTable "Table Heading" "25%
    FormatHTMLTable "Table Heading" "400px"

.NOTES
    In order to use the formatted table it first has to be loaded with data.  Examples below will show how to load the table:

    First, initialize the table array

    $rowdata = @()

    Then Load the array.  If you are using column headers then load those into the column headers array, otherwise the first line of the table goes into the column headers array
    and the second and subsequent lines go into the $rowdata table as shown below:

    $columnHeaders = @('Display Name',($htmlsilver -bor $htmlbold),'Status',($htmlsilver -bor $htmlbold),'Startup Type',($htmlsilver -bor $htmlbold))

    The first column is the actual name to display, the second are the attributes of the column i.e. color anded with bold or italics.  For the anding, parens are required or it will
    not format correctly.

    This is following by adding rowdata as shown below.  As more columns are added the columns will auto adjust to fit the size of the page.

    $rowdata = @()
    $columnHeaders = @("User Name",($htmlsilver -bor $htmlbold),$UserName,$htmlwhite)
    $rowdata += @(,('Save as PDF',($htmlsilver -bor $htmlbold),$PDF.ToString(),$htmlwhite))
    $rowdata += @(,('Save as TEXT',($htmlsilver -bor $htmlbold),$TEXT.ToString(),$htmlwhite))
    $rowdata += @(,('Save as WORD',($htmlsilver -bor $htmlbold),$MSWORD.ToString(),$htmlwhite))
    $rowdata += @(,('Save as HTML',($htmlsilver -bor $htmlbold),$HTML.ToString(),$htmlwhite))
    $rowdata += @(,('Add DateTime',($htmlsilver -bor $htmlbold),$AddDateTime.ToString(),$htmlwhite))
    $rowdata += @(,('Hardware Inventory',($htmlsilver -bor $htmlbold),$Hardware.ToString(),$htmlwhite))
    $rowdata += @(,('Computer Name',($htmlsilver -bor $htmlbold),$ComputerName,$htmlwhite))
    $rowdata += @(,('Filename1',($htmlsilver -bor $htmlbold),$Script:FileName1,$htmlwhite))
    $rowdata += @(,('OS Detected',($htmlsilver -bor $htmlbold),$Script:RunningOS,$htmlwhite))
    $rowdata += @(,('PSUICulture',($htmlsilver -bor $htmlbold),$PSCulture,$htmlwhite))
    $rowdata += @(,('PoSH version',($htmlsilver -bor $htmlbold),$Host.Version.ToString(),$htmlwhite))
    FormatHTMLTable "Example of Horizontal AutoFitContents HTML Table"

     Colors and Bold/Italics Flags are shown below:

        htmlbold       
        htmlitalics    
        htmlred        
        htmlcyan        
        htmlblue       
        htmldarkblue   
        htmllightblue   
        htmlpurple      
        htmlyellow      
        htmllime       
        htmlmagenta     
        htmlwhite       
        htmlsilver      
        htmlgray       
        htmlolive       
        htmlorange      
        htmlmaroon      
        htmlgreen       
        htmlblack     

#>

Function FormatHTMLTable
{
    Param([string]$tableheader,
    [string]$tablewidth="auto",
    [string]$fontName="Calibri",
	[int]$fontSize=2)

    $HTMLBody = "<b><font face='" + $fontname + "' size='" + ($fontsize + 1) + "'>" + $tableheader + "</font></b>"

	If($columnHeaders.Length -eq 0 -or $null -eq $columnHeaders)
	{
		$NumCols = 2
	}  # means we have no column headers, just a table
	Else
	{
		$NumCols = $columnHeaders.Length
	}  # need to add one for the color attrib
		
	If($Null -eq $rowdata)
	{
		$NumRows = $rowdata.length + 1
	}
	Else
	{
		$NumRows = 1
	}
	
	$htmlbody += "<table border='1' width='" + $tablewidth + "'><tr>"
       
   	For($columnIndex = 0; $columnIndex -lt $NumCols; $columnindex+=2)
	{
		$tmp = CheckHTMLColor $columnheaders[$columnIndex+1]
		
		$htmlbody += "<td bgcolor='" + $tmp + "'><font face='" + $fontname + "' size='" + $fontsize + "'>"

		If($columnheaders[$columnIndex+1] -band $htmlbold)
		{
			$htmlbody += "<b>"
		}
		If($columnheaders[$columnIndex+1] -band $htmlitalics)
		{
			$htmlbody += "<i>"
		}
		If($Null -ne $columnheaders[$columnIndex])
		{
			If($columnheaders[$columnIndex] -eq " " -or $columnheaders[$columnIndex].length -eq 0)
			{
				$htmlbody += "&nbsp;&nbsp;&nbsp;"
			}
			Else
			{
				$found = $false
				For($i=0;$i -lt $columnHeaders[$columnIndex].length;$i+=2)
				{
					If($columnheaders[$columnIndex][$i] -eq " ")
					{
						$htmlbody += "&nbsp;"
					}
					If($columnheaders[$columnIndex][$i] -ne " ")
					{
						Break
					}
				}
				$htmlbody += $columnHeaders[$columnIndex]
			}
		}
		Else
		{
			$htmlbody += "&nbsp;&nbsp;&nbsp;"
		}
		If($columnheaders[$columnIndex+1] -band $htmlbold)
		{
			$htmlbody += "</b>"
		}
		If($columnheaders[$columnIndex+1] -band $htmlitalics)
		{
			$htmlbody += "</i>"
		}
		$htmlbody += "</font></td>"
	}
		
	$htmlbody += "</tr>"
		
	$rowindex = 2
	If($Nul -ne $RowData)
	{
		AddHTMLTable $fontName $fontSize
		$rowdata = @()
	}
		
	$htmlbody = "</table>"
	#echo $HTMLBody >> $FileName1
	out-file -FilePath $Script:FileName1 -Append -InputObject $HTMLBody 4>$Null
	
    $columnHeaders = @()
}
#endregion

#region other HTML functions
#***********************************************************************************************************
# CheckHTMLColor - Called from AddHTMLTable WriteHTMLLine and FormatHTMLTable
#***********************************************************************************************************
Function CheckHTMLColor
{
	Param($hash)

	If($hash -band $htmlwhite)
	{
		Return $htmlwhitemask
	}
	If($hash -band $htmlred)
	{
		Return $htmlredmask
	}
	If($hash -band $htmlcyan)
	{
		Return $htmlcyanmask
	}
	If($hash -band $htmlblue)
	{
		Return $htmlbluemask
	}
	If($hash -band $htmldarkblue)
	{
		Return $htmldarkbluemask
	}
	If($hash -band $htmllightblue)
	{
		Return $htmllightbluemask
	}
	If($hash -band $htmlpurple)
	{
		Return $htmlpurplemask
	}
	If($hash -band $htmlyellow)
	{
		Return $htmlyellowmask
	}
	If($hash -band $htmllime)
	{
		Return $htmllimemask
	}
	If($hash -band $htmlmagenta)
	{
		Return $htmlmagentamask
	}
	If($hash -band $htmlsilver)
	{
		Return $htmlsilvermask
	}
	If($hash -band $htmlgray)
	{
		Return $htmlgraymask
	}
	If($hash -band $htmlblack)
	{
		Return $htmlblackmask
	}
	If($hash -band $htmlorange)
	{
		Return $htmlorangemask
	}
	If($hash -band $htmlmaroon)
	{
		Return $htmlmaroonmask
	}
	If($hash -band $htmlgreen)
	{
		Return $htmlgreenmask
	}
	If($hash -band $htmlolive)
	{
		Return $htmlolivemask
	}
}

Function SetupHTML
{
	Write-Verbose "$(Get-Date -Format G): Setting up HTML"
    $htmlhead = "<html><head><meta http-equiv='Content-Language' content='da'><title>" + $Title + "</title></head><body>"
    #echo $htmlhead > $FileName1
	out-file -FilePath $FileName1 -Force -InputObject $HTMLHead 4>$Null
	
}
#endregion

#region Iain's Word table functions

<#
.Synopsis
	Add a table to a Microsoft Word document
.DESCRIPTION
	This function adds a table to a Microsoft Word document from either an array of
	Hashtables or an array of PSCustomObjects.

	Using this function is quicker than setting each table cell individually but can
	only utilise the built-in MS Word table autoformats. Individual tables cells can
	be altered after the table has been appended to the document (a table reference
	is returned).
.EXAMPLE
	AddWordTable -Hashtable $HashtableArray

	This example adds table to the MS Word document, utilising all key/value pairs in
	the array of hashtables. Column headers will display the key names as defined.
	Note: the columns might not be displayed in the order that they were defined. To
	ensure columns are displayed in the required order utilise the -Columns parameter.
.EXAMPLE
	AddWordTable -Hashtable $HashtableArray -List

	This example adds table to the MS Word document, utilising all key/value pairs in
	the array of hashtables. No column headers will be added, in a ListView format.
	Note: the columns might not be displayed in the order that they were defined. To
	ensure columns are displayed in the required order utilise the -Columns parameter.
.EXAMPLE
	AddWordTable -CustomObject $PSCustomObjectArray

	This example adds table to the MS Word document, utilising all note property names
	the array of PSCustomObjects. Column headers will display the note property names.
	Note: the columns might not be displayed in the order that they were defined. To
	ensure columns are displayed in the required order utilise the -Columns parameter.
.EXAMPLE
	AddWordTable -Hashtable $HashtableArray -Columns FirstName,LastName,EmailAddress

	This example adds a table to the MS Word document, but only using the specified
	key names: FirstName, LastName and EmailAddress. If other keys are present in the
	array of Hashtables they will be ignored.
.EXAMPLE
	AddWordTable -CustomObject $PSCustomObjectArray -Columns FirstName,LastName,EmailAddress -Headers "First Name","Last Name","Email Address"

	This example adds a table to the MS Word document, but only using the specified
	PSCustomObject note properties: FirstName, LastName and EmailAddress. If other note
	properties are present in the array of PSCustomObjects they will be ignored. The
	display names for each specified column header has been overridden to display a
	custom header. Note: the order of the header names must match the specified columns.
#>

Function AddWordTable
{
	[CmdletBinding()]
	Param
	(
		# Array of Hashtable (including table headers)
		[Parameter(Mandatory=$true, ValueFromPipelineByPropertyName=$true, ParameterSetName='Hashtable', Position=0)]
		[ValidateNotNullOrEmpty()] [System.Collections.Hashtable[]] $Hashtable,
		# Array of PSCustomObjects
		[Parameter(Mandatory=$true, ValueFromPipelineByPropertyName=$true, ParameterSetName='CustomObject', Position=0)]
		[ValidateNotNullOrEmpty()] [PSCustomObject[]] $CustomObject,
		# Array of Hashtable key names or PSCustomObject property names to include, in display order.
		# If not supplied then all Hashtable keys or all PSCustomObject properties will be displayed.
		[Parameter(ValueFromPipelineByPropertyName=$true)] [AllowNull()] [string[]] $Columns = $null,
		# Array of custom table header strings in display order.
		[Parameter(ValueFromPipelineByPropertyName=$true)] [AllowNull()] [string[]] $Headers = $null,
		# AutoFit table behavior.
		[Parameter(ValueFromPipelineByPropertyName=$true)] [AllowNull()] [int] $AutoFit = -1,
		# List view (no headers)
		[Switch] $List,
		# Grid lines
		[Switch] $NoGridLines,
		# Built-in Word table formatting style constant
		# Would recommend only $wdTableFormatContempory for normal usage (possibly $wdTableFormatList5 for List view)
		[Parameter(ValueFromPipelineByPropertyName=$true)] [int] $Format = 0
	)

	Begin 
	{
		Write-Debug ("Using parameter set '{0}'" -f $PSCmdlet.ParameterSetName);
		## Check if -Columns wasn't specified but -Headers were (saves some additional parameter sets!)
		If(($Null -eq $Columns) -and ($Null -eq $Headers)) 
		{
			Write-Warning "No columns specified and therefore, specified headers will be ignored.";
			$Columns = $Null;
		}
		ElseIf(($Null -ne $Columns) -and ($Null -ne $Headers)) 
		{
			## Check if number of specified -Columns matches number of specified -Headers
			If($Columns.Length -ne $Headers.Length) 
			{
				Write-Error "The specified number of columns does not match the specified number of headers.";
			}
		} ## end elseif
	} ## end Begin

	Process
	{
		## Build the Word table data string to be converted to a range and then a table later.
        [System.Text.StringBuilder] $WordRangeString = New-Object System.Text.StringBuilder;

		Switch ($PSCmdlet.ParameterSetName) 
		{
			'CustomObject' 
			{
				If($Null -eq $Columns) 
				{
					## Build the available columns from all availble PSCustomObject note properties
					[string[]] $Columns = @();
					## Add each NoteProperty name to the array
					ForEach($Property in ($CustomObject | Get-Member -MemberType NoteProperty)) 
					{ 
						$Columns += $Property.Name; 
					}
				}

				## Add the table headers from -Headers or -Columns (except when in -List(view)
				If(-not $List) 
				{
					Write-Debug ("$(Get-Date): `t`tBuilding table headers");
					If($Null -ne $Headers) 
					{
                        [ref] $null = $WordRangeString.AppendFormat("{0}`n", [string]::Join("`t", $Headers));
					}
					Else 
					{ 
                        [ref] $null = $WordRangeString.AppendFormat("{0}`n", [string]::Join("`t", $Columns));
					}
				}

				## Iterate through each PSCustomObject
				Write-Debug ("$(Get-Date): `t`tBuilding table rows");
				ForEach($Object in $CustomObject) 
				{
					$OrderedValues = @();
					## Add each row item in the specified order
					ForEach($Column in $Columns) 
					{ 
						$OrderedValues += $Object.$Column; 
					}
					## Use the ordered list to add each column in specified order
                    [ref] $null = $WordRangeString.AppendFormat("{0}`n", [string]::Join("`t", $OrderedValues));
				} ## end foreach
				Write-Debug ("$(Get-Date): `t`t`tAdded '{0}' table rows" -f ($CustomObject.Count));
			} ## end CustomObject

			Default 
			{   ## Hashtable
				If($Null -eq $Columns) 
				{
					## Build the available columns from all available hashtable keys. Hopefully
					## all Hashtables have the same keys (they should for a table).
					$Columns = $Hashtable[0].Keys;
				}

				## Add the table headers from -Headers or -Columns (except when in -List(view)
				If(-not $List) 
				{
					Write-Debug ("$(Get-Date): `t`tBuilding table headers");
					If($Null -ne $Headers) 
					{ 
                        [ref] $null = $WordRangeString.AppendFormat("{0}`n", [string]::Join("`t", $Headers));
					}
					Else 
					{
                        [ref] $null = $WordRangeString.AppendFormat("{0}`n", [string]::Join("`t", $Columns));
					}
				}
                
				## Iterate through each Hashtable
				Write-Debug ("$(Get-Date): `t`tBuilding table rows");
				ForEach($Hash in $Hashtable) 
				{
					$OrderedValues = @();
					## Add each row item in the specified order
					ForEach($Column in $Columns) 
					{ 
						$OrderedValues += $Hash.$Column; 
					}
					## Use the ordered list to add each column in specified order
                    [ref] $null = $WordRangeString.AppendFormat("{0}`n", [string]::Join("`t", $OrderedValues));
				} ## end foreach

				Write-Debug ("$(Get-Date): `t`t`tAdded '{0}' table rows" -f $Hashtable.Count);
			} ## end default
		} ## end switch

		## Create a MS Word range and set its text to our tab-delimited, concatenated string
		Write-Debug ("$(Get-Date): `t`tBuilding table range");
		$WordRange = $Script:Doc.Application.Selection.Range;
		$WordRange.Text = $WordRangeString.ToString();

		## Create hash table of named arguments to pass to the ConvertToTable method
		$ConvertToTableArguments = @{ Separator = [Microsoft.Office.Interop.Word.WdTableFieldSeparator]::wdSeparateByTabs; }

		## Negative built-in styles are not supported by the ConvertToTable method
		If($Format -ge 0) 
		{
			$ConvertToTableArguments.Add("Format", $Format);
			$ConvertToTableArguments.Add("ApplyBorders", $true);
			$ConvertToTableArguments.Add("ApplyShading", $true);
			$ConvertToTableArguments.Add("ApplyFont", $true);
			$ConvertToTableArguments.Add("ApplyColor", $true);
			If(!$List) 
			{ 
				$ConvertToTableArguments.Add("ApplyHeadingRows", $true); 
			}
			$ConvertToTableArguments.Add("ApplyLastRow", $true);
			$ConvertToTableArguments.Add("ApplyFirstColumn", $true);
			$ConvertToTableArguments.Add("ApplyLastColumn", $true);
		}

		## Invoke ConvertToTable method - with named arguments - to convert Word range to a table
		## See http://msdn.microsoft.com/en-us/library/office/aa171893(v=office.11).aspx
		Write-Debug ("$(Get-Date): `t`tConverting range to table");
		## Store the table reference just in case we need to set alternate row coloring
		$WordTable = $WordRange.GetType().InvokeMember(
			"ConvertToTable",                               # Method name
			[System.Reflection.BindingFlags]::InvokeMethod, # Flags
			$null,                                          # Binder
			$WordRange,                                     # Target (self!)
			([Object[]]($ConvertToTableArguments.Values)),  ## Named argument values
			$null,                                          # Modifiers
			$null,                                          # Culture
			([String[]]($ConvertToTableArguments.Keys))     ## Named argument names
		);

		## Implement grid lines (will wipe out any existing formatting
		If($Format -lt 0) 
		{
			Write-Debug ("$(Get-Date): `t`tSetting table format");
			$WordTable.Style = $Format;
		}

		## Set the table autofit behavior
		If($AutoFit -ne -1) 
		{ 
			$WordTable.AutoFitBehavior($AutoFit); 
		}

		#the next line causes the heading row to flow across page breaks
		$WordTable.Rows.First.Headingformat = $wdHeadingFormatTrue;

		If(!$NoGridLines) 
		{
			$WordTable.Borders.InsideLineStyle = $wdLineStyleSingle;
			$WordTable.Borders.OutsideLineStyle = $wdLineStyleSingle;
		}

		Return $WordTable;

	} ## end Process
}

<#
.Synopsis
	Sets the format of one or more Word table cells
.DESCRIPTION
	This function sets the format of one or more table cells, either from a collection
	of Word COM object cell references, an individual Word COM object cell reference or
	a hashtable containing Row and Column information.

	The font name, font size, bold, italic , underline and shading values can be used.
.EXAMPLE
	SetWordCellFormat -Hashtable $Coordinates -Table $TableReference -Bold

	This example sets all text to bold that is contained within the $TableReference
	Word table, using an array of hashtables. Each hashtable contain a pair of co-
	ordinates that is used to select the required cells. Note: the hashtable must
	contain the .Row and .Column key names. For example:
	@ { Row = 7; Column = 3 } to set the cell at row 7 and column 3 to bold.
.EXAMPLE
	$RowCollection = $Table.Rows.First.Cells
	SetWordCellFormat -Collection $RowCollection -Bold -Size 10

	This example sets all text to size 8 and bold for all cells that are contained
	within the first row of the table.
	Note: the $Table.Rows.First.Cells returns a collection of Word COM cells objects
	that are in the first table row.
.EXAMPLE
	$ColumnCollection = $Table.Columns.Item(2).Cells
	SetWordCellFormat -Collection $ColumnCollection -BackgroundColor 255

	This example sets the background (shading) of all cells in the table's second
	column to red.
	Note: the $Table.Columns.Item(2).Cells returns a collection of Word COM cells objects
	that are in the table's second column.
.EXAMPLE
	SetWordCellFormat -Cell $Table.Cell(17,3) -Font "Tahoma" -Color 16711680

	This example sets the font to Tahoma and the text color to blue for the cell located
	in the table's 17th row and 3rd column.
	Note: the $Table.Cell(17,3) returns a single Word COM cells object.
#>

Function SetWordCellFormat 
{
	[CmdletBinding(DefaultParameterSetName='Collection')]
	Param (
		# Word COM object cell collection reference
		[Parameter(Mandatory=$True, ValueFromPipeline=$True, ParameterSetName='Collection', Position=0)] [ValidateNotNullOrEmpty()] $Collection,
		# Word COM object individual cell reference
		[Parameter(Mandatory=$True, ParameterSetName='Cell', Position=0)] [ValidateNotNullOrEmpty()] $Cell,
		# Hashtable of cell co-ordinates
		[Parameter(Mandatory=$True, ParameterSetName='Hashtable', Position=0)] [ValidateNotNullOrEmpty()] [System.Collections.Hashtable[]] $Coordinates,
		# Word COM object table reference
		[Parameter(Mandatory=$True, ParameterSetName='Hashtable', Position=1)] [ValidateNotNullOrEmpty()] $Table,
		# Font name
		[Parameter()] [AllowNull()] [string] $Font = $Null,
		# Font color
		[Parameter()] [AllowNull()] $Color = $Null,
		# Font size
		[Parameter()] [ValidateNotNullOrEmpty()] [int] $Size = 0,
		# Cell background color
		[Parameter()] [AllowNull()] [int]$BackgroundColor = $Null,
		# Force solid background color
		[Switch] $Solid,
		[Switch] $Bold,
		[Switch] $Italic,
		[Switch] $Underline
	)

	Begin 
	{
		Write-Debug ("Using parameter set '{0}'." -f $PSCmdlet.ParameterSetName);
	}

	Process 
	{
		Switch ($PSCmdlet.ParameterSetName) 
		{
			'Collection' {
				ForEach($Cell in $Collection) 
				{
					If($Null -ne $BackgroundColor) { $Cell.Shading.BackgroundPatternColor = $BackgroundColor; }
					If($Bold) { $Cell.Range.Font.Bold = $True; }
					If($Italic) { $Cell.Range.Font.Italic = $True; }
					If($Underline) { $Cell.Range.Font.Underline = 1; }
					If($Null -ne $Font) { $Cell.Range.Font.Name = $Font; }
					If($Null -ne $Color) { $Cell.Range.Font.Color = $Color; }
					If($Size -ne 0) { $Cell.Range.Font.Size = $Size; }
					If($Solid) { $Cell.Shading.Texture = 0; } ## wdTextureNone
				} # end ForEach
			} # end Collection
			'Cell' 
			{
				If($Bold) { $Cell.Range.Font.Bold = $True; }
				If($Italic) { $Cell.Range.Font.Italic = $True; }
				If($Underline) { $Cell.Range.Font.Underline = 1; }
				If($Null -ne $Font) { $Cell.Range.Font.Name = $Font; }
				If($Null -ne $Color) { $Cell.Range.Font.Color = $Color; }
				If($Size -ne 0) { $Cell.Range.Font.Size = $Size; }
				If($Null -ne $BackgroundColor) { $Cell.Shading.BackgroundPatternColor = $BackgroundColor; }
				If($Solid) { $Cell.Shading.Texture = 0; } ## wdTextureNone
			} # end Cell
			'Hashtable' 
			{
				ForEach($Coordinate in $Coordinates) 
				{
					$Cell = $Table.Cell($Coordinate.Row, $Coordinate.Column);
					If($Bold) { $Cell.Range.Font.Bold = $True; }
					If($Italic) { $Cell.Range.Font.Italic = $True; }
					If($Underline) { $Cell.Range.Font.Underline = 1; }
					If($Null -ne $Font) { $Cell.Range.Font.Name = $Font; }
					If($Null -ne $Color) { $Cell.Range.Font.Color = $Color; }
					If($Size -ne 0) { $Cell.Range.Font.Size = $Size; }
					If($Null -ne $BackgroundColor) { $Cell.Shading.BackgroundPatternColor = $BackgroundColor; }
					If($Solid) { $Cell.Shading.Texture = 0; } ## wdTextureNone
				}
			} # end Hashtable
		} # end switch
	} # end process
}

<#
.Synopsis
	Sets alternate row colors in a Word table
.DESCRIPTION
	This function sets the format of alternate rows within a Word table using the
	specified $BackgroundColor. This function is expensive (in performance terms) as
	it recursively sets the format on alternate rows. It would be better to pick one
	of the predefined table formats (if one exists)? Obviously the more rows, the
	longer it takes :'(

	Note: this function is called by the AddWordTable function if an alternate row
	format is specified.
.EXAMPLE
	SetWordTableAlternateRowColor -Table $TableReference -BackgroundColor 255

	This example sets every-other table (starting with the first) row and sets the
	background color to red (wdColorRed).
.EXAMPLE
	SetWordTableAlternateRowColor -Table $TableReference -BackgroundColor 39423 -Seed Second

	This example sets every other table (starting with the second) row and sets the
	background color to light orange (weColorLightOrange).
#>

Function SetWordTableAlternateRowColor 
{
	[CmdletBinding()]
	Param (
		# Word COM object table reference
		[Parameter(Mandatory=$true, ValueFromPipeline=$true, Position=0)] [ValidateNotNullOrEmpty()] $Table,
		# Alternate row background color
		[Parameter(Mandatory=$true, Position=1)] [ValidateNotNull()] [int] $BackgroundColor,
		# Alternate row starting seed
		[Parameter(ValueFromPipelineByPropertyName=$true, Position=2)] [ValidateSet('First','Second')] [string] $Seed = 'First'
	)

	Process 
	{
		$StartDateTime = Get-Date;
		Write-Debug ("{0}: `t`tSetting alternate table row colors.." -f $StartDateTime);

		## Determine the row seed (only really need to check for 'Second' and default to 'First' otherwise
		If($Seed.ToLower() -eq 'second') 
		{ 
			$StartRowIndex = 2; 
		}
		Else 
		{ 
			$StartRowIndex = 1; 
		}

		For($AlternateRowIndex = $StartRowIndex; $AlternateRowIndex -lt $Table.Rows.Count; $AlternateRowIndex += 2) 
		{ 
			$Table.Rows.Item($AlternateRowIndex).Shading.BackgroundPatternColor = $BackgroundColor;
		}

		## I've put verbose calls in here we can see how expensive this functionality actually is.
		$EndDateTime = Get-Date;
		$ExecutionTime = New-TimeSpan -Start $StartDateTime -End $EndDateTime;
		Write-Debug ("{0}: `t`tDone setting alternate row style color in '{1}' seconds" -f $EndDateTime, $ExecutionTime.TotalSeconds);
	}
}
#endregion

#region general script functions
Function Check-LoadedModule
#Function created by Jeff Wouters
#@JeffWouters on Twitter
#modified by Michael B. Smith to handle when the module doesn't exist on server
#modified by @andyjmorgan
#bug fixed by @schose
#bug fixed by Peter Bosen
#This Function handles all three scenarios:
#
# 1. Module is already imported into current session
# 2. Module is not already imported into current session, it does exists on the server and is imported
# 3. Module does not exist on the server

{
	Param([parameter(Mandatory = $True)][alias("Module")][string]$ModuleName)
	#$LoadedModules = Get-Module | Select-Object Name
	#following line changed at the recommendation of @andyjmorgan
	$LoadedModules = Get-Module | ForEach-Object { $_.Name.ToString() }
	#bug reported on 21-JAN-2013 by @schose 
	#the following line did not work if the citrix.grouppolicy.commands.psm1 module
	#was manually loaded from a non Default folder
	#$ModuleFound = (!$LoadedModules -like "*$ModuleName*")
	
	[string]$ModuleFound = ($LoadedModules -like "*$ModuleName*")
	If($ModuleFound -ne $ModuleName) 
	{
		$module = Import-Module -Name $ModuleName -PassThru -EA 0 4>$Null
		If($module -and $?)
		{
			# module imported properly
			Return $True
		}
		Else
		{
			# module import failed
			Return $False
		}
	}
	Else
	{
		#module already imported into current session
		Return $True
	}
}

Function Check-NeededPSSnapins
{
	Param([parameter(Mandatory = $True)][alias("Snapin")][string[]]$Snapins)

	#Function specifics
	$MissingSnapins = @()
	[bool]$FoundMissingSnapin = $False
	$LoadedSnapins = @()
	$RegisteredSnapins = @()

	#Creates arrays of strings, rather than objects, we're passing strings so this will be more robust.
	$loadedSnapins += Get-PSSnapin | ForEach-Object {$_.name}
	$registeredSnapins += Get-PSSnapin -Registered | ForEach-Object {$_.name}

	ForEach($Snapin in $Snapins)
	{
		#check if the snapin is loaded
		If(!($LoadedSnapins -like $snapin))
		{
			#Check if the snapin is missing
			If(!($RegisteredSnapins -like $Snapin))
			{
				#set the flag if it's not already
				If(!($FoundMissingSnapin))
				{
					$FoundMissingSnapin = $True
				}
				#add the entry to the list
				$MissingSnapins += $Snapin
			}
			Else
			{
				#Snapin is registered, but not loaded, loading it now:
				Write-Host "Loading Windows PowerShell snap-in: $snapin"
				Add-PSSnapin -Name $snapin -EA 0

				If(!($?))
				{
					Write-Error "
	`n`n
	Error loading snapin: $($error[0].Exception.Message)
	`n`n
	Script cannot continue.
	`n`n"
					Return $false
				}				
			}
		}
	}

	If($FoundMissingSnapin)
	{
		Write-Warning "Missing Windows PowerShell snap-ins Detected:"
		Write-Host ""
		$missingSnapins | ForEach-Object {Write-Host "`tMissing Snapin: ($_)"}
		Write-Host ""
		Return $False
	}
	Else
	{
		Return $True
	}
}

Function SaveandCloseDocumentandShutdownWord
{
	#bug fix 1-Apr-2014
	#reset Grammar and Spelling options back to their original settings
	$Script:Word.Options.CheckGrammarAsYouType = $Script:CurrentGrammarOption
	$Script:Word.Options.CheckSpellingAsYouType = $Script:CurrentSpellingOption

	Write-Verbose "$(Get-Date -Format G): Save and Close document and Shutdown Word"
	If($Script:WordVersion -eq $wdWord2010)
	{
		#the $saveFormat below passes StrictMode 2
		#I found this at the following two links
		#http://blogs.technet.com/b/bshukla/archive/2011/09/27/3347395.aspx
		#http://msdn.microsoft.com/en-us/library/microsoft.office.interop.word.wdsaveformat(v=office.14).aspx
		If($PDF)
		{
			Write-Verbose "$(Get-Date -Format G): Saving as DOCX file first before saving to PDF"
		}
		Else
		{
			Write-Verbose "$(Get-Date -Format G): Saving DOCX file"
		}
		If($AddDateTime)
		{
			$Script:FileName1 += "_$(Get-Date -f yyyy-MM-dd_HHmm).docx"
			If($PDF)
			{
				$Script:FileName2 += "_$(Get-Date -f yyyy-MM-dd_HHmm).pdf"
			}
		}
		Write-Verbose "$(Get-Date -Format G): Running Word 2010 and detected operating system $($Script:RunningOS)"
		$saveFormat = [Enum]::Parse([Microsoft.Office.Interop.Word.WdSaveFormat], "wdFormatDocumentDefault")
		$Script:Doc.SaveAs([REF]$Script:FileName1, [ref]$SaveFormat)
		If($PDF)
		{
			Write-Verbose "$(Get-Date -Format G): Now saving as PDF"
			$saveFormat = [Enum]::Parse([Microsoft.Office.Interop.Word.WdSaveFormat], "wdFormatPDF")
			$Script:Doc.SaveAs([REF]$Script:FileName2, [ref]$saveFormat)
		}
	}
	ElseIf($Script:WordVersion -eq $wdWord2013 -or $Script:WordVersion -eq $wdWord2016)
	{
		If($PDF)
		{
			Write-Verbose "$(Get-Date -Format G): Saving as DOCX file first before saving to PDF"
		}
		Else
		{
			Write-Verbose "$(Get-Date -Format G): Saving DOCX file"
		}
		If($AddDateTime)
		{
			$Script:FileName1 += "_$(Get-Date -f yyyy-MM-dd_HHmm).docx"
			If($PDF)
			{
				$Script:FileName2 += "_$(Get-Date -f yyyy-MM-dd_HHmm).pdf"
			}
		}
		Write-Verbose "$(Get-Date -Format G): Running Word 2013 and detected operating system $($Script:RunningOS)"
		$Script:Doc.SaveAs2([REF]$Script:FileName1, [ref]$wdFormatDocumentDefault)
		If($PDF)
		{
			Write-Verbose "$(Get-Date -Format G): Now saving as PDF"
			$Script:Doc.SaveAs([REF]$Script:FileName2, [ref]$wdFormatPDF)
		}
	}

	Write-Verbose "$(Get-Date -Format G): Closing Word"
	$Script:Doc.Close()
	$Script:Word.Quit()
	If($PDF)
	{
		Write-Verbose "$(Get-Date -Format G): Deleting $($Script:FileName1) since only $($Script:FileName2) is needed"
		Remove-Item $Script:FileName1 4>$Null
	}
	Write-Verbose "$(Get-Date -Format G): System Cleanup"
	[System.Runtime.Interopservices.Marshal]::ReleaseComObject($Script:Word) | Out-Null
	If(Test-Path variable:global:word)
	{
		Remove-Variable -Name word -Scope Global 4>$Null
	}
	$SaveFormat = $Null
	[gc]::collect() 
	[gc]::WaitForPendingFinalizers()
}

Function SaveandCloseTextDocument
{
	If($AddDateTime)
	{
		$Script:FileName1 += "_$(Get-Date -f yyyy-MM-dd_HHmm).txt"
	}

	Write-Output $global:Output.ToString() | Out-File $Script:Filename1 4>$Null
}

Function SaveandCloseHTMLDocument
{
	If($AddDateTime)
	{
		$Script:FileName1 += "_$(Get-Date -f yyyy-MM-dd_HHmm).html"
	}
	Out-File -FilePath $Script:FileName1 -Append -InputObject "<p></p></body></html>" 4>$Null
}

Function SetFileName1andFileName2
{
	Param([string]$OutputFileName)

	If($Folder -eq "")
	{
		$pwdpath = $pwd.Path
	}
	Else
	{
		$pwdpath = $Folder
	}

	If($pwdpath.EndsWith("\"))
	{
		#remove the trailing \
		$pwdpath = $pwdpath.SubString(0, ($pwdpath.Length - 1))
	}

	#set $filename1 and $filename2 with no file extension
	If($AddDateTime)
	{
		[string]$Script:FileName1 = "$($pwdpath)\$($OutputFileName)"
		If($PDF)
		{
			[string]$Script:FileName2 = "$($pwdpath)\$($OutputFileName)"
		}
	}

	If($MSWord -or $PDF)
	{
		CheckWordPreReq

		If($DeliveryGroupsUtilization)
		{
			CheckExcelPreReq
		}

		If(!$AddDateTime)
		{
			[string]$Script:FileName1 = "$($pwdpath)\$($OutputFileName).docx"
			If($PDF)
			{
				[string]$Script:FileName2 = "$($pwdpath)\$($OutputFileName).pdf"
			}
		}

		SetupWord
	}
	ElseIf($Text)
	{
		If(!$AddDateTime)
		{
			[string]$Script:FileName1 = "$($pwdpath)\$($OutputFileName).txt"
		}
		ShowScriptOptions
	}
	ElseIf($HTML)
	{
		If(!$AddDateTime)
		{
			[string]$Script:FileName1 = "$($pwdpath)\$($OutputFileName).html"
		}
		SetupHTML
		ShowScriptOptions
	}
}

Function ProcessDocumentOutput
{
	If($MSWORD -or $PDF)
	{
		SaveandCloseDocumentandShutdownWord
	}
	ElseIf($Text)
	{
		SaveandCloseTextDocument
	}
	ElseIf($HTML)
	{
		SaveandCloseHTMLDocument
	}

	$GotFile = $False

	If($PDF)
	{
		If(Test-Path "$($Script:FileName2)")
		{
			Write-Verbose "$(Get-Date -Format G): $($Script:FileName2) is ready for use"
			Write-Verbose "$(Get-Date -Format G): "
			$GotFile = $True
		}
		Else
		{
			Write-Warning "$(Get-Date): Unable to save the output file, $($Script:FileName2)"
			Write-Error "Unable to save the output file, $($Script:FileName2)"
		}
	}
	Else
	{
		If(Test-Path "$($Script:FileName1)")
		{
			Write-Verbose "$(Get-Date -Format G): $($Script:FileName1) is ready for use"
			Write-Verbose "$(Get-Date -Format G): "
			$GotFile = $True
		}
		Else
		{
			Write-Warning "$(Get-Date): Unable to save the output file, $($Script:FileName1)"
			Write-Error "Unable to save the output file, $($Script:FileName1)"
		}
	}

	#email output file if requested
	If($GotFile -and ![System.String]::IsNullOrEmpty( $SmtpServer ))
	{
		If($PDF)
		{
			$emailAttachment = $Script:FileName2
		}
		Else
		{
			$emailAttachment = $Script:FileName1
		}
		SendEmail $emailAttachment
	}
}

Function ShowScriptOptions
{
	Write-Verbose "$(Get-Date -Format G): "
	Write-Verbose "$(Get-Date -Format G): "
	If($MSWord -or $PDF)
	{
		Write-Verbose "$(Get-Date -Format G): Company Name    : $($Script:CoName)"
		Write-Verbose "$(Get-Date -Format G): Company Address : $($CompanyAddress)"
		Write-Verbose "$(Get-Date -Format G): Company Email   : $($CompanyEmail)"
		Write-Verbose "$(Get-Date -Format G): Company Fax     : $($CompanyFax)"
		Write-Verbose "$(Get-Date -Format G): Company Phone   : $($CompanyPhone)"
		Write-Verbose "$(Get-Date -Format G): Cover Page      : $($CoverPage)"
		Write-Verbose "$(Get-Date -Format G): User Name       : $($UserName)"
		Write-Verbose "$(Get-Date -Format G): Save As Word    : $($Word)"
		Write-Verbose "$(Get-Date -Format G): Save As PDF     : $($PDF)"
		Write-Verbose "$(Get-Date -Format G): "
	}
	ElseIf($Text)
	{
		Write-Verbose "$(Get-Date -Format G): Save As Text    : $($Text)"
	}
	ElseIf($HTML)
	{
		Write-Verbose "$(Get-Date -Format G): Save As HTML    : $($HTML)"
	}
	Write-Verbose "$(Get-Date -Format G): AdminAddress    : $($AdminAddress)"
	Write-Verbose "$(Get-Date -Format G): MachineCatalogs : $($MachineCatalogs)"
	Write-Verbose "$(Get-Date -Format G): DeliveryGroups  : $($DeliveryGroups)"
	Write-Verbose "$(Get-Date -Format G): DGUtilization   : $($DeliveryGroupsUtilization)"
	Write-Verbose "$(Get-Date -Format G): Applications    : $($Applications)"
	Write-Verbose "$(Get-Date -Format G): Policies        : $($Policies)"
	Write-Verbose "$(Get-Date -Format G): NoPolicies      : $($NoPolicies)"
	Write-Verbose "$(Get-Date -Format G): NoADPolicies    : $($NoADPolicies)"
	Write-Verbose "$(Get-Date -Format G): Hosting         : $($Hosting)"
	Write-Verbose "$(Get-Date -Format G): HW Inventory    : $($Hardware)"
	Write-Verbose "$(Get-Date -Format G): Add DateTime    : $($AddDateTime)"
	Write-Verbose "$(Get-Date -Format G): "
	Write-Verbose "$(Get-Date -Format G): Site Name       : $($XDSiteName)"
	Write-Verbose "$(Get-Date -Format G): Title           : $($Script:Title)"
	Write-Verbose "$(Get-Date -Format G): Filename1       : $($Script:filename1)"
	If($PDF)
	{
		Write-Verbose "$(Get-Date -Format G): Filename2       : $($Script:filename2)"
	}
	If(![System.String]::IsNullOrEmpty( $SmtpServer ))
	{
		Write-Verbose "$(Get-Date -Format G): Smtp Server     : $($SmtpServer)"
		Write-Verbose "$(Get-Date -Format G): Smtp Port       : $($SmtpPort)"
		Write-Verbose "$(Get-Date -Format G): Use SSL         : $($UseSSL)"
		Write-Verbose "$(Get-Date -Format G): From            : $($From)"
		Write-Verbose "$(Get-Date -Format G): To              : $($To)"
	}
	Write-Verbose "$(Get-Date -Format G): OS Detected     : $($Script:RunningOS)"
	Write-Verbose "$(Get-Date -Format G): PSUICulture     : $($PSUICulture)"
	Write-Verbose "$(Get-Date -Format G): PSCulture       : $($PSCulture)"
	If($MSWord -or $PDF)
	{
		Write-Verbose "$(Get-Date -Format G): Word version    : $($WordProduct)"
		Write-Verbose "$(Get-Date -Format G): Word language   : $($Script:WordLanguageValue)"
	}
	Write-Verbose "$(Get-Date -Format G): PoSH version    : $($Host.Version)"
	Write-Verbose "$(Get-Date -Format G): "
	Write-Verbose "$(Get-Date -Format G): Script start    : $($Script:StartTime)"
	Write-Verbose "$(Get-Date -Format G): "
	Write-Verbose "$(Get-Date -Format G): "
}

Function AbortScript
{
	If($MSWord -or $PDF)
	{
		$Script:Word.quit()
		Write-Verbose "$(Get-Date -Format G): System Cleanup"
		[System.Runtime.Interopservices.Marshal]::ReleaseComObject($Script:Word) | Out-Null
		If(Test-Path variable:global:word)
		{
			Remove-Variable -Name word -Scope Global
		}
	}
	[gc]::collect() 
	[gc]::WaitForPendingFinalizers()
	Write-Verbose "$(Get-Date -Format G): Script has been aborted"
	$ErrorActionPreference = $SaveEAPreference
	Exit
}

Function OutputWarning
{
	Param([string] $txt)
	Write-Warning $txt
	If($MSWord -or $PDF)
	{
		WriteWordLine 0 1 $txt
	}
	ElseIf($Text)
	{
		Line 1 $txt
	}
	ElseIf($HTML)
	{
		WriteHTMLLine 0 1 $txt
	}
}
#endregion

#region email function#region email function
Function SendEmail
{
	Param([array]$Attachments)
	Write-Verbose "$(Get-Date -Format G): Prepare to email"

	$emailAttachment = $Attachments
	$emailSubject = $Script:Title
	$emailBody = @"
Hello, <br />
<br />
$Script:Title is attached.

"@ 

	If($Dev)
	{
		Out-File -FilePath $Script:DevErrorFile -InputObject $error 4>$Null
	}

	$error.Clear()
	
	If($From -Like "anonymous@*")
	{
		#https://serverfault.com/questions/543052/sending-unauthenticated-mail-through-ms-exchange-with-powershell-windows-server
		$anonUsername = "anonymous"
		$anonPassword = ConvertTo-SecureString -String "anonymous" -AsPlainText -Force
		$anonCredentials = New-Object System.Management.Automation.PSCredential($anonUsername,$anonPassword)

		If($UseSSL)
		{
			Send-MailMessage -Attachments $emailAttachment -Body $emailBody -BodyAsHtml -From $From `
			-Port $SmtpPort -SmtpServer $SmtpServer -Subject $emailSubject -To $To `
			-UseSSL -credential $anonCredentials *>$Null 
		}
		Else
		{
			Send-MailMessage -Attachments $emailAttachment -Body $emailBody -BodyAsHtml -From $From `
			-Port $SmtpPort -SmtpServer $SmtpServer -Subject $emailSubject -To $To `
			-credential $anonCredentials *>$Null 
		}
		
		If($?)
		{
			Write-Verbose "$(Get-Date -Format G): Email successfully sent using anonymous credentials"
		}
		ElseIf(!$?)
		{
			$e = $error[0]

			Write-Verbose "$(Get-Date -Format G): Email was not sent:"
			Write-Warning "$(Get-Date): Exception: $e.Exception" 
		}
	}
	Else
	{
		If($UseSSL)
		{
			Write-Verbose "$(Get-Date -Format G): Trying to send email using current user's credentials with SSL"
			Send-MailMessage -Attachments $emailAttachment -Body $emailBody -BodyAsHtml -From $From `
			-Port $SmtpPort -SmtpServer $SmtpServer -Subject $emailSubject -To $To `
			-UseSSL *>$Null
		}
		Else
		{
			Write-Verbose  "$(Get-Date): Trying to send email using current user's credentials without SSL"
			Send-MailMessage -Attachments $emailAttachment -Body $emailBody -BodyAsHtml -From $From `
			-Port $SmtpPort -SmtpServer $SmtpServer -Subject $emailSubject -To $To *>$Null
		}

		If(!$?)
		{
			$e = $error[0]
			
			#error 5.7.57 is O365 and error 5.7.0 is gmail
			If($null -ne $e.Exception -and $e.Exception.ToString().Contains("5.7"))
			{
				#The server response was: 5.7.xx SMTP; Client was not authenticated to send anonymous mail during MAIL FROM
				Write-Verbose "$(Get-Date -Format G): Current user's credentials failed. Ask for usable credentials."

				If($Dev)
				{
					Out-File -FilePath $Script:DevErrorFile -InputObject $error -Append 4>$Null
				}

				$error.Clear()

				$emailCredentials = Get-Credential -UserName $From -Message "Enter the password to send email"

				If($UseSSL)
				{
					Send-MailMessage -Attachments $emailAttachment -Body $emailBody -BodyAsHtml -From $From `
					-Port $SmtpPort -SmtpServer $SmtpServer -Subject $emailSubject -To $To `
					-UseSSL -credential $emailCredentials *>$Null 
				}
				Else
				{
					Send-MailMessage -Attachments $emailAttachment -Body $emailBody -BodyAsHtml -From $From `
					-Port $SmtpPort -SmtpServer $SmtpServer -Subject $emailSubject -To $To `
					-credential $emailCredentials *>$Null 
				}

				If($?)
				{
					Write-Verbose "$(Get-Date -Format G): Email successfully sent using new credentials"
				}
				ElseIf(!$?)
				{
					$e = $error[0]

					Write-Verbose "$(Get-Date -Format G): Email was not sent:"
					Write-Warning "$(Get-Date): Exception: $e.Exception" 
				}
			}
			Else
			{
				Write-Verbose "$(Get-Date -Format G): Email was not sent:"
				Write-Warning "$(Get-Date): Exception: $e.Exception" 
			}
		}
	}
}
#endregion

#region Machine Catalog functions
Function ProcessMachines
{
	Write-Verbose "$(Get-Date -Format G): Retrieving Machines"
	
	$AllMachineCatalogs = Get-BrokerCatalog @XDParams2 -SortBy Name
	If($? -and $Null -ne $AllMachineCatalogs)
	{
		OutputMachines $AllMachineCatalogs
	}
	ElseIf($? -and ($Null -eq $AllMachineCatalogs))
	{
		$txt = "There are no Machines"
		OutputWarning $txt
	}
	Else
	{
		$txt = "Unable to retrieve Machines"
		OutputWarning $txt
	}
	Write-Verbose "$(Get-Date -Format G): "
}

Function OutputMachines
{
	Param([object]$Catalogs)
	
	$txt = "Machines"
	If($MSWord -or $PDF)
	{
		$Selection.InsertNewPage()
		WriteWordLine 1 0 $txt
	}
	ElseIf($Text)
	{
		Line 0 $txt
		Line 0 ""
	}
	ElseIf($HTML)
	{
		WriteHTMLLine 1 0 $txt
	}

	If($MSWord -or $PDF)
	{
		[System.Collections.Hashtable[]] $CatalogsWordTable = @();
		## Seed the $Services row index from the second row
		[int] $CurrentServiceIndex = 2;
	}

	ForEach($Catalog in $Catalogs)
	{
		Write-Verbose "$(Get-Date -Format G): `tAdding row for Catalog $($Catalog.Name)"
		
		$xCatalogType = ""
		$xMachineType = ""
		#PvD is only valid for XenDesktop 5.6
		If($Catalog.AllocationType -eq "Permanent" -and $Catalog.CatalogKind -eq "ThinCloned")
		{
			$xCatalogType = "Dedicated"
			$xMachineType = "Dedicated"
		}
		ElseIf($Catalog.AllocationType -eq "Permanent" -and $Catalog.CatalogKind -eq "PowerManaged")
		{
			$xCatalogType = "Existing"
			$xMachineType = "Existing"
		}
		ElseIf($Catalog.AllocationType -eq "Permanent" -and $Catalog.CatalogKind -eq "Unmanaged")
		{
			$xCatalogType = "Physical"
			$xMachineType = "Physical"
		}
		ElseIf($Catalog.AllocationType -eq "Random" -and $Catalog.CatalogKind -eq "SingleImage")
		{
			$xCatalogType = "Pooled-Random"
			$xMachineType = "Pooled"
		}
		ElseIf($Catalog.AllocationType -eq "Permanent" -and $Catalog.CatalogKind -eq "SingleImage")
		{
			$xCatalogType = "Pooled-Static"
			$xMachineType = "Pooled"
		}
		ElseIf($CanUsePvD -and ($Catalog.AllocationType -eq "Permanent" -and $Catalog.CatalogKind -eq "Pvd"))
		{
			$xCatalogType = "Pooled with personal vDisk"
			$xMachineType = "Pooled with personal vDisk"
		}
		ElseIf($Catalog.AllocationType -eq "Random" -and $Catalog.CatalogKind -eq "Pvs")
		{
			$xCatalogType = "Streamed"
			$xMachineType = "Streamed"
		}
		ElseIf($CanUsePvD -and ($Catalog.AllocationType -eq "Random" -and $Catalog.CatalogKind -eq "PvsPvd"))
		{
			$xCatalogType = "Streamed with personal vDisk"
			$xMachineType = "Streamed with personal vDisk"
		}
		ElseIf($CanUsePvD -and ($Catalog.AllocationType -eq "Permanent" -and $Catalog.CatalogKind -eq "PvsPvd"))
		{
			$xCatalogType = "Streamed with personal vDisk"
			$xMachineType = "Streamed with personal vDisk"
		}
		Else
		{
			$xCatalogType = "Unable to determine Catalog type. AllocationType: $($Catalog.AllocationType) CatalogKind: $($Catalog.CatalogKind)"
			$xMachineType = "Unable to determine Machine type. AllocationType: $($Catalog.AllocationType) CatalogKind: $($Catalog.CatalogKind)"
		}

		If($MSWord -or $PDF)
		{
			$WordTableRowHash = @{
			CatalogName = $Catalog.Name; 
			CatalogType = $xCatalogType; 
			Withuser = $Catalog.AssignedCount; 
			Withoutuser = $Catalog.UnassignedCount; 
			Assigned = $Catalog.UsedCount; 
			Free = $Catalog.AvailableCount; 
			}
			$CatalogsWordTable += $WordTableRowHash;
			$CurrentServiceIndex++;
		}
		ElseIf($Text)
		{
			Line 1 "Name`t`t: " $Catalog.Name
			Line 1 "Type`t`t: " $xCatalogType
			Line 1 "With user`t: " $Catalog.AssignedCount
			Line 1 "Without user`t: " $Catalog.UnassignedCount
			Line 1 "Assigned`t: " $Catalog.UsedCount
			Line 1 "Free`t`t: " $Catalog.AvailableCount
			Line 0 ""
		}
		ElseIf($HTML)
		{
			WriteHTMLLine 0 1 "Name: " $Catalog.Name
			WriteHTMLLine 0 1 "Type: " $xCatalogType
			WriteHTMLLine 0 1 "With user: " $Catalog.AssignedCount
			WriteHTMLLine 0 1 "Without user: " $Catalog.UnassignedCount
			WriteHTMLLine 0 1 "Assigned: " $Catalog.UsedCount
			WriteHTMLLine 0 1 "Free: " $Catalog.AvailableCount
			WriteHTMLLine 0 0 " "
		}
	}

	If($MSWord -or $PDF)
	{
		## Add the table to the document, using the hashtable (-Alt is short for -AlternateBackgroundColor!)
		$Table = AddWordTable -Hashtable $CatalogsWordTable `
		-Columns  CatalogName,CatalogType,Withuser,Withoutuser,Assigned,Free `
		-Headers  "Name","Type","With user","Without user","Assigned","Free" `
		-Format $wdTableGrid `
		-AutoFit $wdAutoFitContent;

		## IB - Set the header row format after the SetWordTableAlternateRowColor function as it will paint the header row!
		SetWordCellFormat -Collection $Table.Rows.Item(1).Cells -Bold -BackgroundColor $wdColorGray15;

		#indent the entire table 1 tab stop
		$Table.Rows.SetLeftIndent($Indent0TabStops,$wdAdjustProportional)

		FindWordDocumentEnd
		$Table = $Null
	}
	
	If($MachineCatalogs)
	{
		ForEach($Catalog in $Catalogs)
		{
			#retrieve machines in machine catalog
			$Machines = Get-BrokerMachine -CatalogName $Catalog.name @XDParams2 -SortBy DNSName
			If($? -and $Null -ne $Machines)
			{
				$txt = "Catalog Details: "
				If($MSWord -or $PDF)
				{
					$Selection.InsertNewPage()
					WriteWordLine 2 0 $txt $Catalog.Name
				}
				ElseIf($Text)
				{
					Line 0 $txt $Catalog.Name
				}
				ElseIf($HTML)
				{
					WriteHTMLLine 2 0 $txt $Catalog.Name
				}
				
				ForEach($Machine in $Machines)
				{
					$Details = Get-BrokerDesktop -MachineName $Machine.MachineName @XDParams1
					
					If($? -and $Null -ne $Details)
					{
						OutputMachineDesktopDetails $Details $Machine
					}
					ElseIf($? -and ($null -eq $Details))
					{
						$txt = "There are no additional details available for $($Machine.DNSName)"
						OutputWarning $txt
					}
					Else
					{
						$txt = "Unable to retrieve additional details for $($Machine.DNSName)"
						OutputWarning $txt
					}
				}
			}
			ElseIf($? -and $Null -eq $Machines)
			{
				$txt = "There are no Machines for Delivery Group $($Catalog.name)"
				OutputWarning $txt
			}
			Else
			{
				$txt = "Unable to retrieve Machines for Delivery Group $($Catalog.name)"
				OutputWarning $txt
			}
		}
	}
}
#endregion

#region function to output machine/desktop details
Function OutputMachineDesktopDetails
{
	Param([object] $Details, [object] $Machine)
	
	If([String]::IsNullOrEmpty($Machine.HostedMachineName))
	{
		Write-Verbose "$(Get-Date -Format G): `t`t`tOuput Machine (Unknown Power State or Unregistered)"
	}
	Else
	{
		Write-Verbose "$(Get-Date -Format G): `t`t`tOuput Machine $($Machine.HostedMachineName)"
	}
	$SummaryState = $Details.SummaryState
	If($SummaryState -eq "InUse")
	{
		$SummaryState = "In Use"
	}

	$xIsAssigned = "No"
	If($Machine.IsAssigned)
	{
		$xIsAssigned = "Yes"
	}
	
	$xAssociatedUserNames = @()
	ForEach($Value in $Machine.AssociatedUserNames)
	{
		$xAssociatedUserNames += "$($Value)"
	}

	$xAssociatedUserUPNs = @()
	ForEach($Value in $Machine.AssociatedUserUPNs)
	{
		$xAssociatedUserUPNs += "$($Value)"
	}

	$xAssociatedUserFullNames = @()
	ForEach($Value in $Machine.AssociatedUserFullNames)
	{
		$xAssociatedUserFullNames += "$($Value)"
	}

	$xInMaintenanceMode = ""
	If($Details.InMaintenanceMode)
	{
		$xInMaintenanceMode = "On"
	}
	Else
	{
		$xInMaintenanceMode ="Off"
	}
		
	$xLastDeregistrationReason = ""
	Switch ($Machine.LastDeregistrationReason)
	{
		$null								{$xLastDeregistrationReason = ""; Break}
		"AgentAddressResolutionFailed"		{$xLastDeregistrationReason = "Agent Address Resolution Failed"; Break}
		"AgentConfigurationError"			{$xLastDeregistrationReason = "Agent Configuration Error"; Break}
		"AgentNotContactable"				{$xLastDeregistrationReason = "Agent Not Contactable"; Break}
		"AgentRejectedConfiguration"		{$xLastDeregistrationReason = "Agent Rejected Configuration"; Break}
		"AgentRequested"					{$xLastDeregistrationReason = "Agent Requested"; Break}
		"AgentShutdown"						{$xLastDeregistrationReason = "Agent Shutdown"; Break}
		"AgentSuspended"					{$xLastDeregistrationReason = "Agent Suspended"; Break}
		"BrokerError"						{$xLastDeregistrationReason = "Broker Error"; Break}
		"BrokerRegistrationLimitReached"	{$xLastDeregistrationReason = "Broker Registration Limit Reached"; Break}
		"CommunicationFailure"				{$xLastDeregistrationReason = "Communication Failure"; Break}
		"ContactLost"						{$xLastDeregistrationReason = "Contact Lost"; Break}
		"DesktopRemoved"					{$xLastDeregistrationReason = "Desktop Removed"; Break}
		"DesktopRestart"					{$xLastDeregistrationReason = "Desktop Restart"; Break}
		"IncompatibleAgent"					{$xLastDeregistrationReason = "Incompatible Agent"; Break}
		Default {$xLastDeregistrationReason = "Unable to determine LastDeregistrationReason: $($Machine.LastDeregistrationReason)"; Break}
	}
		
	$xLastConnectionFailure = ""
	Switch ($Details.LastConnectionFailure)
	{
		"ConnectionTimeout"		{$xLastConnectionFailure = "Connection TImeout"; Break}
		"Licensing"				{$xLastConnectionFailure = "Licensing"; Break}
		"None"					{$xLastConnectionFailure = "None"; Break}
		"Other"					{$xLastConnectionFailure = "Other"; Break}
		"RegistrationTimeout"	{$xLastConnectionFailure = "Registration Timeout"; Break}
		"SessionPreparation"	{$xLastConnectionFailure = "Session Preparation"; Break}
		"Ticketing"				{$xLastConnectionFailure = "Ticketing"; Break}
		Default {$xLastConnectionFailure = "Unable to determine Last Connection Failure: $($Details.LastConnectionFailure)"; Break}
	}
		
	$xDesktopConditions = @()
	ForEach($Value in $Details.DesktopConditions)
	{
		$xDesktopConditions += "$($Value)"
	}
		
	$xSessionState = $Details.SessionState
	If($Details.SessionState -eq "PreparingSession") #fix typo found by GRL 13-Jul-2022
	{
		$xSessionState = "PreparingSession"
	}
	ElseIf($Details.SessionState -eq "NonBrokeredSession")
	{
		$xSessionState = "Non Brokered Session"
	}
		
	$xSecureIcaActive = ""
	If($Machine.SecureIcaActive)
	{
		$xSecureIcaActive = "Yes"
	}
	Else
	{
		$xSecureIcaActive = "No"
	}
		
	$xPublishedApplications = @()
	ForEach($value in $Details.PublishedApplications)
	{
		$xPublishedApplications += "$($value)"
	}

	$xApplicationsInUse = @()
	ForEach($value in $Details.ApplicationsInUse)
	{
		$xApplicationsInUse += "$($value)"
	}

	$First = $True
	If($MSWord -or $PDF)
	{
		If(!$First)
		{
			$Selection.InsertNewPage()
		}
		$First = $False
		WriteWordLine 3 0 $Machine.MachineName
		WriteWordLine 0 1 "Machine"
		[System.Collections.Hashtable[]] $ScriptInformation = @()
		$ScriptInformation += @{ Data = "Name"; Value = $Machine.MachineName; }
		$ScriptInformation += @{ Data = "DNS Name"; Value = $Machine.DNSName; }
		$ScriptInformation += @{ Data = "State"; Value = $SummaryState; }
		If($CanUsePvD)
		{
			$ScriptInformation += @{ Data = "Personal vDisk Stage"; Value = $Machine.PvdStage; }
		}
		$ScriptInformation += @{ Data = "Desktop Group"; Value = $Details.DesktopGroupName; }
		$ScriptInformation += @{ Data = "Catalog"; Value = $Details.CatalogName; }
		$ScriptInformation += @{ Data = "Machine Type"; Value = $xMachineType; }
		$ScriptInformation += @{ Data = "Allocation Type"; Value = "$($Details.DesktopKind) Desktop"; }
		$ScriptInformation += @{ Data = "Is Allocated"; Value = $xIsAssigned; }
		$ScriptInformation += @{ Data = "User"; Value = $xAssociatedUserNames[0]; }
		$cnt = -1
		ForEach($tmp in $xAssociatedUserNames)
		{
			$cnt++
			If($cnt -gt 0)
			{
				$ScriptInformation += @{ Data = ""; Value = $tmp; }
			}
		}
		$ScriptInformation += @{ Data = "UPN"; Value = $xAssociatedUserUPNs[0]; }
		$cnt = -1
		ForEach($tmp in $xAssociatedUserUPNs)
		{
			$cnt++
			If($cnt -gt 0)
			{
				$ScriptInformation += @{ Data = ""; Value = $tmp; }
			}
		}
		$ScriptInformation += @{ Data = "User Display Name"; Value = $xAssociatedUserFullNames[0]; }
		$cnt = -1
		ForEach($tmp in $xAssociatedUserFullNames)
		{
			$cnt++
			If($cnt -gt 0)
			{
				$ScriptInformation += @{ Data = ""; Value = $tmp; }
			}
		}
		$ScriptInformation += @{ Data = "Maintenance Mode"; Value = $xInMaintenanceMode; }
		
		$Table = AddWordTable -Hashtable $ScriptInformation `
		-Columns Data,Value `
		-List `
		-Format $wdTableGrid `
		-AutoFit $wdAutoFitFixed;

		## IB - Set the header row format
		SetWordCellFormat -Collection $Table.Columns.Item(1).Cells -Bold -BackgroundColor $wdColorGray15;

		$Table.Columns.Item(1).Width = 200;
		$Table.Columns.Item(2).Width = 250;

		$Table.Rows.SetLeftIndent($Indent2TabStops,$wdAdjustProportional)

		FindWordDocumentEnd
		$Table = $Null
		WriteWordLine 0 0 ""

		WriteWordLine 0 1 "Hosting"
		[System.Collections.Hashtable[]] $ScriptInformation = @()
		$ScriptInformation += @{ Data = "Power State"; Value = $Machine.PowerState; }
		$ScriptInformation += @{ Data = "Host"; Value = $Details.HypervisorConnectionName; }
		$ScriptInformation += @{ Data = "Server"; Value = $Details.HostingServerName; }
		$ScriptInformation += @{ Data = "VM"; Value = $Machine.HostedMachineName; }
		$ScriptInformation += @{ Data = "Pending Update"; Value = $Details.ImageOutOfDate; }

		$Table = AddWordTable -Hashtable $ScriptInformation `
		-Columns Data,Value `
		-List `
		-Format $wdTableGrid `
		-AutoFit $wdAutoFitFixed;

		## IB - Set the header row format
		SetWordCellFormat -Collection $Table.Columns.Item(1).Cells -Bold -BackgroundColor $wdColorGray15;

		$Table.Columns.Item(1).Width = 200;
		$Table.Columns.Item(2).Width = 250;

		$Table.Rows.SetLeftIndent($Indent2TabStops,$wdAdjustProportional)

		FindWordDocumentEnd
		$Table = $Null
		WriteWordLine 0 0 ""
		
		WriteWordLine 0 1 "Registration"
		[System.Collections.Hashtable[]] $ScriptInformation = @()
		$ScriptInformation += @{ Data = "Registration State"; Value = $Machine.RegistrationState; }
		$ScriptInformation += @{ Data = "Unregistered Time"; Value = $Details.LastDeregistrationTime; }
		$ScriptInformation += @{ Data = "Unregistered Reason"; Value = $xLastDeregistrationReason; }
		$ScriptInformation += @{ Data = "Broker"; Value = $Details.ControllerDNSName; }

		$Table = AddWordTable -Hashtable $ScriptInformation `
		-Columns Data,Value `
		-List `
		-Format $wdTableGrid `
		-AutoFit $wdAutoFitFixed;

		## IB - Set the header row format
		SetWordCellFormat -Collection $Table.Columns.Item(1).Cells -Bold -BackgroundColor $wdColorGray15;

		$Table.Columns.Item(1).Width = 200;
		$Table.Columns.Item(2).Width = 250;

		$Table.Rows.SetLeftIndent($Indent2TabStops,$wdAdjustProportional)

		FindWordDocumentEnd
		$Table = $Null
		WriteWordLine 0 0 ""
		
		WriteWordLine 0 1 "Condition"
		[System.Collections.Hashtable[]] $ScriptInformation = @()
		$ScriptInformation += @{ Data = "Last Connection Failure"; Value = $xLastConnectionFailure; }
		$ScriptInformation += @{ Data = "Conditions"; Value = $xDesktopConditions[0]; }
		$cnt = -1
		ForEach($tmp in $xDesktopConditions)
		{
			$cnt++
			If($cnt -gt 0)
			{
				$ScriptInformation += @{ Data = ""; Value = $tmp; }
			}
		}

		$Table = AddWordTable -Hashtable $ScriptInformation `
		-Columns Data,Value `
		-List `
		-Format $wdTableGrid `
		-AutoFit $wdAutoFitFixed;

		## IB - Set the header row format
		SetWordCellFormat -Collection $Table.Columns.Item(1).Cells -Bold -BackgroundColor $wdColorGray15;

		$Table.Columns.Item(1).Width = 200;
		$Table.Columns.Item(2).Width = 250;

		$Table.Rows.SetLeftIndent($Indent2TabStops,$wdAdjustProportional)

		FindWordDocumentEnd
		$Table = $Null
		WriteWordLine 0 0 ""
		
		WriteWordLine 0 1 "Machine Details"
		[System.Collections.Hashtable[]] $ScriptInformation = @()
		$ScriptInformation += @{ Data = "IP Address"; Value = $Details.IPAddress; }
		$ScriptInformation += @{ Data = "OS"; Value = $Details.OSType; }
		$ScriptInformation += @{ Data = "Agent Version"; Value = $Details.AgentVersion; }

		$Table = AddWordTable -Hashtable $ScriptInformation `
		-Columns Data,Value `
		-List `
		-Format $wdTableGrid `
		-AutoFit $wdAutoFitFixed;

		## IB - Set the header row format
		SetWordCellFormat -Collection $Table.Columns.Item(1).Cells -Bold -BackgroundColor $wdColorGray15;

		$Table.Columns.Item(1).Width = 200;
		$Table.Columns.Item(2).Width = 250;

		$Table.Rows.SetLeftIndent($Indent2TabStops,$wdAdjustProportional)

		FindWordDocumentEnd
		$Table = $Null
		WriteWordLine 0 0 ""
		
		WriteWordLine 0 1 "Session"
		[System.Collections.Hashtable[]] $ScriptInformation = @()
		$ScriptInformation += @{ Data = "Session State"; Value = $xSessionState; }
		$ScriptInformation += @{ Data = "Current User"; Value = $Details.SessionUserName; }
		$ScriptInformation += @{ Data = "Logon Time"; Value = $Details.StartTime; }

		$Table = AddWordTable -Hashtable $ScriptInformation `
		-Columns Data,Value `
		-List `
		-Format $wdTableGrid `
		-AutoFit $wdAutoFitFixed;

		## IB - Set the header row format
		SetWordCellFormat -Collection $Table.Columns.Item(1).Cells -Bold -BackgroundColor $wdColorGray15;

		$Table.Columns.Item(1).Width = 200;
		$Table.Columns.Item(2).Width = 250;

		$Table.Rows.SetLeftIndent($Indent2TabStops,$wdAdjustProportional)

		FindWordDocumentEnd
		$Table = $Null
		WriteWordLine 0 0 ""

		WriteWordLine 0 1 "Session Details"
		[System.Collections.Hashtable[]] $ScriptInformation = @()
		$ScriptInformation += @{ Data = "Session Change Time"; Value = $Details.SessionStateChangeTime; }
		$ScriptInformation += @{ Data = "SmartAccess Filters"; Value = $Details.SmartAccessTags; }

		$Table = AddWordTable -Hashtable $ScriptInformation `
		-Columns Data,Value `
		-List `
		-Format $wdTableGrid `
		-AutoFit $wdAutoFitFixed;

		## IB - Set the header row format
		SetWordCellFormat -Collection $Table.Columns.Item(1).Cells -Bold -BackgroundColor $wdColorGray15;

		$Table.Columns.Item(1).Width = 200;
		$Table.Columns.Item(2).Width = 250;

		$Table.Rows.SetLeftIndent($Indent2TabStops,$wdAdjustProportional)

		FindWordDocumentEnd
		$Table = $Null
		WriteWordLine 0 0 ""
		
		WriteWordLine 0 1 "Connection"
		[System.Collections.Hashtable[]] $ScriptInformation = @()
		$ScriptInformation += @{ Data = "Last Connection Time"; Value = $Details.LastConnectionTime ; }
		$ScriptInformation += @{ Data = "Last Connection User"; Value = $Details.LastConnectionUser; }
		$ScriptInformation += @{ Data = "Endpoint"; Value = $Details.ClientName; }
		$ScriptInformation += @{ Data = "Endpoint (IP)"; Value = $Details.ClientAddress; }
		$ScriptInformation += @{ Data = "Plug-in Version"; Value = $Details.ClientVersion; }
		$ScriptInformation += @{ Data = "Connected Via"; Value = $Details.ConnectedViaHostName; }
		$ScriptInformation += @{ Data = "Connected Via (IP)"; Value = $Details.ConnectedViaIP; }
		$ScriptInformation += @{ Data = "Launched Via"; Value = $Details.PaunchedViaHostName; }
		$ScriptInformation += @{ Data = "Launched Via (IP)"; Value = $Details.LaunchedViaIP; }
		$ScriptInformation += @{ Data = "Connection Type"; Value = $Details.Protocol; }
		$ScriptInformation += @{ Data = "SecureICA"; Value = $xSecureIcaActive ; }

		$Table = AddWordTable -Hashtable $ScriptInformation `
		-Columns Data,Value `
		-List `
		-Format $wdTableGrid `
		-AutoFit $wdAutoFitFixed;

		## IB - Set the header row format
		SetWordCellFormat -Collection $Table.Columns.Item(1).Cells -Bold -BackgroundColor $wdColorGray15;

		$Table.Columns.Item(1).Width = 200;
		$Table.Columns.Item(2).Width = 250;

		$Table.Rows.SetLeftIndent($Indent2TabStops,$wdAdjustProportional)

		FindWordDocumentEnd
		$Table = $Null
		WriteWordLine 0 0 ""
		
		WriteWordLine 0 1 "Applications"
		[System.Collections.Hashtable[]] $ScriptInformation = @()
		$ScriptInformation += @{ Data = "Published Applications"; Value = $xPublishedApplications[0]; }
		$cnt = -1
		ForEach($tmp in $xPublishedApplications)
		{
			$cnt++
			If($cnt -gt 0)
			{
				$ScriptInformation += @{ Data = ""; Value = $tmp; }
			}
		}
		$ScriptInformation += @{ Data = "Apps In Use"; Value = $xApplicationsInUse[0]; }
		$cnt = -1
		ForEach($tmp in $xApplicationsInUse)
		{
			$cnt++
			If($cnt -gt 0)
			{
				$ScriptInformation += @{ Data = ""; Value = $tmp; }
			}
		}
		$ScriptInformation += @{ Data = "License ID"; Value = $Details.LicenseId; }

		$Table = AddWordTable -Hashtable $ScriptInformation `
		-Columns Data,Value `
		-List `
		-Format $wdTableGrid `
		-AutoFit $wdAutoFitFixed;

		## IB - Set the header row format
		SetWordCellFormat -Collection $Table.Columns.Item(1).Cells -Bold -BackgroundColor $wdColorGray15;

		$Table.Columns.Item(1).Width = 200;
		$Table.Columns.Item(2).Width = 250;

		$Table.Rows.SetLeftIndent($Indent2TabStops,$wdAdjustProportional)

		FindWordDocumentEnd
		$Table = $Null
		WriteWordLine 0 0 ""
	}
	ElseIf($Text)
	{
		Line 0 $Machine.MachineName
		Line 1 "Machine"
		Line 2 "Name`t`t`t: " $Machine.MachineName
		Line 2 "DNS Name`t`t: " $Machine.DNSName
		Line 2 "State`t`t`t: " $SummaryState
		If($CanUsePvD)
		{
			Line 2 "Personal vDisk Stage`t: " $Machine.PvdStage
		}
		Line 2 "Desktop Group`t`t: " $Details.DesktopGroupName
		Line 2 "Catalog`t`t`t: " $Details.CatalogName
		Line 2 "Machine Type`t`t: " $xMachineType
		Line 2 "Allocation Type`t`t: " "$($Details.DesktopKind) Desktop"
		Line 2 "Is Allocated`t`t: " $xIsAssigned
		Line 2 "User`t`t`t: " $xAssociatedUserNames[0]
		$cnt = -1
		ForEach($tmp in $xAssociatedUserNames)
		{
			$cnt++
			If($cnt -gt 0)
			{
				Line 5 "  " $tmp
			}
		}
		Line 2 "UPN`t`t`t: " $xAssociatedUserUPNs[0]
		$cnt = -1
		ForEach($tmp in $xAssociatedUserUPNs)
		{
			$cnt++
			If($cnt -gt 0)
			{
				Line 5 "  " $tmp
			}
		}
		Line 2 "User Display Name`t: " $xAssociatedUserFullNames[0]
		$cnt = -1
		ForEach($tmp in $xAssociatedUserFullNames)
		{
			$cnt++
			If($cnt -gt 0)
			{
				Line 5 "  " $tmp
			}
		}
		Line 2 "Maintenance Mode`t: " $xInMaintenanceMode
		Line 0 ""

		Line 1 "Hosting"
		Line 2 "Power State`t`t: " $Machine.PowerState
		Line 2 "Host`t`t`t: " $Details.HypervisorConnectionName
		Line 2 "Server`t`t`t: " $Details.HostingServerName
		Line 2 "VM`t`t`t: " $Machine.HostedMachineName
		Line 2 "Pending Update`t`t: " $Details.ImageOutOfDate
		Line 0 ""
		
		Line 1 "Registration"
		Line 2 "Registration State`t: " $Machine.RegistrationState
		Line 2 "Unregistered Time`t: " $Details.LastDeregistrationTime
		Line 2 "Unregistered Reason`t: " $xLastDeregistrationReason
		Line 2 "Broker`t`t`t: " $Details.ControllerDNSName
		Line 0 ""
		
		Line 1 "Condition"
		Line 2 "Last Connection Failure`t: " $xLastConnectionFailure
		Line 2 "Conditions`t`t: " $xDesktopConditions[0]
		$cnt = -1
		ForEach($tmp in $xDesktopConditions)
		{
			$cnt++
			If($cnt -gt 0)
			{
				Line 5 "  " $tmp
			}
		}
		Line 0 ""
		
		Line 1 "Machine Details"
		Line 2 "IP Address`t`t: " $Details.IPAddress
		Line 2 "OS`t`t`t: " $Details.OSType
		Line 2 "Agent Version`t`t: " $Details.AgentVersion
		Line 0 ""
		
		Line 1 "Session"
		Line 2 "Session State`t`t: " $xSessionState
		Line 2 "Current User`t`t: " $Details.SessionUserName
		Line 2 "Logon Time`t`t: " $Details.StartTime
		Line 0 ""

		Line 1 "Session Details"
		Line 2 "Session Change Time`t: " $Details.SessionStateChangeTime
		Line 2 "SmartAccess Filters`t: " $Details.SmartAccessTags
		Line 0 ""
		
		Line 1 "Connection"
		Line 2 "Last Connection Time`t: " $Details.LastConnectionTime 
		Line 2 "Last Connection User`t: " $Details.LastConnectionUser
		Line 2 "Endpoint`t`t: " $Details.ClientName
		Line 2 "Endpoint (IP)`t`t: " $Details.ClientAddress
		Line 2 "Plug-in Version`t`t: " $Details.ClientVersion
		Line 2 "Connected Via`t`t: " $Details.ConnectedViaHostName
		Line 2 "Connected Via (IP)`t: " $Details.ConnectedViaIP
		Line 2 "Launched Via`t`t: " $Details.PaunchedViaHostName
		Line 2 "Launched Via (IP)`t: " $Details.LaunchedViaIP
		Line 2 "Connection Type`t`t: " $Details.Protocol
		Line 2 "SecureICA`t`t: " $xSecureIcaActive 
		Line 0 ""
		
		Line 1 "Applications"
		Line 2 "Published Applications`t: " $xPublishedApplications[0]
		$cnt = -1
		ForEach($tmp in $xPublishedApplications)
		{
			$cnt++
			If($cnt -gt 0)
			{
				Line 5 "  " $tmp
			}
		}
		Line 2 "Apps In Use`t`t: " $xApplicationsInUse[0]
		$cnt = -1
		ForEach($tmp in $xApplicationsInUse)
		{
			$cnt++
			If($cnt -gt 0)
			{
				Line 5 "  " $tmp
			}
		}
		Line 2 "License ID`t`t: " $Details.LicenseId
		Line 0 ""
	}
	ElseIf($HTML)
	{
		WriteHTMLLine 3 0 $Machine.MachineName
		WriteHTMLLine 0 1 "Machine"
		WriteHTMLLine 0 2 "Name: " $Machine.MachineName
		WriteHTMLLine 0 2 "DNS Name: " $Machine.DNSName
		WriteHTMLLine 0 2 "State: " $SummaryState
		If($CanUsePvD)
		{
			WriteHTMLLine 0 2 "Personal vDisk Stage: " $Machine.PvdStage
		}
		WriteHTMLLine 0 2 "Desktop Group: " $Details.DesktopGroupName
		WriteHTMLLine 0 2 "Catalog: " $Details.CatalogName
		WriteHTMLLine 0 2 "Machine Type: " $xMachineType
		WriteHTMLLine 0 2 "Allocation Type" "$($Details.DesktopKind) Desktop"
		WriteHTMLLine 0 2 "Is Allocated: " $xIsAssigned
		WriteHTMLLine 0 2 "User: " $xAssociatedUserNames[0]
		$cnt = -1
		ForEach($tmp in $xAssociatedUserNames)
		{
			$cnt++
			If($cnt -gt 0)
			{
				WriteHTMLLine 0 3 "  " $tmp
			}
		}
		WriteHTMLLine 0 2 "UPN: " $xAssociatedUserUPNs[0]
		$cnt = -1
		ForEach($tmp in $xAssociatedUserUPNs)
		{
			$cnt++
			If($cnt -gt 0)
			{
				WriteHTMLLine 0 3 "  " $tmp
			}
		}
		WriteHTMLLine 0 2 "User Display Name: " $xAssociatedUserFullNames[0]
		$cnt = -1
		ForEach($tmp in $xAssociatedUserFullNames)
		{
			$cnt++
			If($cnt -gt 0)
			{
				WriteHTMLLine 0 3 "  " $tmp
			}
		}
		WriteHTMLLine 0 2 "Maintenance Mode: " $xInMaintenanceMode
		WriteHTMLLine 0 0 " "

		WriteHTMLLine 0 1 "Hosting"
		WriteHTMLLine 0 2 "Power State: " $Machine.PowerState
		WriteHTMLLine 0 2 "Host: " $Details.HypervisorConnectionName
		WriteHTMLLine 0 2 "Server: " $Details.HostingServerName
		WriteHTMLLine 0 2 "VM: " $Machine.HostedMachineName
		WriteHTMLLine 0 2 "Pending Update: " $Details.ImageOutOfDate
		WriteHTMLLine 0 0 " "
		
		WriteHTMLLine 0 1 "Registration"
		WriteHTMLLine 0 2 "Registration State: " $Machine.RegistrationState
		WriteHTMLLine 0 2 "Unregistered Time: " $Details.LastDeregistrationTime
		WriteHTMLLine 0 2 "Unregistered Reason: " $xLastDeregistrationReason
		WriteHTMLLine 0 2 "Broker: " $Details.ControllerDNSName
		WriteHTMLLine 0 0 " "
		
		WriteHTMLLine 0 1 "Condition"
		WriteHTMLLine 0 2 "Last Connection Failure: " $xLastConnectionFailure
		WriteHTMLLine 0 2 "Conditions: " $xDesktopConditions[0]
		$cnt = -1
		ForEach($tmp in $xDesktopConditions)
		{
			$cnt++
			If($cnt -gt 0)
			{
				WriteHTMLLine 0 3 "  " $tmp
			}
		}
		WriteHTMLLine 0 0 " "
		
		WriteHTMLLine 0 1 "Machine Details"
		WriteHTMLLine 0 2 "IP Address: " $Details.IPAddress
		WriteHTMLLine 0 2 "OS: " $Details.OSType
		WriteHTMLLine 0 2 "Agent Version: " $Details.AgentVersion
		WriteHTMLLine 0 0 " "
		
		WriteHTMLLine 0 1 "Session"
		WriteHTMLLine 0 2 "Session State: " $xSessionState
		WriteHTMLLine 0 2 "Current User: " $Details.SessionUserName
		WriteHTMLLine 0 2 "Logon Time: " $Details.StartTime
		WriteHTMLLine 0 0 " "

		WriteHTMLLine 0 1 "Session Details"
		WriteHTMLLine 0 2 "Session Change Time: " $Details.SessionStateChangeTime
		WriteHTMLLine 0 2 "SmartAccess Filters: " $Details.SmartAccessTags
		WriteHTMLLine 0 0 " "
		
		WriteHTMLLine 0 1 "Connection"
		WriteHTMLLine 0 2 "Last Connection Time: " $Details.LastConnectionTime 
		WriteHTMLLine 0 2 "Last Connection User: " $Details.LastConnectionUser
		WriteHTMLLine 0 2 "Endpoint: " $Details.ClientName
		WriteHTMLLine 0 2 "Endpoint (IP): " $Details.ClientAddress
		WriteHTMLLine 0 2 "Plug-in Version: " $Details.ClientVersion
		WriteHTMLLine 0 2 "Connected Via: " $Details.ConnectedViaHostName
		WriteHTMLLine 0 2 "Connected Via (IP): " $Details.ConnectedViaIP
		WriteHTMLLine 0 2 "Launched Via: " $Details.PaunchedViaHostName
		WriteHTMLLine 0 2 "Launched Via (IP): " $Details.LaunchedViaIP
		WriteHTMLLine 0 2 "Connection Type: " $Details.Protocol
		WriteHTMLLine 0 2 "SecureICA: " $xSecureIcaActive 
		WriteHTMLLine 0 0 " "
		
		WriteHTMLLine 0 1 "Applications"
		WriteHTMLLine 0 2 "Published Applications: " $xPublishedApplications[0]
		$cnt = -1
		ForEach($tmp in $xPublishedApplications)
		{
			$cnt++
			If($cnt -gt 0)
			{
				WriteHTMLLine 0 3 "  " $tmp
			}
		}
		WriteHTMLLine 0 2 "Apps In Use: " $xApplicationsInUse[0]
		$cnt = -1
		ForEach($tmp in $xApplicationsInUse)
		{
			$cnt++
			If($cnt -gt 0)
			{
				WriteHTMLLine 0 3 "  " $tmp
			}
		}
		WriteHTMLLine 0 2 "License ID: " $Details.LicenseId
		WriteHTMLLine 0 0 " "
	}
}
#endregion

#region Delivery Group functions
Function ProcessAssignments
{
	Write-Verbose "$(Get-Date -Format G): Retrieving Assignments"
	
	$Assignments = Get-BrokerDesktopGroup @XDParams2 -SortBy Name
	If($? -and $Null -ne $Assignments)
	{
		OutputAssignments $Assignments
		
		If($DeliveryGroupsUtilization)
		{
			Write-Verbose "$(Get-Date -Format G): `t`t`tCreating Assigments Utilization report"
			OutputAssignmentsUtilization $Assignments
		}
	}
	ElseIf($? -and ($Null -eq $Assignments))
	{
		$txt = "There are no Assignments"
		OutputWarning $txt
	}
	Else
	{
		$txt = "Unable to retrieve Assignments"
		OutputWarning $txt
	}
	Write-Verbose "$(Get-Date -Format G): "
}

Function OutputAssignments
{
	Param([object]$Assignments)
	
	$txt = "Assignments"
	If($MSWord -or $PDF)
	{
		$Selection.InsertNewPage()
		WriteWordLine 1 0 $txt
	}
	ElseIf($Text)
	{
		Line 0 $txt
		Line 0 ""
	}
	ElseIf($HTML)
	{
		WriteHTMLLine 1 0 $txt
	}

	If($MSWord -or $PDF)
	{
		[System.Collections.Hashtable[]] $AssignmentsWordTable = @();
		## Seed the $Services row index from the second row
		[int] $CurrentServiceIndex = 2;
	}

	ForEach($Assignment in $Assignments)
	{
		Write-Verbose "$(Get-Date -Format G): `tAdding row for Assignment $($Assignment.Name)"

		$xEnabled = ""
		If($Assignment.Enabled -eq $True -and $Assignment.InMaintenanceMode -eq $True)
		{
			$xEnabled = "Maintenance Mode"
		}
		ElseIf($Assignment.Enabled -eq $False -and $Assignment.InMaintenanceMode -eq $True)
		{
			$xEnabled = "Maintenance Mode"
		}
		ElseIf($Assignment.Enabled -eq $True -and $Assignment.InMaintenanceMode -eq $False)
		{
			$xEnabled = "Enabled"
		}
		ElseIf($Assignment.Enabled -eq $False -and $Assignment.InMaintenanceMode -eq $False)
		{
			$xEnabled = "Disabled"
		}
		
		If($MSWord -or $PDF)
		{
			$WordTableRowHash = @{
			AssignmentName = $Assignment.Name; 
			TotalDesktops = $Assignment.TotalDesktops; 
			Available = $Assignment.DesktopsAvailable; 
			InUse = $Assignment.DesktopsInUse; 
			Disconnected = $Assignment.DesktopsDisconnected; 
			Unregistered = $Assignment.DesktopsUnregistered; 
			Enabled = $xEnabled;
			}
			$AssignmentsWordTable += $WordTableRowHash;
			$CurrentServiceIndex++;
		}
		ElseIf($Text)
		{
			Line 1 "Name`t`t: " $Assignment.Name
			Line 1 "Total desktops`t: " $Assignment.TotalDesktops
			Line 1 "Available`t: " $Assignment.DesktopsAvailable
			Line 1 "In use`t`t: " $Assignment.DesktopsInUse
			Line 1 "Disconnected`t: " $Assignment.DesktopsDisconnected
			Line 1 "Unregistered`t: " $Assignment.DesktopsUnregistered
			Line 1 "Enabled`t`t: " $xEnabled
			Line 0 ""
		}
		ElseIf($HTML)
		{
			WriteHTMLLine 0 1 "Name: " $Assignment.Name
			WriteHTMLLine 0 1 "Total desktops: " $Assignment.TotalDesktops
			WriteHTMLLine 0 1 "Available: " $Assignment.DesktopsAvailable
			WriteHTMLLine 0 1 "In use: " $Assignment.DesktopsInUse
			WriteHTMLLine 0 1 "Disconnected: " $Assignment.DesktopsDisconnected
			WriteHTMLLine 0 1 "Unregistered: " $Assignment.DesktopsUnregistered
			WriteHTMLLine 0 1 "Enabled: " $xEnabled
			WriteHTMLLine 0 0 " "
		}
	}

	If($MSWord -or $PDF)
	{
		## Add the table to the document, using the hashtable (-Alt is short for -AlternateBackgroundColor!)
		$Table = AddWordTable -Hashtable $AssignmentsWordTable `
		-Columns  AssignmentName,TotalDesktops,Available,InUse,Disconnected,Unregistered,Enabled `
		-Headers  "Name","Total desktops","Available","In use","Disconnected","Unregistered","Enabled" `
		-Format $wdTableGrid `
		-AutoFit $wdAutoFitContent;

		SetWordCellFormat -Collection $Table -Size 9
		SetWordCellFormat -Collection $Table.Rows.Item(1).Cells -Bold -BackgroundColor $wdColorGray15 -Size 9;

		$Table.Rows.SetLeftIndent($Indent0TabStops,$wdAdjustProportional)

		FindWordDocumentEnd
		$Table = $Null
		WriteWordLine 0 0 ""
	}

	If($DeliveryGroups)
	{
		#list all the machine catalogs that supply desktops to each desktop group
		If($MSWord -or $PDF)
		{
			[System.Collections.Hashtable[]] $AssignmentsWordTable = @();
			## Seed the $Services row index from the second row
			[int] $CurrentServiceIndex = 2;
		}

		ForEach($Assignment in $Assignments)
		{
			#process the catalogs associated with this desktop group
			ProcessAssignmentCatalogs $Assignment
			
			#retrieve machines in machine Assignment
			$Machines = Get-BrokerDesktop -DesktopGroupName $Assignment.name @XDParams2
			If($? -and $Null -ne $Machines)
			{
				#sort by catalog name and then DNSName
				#can't use HostedMachineName as that property may not have data
				$machines = $machines | Sort-Object catalogname,DNSName
				If($MSWord -or $PDF)
				{
					WriteWordLine 2 0 "Assignment Details: " $Assignment.Name
				}
				ElseIf($Text)
				{
					Line 0 "Assignment Details: " $Assignment.Name
				}
				ElseIf($HTML)
				{
					WriteHTMLLine 2 0 "Assignment Details: " $Assignment.Name
				}

				ForEach($Machine in $Machines)
				{
					$Details = Get-BrokerDesktop -MachineName $Machine.MachineName @XDParams1
					
					If($? -and $Null -ne $Details)
					{
						OutputMachineDesktopDetails $Details $Machine 
					}
					ElseIf($? -and ($Null -eq $Details))
					{
						$txt = "There are no additional machine details available for $($Machine.DNSName)"
						OutputWarning $txt
					}
					Else
					{
						$txt = "Unable to retrieve additional machine details for $($Machine.DNSName)"
						OutputWarning $txt
					}
				}
			}
			ElseIf($? -and $Null -eq $Machines)
			{
				$txt = "There are no Machines for Desktop Group $($Assignment.name)"
				OutputWarning $txt
			}
			Else
			{
				$txt = "Unable to retrieve Machines for Desktop Group $($Assignment.name)"
				OutputWarning $txt
			}
		}
	}
}

Function ProcessAssignmentCatalogs
{
	Param([object] $Assignment)

	Write-Verbose "$(Get-Date -Format G): `t`tRetrieve Catalogs for Desktop Group $($Assignment.name)"

	#get all the desktops associated with this desktop group and sort by DesktopGroupName
	$tmpDesktops = Get-BrokerDesktop -DesktopGroupName $Assignment.Name @XDParams2 -SortBy DesktopGroupName
	If($? -and $Null -ne $tmpDesktops)
	{
		#now get just the catalog name property
		#get the unique results of the catalogname
		$tmpCatalogs = $tmpDesktops | Select-Object CatalogName | Sort-Object CatalogName -Unique
		
		$cnt = 0
		If($tmpCatalogs -is [array])
		{
			$cnt = $tmpCatalogs.Count
		}
		Else
		{
			$cnt = 1
		}
		
		$txt = "Catalogs ($($cnt)) for Desktop Group $($Assignment.Name)"
		If($MSWord -or $PDF)
		{
			$Selection.InsertNewPage()
			WriteWordLine 2 0 $txt
		}
		ElseIf($Text)
		{
			Line 0 $txt
		}
		ElseIf($HTML)
		{
			WriteHTMLLine 2 0 $txt
		}
		$txt = ""

		#process each catalogname
		If($MSWord -or $PDF)
		{
			[System.Collections.Hashtable[]] $CatalogsWordTable = @();
			## Seed the $Services row index from the second row
			[int] $CurrentServiceIndex = 2;
		}

		ForEach($tmpCatalog in $tmpCatalogs)
		{
			$Catalog = Get-BrokerCatalog -Name $tmpCatalog.CatalogName
			$xCatalogType = ""
			If($Catalog.AllocationType -eq "Permanent" -and $Catalog.CatalogKind -eq "ThinCloned")
			{
				$xCatalogType = "Dedicated"
			}
			ElseIf($Catalog.AllocationType -eq "Permanent" -and $Catalog.CatalogKind -eq "PowerManaged")
			{
				$xCatalogType = "Existing"
			}
			ElseIf($Catalog.AllocationType -eq "Permanent" -and $Catalog.CatalogKind -eq "Unmanaged")
			{
				$xCatalogType = "Physical"
			}
			ElseIf($Catalog.AllocationType -eq "Random" -and $Catalog.CatalogKind -eq "SingleImage")
			{
				$xCatalogType = "Pooled-Random"
			}
			ElseIf($Catalog.AllocationType -eq "Permanent" -and $Catalog.CatalogKind -eq "SingleImage")
			{
				$xCatalogType = "Pooled-Static"
			}
			ElseIf($CanUsePvD -and ($Catalog.AllocationType -eq "Permanent" -and $Catalog.CatalogKind -eq "Pvd"))
			{
				$xCatalogType = "Pooled with personal vDisk"
			}
			ElseIf($Catalog.AllocationType -eq "Random" -and $Catalog.CatalogKind -eq "Pvs")
			{
				$xCatalogType = "Streamed"
			}
			ElseIf($CanUsePvD -and ($Catalog.AllocationType -eq "Random" -and $Catalog.CatalogKind -eq "PvsPvd"))
			{
				$xCatalogType = "Streamed with personal vDisk"
			}
			Else
			{
				$xCatalogType = "Unable to determine Catalog type. AllocationType: $($Catalog.AllocationType) CatalogKind: $($Catalog.CatalogKind)"
			}
			If($MSWord -or $PDF)
			{
				$WordTableRowHash = @{
				CatalogName = $Catalog.Name; 
				CatalogType = $xCatalogType; 
				DesktopsTotal = $Catalog.UsedCount; 
				DesktopsFree = $Catalog.AvailableCount; 
				}
				$CatalogsWordTable += $WordTableRowHash;
				$CurrentServiceIndex++;
			}
			ElseIf($Text)
			{
				Line 1 "Catalog name`t: " $Catalog.Name
				Line 1 "Catalog type`t: " $xCatalogType
				Line 1 "Desktops total`t: " $Catalog.UsedCount
				Line 1 "Desktops free`t: " $Catalog.AvailableCount
				Line 0 ""
			}
			ElseIf($HTML)
			{
				WriteHTMLLine 0 1 "Catalog name: " $Catalog.Name
				WriteHTMLLine 0 1 "Catalog type: " $xCatalogType
				WriteHTMLLine 0 1 "Desktops total: " $Catalog.UsedCount
				WriteHTMLLine 0 1 "Desktops free: " $Catalog.AvailableCount
				WriteHTMLLine 0 0 " "
			}
		}
		
		If($MSWord -or $PDF)
		{
			## Add the table to the document, using the hashtable (-Alt is short for -AlternateBackgroundColor!)
			$Table = AddWordTable -Hashtable $CatalogsWordTable `
			-Columns  CatalogName,CatalogType,DesktopsTotal,DesktopsFree `
			-Headers  "Catalog name","Catalog type","Desktops total","Desktops free" `
			-Format $wdTableGrid `
			-AutoFit $wdAutoFitContent;

			## IB - Set the header row format after the SetWordTableAlternateRowColor function as it will paint the header row!
			SetWordCellFormat -Collection $Table.Rows.Item(1).Cells -Bold -BackgroundColor $wdColorGray15;

			#indent the entire table 1 tab stop
			$Table.Rows.SetLeftIndent($Indent0TabStops,$wdAdjustProportional)

			FindWordDocumentEnd
			$Table = $Null
		}
	}
	ElseIf($? -and ($Null -eq $tmpDesktops))
	{
		$txt = "There are no Desktops for Desktop Group $($Assignment.Name)"
		OutputWarning $txt
	}
	Else
	{
		$txt = "Unable to retrieve Desktops for Desktop Group $($Assignment.Name)"
		OutputWarning $txt
	}
}

Function OutputAssignmentsUtilization
{
	Param([object]$Assignments)

	#code contributed by Eduardo Molina
	#Twitter: @molikop
	#eduardo@molikop.com
	#www.molikop.com

	$txt = "Assignment Utilization Report"
	If($MSWord -or $PDF)
	{
		ForEach($Assignment in $Assignments)
		{
			Write-Verbose "$(Get-Date -Format G): `t`t`tProcessing Assigment Utilization for $($Assignment.Name)" -Verbose
			$Selection.InsertNewPage()
			WriteWordLine 2 0 $txt
			WriteWordLine 4 0 "Desktop Assignment Name: " $Assignment.Name

			$xEnabled = ""
			If($Assignment.Enabled -eq $True -and $Assignment.InMaintenanceMode -eq $True)
			{
				$xEnabled = "Maintenance Mode"
			}
			ElseIf($Assignment.Enabled -eq $False -and $Assignment.InMaintenanceMode -eq $True)
			{
				$xEnabled = "Maintenance Mode"
			}
			ElseIf($Assignment.Enabled -eq $True -and $Assignment.InMaintenanceMode -eq $False)
			{
				$xEnabled = "Enabled"
			}
			ElseIf($Assignment.Enabled -eq $False -and $Assignment.InMaintenanceMode -eq $False)
			{
				$xEnabled = "Disabled"
			}

			$xColorDepth = ""
			If($Assignment.ColorDepth -eq "FourBit")
			{
				$xColorDepth = "4bit - 16 colors"
			}
			ElseIf($Assignment.ColorDepth -eq "EightBit")
			{
				$xColorDepth = "8bit - 256 colors"
			}
			ElseIf($Assignment.ColorDepth -eq "SixteenBit")
			{
				$xColorDepth = "16bit - High color"
			}
			ElseIf($Assignment.ColorDepth -eq "TwentyFourBit")
			{
				$xColorDepth = "24bit - True color"
			}

			[System.Collections.Hashtable[]] $ScriptInformation = @()
			$ScriptInformation += @{ Data = "Description"; Value = $Assignment.Description; }
			$ScriptInformation += @{ Data = "User Icon Name"; Value = $Assignment.PublishedName; }
			$ScriptInformation += @{ Data = "Desktop Type"; Value = $Assignment.DesktopKind; }
			$ScriptInformation += @{ Data = "Status"; Value = $xEnabled; }
			$ScriptInformation += @{ Data = "Automatic reboots when user logs off"; Value = $Assignment.ShutdownDesktopsAfterUse; }
			$ScriptInformation += @{ Data = "Color Depth"; Value = $xColorDepth; }

			$Table = AddWordTable -Hashtable $ScriptInformation `
			-Columns Data,Value `
			-List `
			-Format $wdTableGrid `
			-AutoFit $wdAutoFitFixed;

			## IB - Set the header row format
			SetWordCellFormat -Collection $Table.Columns.Item(1).Cells -Bold -BackgroundColor $wdColorGray15;

			$Table.Columns.Item(1).Width = 200;
			$Table.Columns.Item(2).Width = 200;

			$Table.Rows.SetLeftIndent($Indent0TabStops,$wdAdjustProportional)

			FindWordDocumentEnd
			$Table = $Null
			WriteWordLine 0 0 ""
			
			Write-Verbose "$(Get-Date -Format G): `t`t`tInitializing utilization chart for $($Assignment.Name)" -Verbose

			$TempFile =  "$($pwd)\emtempgraph_$(Get-Date -UFormat %Y%m%d_%H%M%S).csv"		
			Write-Verbose "$(Get-Date -Format G): `t`t`tGetting utilization data for $($Assignment.Name)" -Verbose
			$Results = Get-BrokerDesktopUsage @XDParams2 -DesktopGroupName $Assignment.Name -SortBy Timestamp | Select-Object Timestamp, InUse

			If($? -and $Null -ne $Results)
			{
				$Results | Export-Csv $TempFile -NoTypeInformation *>$Null

				#Create excel COM object 
				$excel = New-Object -ComObject excel.application 4>$Null

				#Make Visible 
				$excel.Visible  = $False
				$excel.DisplayAlerts  = $False

				#Various Enumerations 
				$xlDirection = [Microsoft.Office.Interop.Excel.XLDirection] 
				$excelChart = [Microsoft.Office.Interop.Excel.XLChartType]
				$excelAxes = [Microsoft.Office.Interop.Excel.XlAxisType]
				$excelCategoryScale = [Microsoft.Office.Interop.Excel.XlCategoryType]
				$excelTickMark = [Microsoft.Office.Interop.Excel.XlTickMark]

				Write-Verbose "$(Get-Date -Format G): `t`t`tOpening Excel with temp file $($TempFile)" -Verbose

				#Add CSV File into Excel Workbook 
				$null = $excel.Workbooks.Open($TempFile)
				$worksheet = $excel.ActiveSheet
				$Null = $worksheet.UsedRange.EntireColumn.AutoFit()

				#Assumes that date is always on A column 
				$range = $worksheet.Range("A2")
				$selectionXL = $worksheet.Range($range,$range.end($xlDirection::xlDown))
				$Start = @($selectionXL)[0].Text
				$End = @($selectionXL)[-1].Text

				Write-Verbose "$(Get-Date -Format G): `t`t`tCreating chart for $($Assignment.Name)" -Verbose
				$chart = $worksheet.Shapes.AddChart().Chart 

				$chart.chartType = $excelChart::xlXYScatterLines
				$chart.HasLegend = $false
				$chart.HasTitle = $true
				$chart.ChartTitle.Text = "$($Assignment.Name) utilization"

				#Work with the X axis for the Date Stamp 
				$xaxis = $chart.Axes($excelAxes::XlCategory)                                     
				$xaxis.HasTitle = $False
				$xaxis.CategoryType = $excelCategoryScale::xlCategoryScale
				$xaxis.MajorTickMark = $excelTickMark::xlTickMarkCross
				$xaxis.HasMajorGridLines = $true
				$xaxis.TickLabels.NumberFormat = "m/d/yyyy"
				$xaxis.TickLabels.Orientation = 48 #degrees to rotate text

				#Work with the Y axis for the number of desktops in use                                               
				$yaxis = $chart.Axes($excelAxes::XlValue)
				$yaxis.HasTitle = $true                                                       
				$yaxis.AxisTitle.Text = "Desktops in use"
				$yaxis.AxisTitle.Font.Size = 12

				$worksheet.ChartObjects().Item(1).copy()
				$word.Selection.PasteAndFormat(13)  #Pastes an Excel chart as a picture

				Write-Verbose "$(Get-Date -Format G): `t`t`tClosing excel for $($Assignment.Name)" -Verbose
				$excel.Workbooks.Close($false)
				$excel.Quit()

				FindWordDocumentEnd
				WriteWordLine 0 0 ""
				
				While( [System.Runtime.Interopservices.Marshal]::ReleaseComObject($selectionXL)){}
				While( [System.Runtime.Interopservices.Marshal]::ReleaseComObject($Range)){}
				While( [System.Runtime.Interopservices.Marshal]::ReleaseComObject($Chart)){}
				While( [System.Runtime.Interopservices.Marshal]::ReleaseComObject($Worksheet)){}
				While( [System.Runtime.Interopservices.Marshal]::ReleaseComObject($Excel)){}

				Write-Verbose "$(Get-Date -Format G): `t`t`tDeleting temp files $($TempFile)" -Verbose
				Remove-Item $TempFile *>$Null
			}
			ElseIf($? -and $Null -eq $Results)
			{
				$txt = "There is no Utilization data for $($Assignment.Name)"
				OutputWarning $txt
			}
			Else
			{
				$txt = "Unable to retrieve Utilization data for $($Assignment.name)"
				OutputWarning $txt
			}
		}
	}
	Write-Verbose "$(Get-Date -Format G): "
}
#endregion

#region Applications functions
Function ProcessApplications
{
	Write-Verbose "$(Get-Date -Format G): Retrieving Applications"
	
	$AllApplications = Get-BrokerApplication @XDParams1 -SortBy DisplayName
	If($? -and $Null -ne $AllApplications)
	{
		OutputApplications $AllApplications
	}
	ElseIf($? -and ($Null -eq $AllApplications))
	{
		$txt = "There are no Applications"
		OutputWarning $txt
	}
	Else
	{
		$txt = "Unable to retrieve Applications"
		OutputWarning $txt
	}
	Write-Verbose "$(Get-Date -Format G): "
}

Function OutputApplications
{
	Param([object]$AllApplications)
	
	$txt = "Applications"
	If($MSWord -or $PDF)
	{
		$Selection.InsertNewPage()
		WriteWordLine 1 0 $txt
	}
	ElseIf($Text)
	{
		Line 0 $txt
		Line 0 ""
	}
	ElseIf($HTML)
	{
		WriteHTMLLine 1 0 $txt
	}

	If($MSWord -or $PDF)
	{
		[System.Collections.Hashtable[]] $AllApplicationsWordTable = @();
		## Seed the $Services row index from the second row
		[int] $CurrentServiceIndex = 2;
	}

	ForEach($Application in $AllApplications)
	{
		Write-Verbose "$(Get-Date -Format G): `tAdding row for Application $($Application.DisplayName)"

		$xEnabled = "Yes"
		If($Application.Enabled -eq $False)
		{
			$xEnabled = "No"
		}
		
		If($MSWord -or $PDF)
		{
			$WordTableRowHash = @{
			ApplicationName = $Application.DisplayName; 
			Description = $Application.Description; 
			Enabled = $xEnabled; 
			Program = $Application.CommandLineExecutable; 
			}
			$AllApplicationsWordTable += $WordTableRowHash;
			$CurrentServiceIndex++;
		}
		ElseIf($Text)
		{
			Line 1 "Name`t`t: " $Application.DisplayName
			Line 1 "Description`t: " $Application.Description
			Line 1 "Enabled`t`t: " $xEnabled
			Line 1 "Program`t`t: " $Application.CommandLineExecutable
			Line 0 ""
		}
		ElseIf($HTML)
		{
			WriteHTMLLine 0 1 "Name: " $Application.DisplayName
			WriteHTMLLine 0 1 "Description: " $Application.Description
			WriteHTMLLine 0 1 "Enabled: " $xEnabled
			WriteHTMLLine 0 1 "Program: " $Application.CommandLineExecutable
			WriteHTMLLine 0 0 " "
		}
	}

	If($MSWord -or $PDF)
	{
		## Add the table to the document, using the hashtable (-Alt is short for -AlternateBackgroundColor!)
		$Table = AddWordTable -Hashtable $AllApplicationsWordTable `
		-Columns  ApplicationName,Description,Enabled,Program `
		-Headers  "Name","Description","Enabled","Program" `
		-Format $wdTableGrid `
		-AutoFit $wdAutoFitContent;

		## IB - Set the header row format after the SetWordTableAlternateRowColor function as it will paint the header row!
		SetWordCellFormat -Collection $Table.Rows.Item(1).Cells -Bold -BackgroundColor $wdColorGray15;

		$Table.Rows.SetLeftIndent($Indent0TabStops,$wdAdjustProportional)

		FindWordDocumentEnd
		$Table = $Null
		WriteWordLine 0 0 ""
	}

	If($Applications)
	{
		$First = $True
		ForEach($Application in $AllApplications)
		{
			If($MSWord -or $PDF)
			{
				If(!$First)
				{
					$Selection.InsertNewPage()
				}
				WriteWordLine 2 0 $Application.DisplayName
				$First = $False
			}
			ElseIf($Text)
			{
				Line 0 $Application.DisplayName
			}
			ElseIf($HTML)
			{
				WriteHTMLLine 2 0 $Application.DisplayName
			}
			
			OutputApplicationDetails $Application
			OutputApplicationDesktopGroups $Application
			OutputApplicationMachines $Application
			OutputApplicationSessions $Application
			OutputApplicationUsers $Application
		}
	}
}

Function OutputApplicationDetails
{
	Param([object] $Application)
	
	Write-Verbose "$(Get-Date -Format G): `t`tApplication details for $($Application.BrowserName)"
	$txt = "Details"
	If($MSWord -or $PDF)
	{
		WriteWordLine 3 0 $txt
	}
	ElseIf($Text)
	{
		Line 0 $txt
	}
	ElseIf($HTML)
	{
		WriteHTMLLine 3 0 $txt
	}

	$xEnabled = "No"
	$xDesktopShortcut = "No"
	$xStartmenuShortcut = "No"
	$xAudioEnabled = "No"
	$xEncryptionRequired = "No"
	$xWaitForPrinters = "No"
	$xTags = @()
	$xColorDepth = ""
	$xCPUPriorityLevel = ""
	$xAccessGateway = ""
	$xAGFilters = @()
	$xWithoutAG = ""
	
	If($Application.Enabled)
	{
		$xEnabled = "Yes"
	}
	If($Application.ShortcutAddedToDesktop)
	{
		$xDesktopShortcut = "Yes"
	}
	If($Application.ShortcutAddedToStartMenu)
	{
		$xStartmenuShortcut= "Yes"
	}
	If($Application.AudioRequired)
	{
		$xAudioEnabled = "Yes"
	}
	If($Application.SecureIcaRequired)
	{
		$xEncryptionRequired = "Yes"
	}
	If($Application.WaitForPrinterCreation)
	{
		$xWaitForPrinters = "Yes"
	}
	ForEach($Tag in $Application.Tags)
	{
		$xTags += "$($Tag)"
	}
	
	Switch($Application.ColorDepth)
	{
		"FourBit"		{$xColorDepth = "16 color"}
		"EightBit"		{$xColorDepth = "256 color"}
		"SixteenBit"	{$xColorDepth = "High color"}
		"TwentyFourBit"	{$xColorDepth = "True Color"}
		Default	{$xColorDepth = "Unable to determine Color Depth: $($Application.ColorDepth)"}
	}
	
	If($Application.WindowSizeType -eq "Percent" -and $Application.WindowScale -eq "100")
	{
		$xWindowsSize = "Full screen"
	}
	ElseIf($Application.WindowSizeType -eq "Percent" -and $Application.WindowScale -ne "100")
	{
		$xWindowsSize = "$($Application.WindowScale)% of client display"
	}
	ElseIf($Application.WindowSizeType -eq "Pixels")
	{
		$xWindowsSize = "$($Application.WindowWidth)x$($Application.WindowHeight)"
	}
	
	Switch ($Application.CpuPriorityLevel)
	{
		"Low" 			{$xCPUPriorityLevel = "Low"; Break}
		"BelowNormal" 	{$xCPUPriorityLevel = "Below normal"; Break}
		"Normal" 		{$xCPUPriorityLevel = "Normal"; Break}
		"AboveNormal"	{$xCPUPriorityLevel = "Above normal"; Break}
		"High" 			{$xCPUPriorityLevel = "High"; Break}
		Default {$xCPUPriorityLevel = "Unable to determine CPU Priority level: $($Application.CpuPriorityLevel)"}
	}

	$results = Get-BrokerAccessPolicyRule -IncludedApplication $Application.BrowserName @XDParams1
	If($? -and $Null -ne $results)
	{
		If($results.AllowedConnections -eq "Filtered" -and $Results.IncludedSmartAccessFilterEnabled -eq $False)
		{
			$xAccessGateway = "Allow all"
			$xAGFilters = {<N/A>}
			$xWithoutAG = "Yes"
		}
		ElseIf($results.AllowedConnections -eq "ViaAG" -and $Results.IncludedSmartAccessFilterEnabled -eq $False)
		{
			$xAccessGateway = "Allow all"
			$xAGFilters = {<N/A>}
			$xWithoutAG = "No"
		}
		ElseIf($results.AllowedConnections -eq "NotViaAG" -and $Results.IncludedSmartAccessFilterEnabled -eq $False)
		{
			$xAccessGateway = "None"
			$xAGFilters = {<N/A>}
			$xWithoutAG = "Yes"
		}
		ElseIf($results.AllowedConnections -eq "Filtered" -and $Results.IncludedSmartAccessFilterEnabled -eq $True)
		{
			$xAccessGateway = "Filtered"
			$xWithoutAG = "Yes"
			$xAGFilters = @()
			ForEach($AccessCondition in $results.IncludedSmartAccessTags)
			{
				$xAGFilters += $AccessCondition
			}
		}
		ElseIf($results.AllowedConnections -eq "ViaAG" -and $Results.IncludedSmartAccessFilterEnabled -eq $True)
		{
			$xAccessGateway = "Filtered"
			$xWithoutAG = "No"
			$xAGFilters = @()
			ForEach($AccessCondition in $results.IncludedSmartAccessTags)
			{
				$xAGFilters += $AccessCondition
			}
		}
	}
	
	If($MSWord -or $PDF)
	{
		WriteWordLine 0 1 "Basic Settings"
		[System.Collections.Hashtable[]] $ScriptInformation = @()
		$ScriptInformation += @{ Data = "Browser name"; Value = $Application.BrowserName; }
		$ScriptInformation += @{ Data = "Name"; Value = $Application.DisplayName; }
		$ScriptInformation += @{ Data = "Description"; Value = $Application.Description; }
		$ScriptInformation += @{ Data = "Enabled"; Value = $xEnabled; }
		$ScriptInformation += @{ Data = "Tags"; Value = $xTags[0]; }
		$cnt=-1
		ForEach($tmp in $xTags)
		{
			$cnt++
			If($cnt -gt 0)
			{
				$ScriptInformation += @{ Data = ""; Value = $tmp; }
			}
		}
		
		$Table = AddWordTable -Hashtable $ScriptInformation `
		-Columns Data,Value `
		-List `
		-Format $wdTableGrid `
		-AutoFit $wdAutoFitFixed;

		## IB - Set the header row format
		SetWordCellFormat -Collection $Table.Columns.Item(1).Cells -Bold -BackgroundColor $wdColorGray15;

		$Table.Columns.Item(1).Width = 200;
		$Table.Columns.Item(2).Width = 300;

		$Table.Rows.SetLeftIndent($Indent1TabStops,$wdAdjustProportional)

		FindWordDocumentEnd
		$Table = $Null
		WriteWordLine 0 0 ""
		
		WriteWordLine 0 1 "Program Location"
		[System.Collections.Hashtable[]] $ScriptInformation = @()
		$ScriptInformation += @{ Data = "Program"; Value = $Application.CommandLineExecutable; }
		$ScriptInformation += @{ Data = "Command line arguments"; Value = $Application.CommandLineArguments; }
		$ScriptInformation += @{ Data = "Working directory"; Value = $Application.WorkingDirectory; }
		
		$Table = AddWordTable -Hashtable $ScriptInformation `
		-Columns Data,Value `
		-List `
		-Format $wdTableGrid `
		-AutoFit $wdAutoFitFixed;

		## IB - Set the header row format
		SetWordCellFormat -Collection $Table.Columns.Item(1).Cells -Bold -BackgroundColor $wdColorGray15;

		$Table.Columns.Item(1).Width = 200;
		$Table.Columns.Item(2).Width = 300;

		$Table.Rows.SetLeftIndent($Indent1TabStops,$wdAdjustProportional)

		FindWordDocumentEnd
		$Table = $Null
		WriteWordLine 0 0 ""
		
		WriteWordLine 0 1 "Shortcut Location"
		[System.Collections.Hashtable[]] $ScriptInformation = @()
		$ScriptInformation += @{ Data = "Client folder"; Value = $Application.ClientFolder; }
		$ScriptInformation += @{ Data = "Shortcut added to desktop"; Value = $xDesktopShortcut; }
		$ScriptInformation += @{ Data = "Shortcut added to start menu"; Value = $xStartmenuShortcut; }
		If($Application.ShortcutAddedToStartMenu)
		{
			$ScriptInformation += @{ Data = "Start menu folder"; Value = $Application.StartMenuFolder; }
		}
		
		$Table = AddWordTable -Hashtable $ScriptInformation `
		-Columns Data,Value `
		-List `
		-Format $wdTableGrid `
		-AutoFit $wdAutoFitFixed;

		## IB - Set the header row format
		SetWordCellFormat -Collection $Table.Columns.Item(1).Cells -Bold -BackgroundColor $wdColorGray15;

		$Table.Columns.Item(1).Width = 200;
		$Table.Columns.Item(2).Width = 300;

		$Table.Rows.SetLeftIndent($Indent1TabStops,$wdAdjustProportional)

		FindWordDocumentEnd
		$Table = $Null
		WriteWordLine 0 0 ""
		
		WriteWordLine 0 1 "Appearance"
		[System.Collections.Hashtable[]] $ScriptInformation = @()
		$ScriptInformation += @{ Data = "Window size"; Value = $xWindowsSize; }
		$ScriptInformation += @{ Data = "Color depth"; Value = $xColorDepth; }
		
		$Table = AddWordTable -Hashtable $ScriptInformation `
		-Columns Data,Value `
		-List `
		-Format $wdTableGrid `
		-AutoFit $wdAutoFitFixed;

		## IB - Set the header row format
		SetWordCellFormat -Collection $Table.Columns.Item(1).Cells -Bold -BackgroundColor $wdColorGray15;

		$Table.Columns.Item(1).Width = 200;
		$Table.Columns.Item(2).Width = 300;

		$Table.Rows.SetLeftIndent($Indent1TabStops,$wdAdjustProportional)

		FindWordDocumentEnd
		$Table = $Null
		WriteWordLine 0 0 ""
		
		WriteWordLine 0 1 "Multimedia"
		[System.Collections.Hashtable[]] $ScriptInformation = @()
		$ScriptInformation += @{ Data = "Audio enabled"; Value = $xAudioEnabled; }
		
		$Table = AddWordTable -Hashtable $ScriptInformation `
		-Columns Data,Value `
		-List `
		-Format $wdTableGrid `
		-AutoFit $wdAutoFitFixed;

		## IB - Set the header row format
		SetWordCellFormat -Collection $Table.Columns.Item(1).Cells -Bold -BackgroundColor $wdColorGray15;

		$Table.Columns.Item(1).Width = 200;
		$Table.Columns.Item(2).Width = 300;

		$Table.Rows.SetLeftIndent($Indent1TabStops,$wdAdjustProportional)

		FindWordDocumentEnd
		$Table = $Null
		WriteWordLine 0 0 ""
		
		WriteWordLine 0 1 "Security"
		[System.Collections.Hashtable[]] $ScriptInformation = @()
		$ScriptInformation += @{ Data = "Encryption required"; Value = $xEncryptionRequired; }
		
		$Table = AddWordTable -Hashtable $ScriptInformation `
		-Columns Data,Value `
		-List `
		-Format $wdTableGrid `
		-AutoFit $wdAutoFitFixed;

		## IB - Set the header row format
		SetWordCellFormat -Collection $Table.Columns.Item(1).Cells -Bold -BackgroundColor $wdColorGray15;

		$Table.Columns.Item(1).Width = 200;
		$Table.Columns.Item(2).Width = 300;

		$Table.Rows.SetLeftIndent($Indent1TabStops,$wdAdjustProportional)

		FindWordDocumentEnd
		$Table = $Null
		WriteWordLine 0 0 ""
		
		WriteWordLine 0 1 "Resources"
		[System.Collections.Hashtable[]] $ScriptInformation = @()
		$ScriptInformation += @{ Data = "CPU priority level"; Value = $xCPUPriorityLevel; }
		$ScriptInformation += @{ Data = "Wait for printer creation"; Value = $xWaitForPrinters; }
		
		$Table = AddWordTable -Hashtable $ScriptInformation `
		-Columns Data,Value `
		-List `
		-Format $wdTableGrid `
		-AutoFit $wdAutoFitFixed;

		## IB - Set the header row format
		SetWordCellFormat -Collection $Table.Columns.Item(1).Cells -Bold -BackgroundColor $wdColorGray15;

		$Table.Columns.Item(1).Width = 200;
		$Table.Columns.Item(2).Width = 300;

		$Table.Rows.SetLeftIndent($Indent1TabStops,$wdAdjustProportional)

		FindWordDocumentEnd
		$Table = $Null
		WriteWordLine 0 0 ""
		
		WriteWordLine 0 1 "Advanced access control"
		[System.Collections.Hashtable[]] $ScriptInformation = @()
	
		$ScriptInformation += @{ Data = "Access Gateway"; Value = $xAccessGateway; }
		$ScriptInformation += @{ Data = "Filters"; Value = $xAGFilters[0]; }
		$cnt=-1
		ForEach($tmp in $xAGFilters)
		{
			$cnt++
			If($cnt -gt 0)
			{
				$ScriptInformation += @{ Data = ""; Value = $tmp; }
			}
		}
		$ScriptInformation += @{ Data = "Without Access Gateway"; Value = $xWithoutAG; }
		
		$Table = AddWordTable -Hashtable $ScriptInformation `
		-Columns Data,Value `
		-List `
		-Format $wdTableGrid `
		-AutoFit $wdAutoFitFixed;

		## IB - Set the header row format
		SetWordCellFormat -Collection $Table.Columns.Item(1).Cells -Bold -BackgroundColor $wdColorGray15;

		$Table.Columns.Item(1).Width = 200;
		$Table.Columns.Item(2).Width = 300;

		$Table.Rows.SetLeftIndent($Indent1TabStops,$wdAdjustProportional)

		FindWordDocumentEnd
		$Table = $Null
		WriteWordLine 0 0 ""
	}
	ElseIf($Text)
	{
		Line 1 "Basic Settings"
		Line 2 "Browser name`t`t`t: " $Application.BrowserName
		Line 2 "Name`t`t`t`t: " $Application.DisplayName
		Line 2 "Description`t`t`t: " $Application.Description
		Line 2 "Enabled`t`t`t`t: " $xEnabled
		Line 2 "Tags`t`t`t`t: " $xTags[0]
		$cnt=-1
		ForEach($tmp in $xTags)
		{
			$cnt++
			If($cnt -gt 0)
			{
				Line 6 "  " $tmp
			}
		}
		Line 0 ""
		
		Line 1 "Program Location"
		Line 2 "Program`t`t`t`t: " $Application.CommandLineExecutable
		Line 2 "Command line arguments`t`t: " $Application.CommandLineArguments
		Line 2 "Working directory`t`t: " $Application.WorkingDirectory
		Line 0 ""
		
		Line 1 "Shortcut Location"
		Line 2 "Client folder`t`t`t: " $Application.ClientFolder
		Line 2 "Shortcut added to desktop`t: " $xDesktopShortcut
		Line 2 "Shortcut added to start menu`t: " $xStartmenuShortcut
		If($Application.ShortcutAddedToStartMenu)
		{
			Line 2 "Start menu folder`t`t: " $Application.StartMenuFolder
		}
		Line 0 ""
		
		Line 1 "Appearance"
		Line 2 "Window size`t`t`t: " $xWindowsSize
		Line 2 "Color depth`t`t`t: " $xColorDepth
		Line 0 ""
		
		Line 1 "Multimedia"
		Line 2 "Audio enabled`t`t`t: " $xAudioEnabled
		Line 0 ""
		
		Line 1 "Security"
		Line 2 "Encryption required`t`t: " $xEncryptionRequired
		Line 0 ""
		
		Line 1 "Resources"
		Line 2 "CPU priority level`t`t: " $xCPUPriorityLevel
		Line 2 "Wait for printer creation`t: " $xWaitForPrinters
		Line 0 ""
		
		Line 1 "Advanced access control"
		Line 2 "Access Gateway`t`t`t: " $xAccessGateway
		Line 2 "Filters`t`t`t`t: " $xAGFilters[0]
		$cnt=-1
		ForEach($tmp in $xAGFilters)
		{
			$cnt++
			If($cnt -gt 0)
			{
				Line 6 "  " $tmp
			}
		}
		Line 2 "Without Access Gateway`t`t: " $xWithoutAG
		Line 0 ""
	}
	ElseIf($HTML)
	{
		WriteHTMLLine 0 1 "Basic Settings"
		WriteHTMLLine 0 2 "Browser name: " $Application.BrowserName
		WriteHTMLLine 0 2 "Name: " $Application.DisplayName
		WriteHTMLLine 0 2 "Description: " $Application.Description
		WriteHTMLLine 0 2 "Enabled: " $xEnabled
		WriteHTMLLine 0 2 "Tags: " $xTags[0]
		$cnt=-1
		ForEach($tmp in $xTags)
		{
			$cnt++
			If($cnt -gt 0)
			{
				WriteHTMLLine 0 3 "  " $tmp
			}
		}
		WriteHTMLLine 0 0 " "
		
		WriteHTMLLine 0 1 "Program Location"
		WriteHTMLLine 0 2 "Program: " $Application.CommandLineExecutable
		WriteHTMLLine 0 2 "Command line arguments: " $Application.CommandLineArguments
		WriteHTMLLine 0 2 "Working directory: " $Application.WorkingDirectory
		WriteHTMLLine 0 0 " "
		
		WriteHTMLLine 0 1 "Shortcut Location"
		WriteHTMLLine 0 2 "Client folder: " $Application.ClientFolder
		WriteHTMLLine 0 2 "Shortcut added to desktop: " $xDesktopShortcut
		WriteHTMLLine 0 2 "Shortcut added to start menu: " $xStartmenuShortcut
		If($Application.ShortcutAddedToStartMenu)
		{
			WriteHTMLLine 0 2 "Start menu folder: " $Application.StartMenuFolder
		}
		WriteHTMLLine 0 0 " "
		
		WriteHTMLLine 0 1 "Appearance"
		WriteHTMLLine 0 2 "Window size: " $xWindowsSize
		WriteHTMLLine 0 2 "Color depth: " $xColorDepth
		WriteHTMLLine 0 0 " "
		
		WriteHTMLLine 0 1 "Multimedia"
		WriteHTMLLine 0 2 "Audio enabled: " $xAudioEnabled
		WriteHTMLLine 0 0 " "
		
		WriteHTMLLine 0 1 "Security"
		WriteHTMLLine 0 2 "Encryption required: " $xEncryptionRequired
		WriteHTMLLine 0 0 " "
		
		WriteHTMLLine 0 1 "Resources"
		WriteHTMLLine 0 2 "CPU priority level: " $xCPUPriorityLevel
		WriteHTMLLine 0 2 "Wait for printer creation: " $xWaitForPrinters
		WriteHTMLLine 0 0 " "
		
		WriteHTMLLine 0 1 "Advanced access control"
		WriteHTMLLine 0 2 "Access Gateway: " $xAccessGateway
		WriteHTMLLine 0 2 "Filters: " $xAGFilters[0]
		$cnt=-1
		ForEach($tmp in $xAGFilters)
		{
			$cnt++
			If($cnt -gt 0)
			{
				WriteHTMLLine 0 3 "  " $tmp
			}
		}
		WriteHTMLLine 0 2 "Without Access Gateway: " $xWithoutAG
		WriteHTMLLine 0 0 " "
	}
}

Function OutputApplicationDesktopGroups
{
	Param([object] $Application)
	
	Write-Verbose "$(Get-Date -Format G): `t`tApplication desktop groups for $($Application.BrowserName)"
	$txt = "Desktop Groups"
	If($MSWord -or $PDF)
	{
		WriteWordLine 3 0 $txt
	}
	ElseIf($Text)
	{
		Line 0 $txt
	}
	ElseIf($HTML)
	{
		WriteHTMLLine 3 0 $txt
	}

	$DesktopGroups = Get-BrokerDesktopGroup -ApplicationUid $Application.Uid @XDParams1
	If($? -and $Null -ne $DesktopGroups)
	{
		If($MSWord -or $PDF)
		{
			[System.Collections.Hashtable[]] $GroupsWordTable = @();
			## Seed the $Services row index from the second row
			[int] $CurrentServiceIndex = 2;
		}
		ForEach($Group in $DesktopGroups)
		{
			If($MSWord -or $PDF)
			{
				$WordTableRowHash = @{
				GroupName = $Group.Name; 
				GroupDesc = $Group.Description; 
				}
				$GroupsWordTable += $WordTableRowHash;
				$CurrentServiceIndex++;
			}
			ElseIf($Text)
			{
				Line 1 "Name`t`t: " $Group.Name
				Line 1 "Description`t: " $Group.Description
				Line 0 ""
			}
			ElseIf($HTML)
			{
				WriteHTMLLine 0 1 "Name: " $Group.Name
				WriteHTMLLine 0 1 "Description: " $Group.Description
				WriteHTMLLine 0 0 " "
			}
		}

		If($MSWord -or $PDF)
		{
			## Add the table to the document, using the hashtable (-Alt is short for -AlternateBackgroundColor!)
			$Table = AddWordTable -Hashtable $GroupsWordTable `
			-Columns  GroupName,GroupDesc `
			-Headers  "Name","Description" `
			-Format $wdTableGrid `
			-AutoFit $wdAutoFitFixed;

			## IB - Set the header row format after the SetWordTableAlternateRowColor function as it will paint the header row!
			SetWordCellFormat -Collection $Table.Rows.Item(1).Cells -Bold -BackgroundColor $wdColorGray15;

			$Table.Columns.Item(1).Width = 200;
			$Table.Columns.Item(2).Width = 200;
			
			$Table.Rows.SetLeftIndent($Indent1TabStops,$wdAdjustProportional)

			FindWordDocumentEnd
			$Table = $Null
		}
	}
	ElseIf($? -and ($Null -eq $DesktopGroups))
	{
		$txt = "There are no Desktop Groups for Application $($Application.BrowserName)"
		OutputWarning $txt
	}
	Else
	{
		$txt = "Unable to retrieve Desktop Groups for Application $($Application.BrowserName)"
		OutputWarning $txt
	}
}

Function OutputApplicationMachines
{
	Param([object] $Application)
	
	Write-Verbose "$(Get-Date -Format G): `t`tApplication machines for $($Application.BrowserName)"
	$txt = "Machines"
	If($MSWord -or $PDF)
	{
		WriteWordLine 3 0 $txt
	}
	ElseIf($Text)
	{
		Line 0 $txt
	}
	ElseIf($HTML)
	{
		WriteHTMLLine 3 0 $txt
	}

	#machines are based on the uid of desktop groups
	#get all desktop groups first
	$DesktopGroups = Get-BrokerDesktopGroup -ApplicationUid $Application.Uid @XDParams1
	
	If($? -and $Null -ne $DesktopGroups)
	{
		#sort by uid, unique so there is only one of each
		$DesktopGroups = $DesktopGroups | Select-Object Uid | Sort-Object Uid -unique
		
		$uids = @()
		ForEach($Group in $DesktopGroups)
		{
			$uids += $Group.Uid
		}

		If($MSWord -or $PDF)
		{
			[System.Collections.Hashtable[]] $MachinesWordTable = @();
			## Seed the $Services row index from the second row
			[int] $CurrentServiceIndex = 2;
		}

		#now get the privateappdesktop for each desktopgroup uid
		ForEach($uid in $uids)
		{
			
			$xKind = (Get-BrokerDesktopGroup -Uid $uid @XDParams1).DesktopKind
			
			If($xKind -eq "SharedApp")
			{
				$machine = Get-BrokerSharedAppDesktop -DesktopGroupUid $uid @XDParams1
			}
			ElseIf($xKind -eq "PrivateApp")
			{
				$machine = Get-BrokerPrivateAppDesktop -DesktopGroupUid $uid @XDParams1
			}
			
			If($? -and $Null -ne $machine)
			{
				$xInMaintenanceMode = ""
				If($Machine.InMaintenanceMode)
				{
					$xInMaintenanceMode = "Enabled"
				}
				Else
				{
					$xInMaintenanceMode ="Disabled"
				}
				
				If($Machine.PowerState -eq "On" -and $Machine.RegistrationState -eq "Registered")
				{
					$xState = "Available"
				}
				ElseIf($Machine.PowerState -eq "On" -and $Machine.RegistrationState -eq "Unregistered")
				{
					$xState = "Unregistered"
				}
				ElseIf($Machine.PowerState -eq "Off" -and $Machine.RegistrationState -eq "Unregistered")
				{
					$xState = "Off"
				}

				If($MSWord -or $PDF)
				{
					$WordTableRowHash = @{
					DNSName = $Machine.DNSName; 
					State = $xState; 
					MaintenanceMode = $xInMaintenanceMode;
					OperatingSystem = $Machine.OSType;
					}
					$MachinesWordTable += $WordTableRowHash;
					$CurrentServiceIndex++;
				}
				ElseIf($Text)
				{
					Line 2 "DNS Name`t`t: " $Machine.DNSName
					Line 2 "State`t`t`t: " $xState
					Line 2 "Maintenance Mode`t: " $xInMaintenanceMode
					Line 2 "Operating System`t: " $Machine.OSType
					Line 0 ""
				}
				ElseIf($HTML)
				{
					WriteHTMLLine 0 2 "DNS Name: " $Machine.DNSName
					WriteHTMLLine 0 2 "State: " $xState
					WriteHTMLLine 0 2 "Maintenance Mode: " $xInMaintenanceMode
					WriteHTMLLine 0 2 "Operating System: " $Machine.OSType
					WriteHTMLLine 0 0 " "
				}
			}
		}
		
		If($MSWord -or $PDF)
		{
			## Add the table to the document, using the hashtable (-Alt is short for -AlternateBackgroundColor!)
			$Table = AddWordTable -Hashtable $MachinesWordTable `
			-Columns  DNSName,State,MaintenanceMode,OperatingSystem `
			-Headers  "DNS Name","State","Maintenance Mode","Operating System" `
			-Format $wdTableGrid `
			-AutoFit $wdAutoFitFixed;

			## IB - Set the header row format after the SetWordTableAlternateRowColor function as it will paint the header row!
			SetWordCellFormat -Collection $Table.Rows.Item(1).Cells -Bold -BackgroundColor $wdColorGray15;

			$Table.Columns.Item(1).Width = 200;
			$Table.Columns.Item(2).Width = 65;
			$Table.Columns.Item(3).Width = 80;
			$Table.Columns.Item(4).Width = 150;

			$Table.Rows.SetLeftIndent($Indent1TabStops,$wdAdjustProportional)

			FindWordDocumentEnd
			$Table = $Null
		}
	}
	ElseIf($? -and ($Null -eq $Machines))
	{
		$txt = "There are no Machines for Application $($Application.BrowserName)"
		OutputWarning $txt
	}
	Else
	{
		$txt = "Unable to retrieve Machines for Application $($Application.BrowserName)"
		OutputWarning $txt
	}
}

Function OutputApplicationSessions
{
	Param([object] $Application)
	
	Write-Verbose "$(Get-Date -Format G): `t`tApplication sessions for $($Application.BrowserName)"
	$txt = "Sessions"
	If($MSWord -or $PDF)
	{
		WriteWordLine 3 0 $txt
	}
	ElseIf($Text)
	{
		Line 0 $txt
	}
	ElseIf($HTML)
	{
		WriteHTMLLine 3 0 $txt
	}

	$Sessions = Get-BrokerSession -ApplicationUid $Application.Uid @XDParams1
	
	If($? -and $Null -ne $Sessions)
	{
		#sort by uid
		$Sessions = $Sessions | Sort-Object Uid
		
		If($MSWord -or $PDF)
		{
			[System.Collections.Hashtable[]] $SessionsWordTable = @();
			## Seed the $Services row index from the second row
			[int] $CurrentServiceIndex = 2;
		}

		#now get the privateappdesktop for each desktopgroup uid
		ForEach($Session in $Sessions)
		{
			#get desktop by Session Uid
			$xMachineName = ""
			$Desktop = Get-BrokerDesktop -SessionUid $Session.Uid @XDParams1
			
			If($? -and $Null -ne $Desktop)
			{
				$xMachineName = $Desktop.MachineName
			}
			Else
			{
				$xMachineName = "Not Found"
			}
			
			If($MSWord -or $PDF)
			{
				$WordTableRowHash = @{
				ID = $Session.uid;
				UserName = $Session.UserName;
				ClientName= $Session.ClientName;
				MachineName = $xMachineName;
				State = $Session.SessionState;
				Protocol = $Session.Protocol;
				}
				$SessionsWordTable += $WordTableRowHash;
				$CurrentServiceIndex++;
			}
			ElseIf($Text)
			{
				Line 2 "ID`t`t: " $Session.Uid
				Line 2 "User Name`t: " $Session.UserName
				Line 2 "Client Name`t: " $Session.ClientName
				Line 2 "Machine Name`t: " $xMachineName
				Line 2 "State`t`t: " $Session.SessionState
				Line 2 "Protocol`t: " $Session.Protocol
				Line 0 ""
			}
			ElseIf($HTML)
			{
				WriteHTMLLine 0 2 "ID: " $Session.Uid
				WriteHTMLLine 0 2 "User Name: " $Session.UserName
				WriteHTMLLine 0 2 "Client Name: " $Session.ClientName
				WriteHTMLLine 0 2 "Machine Name: " $xMachineName
				WriteHTMLLine 0 2 "State: " $Session.SessionState
				WriteHTMLLine 0 2 "Protocol: " $Session.Protocol
				WriteHTMLLine 0 0 " "
			}
		}
		
		If($MSWord -or $PDF)
		{
			## Add the table to the document, using the hashtable (-Alt is short for -AlternateBackgroundColor!)
			$Table = AddWordTable -Hashtable $SessionsWordTable `
			-Columns  ID,UserName,ClientName,MachineName,State,Protocol `
			-Headers  "ID","User Name","Client Name","Machine Name","State","Protocol" `
			-Format $wdTableGrid `
			-AutoFit $wdAutoFitFixed;

			## IB - Set the header row format after the SetWordTableAlternateRowColor function as it will paint the header row!
			SetWordCellFormat -Collection $Table.Rows.Item(1).Cells -Bold -BackgroundColor $wdColorGray15;

			$Table.Columns.Item(1).Width = 30;
			$Table.Columns.Item(2).Width = 135;
			$Table.Columns.Item(3).Width = 85;
			$Table.Columns.Item(4).Width = 135;
			$Table.Columns.Item(5).Width = 50;
			$Table.Columns.Item(6).Width = 55;

			$Table.Rows.SetLeftIndent($Indent1TabStops,$wdAdjustProportional)

			FindWordDocumentEnd
			$Table = $Null
		}
	}
	ElseIf($? -and $Null -eq $Sessions)
	{
		$txt = "There are no Sessions for Application $($Application.BrowserName)"
		OutputWarning $txt
	}
	Else
	{
		$txt = "Unable to retrieve Sessions for Application $($Application.BrowserName)"
		OutputWarning $txt
	}
}

Function OutputApplicationUsers
{
	Param([object] $Application)
	
	Write-Verbose "$(Get-Date -Format G): `t`tApplication users for $($Application.BrowserName)"
	$txt = "Users"
	If($MSWord -or $PDF)
	{
		WriteWordLine 3 0 $txt
	}
	ElseIf($Text)
	{
		Line 0 $txt
	}
	ElseIf($HTML)
	{
		WriteHTMLLine 3 0 $txt
	}
	
	$AllUsers = Get-BrokerAccessPolicyRule -IncludedApplicationFilterEnabled $True -IncludedApplication $Application.Uid @XDParams1
	
	If($? -and $Null -ne $AllUsers)
	{
	
		$Users = @()
		ForEach($tmp in $AllUsers.IncludedUsers)
		{
			$Users += $tmp.Name
		}
		If($MSWord -or $PDF)
		{
			[System.Collections.Hashtable[]] $UsersWordTable = @();
			## Seed the $Services row index from the second row
			[int] $CurrentServiceIndex = 2;
		}

		ForEach($User in $Users)
		{
			
			If($MSWord -or $PDF)
			{
				$WordTableRowHash = @{
				Name = $User;
				}
				$UsersWordTable += $WordTableRowHash;
				$CurrentServiceIndex++;
			}
			ElseIf($Text)
			{
				Line 2 "Name: " $User
				Line 0 ""
			}
			ElseIf($HTML)
			{
				WriteHTMLLine 0 2 "Name: " $User
				WriteHTMLLine 0 0 " "
			}
		}
		
		If($MSWord -or $PDF)
		{
			## Add the table to the document, using the hashtable (-Alt is short for -AlternateBackgroundColor!)
			$Table = AddWordTable -Hashtable $UsersWordTable `
			-Columns  Name `
			-Headers  "Name" `
			-Format $wdTableGrid `
			-AutoFit $wdAutoFitFixed;

			## IB - Set the header row format after the SetWordTableAlternateRowColor function as it will paint the header row!
			SetWordCellFormat -Collection $Table.Rows.Item(1).Cells -Bold -BackgroundColor $wdColorGray15;

			$Table.Columns.Item(1).Width = 200;
			$Table.Rows.SetLeftIndent($Indent1TabStops,$wdAdjustProportional)

			FindWordDocumentEnd
			$Table = $Null
		}
	}
	ElseIf($? -and $Null -eq $AllUsers)
	{
		$txt = "There are no Users for Application $($Application.BrowserName)"
		OutputWarning $txt
	}
	Else
	{
		$txt = "Unable to retrieve Users for Application $($Application.BrowserName)"
		OutputWarning $txt
	}
}
#endregion

#region policy functions
Function ProcessPolicies
{
	$txt = "HDX Policy"
	If($MSWord -or $PDF)
	{
		$selection.InsertNewPage()
		WriteWordLine 1 0 $txt
	}
	ElseIf($Text)
	{
		Line 0 $txt
	}
	ElseIf($HTML)
	{
		WriteHTMLLine 1 0 $txt
	}
	Write-Verbose "$(Get-Date -Format G): Processing XenDesktop Policies"
	
	ProcessPolicySummary 
	
	If($Policies)
	{
	
		Write-Verbose "$(Get-Date -Format G): Does localfarmgpo PSDrive already exist?"
		If(Get-PSDrive localfarmgpo -EA 0)
		{
			Write-Verbose "$(Get-Date -Format G): `tRemoving the current localfarmgpo PSDrive"
			Remove-PSDrive localfarmgpo -EA 0 4>$Null
		}
		
		Write-Verbose "$(Get-Date -Format G): Creating localfarmgpo PSDrive"
		New-PSDrive localfarmgpo -psprovider citrixgrouppolicy -root \ -controller $AdminAddress -Scope Global *>$Null
		If(Get-PSDrive localfarmgpo -EA 0)
		{
			ProcessCitrixPolicies "localfarmgpo"
			Write-Verbose "$(Get-Date -Format G): Finished Processing Citrix Site Policies"
			Write-Verbose "$(Get-Date -Format G): "
		}
		Else
		{
			Write-Warning "Unable to create the LocalFarmGPO PSDrive on the XenDesktop Controller $($AdminAddress)"
		}
		
		If($NoADPolicies)
		{
			#don't process AD policies
		}
		Else
		{
			#thanks to the Citrix Engineering Team for helping me solve processing Citrix AD based Policies
			Write-Verbose "$(Get-Date -Format G): "
			Write-Verbose "$(Get-Date -Format G): See if there are any Citrix AD based policies to process"
			$CtxGPOArray = @()
			$CtxGPOArray = GetCtxGPOsInAD
			If($CtxGPOArray -is [Array] -and $CtxGPOArray.Count -gt 0)
			{
				Write-Verbose "$(Get-Date -Format G): There are $($CtxGPOArray.Count) Citrix AD based policies to process"

				[array]$CtxGPOArray = $CtxGPOArray | Sort-Object -unique
				
				ForEach($CtxGPO in $CtxGPOArray)
				{
					Write-Verbose "$(Get-Date -Format G): Creating ADGpoDrv PSDrive"
					New-PSDrive -Name ADGpoDrv -PSProvider CitrixGroupPolicy -Root \ -DomainGpo $($CtxGPO) -Scope Global *>$Null
					If(Get-PSDrive ADGpoDrv -EA 0)
					{
						Write-Verbose "$(Get-Date -Format G): Processing Citrix AD Policy $($CtxGPO)"
					
						Write-Verbose "$(Get-Date -Format G): `tRetrieving AD Policy $($CtxGPO)"
						ProcessCitrixPolicies "ADGpoDrv"
						Write-Verbose "$(Get-Date -Format G): Finished Processing Citrix AD Policy $($CtxGPO)"
						Write-Verbose "$(Get-Date -Format G): "
					}
					Else
					{
						Write-Warning "$($CtxGPO) is not readable by this XenDesktop Controller"
						Write-Warning "$($CtxGPO) was probably created by an updated Citrix Group Policy Provider"
					}
				}
				Write-Verbose "$(Get-Date -Format G): Finished Processing Citrix AD Policies"
				Write-Verbose "$(Get-Date -Format G): "
			}
			Else
			{
				Write-Verbose "$(Get-Date -Format G): There are no Citrix AD based policies to process"
				Write-Verbose "$(Get-Date -Format G): "
			}
		}
	}
	Write-Verbose "$(Get-Date -Format G): Finished Processing Citrix Policies"
	Write-Verbose "$(Get-Date -Format G): "
}

Function ProcessPolicySummary
{
	Write-Verbose "$(Get-Date -Format G): Does localfarmgpo PSDrive already exist?"
	If(Get-PSDrive localfarmgpo -EA 0)
	{
		Write-Verbose "$(Get-Date -Format G): `tRemoving the current localfarmgpo PSDrive"
		Remove-PSDrive localfarmgpo -EA 0 4>$Null
	}
	Write-Verbose "$(Get-Date -Format G): `tRetrieving Site Policies"
	Write-Verbose "$(Get-Date -Format G): `t`tCreating localfarmgpo PSDrive"
	New-PSDrive localfarmgpo -psprovider citrixgrouppolicy -root \ -controller $AdminAddress -Scope Global *>$Null

	If(Get-PSDrive localfarmgpo -EA 0)
	{
		$HDXPolicies = Get-CtxGroupPolicy -DriveName localfarmgpo -Type "Computer" -EA 0 | Sort-Object Priority
		
		OutputSummaryPolicyTable $HDXPolicies "Machine" "localfarmgpo"

		$HDXPolicies = Get-CtxGroupPolicy -DriveName localfarmgpo -Type "User" -EA 0 | Sort-Object Priority
		
		OutputSummaryPolicyTable $HDXPolicies "User" "localfarmgpo"
	}
	Else
	{
		Write-Warning "Unable to create the LocalFarmGPO PSDrive on the XenDesktop Controller $($AdminAddress)"
	}

	If($NoADPolicies)
	{
		#don't process AD policies
	}
	Else
	{
		Write-Verbose "$(Get-Date -Format G): "
		Write-Verbose "$(Get-Date -Format G): See if there are any Citrix AD based policies to process"
		$CtxGPOArray = @()
		$CtxGPOArray = GetCtxGPOsInAD
		If($CtxGPOArray -is [Array] -and $CtxGPOArray.Count -gt 0)
		{
			[array]$CtxGPOArray = $CtxGPOArray | Sort-Object -unique
				
			Write-Verbose "$(Get-Date -Format G): There are $($CtxGPOArray.Count) Citrix AD based policies to process"
			
			ForEach($CtxGPO in $CtxGPOArray)
			{
				Write-Verbose "$(Get-Date -Format G): Creating ADGpoDrv PSDrive"
				New-PSDrive -Name ADGpoDrv -PSProvider CitrixGroupPolicy -Root \ -DomainGpo $($CtxGPO) -Scope "Global" *>$Null
				If(Get-PSDrive ADGpoDrv -EA 0)
				{
					Write-Verbose "$(Get-Date -Format G): Processing Citrix AD Policy $($CtxGPO)"
				
					Write-Verbose "$(Get-Date -Format G): `tRetrieving AD Policy $($CtxGPO) Machine Settings"
					$HDXPolicies = Get-CtxGroupPolicy -DriveName ADGpoDrv -Type "Computer" -EA 0 | Sort-Object Priority
			
					OutputSummaryPolicyTable $HDXPolicies "Machine" "AD" $CtxGPO
					
					Write-Verbose "$(Get-Date -Format G): `tRetrieving AD Policy $($CtxGPO) User Settings"
					$HDXPolicies = Get-CtxGroupPolicy -DriveName ADGpoDrv -Type "User" -EA 0 | Sort-Object Priority
					
					OutputSummaryPolicyTable $HDXPolicies "User" "AD" $CtxGPO
					
					Write-Verbose "$(Get-Date -Format G): Finished Processing Citrix AD Policy $($CtxGPO)"
					Write-Verbose "$(Get-Date -Format G): "
				}
				Else
				{
					Write-Warning "$($CtxGPO) is not readable by this XenDesktop Controller"
					Write-Warning "$($CtxGPO) was probably created by an updated Citrix Group Policy Provider"
				}
				Remove-PSDrive ADGpoDrv -EA 0 4>$Null
			}
			Write-Verbose "$(Get-Date -Format G): Finished Processing Citrix AD Policies"
			Write-Verbose "$(Get-Date -Format G): "
		}
		Else
		{
			Write-Verbose "$(Get-Date -Format G): There are no Citrix AD based policies to process"
			Write-Verbose "$(Get-Date -Format G): "
		}
	}
}

Function OutputSummaryPolicyTable
{
	Param([object] $HDXPolicies, [string] $xType, [string] $xLocation, [string] $ADGPOName = "")
	
	If($xLocation -eq "localfarmgpo")
	{
		$txt = "Site $($xType) Policies"
		If($MSWord -or $PDF)
		{
			WriteWordLine 3 0 $txt
		}
		ElseIf($Text)
		{
			Line 0 $txt
		}
		ElseIf($HTML)
		{
			WriteHTMLLine 3 0 $txt
		}
	}

	If($Null -ne $HDXPolicies)
	{
		Write-Verbose "$(Get-Date -Format G): `t`t`t$($xType) Policies"
		If($MSWord -or $PDF)
		{
			[System.Collections.Hashtable[]] $PoliciesWordTable = @();
			## Seed the $Services row index from the second row
			[int] $CurrentServiceIndex = 2;
		}

		#now get the privateappdesktop for each desktopgroup uid
		$First = $True
		ForEach($Policy in $HDXPolicies)
		{
			
			If($xLocation -eq "AD")
			{
				If($First)
				{
					$txt = "Active Directory $($xType) Policies ($($ADGpoName))"
					If($MSWord -or $PDF)
					{
						WriteWordLine 3 0 $txt
					}
					ElseIf($Text)
					{
						Line 0 $txt
					}
					ElseIf($HTML)
					{
						WriteHTMLLine 3 0 $txt
					}
				}
				$First = $False
			}
	
			If($MSWord -or $PDF)
			{
				$WordTableRowHash = @{
				Name = $Policy.PolicyName;
				Priority = $Policy.Priority;
				Enabled= $Policy.Enabled;
				Description = $Policy.Description;
				}
				$PoliciesWordTable += $WordTableRowHash;
				$CurrentServiceIndex++;
			}
			ElseIf($Text)
			{
				Line 2 "Name`t`t: " $Policy.PolicyName
				Line 2 "Priority`t: " $Policy.Priority
				Line 2 "Enabled`t`t: " $Policy.Enabled
				Line 2 "Description`t: " $Policy.Description
				Line 0 ""
			}
			ElseIf($HTML)
			{
				WriteHTMLLine 0 2 "Name: " $Policy.PolicyName
				WriteHTMLLine 0 2 "Priority: " $Policy.Priority
				WriteHTMLLine 0 2 "Enabled: " $Policy.Enabled
				WriteHTMLLine 0 2 "Description: " $Policy.Description
				WriteHTMLLine 0 0 " "
			}
		}
		
		If($MSWord -or $PDF)
		{
			## Add the table to the document, using the hashtable (-Alt is short for -AlternateBackgroundColor!)
			$Table = AddWordTable -Hashtable $PoliciesWordTable `
			-Columns  Name,Priority,Enabled,Description `
			-Headers  "Name","Priority","Enabled","Description" `
			-Format $wdTableGrid `
			-AutoFit $wdAutoFitFixed;

			## IB - Set the header row format after the SetWordTableAlternateRowColor function as it will paint the header row!
			SetWordCellFormat -Collection $Table.Rows.Item(1).Cells -Bold -BackgroundColor $wdColorGray15;

			$Table.Columns.Item(1).Width = 200
			$Table.Columns.Item(2).Width = 50;
			$Table.Columns.Item(3).Width = 60;
			$Table.Columns.Item(4).Width = 200

			#indent the entire table 1 tab stop
			$Table.Rows.SetLeftIndent($Indent0TabStops,$wdAdjustProportional)

			FindWordDocumentEnd
			$Table = $Null
		}
	}
	ElseIf($Null -eq $HDXPolicies)
	{
		$txt = "There are no $($xType) HDX Policies"
		OutputWarning $txt
	}
	Else
	{
		$txt = "Unable to retrieve $($xType) HDX Policies"
		OutputWarning $txt
	}
}

Function validStateProp( [object] $object, [string] $topLevel, [string] $secondLevel )
{
	#function created 8-jan-2014 by Michael B. Smith
	If( $object )
	{
		If((Get-Member -Name $topLevel -InputObject $object))
		{
			If((Get-Member -Name $secondLevel -InputObject $object.$topLevel))
			{
				Return $True
			}
		}
	}
	Return $False
}

Function ProcessCitrixPolicies
{
	Param([string]$xDriveName)

	$Policies = Get-CtxGroupPolicy -DriveName $xDriveName -EA 0 | Sort-Object Type,Priority

	If($? -and $Null -ne $Policies)
	{
		ForEach($Policy in $Policies)
		{
			Write-Verbose "$(Get-Date -Format G): `tStarted $($Policy.PolicyName)`t$($Policy.Type)"
			If($MSWord -or $PDF)
			{
				$selection.InsertNewPage()
				WriteWordLine 2 0 "$($Policy.PolicyName)"
				[System.Collections.Hashtable[]] $ScriptInformation = @()
			
				$ScriptInformation += @{ Data = "Type"; Value = $Policy.Type; }
				$ScriptInformation += @{ Data = "Description"; Value = $Policy.Description; }
				$ScriptInformation += @{ Data = "Enabled"; Value = $Policy.Enabled; }
				$ScriptInformation += @{ Data = "Priority"; Value = $Policy.Priority; }
				
				$Table = AddWordTable -Hashtable $ScriptInformation `
				-Columns Data,Value `
				-List `
				-Format $wdTableGrid `
				-AutoFit $wdAutoFitFixed;

				## IB - Set the header row format
				SetWordCellFormat -Collection $Table.Columns.Item(1).Cells -Bold -BackgroundColor $wdColorGray15;

				$Table.Columns.Item(1).Width = 90;
				$Table.Columns.Item(2).Width = 200;

				$Table.Rows.SetLeftIndent($Indent0TabStops,$wdAdjustProportional)

				FindWordDocumentEnd
				$Table = $Null
			}
			ElseIf($Text)
			{
				Line 0 "$($Policy.PolicyName)"
				Line 1 "Type`t`t: " $Policy.Type
				If(![String]::IsNullOrEmpty($Policy.Description))
				{
					Line 1 "Description`t: " $Policy.Description
				}
				Line 1 "Enabled`t`t: " $Policy.Enabled
				Line 1 "Priority`t: " $Policy.Priority
			}
			ElseIf($HTML)
			{
				WriteHTMLLine 2 0 "$($Policy.PolicyName)"
				WriteHTMLLine 0 1 "Type: " $Policy.Type
				If(![String]::IsNullOrEmpty($Policy.Description))
				{
					WriteHTMLLine 0 1 "Description: " $Policy.Description
				}
				WriteHTMLLine 0 1 "Enabled` " $Policy.Enabled
				WriteHTMLLine 0 1 "Priority: " $Policy.Priority
			}
				

			$filters = Get-CtxGroupPolicyFilter -PolicyName $Policy.PolicyName -DriveName $xDriveName -EA 0

			If($? -and $Null -ne $Filters)
			{
				If(![String]::IsNullOrEmpty($filters))
				{
					$txt = "Filter(s)"
					If($MSWord -or $PDF)
					{
						WriteWordLine 3 0 $txt
					}
					ElseIf($Text)
					{
						Line 0 $txt
					}
					ElseIf($HTML)
					{
						WriteHTMLLine 3 0 $txt
					}
					
					ForEach($Filter in $Filters)
					{
						$tmp = ""
						Switch($filter.FilterType)
						{
							"AccessControl"  {$tmp = "Access Control"; Break}
							"BranchRepeater" {$tmp = "Branch Repeater"; Break}
							"ClientIP"       {$tmp = "Client IP Address"; Break}
							"ClientName"     {$tmp = "Client Name"; Break}
							"DesktopGroup"   {$tmp = "Desktop Group"; Break}
							"DesktopKind"    {$tmp = "Desktop Type"; Break}
							"DesktopTag"     {$tmp = "Tag"; Break}
							"OU"             {$tmp = "Organizational Unit"; Break}
							"User"           {$tmp = "User or Group"; Break}
							"WorkerGroup"    {$tmp = "Worker Group"; Break}
							Default {$tmp = "Policy Filter Type could not be determined: $($filter.FilterType)"; Break}
						}
						
						If($MSWord -or $PDF)
						{
							[System.Collections.Hashtable[]] $ScriptInformation = @()
						
							$ScriptInformation += @{ Data = "Filter name"; Value = $filter.FilterName; }
							$ScriptInformation += @{ Data = "Filter type"; Value = $tmp; }
							$ScriptInformation += @{ Data = "Filter enabled"; Value = $filter.Enabled; }
							$ScriptInformation += @{ Data = "Filter mode"; Value = $filter.Mode; }
							$ScriptInformation += @{ Data = "Filter value"; Value = $filter.FilterValue; }
							
							$Table = AddWordTable -Hashtable $ScriptInformation `
							-Columns Data,Value `
							-List `
							-Format $wdTableGrid `
							-AutoFit $wdAutoFitFixed;

							## IB - Set the header row format
							SetWordCellFormat -Collection $Table.Columns.Item(1).Cells -Bold -BackgroundColor $wdColorGray15;

							$Table.Columns.Item(1).Width = 90;
							$Table.Columns.Item(2).Width = 350;

							$Table.Rows.SetLeftIndent($Indent0TabStops,$wdAdjustProportional)

							FindWordDocumentEnd
							$Table = $Null
							WriteWordLine 0 0 ""
						}
						ElseIf($Text)
						{
							Line 2 "Filter name`t: " $filter.FilterName
							Line 2 "Filter type`t: " $tmp
							Line 2 "Filter enabled`t: " $filter.Enabled
							Line 2 "Filter mode`t: " $filter.Mode
							If(![String]::IsNullOrEmpty($filter.FilterValue))
							{
								Line 2 "Filter value`t: " $filter.FilterValue
							}
							Line 2 ""
						}
						ElseIf($HTML)
						{
							WriteHTMLLine 0 2 "Filter name: " $filter.FilterName
							WriteHTMLLine 0 2 "Filter type: " $tmp
							WriteHTMLLine 0 2 "Filter enabled: " $filter.Enabled
							WriteHTMLLine 0 2 "Filter mode: " $filter.Mode
							If(![String]::IsNullOrEmpty($filter.FilterValue))
							{
								WriteHTMLLine 0 2 "Filter value: " $filter.FilterValue
							}
							WriteHTMLLine 0 2 ""
						}
					}
					$tmp = $Null
				}
				Else
				{
					If($MSWord -or $PDF)
					{
						WriteWordLine 0 1 "Filter(s): None"
					}
					ElseIf($Text)
					{
						Line 1 "Filter(s)`t`t: None"
					}
					ElseIf($HTML)
					{
						WriteHTMLLine 0 1 "Filter(s): None"
					}
				}
			}
			ElseIf($? -and $Null -eq $Filters)
			{
				$txt = "$($Policy.PolicyName) policy applies to all objects in the Site"
				If($MSWord -or $PDF)
				{
					WriteWordLine 3 0 "Assigned to"
					WriteWordLine 0 1 $txt
				}
				ElseIf($Text)
				{
					Line 0 "Assigned to"
					Line 1 $txt
				}
				ElseIf($HTML)
				{
					WriteHTMLLine 3 0 "Assigned to"
					WriteHTMLLine 0 1 $txt
				}
			}
			ElseIf($? -and $Policy.PolicyName -eq "Unfiltered")
			{
				$txt = "Unfiltered policy applies to all objects in the Site"
				If($MSWord -or $PDF)
				{
					WriteWordLine 3 0 "Assigned to"
					WriteWordLine 0 1 $txt
				}
				ElseIf($Text)
				{
					Line 0 "Assigned to"
					Line 1 $txt
				}
				ElseIf($HTML)
				{
					WriteHTMLLine 3 0 "Assigned to"
					WriteHTMLLine 0 1 $txt
				}
			}
			Else
			{
				$txt = "Unable to retrieve Filter settings"
				If($MSWord -or $PDF)
				{
					WriteWordLine 0 1 $txt
				}
				ElseIf($Text)
				{
					Line 1 $txt
				}
				ElseIf($HTML)
				{
					WriteHTMLLine 0 1 $txt
				}
			}

			$Settings = Get-CtxGroupPolicyConfiguration -PolicyName $Policy.PolicyName -Type $Policy.Type -DriveName $xDriveName -EA 0
				
			If($? -and $Null -ne $Settings)
			{
				If($MSWord -or $PDF)
				{
					[System.Collections.Hashtable[]] $SettingsWordTable = @();
					## Seed the $Services row index from the second row
					[int] $CurrentServiceIndex = 2;
				}
				
				ForEach($Setting in $Settings)
				{
					If($Setting.Type -eq "Computer")
					{
						$txt = "Computer settings"
						If($MSWord -or $PDF)
						{
							WriteWordLine 3 0 $txt
						}
						ElseIf($Text)
						{
							Line 1 $txt
						}
						ElseIf($HTML)
						{
							WriteHTMLLine 3 0 $txt
						}
						
						Write-Verbose "$(Get-Date -Format G): `t`tComputer settings"
						Write-Verbose "$(Get-Date -Format G): `t`t`tICA"
						If( ( validStateProp $Setting IcaListenerTimeout State ) -and ($Setting.IcaListenerTimeout.State -ne "NotConfigured"))
						{
							If($MSWord -or $PDF)
							{
								$WordTableRowHash = @{
								Text = "ICA\ICA listener connection timeout";
								Value = $Setting.IcaListenerTimeout.Value;
								}
								$SettingsWordTable += $WordTableRowHash;
								$CurrentServiceIndex++;
							}
							Else
							{
								OutputPolicySetting "ICA\ICA listener connection timeout: " $Setting.IcaListenerTimeout.Value
							}
						}
						If( ( validStateProp $Setting IcaListenerPortNumber State ) -and ($Setting.IcaListenerPortNumber.State -ne "NotConfigured"))
						{
							If($MSWord -or $PDF)
							{
								$WordTableRowHash = @{
								Text = "ICA\ICA listener port number";
								Value = $Setting.IcaListenerPortNumber.Value;
								}
								$SettingsWordTable += $WordTableRowHash;
								$CurrentServiceIndex++;
							}
							Else
							{
								OutputPolicySetting "ICA\ICA listener port number: " $Setting.IcaListenerPortNumber.Value
							}
						}

						Write-Verbose "$(Get-Date -Format G): `t`t`tICA\Auto Client Reconnect"
						If( ( validStateProp $Setting AutoClientReconnect State ) -and ($Setting.AutoClientReconnect.State -ne "NotConfigured"))
						{
							If($MSWord -or $PDF)
							{
								$WordTableRowHash = @{
								Text = "ICA\Auto Client Reconnect\Auto client reconnect";
								Value = $Setting.AutoClientReconnect.State;
								}
								$SettingsWordTable += $WordTableRowHash;
								$CurrentServiceIndex++;
							}
							Else
							{
								OutputPolicySetting "ICA\Auto Client Reconnect\Auto client reconnect: " $Setting.AutoClientReconnect.State
							}
						}
						If( ( validStateProp $Setting AutoClientReconnectAuthenticationRequired  State ) -and ($Setting.AutoClientReconnectAuthenticationRequired.State -ne "NotConfigured"))
						{
							$tmp = ""
							Switch ($Setting.AutoClientReconnectAuthenticationRequired.Value)
							{
								"DoNotRequireAuthentication" {$tmp = "Do not require authentication"; Break}
								"RequireAuthentication"      {$tmp = "Require authentication"; Break}
								Default {$tmp = "Auto client reconnect authentication could not be determined: $($Setting.AutoClientReconnectAuthenticationRequired.Value)"; Break}
							}
							If($MSWord -or $PDF)
							{
								$WordTableRowHash = @{
								Text = "ICA\Auto Client Reconnect\Auto client reconnect authentication";
								Value = $tmp;
								}
								$SettingsWordTable += $WordTableRowHash;
								$CurrentServiceIndex++;
							}
							Else
							{
								OutputPolicySetting "ICA\Auto Client Reconnect\Auto client reconnect authentication: " $tmp
							}
							$tmp = $Null
						}
						If( ( validStateProp $Setting AutoClientReconnectLogging State ) -and ($Setting.AutoClientReconnectLogging.State -ne "NotConfigured"))
						{
							$tmp = ""
							Switch ($Setting.AutoClientReconnectLogging.Value)
							{
								"DoNotLogAutoReconnectEvents" {$tmp = "Do Not Log auto-reconnect events"; Break}
								"LogAutoReconnectEvents"      {$tmp = "Log auto-reconnect events"; Break}
								Default {$tmp = "Auto client reconnect logging could not be determined: $($Setting.AutoClientReconnectLogging.Value)"; Break}
							}
							If($MSWord -or $PDF)
							{
								$WordTableRowHash = @{
								Text = "ICA\Auto Client Reconnect\Auto client reconnect logging";
								Value = $tmp;
								}
								$SettingsWordTable += $WordTableRowHash;
								$CurrentServiceIndex++;
							}
							Else
							{
								OutputPolicySetting "ICA\Auto Client Reconnect\Auto client reconnect logging: " $tmp
							}
							$tmp = $Null
						}
						
						Write-Verbose "$(Get-Date -Format G): `t`t`tICA\End User Monitoring"
						If( ( validStateProp $Setting IcaRoundTripCalculation State ) -and ($Setting.IcaRoundTripCalculation.State -ne "NotConfigured"))
						{
							If($MSWord -or $PDF)
							{
								$WordTableRowHash = @{
								Text = "ICA\End User Monitoring\ICA round trip calculation";
								Value = $Setting.IcaRoundTripCalculation.State;
								}
								$SettingsWordTable += $WordTableRowHash;
								$CurrentServiceIndex++;
							}
							Else
							{
								OutputPolicySetting "ICA\End User Monitoring\ICA round trip calculation: " $Setting.IcaRoundTripCalculation.State
							}
						}
						If( ( validStateProp $Setting IcaRoundTripCalculationInterval State ) -and ($Setting.IcaRoundTripCalculationInterval.State -ne "NotConfigured"))
						{
							If($MSWord -or $PDF)
							{
								$WordTableRowHash = @{
								Text = "ICA\End User Monitoring\ICA round trip calculation interval";
								Value = $Setting.IcaRoundTripCalculationInterval.Value;
								}
								$SettingsWordTable += $WordTableRowHash;
								$CurrentServiceIndex++;
							}
							Else
							{
								OutputPolicySetting "ICA\End User Monitoring\ICA round trip calculation interval: " $Setting.IcaRoundTripCalculationInterval.Value
							}	
						}
						If( ( validStateProp $Setting IcaRoundTripCalculationWhenIdle State ) -and ($Setting.IcaRoundTripCalculationWhenIdle.State -ne "NotConfigured"))
						{
							If($MSWord -or $PDF)
							{
								$WordTableRowHash = @{
								Text = "ICA\End User Monitoring\ICA round trip calculations for idle connections";
								Value = $Setting.IcaRoundTripCalculationWhenIdle.State;
								}
								$SettingsWordTable += $WordTableRowHash;
								$CurrentServiceIndex++;
							}
							Else
							{
								OutputPolicySetting "ICA\End User Monitoring\ICA round trip calculations for idle connections: " $Setting.IcaRoundTripCalculationWhenIdle.State
							}	
						}

						Write-Verbose "$(Get-Date -Format G): `t`t`tICA\Graphics"
						If( ( validStateProp $Setting DisplayMemoryLimit State ) -and ($Setting.DisplayMemoryLimit.State -ne "NotConfigured"))
						{
							If($MSWord -or $PDF)
							{
								$WordTableRowHash = @{
								Text = "ICA\Graphics\Display memory limit (KB)";
								Value = $Setting.DisplayMemoryLimit.Value;
								}
								$SettingsWordTable += $WordTableRowHash;
								$CurrentServiceIndex++;
							}
							Else
							{
								OutputPolicySetting "ICA\Graphics\Display memory limit (KB): " $Setting.DisplayMemoryLimit.Value
							}	
						}
						If( ( validStateProp $Setting DisplayDegradePreference State ) -and ($Setting.DisplayDegradePreference.State -ne "NotConfigured"))
						{
							$tmp = ""
							Switch ($Setting.DisplayDegradePreference.Value)
							{
								"ColorDepth" {$tmp = "Degrade color depth first"; Break}
								"Resolution" {$tmp = "Degrade resolution first"; Break}
								Default {$tmp = "Display mode degrade preference could not be determined: $($Setting.DisplayDegradePreference.Value)"; Break}
							}
							If($MSWord -or $PDF)
							{
								$WordTableRowHash = @{
								Text = "ICA\Graphics\Display mode degrade preference";
								Value = $tmp;
								}
								$SettingsWordTable += $WordTableRowHash;
								$CurrentServiceIndex++;
							}
							Else
							{
								OutputPolicySetting "ICA\Graphics\Display mode degrade preference: " $tmp
							}	
							$tmp = $Null
						}
						If( ( validStateProp $Setting DynamicPreview State ) -and ($Setting.DynamicPreview.State -ne "NotConfigured"))
						{
							If($MSWord -or $PDF)
							{
								$WordTableRowHash = @{
								Text = "ICA\Graphics\Dynamic Windows Preview";
								Value = $Setting.DynamicPreview.State;
								}
								$SettingsWordTable += $WordTableRowHash;
								$CurrentServiceIndex++;
							}
							Else
							{
								OutputPolicySetting "ICA\Graphics\Dynamic Windows Preview: " $Setting.DynamicPreview.State
							}	
						}
						If( ( validStateProp $Setting ImageCaching State ) -and ($Setting.ImageCaching.State -ne "NotConfigured"))
						{
							If($MSWord -or $PDF)
							{
								$WordTableRowHash = @{
								Text = "ICA\Graphics\Image caching";
								Value = $Setting.ImageCaching.State;
								}
								$SettingsWordTable += $WordTableRowHash;
								$CurrentServiceIndex++;
							}
							Else
							{
								OutputPolicySetting "ICA\Graphics\Image caching: " $Setting.ImageCaching.State
							}	
						}
						If( ( validStateProp $Setting DisplayDegradeUserNotification State ) -and ($Setting.DisplayDegradeUserNotification.State -ne "NotConfigured"))
						{
							If($MSWord -or $PDF)
							{
								$WordTableRowHash = @{
								Text = "ICA\Graphics\Notify user when display mode is degraded";
								Value = $Setting.DisplayDegradeUserNotification.State;
								}
								$SettingsWordTable += $WordTableRowHash;
								$CurrentServiceIndex++;
							}
							Else
							{
								OutputPolicySetting "ICA\Graphics\Notify user when display mode is degraded: " $Setting.DisplayDegradeUserNotification.State
							}	
						}
						If( ( validStateProp $Setting QueueingAndTossing State ) -and ($Setting.QueueingAndTossing.State -ne "NotConfigured"))
						{
							If($MSWord -or $PDF)
							{
								$WordTableRowHash = @{
								Text = "ICA\Graphics\Queueing and tossing";
								Value = $Setting.QueueingAndTossing.State;
								}
								$SettingsWordTable += $WordTableRowHash;
								$CurrentServiceIndex++;
							}
							Else
							{
								OutputPolicySetting "ICA\Graphics\Queueing and tossing: " $Setting.QueueingAndTossing.State
							}	
						}

						Write-Verbose "$(Get-Date -Format G): `t`t`tICA\Graphics\Caching"
						If( ( validStateProp $Setting PersistentCache State ) -and ($Setting.PersistentCache.State -ne "NotConfigured"))
						{
							If($MSWord -or $PDF)
							{
								$WordTableRowHash = @{
								Text = "ICA\Graphics\Caching\Persistent Cache Threshold (Kbps)";
								Value = $Setting.PersistentCache.Value;
								}
								$SettingsWordTable += $WordTableRowHash;
								$CurrentServiceIndex++;
							}
							Else
							{
								OutputPolicySetting "ICA\Graphics\Caching\Persistent Cache Threshold (Kbps): " $Setting.PersistentCache.Value
							}
						}

						Write-Verbose "$(Get-Date -Format G): `t`t`tICA\Keep Alive"
						If( ( validStateProp $Setting IcaKeepAliveTimeout State ) -and ($Setting.IcaKeepAliveTimeout.State -ne "NotConfigured"))
						{
							If($MSWord -or $PDF)
							{
								$WordTableRowHash = @{
								Text = "ICA\Keep Alive\ICA keep alive timeout (seconds)";
								Value = $Setting.IcaKeepAliveTimeout.Value;
								}
								$SettingsWordTable += $WordTableRowHash;
								$CurrentServiceIndex++;
							}
							Else
							{
								OutputPolicySetting "ICA\Keep Alive\ICA keep alive timeout (seconds): " $Setting.IcaKeepAliveTimeout.Value
							}
						}
						If( ( validStateProp $Setting IcaKeepAlives State ) -and ($Setting.IcaKeepAlives.State -ne "NotConfigured"))
						{
							$tmp = ""
							Switch ($Setting.IcaKeepAlives.Value)
							{
								"DoNotSendKeepAlives" {$tmp = "Do not send ICA keep alive messages"; Break}
								"SendKeepAlives"      {$tmp = "Send ICA keep alive messages"; Break}
								Default {$tmp = "ICA keep alives could not be determined: $($Setting.IcaKeepAlives.Value)"; Break}
							}
							If($MSWord -or $PDF)
							{
								$WordTableRowHash = @{
								Text = "ICA\Keep Alive\ICA keep alives";
								Value = $tmp;
								}
								$SettingsWordTable += $WordTableRowHash;
								$CurrentServiceIndex++;
							}
							Else
							{
								OutputPolicySetting "ICA\Keep Alive\ICA keep alives: " $tmp
							}
							$tmp = $Null
						}

						Write-Verbose "$(Get-Date -Format G): `t`t`tICA\Multimedia"
						If( ( validStateProp $Setting MultimediaAcceleration State ) -and ($Setting.MultimediaAcceleration.State -ne "NotConfigured"))
						{
							If($MSWord -or $PDF)
							{
								$WordTableRowHash = @{
								Text = "ICA\Multimedia\Windows Media Redirection";
								Value = $Setting.MultimediaAcceleration.State;
								}
								$SettingsWordTable += $WordTableRowHash;
								$CurrentServiceIndex++;
							}
							Else
							{
								OutputPolicySetting "ICA\Multimedia\Windows Media Redirection: " $Setting.MultimediaAcceleration.State
							}
						}
						If( ( validStateProp $Setting MultimediaAccelerationDefaultBufferSize State ) -and ($Setting.MultimediaAccelerationDefaultBufferSize.State -ne "NotConfigured"))
						{
							If($MSWord -or $PDF)
							{
								$WordTableRowHash = @{
								Text = "ICA\Multimedia\Windows Media Redirection Buffer Size (seconds)";
								Value = $Setting.MultimediaAccelerationDefaultBufferSize.Value;
								}
								$SettingsWordTable += $WordTableRowHash;
								$CurrentServiceIndex++;
							}
							Else
							{
								OutputPolicySetting "ICA\Multimedia\Windows Media Redirection Buffer Size (seconds): " $Setting.MultimediaAccelerationDefaultBufferSize.Value
							}
						}
						If( ( validStateProp $Setting MultimediaAccelerationUseDefaultBufferSize State ) -and ($Setting.MultimediaAccelerationUseDefaultBufferSize.State -ne "NotConfigured"))
						{
							If($MSWord -or $PDF)
							{
								$WordTableRowHash = @{
								Text = "ICA\Multimedia\Windows Media Redirection Buffer Size Use";
								Value = $Setting.MultimediaAccelerationUseDefaultBufferSize.State;
								}
								$SettingsWordTable += $WordTableRowHash;
								$CurrentServiceIndex++;
							}
							Else
							{
								OutputPolicySetting "ICA\Multimedia\Windows Media Redirection Buffer Size Use: " $Setting.MultimediaAccelerationUseDefaultBufferSize.State
							}
						}

						Write-Verbose "$(Get-Date -Format G): `t`t`tICA\Multi-Stream Connections"
						If( ( validStateProp $Setting RtpAudioPortRange State ) -and ($Setting.RtpAudioPortRange.State -ne "NotConfigured"))
						{
							If($MSWord -or $PDF)
							{
								$WordTableRowHash = @{
								Text = "ICA\MultiStream Connections\Audio UDP Port Range";
								Value = $Setting.RtpAudioPortRange.Value;
								}
								$SettingsWordTable += $WordTableRowHash;
								$CurrentServiceIndex++;
							}
							Else
							{
								OutputPolicySetting "ICA\MultiStream Connections\Audio UDP Port Range: " $Setting.RtpAudioPortRange.Value
							}
						}
						If( ( validStateProp $Setting MultiPortPolicy State ) -and ($Setting.MultiPortPolicy.State -ne "NotConfigured"))
						{
							If($MSWord -or $PDF)
							{
								$WordTableRowHash = @{
								Text = "ICA\MultiStream Connections\Multi-Port Policy\CGP default port";
								Value = "Default Port";
								}
								$SettingsWordTable += $WordTableRowHash;
								$CurrentServiceIndex++;

								$WordTableRowHash = @{
								Text = "ICA\MultiStream Connections\Multi-Port Policy\CGP default port priority";
								Value = "High";
								}
								$SettingsWordTable += $WordTableRowHash;
								$CurrentServiceIndex++;
							}
							Else
							{
								OutputPolicySetting "ICA\MultiStream Connections\Multi-Port Policy\CGP default port: " "Default Port"
								OutputPolicySetting "ICA\MultiStream Connections\Multi-Port Policy\CGP default port priority: " "High"
							}
							[string]$Tmp = $Setting.MultiPortPolicy.Value
							If($Tmp.Length -gt 0)
							{
								$Port1Priority = ""
								$Port2Priority = ""
								$Port3Priority = ""
								[string]$cgpport1 = $Tmp.substring(0, $Tmp.indexof(";"))
								[string]$cgpport2 = $Tmp.substring($cgpport1.length + 1 , $Tmp.indexof(";"))
								[string]$cgpport3 = $Tmp.substring((($cgpport1.length + 1)+($cgpport2.length + 1)) , $Tmp.indexof(";"))
								[string]$cgpport1priority = $cgpport1.substring($cgpport1.length -1, 1)
								[string]$cgpport2priority = $cgpport2.substring($cgpport2.length -1, 1)
								[string]$cgpport3priority = $cgpport3.substring($cgpport3.length -1, 1)
								$cgpport1 = $cgpport1.substring(0, $cgpport1.indexof(","))
								$cgpport2 = $cgpport2.substring(0, $cgpport2.indexof(","))
								$cgpport3 = $cgpport3.substring(0, $cgpport3.indexof(","))
								Switch ($cgpport1priority)
								{
									"0"	{$Port1Priority = "Very High"; Break}
									"2"	{$Port1Priority = "Medium"; Break}
									"3"	{$Port1Priority = "Low"; Break}
									Default	{$Port1Priority = "Unknown"; Break}
								}
								Switch ($cgpport2priority)
								{
									"0"	{$Port2Priority = "Very High"; Break}
									"2"	{$Port2Priority = "Medium"; Break}
									"3"	{$Port2Priority = "Low"; Break}
									Default	{$Port2Priority = "Unknown"; Break}
								}
								Switch ($cgpport3priority)
								{
									"0"	{$Port3Priority = "Very High"; Break}
									"2"	{$Port3Priority = "Medium"; Break}
									"3"	{$Port3Priority = "Low"; Break}
									Default	{$Port3Priority = "Unknown"; Break}
								}
								If($MSWord -or $PDF)
								{
									$WordTableRowHash = @{
									Text = "ICA\MultiStream Connections\Multi-Port Policy\CGP port1";
									Value = $cgpport1;
									}
									$SettingsWordTable += $WordTableRowHash;
									$CurrentServiceIndex++;

									$WordTableRowHash = @{
									Text = "ICA\MultiStream Connections\Multi-Port Policy\CGP port1 priority";
									Value = $port1priority;
									}
									$SettingsWordTable += $WordTableRowHash;
									$CurrentServiceIndex++;

									$WordTableRowHash = @{
									Text = "ICA\MultiStream Connections\Multi-Port Policy\CGP port2";
									Value = $cgpport2;
									}
									$SettingsWordTable += $WordTableRowHash;
									$CurrentServiceIndex++;

									$WordTableRowHash = @{
									Text = "ICA\MultiStream Connections\Multi-Port Policy\CGP port2 priority";
									Value = $port2priority;
									}
									$SettingsWordTable += $WordTableRowHash;
									$CurrentServiceIndex++;

									$WordTableRowHash = @{
									Text = "ICA\MultiStream Connections\Multi-Port Policy\CGP port3";
									Value = $cgpport3;
									}
									$SettingsWordTable += $WordTableRowHash;
									$CurrentServiceIndex++;

									$WordTableRowHash = @{
									Text = "ICA\MultiStream Connections\Multi-Port Policy\CGP port3 priority";
									Value = $port3priority;
									}
									$SettingsWordTable += $WordTableRowHash;
									$CurrentServiceIndex++;
								}
								Else
								{
									OutputPolicySetting "ICA\MultiStream Connections\Multi-Port Policy\CGP port1: " $cgpport1
									OutputPolicySetting "ICA\MultiStream Connections\Multi-Port Policy\CGP port1 priority: " $port1priority
									OutputPolicySetting "ICA\MultiStream Connections\Multi-Port Policy\CGP port2: " $cgpport2
									OutputPolicySetting "ICA\MultiStream Connections\Multi-Port Policy\CGP port2 priority: " $port2priority
									OutputPolicySetting "ICA\MultiStream Connections\Multi-Port Policy\CGP port3: " $cgpport3
									OutputPolicySetting "ICA\MultiStream Connections\Multi-Port Policy\CGP port4 priority: " $port3priority
								}	
							}
							$Tmp = $Null
							$cgpport1 = $Null
							$cgpport2 = $Null
							$cgpport3 = $Null
							$cgpport1priority = $Null
							$cgpport2priority = $Null
							$cgpport3priority = $Null
							$Port1Priority = $Null
							$Port2Priority = $Null
							$Port3Priority = $Null
						}
						If( ( validStateProp $Setting MultiStreamPolicy State ) -and ($Setting.MultiStreamPolicy.State -ne "NotConfigured"))
						{
							If($MSWord -or $PDF)
							{
								$WordTableRowHash = @{
								Text = "ICA\MultiStream Connections\Multi-Stream";
								Value = $Setting.MultiStreamPolicy.State;
								}
								$SettingsWordTable += $WordTableRowHash;
								$CurrentServiceIndex++;
							}
							Else
							{
								OutputPolicySetting "ICA\MultiStream Connections\Multi-Stream: " $Setting.MultiStreamPolicy.State
							}
						}

						Write-Verbose "$(Get-Date -Format G): `t`t`tICA\Session Reliability"
						If( ( validStateProp $Setting SessionReliabilityConnections State ) -and ($Setting.SessionReliabilityConnections.State -ne "NotConfigured"))
						{
							If($MSWord -or $PDF)
							{
								$WordTableRowHash = @{
								Text = "ICA\Session Reliability\Session reliability connections";
								Value = $Setting.SessionReliabilityConnections.State;
								}
								$SettingsWordTable += $WordTableRowHash;
								$CurrentServiceIndex++;
							}
							Else
							{
								OutputPolicySetting "ICA\Session Reliability\Session reliability connections: " $Setting.SessionReliabilityConnections.State
							}
						}
						If( ( validStateProp $Setting SessionReliabilityPort State ) -and ($Setting.SessionReliabilityPort.State -ne "NotConfigured"))
						{
							If($MSWord -or $PDF)
							{
								$WordTableRowHash = @{
								Text = "ICA\Session Reliability\Session reliability port number";
								Value = $Setting.SessionReliabilityPort.Value;
								}
								$SettingsWordTable += $WordTableRowHash;
								$CurrentServiceIndex++;
							}
							Else
							{
								OutputPolicySetting "ICA\Session Reliability\Session reliability port number: " $Setting.SessionReliabilityPort.Value
							}
						}
						If( ( validStateProp $Setting SessionReliabilityTimeout State ) -and ($Setting.SessionReliabilityTimeout.State -ne "NotConfigured"))
						{
							If($MSWord -or $PDF)
							{
								$WordTableRowHash = @{
								Text = "ICA\Session Reliability\Session reliability timeout (seconds)";
								Value = $Setting.SessionReliabilityTimeout.Value;
								}
								$SettingsWordTable += $WordTableRowHash;
								$CurrentServiceIndex++;
							}
							Else
							{
								OutputPolicySetting "ICA\Session Reliability\Session reliability timeout (seconds): " $Setting.SessionReliabilityTimeout.Value
							}
						}

						Write-Verbose "$(Get-Date -Format G): `t`t`tVirtual Desktop Agent Settings"
						If( ( validStateProp $Setting ControllerRegistrationPort State ) -and ($Setting.ControllerRegistrationPort.State -ne "NotConfigured"))
						{
							If($MSWord -or $PDF)
							{
								$WordTableRowHash = @{
								Text = "Virtual Desktop Agent Settings\Controller Registration Port";
								Value = $Setting.ControllerRegistrationPort.Value;
								}
								$SettingsWordTable += $WordTableRowHash;
								$CurrentServiceIndex++;
							}
							Else
							{
								OutputPolicySetting "Virtual Desktop Agent Settings\Controller Registration Port: " $Setting.ControllerRegistrationPort.Value
							}
						}
						If( ( validStateProp $Setting ControllerSIDs State ) -and ($Setting.ControllerSIDs.State -ne "NotConfigured"))
						{
							If($MSWord -or $PDF)
							{
								$WordTableRowHash = @{
								Text = "Virtual Desktop Agent Settings\Controller SIDs";
								Value = $Setting.ControllerSIDs.Value;
								}
								$SettingsWordTable += $WordTableRowHash;
								$CurrentServiceIndex++;
							}
							Else
							{
								OutputPolicySetting "Virtual Desktop Agent Settings\Controller SIDs: " $Setting.ControllerSIDs.Value
							}
						}
						If( ( validStateProp $Setting Controllers State ) -and ($Setting.Controllers.State -ne "NotConfigured"))
						{
							If($MSWord -or $PDF)
							{
								$WordTableRowHash = @{
								Text = "Virtual Desktop Agent Settings\Controllers";
								Value = $Setting.Controllers.Value;
								}
								$SettingsWordTable += $WordTableRowHash;
								$CurrentServiceIndex++;
							}
							Else
							{
								OutputPolicySetting "Virtual Desktop Agent Settings\Controllers: " $Setting.Controllers.Value
							}
						}
						If( ( validStateProp $Setting SiteGUID State ) -and ($Setting.SiteGUID.State -ne "NotConfigured"))
						{
							If($MSWord -or $PDF)
							{
								$WordTableRowHash = @{
								Text = "Virtual Desktop Agent Settings\Site GUID";
								Value = $Setting.SiteGUID.Value;
								}
								$SettingsWordTable += $WordTableRowHash;
								$CurrentServiceIndex++;
							}
							Else
							{
								OutputPolicySetting "Virtual Desktop Agent Settings\Site GUID: " $Setting.SiteGUID.Value
							}
						}

						Write-Verbose "$(Get-Date -Format G): `t`t`tVirtual Desktop Agent Settings\CPU Usage Monitoring"
						If( ( validStateProp $Setting CPUUsageMonitoring_Enable State ) -and ($Setting.CPUUsageMonitoring_Enable.State -ne "NotConfigured"))
						{
							If($MSWord -or $PDF)
							{
								$WordTableRowHash = @{
								Text = "Virtual Desktop Agent Settings\CPU Usage Monitoring\Enable Monitoring";
								Value = $Setting.CPUUsageMonitoring_Enable.State;
								}
								$SettingsWordTable += $WordTableRowHash;
								$CurrentServiceIndex++;
							}
							Else
							{
								OutputPolicySetting "Virtual Desktop Agent Settings\CPU Usage Monitoring\Enable Monitoring: " $Setting.CPUUsageMonitoring_Enable.State
							}
						}
						If( ( validStateProp $Setting CPUUsageMonitoring_Period State ) -and ($Setting.CPUUsageMonitoring_Period.State -ne "NotConfigured"))
						{
							If($MSWord -or $PDF)
							{
								$WordTableRowHash = @{
								Text = "Virtual Desktop Agent Settings\CPU Usage Monitoring\Monitoring Period (seconds)";
								Value = $Setting.CPUUsageMonitoring_Period.Value;
								}
								$SettingsWordTable += $WordTableRowHash;
								$CurrentServiceIndex++;
							}
							Else
							{
								OutputPolicySetting "Virtual Desktop Agent Settings\CPU Usage Monitoring\Monitoring Period (seconds): " $Setting.CPUUsageMonitoring_Period.Value
							}
						}
						If( ( validStateProp $Setting CPUUsageMonitoring_Threshold State ) -and ($Setting.CPUUsageMonitoring_Threshold.State -ne "NotConfigured"))
						{
							If($MSWord -or $PDF)
							{
								$WordTableRowHash = @{
								Text = "Virtual Desktop Agent Settings\CPU Usage Monitoring\Threshold (percent)";
								Value = $Setting.CPUUsageMonitoring_Threshold.Value;
								}
								$SettingsWordTable += $WordTableRowHash;
								$CurrentServiceIndex++;
							}
							Else
							{
								OutputPolicySetting "Virtual Desktop Agent Settings\CPU Usage Monitoring\Threshold (percent): " $Setting.CPUUsageMonitoring_Threshold.Value
							}
						}
					}
					Else
					{
						$txt = "User settings"
						If($MSWord -or $PDF)
						{
							WriteWordLine 3 0 $txt
						}
						ElseIf($Text)
						{
							Line 1 $txt
						}
						ElseIf($HTML)
						{
							WriteHTMLLine 3 0 $txt
						}

						Write-Verbose "$(Get-Date -Format G): `t`tUser settings"
						Write-Verbose "$(Get-Date -Format G): `t`t`tICA"
						If( ( validStateProp $Setting ClipboardRedirection State ) -and ($Setting.ClipboardRedirection.State -ne "NotConfigured"))
						{
							If($MSWord -or $PDF)
							{
								$WordTableRowHash = @{
								Text = "ICA\Client clipboard redirection";
								Value = $Setting.ClipboardRedirection.State;
								}
								$SettingsWordTable += $WordTableRowHash;
								$CurrentServiceIndex++;
							}
							Else
							{
								OutputPolicySetting "ICA\Client clipboard redirection: " $Setting.ClipboardRedirection.State
							}
						}
						
						Write-Verbose "$(Get-Date -Format G): `t`t`tICA\Adobe Flash Delivery\Flash Redirection"
						If( ( validStateProp $Setting FlashAcceleration State ) -and ($Setting.FlashAcceleration.State -ne "NotConfigured"))
						{
							If($MSWord -or $PDF)
							{
								$WordTableRowHash = @{
								Text = "ICA\Adobe Flash Delivery\Flash Redirection\Flash acceleration";
								Value = $Setting.FlashAcceleration.State;
								}
								$SettingsWordTable += $WordTableRowHash;
								$CurrentServiceIndex++;
							}
							Else
							{
								OutputPolicySetting "ICA\Adobe Flash Delivery\Flash Redirection\Flash acceleration: " $Setting.FlashAcceleration.State
							}
						}
						If( ( validStateProp $Setting FlashUrlColorList State ) -and ($Setting.FlashUrlColorList.State -ne "NotConfigured"))
						{
							If($MSWord -or $PDF)
							{
								$WordTableRowHash = @{
								Text = "ICA\Adobe Flash Delivery\Flash Redirection\Flash background color list";
								Value = "";
								}
								$SettingsWordTable += $WordTableRowHash;
								$CurrentServiceIndex++;
							}
							Else
							{
								OutputPolicySetting "ICA\Adobe Flash Delivery\Flash Redirection\Flash background color list: " ""
							}
							$Values = $Setting.FlashUrlColorList.Values
							$tmp = ""
							ForEach($Value in $Values)
							{
								$tmp = "$($Value)"
								If($MSWord -or $PDF)
								{
									$WordTableRowHash = @{
									Text = "";
									Value = $tmp;
									}
									$SettingsWordTable += $WordTableRowHash;
									$CurrentServiceIndex++;
								}
								Else
								{
									OutputPolicySetting "" $tmp
								}
							}
							$tmp = " "
							If($MSWord -or $PDF)
							{
							}
							Else
							{
								OutputPolicySetting "" $tmp
							}
							$tmp = $Null
							$Values = $Null
						}
						If( ( validStateProp $Setting FlashBackwardsCompatibility State ) -and ($Setting.FlashBackwardsCompatibility.State -ne "NotConfigured"))
						{
							If($MSWord -or $PDF)
							{
								$WordTableRowHash = @{
								Text = "ICA\Adobe Flash Delivery\Flash Redirection\Flash backwards compatibility";
								Value = $Setting.FlashBackwardsCompatibility.State;
								}
								$SettingsWordTable += $WordTableRowHash;
								$CurrentServiceIndex++;
							}
							Else
							{
								OutputPolicySetting "ICA\Adobe Flash Delivery\Flash Redirection\Flash backwards compatibility: " $Setting.FlashBackwardsCompatibility.State
							}
						}
						If( ( validStateProp $Setting FlashDefaultBehavior State ) -and ($Setting.FlashDefaultBehavior.State -ne "NotConfigured"))
						{
							$tmp = ""
							Switch ($Setting.FlashDefaultBehavior.Value)
							{
								"Block"   {$tmp = "Block Flash player"; Break}
								"Disable" {$tmp = "Disable Flash acceleration"; Break}
								"Enable"  {$tmp = "Enable Flash acceleration"; Break}
								Default {$tmp = "Flash Default behavior could not be determined: $($Setting.FlashDefaultBehavior.Value)"; Break}
							}
							
							If($MSWord -or $PDF)
							{
								$WordTableRowHash = @{
								Text = "ICA\Adobe Flash Delivery\Flash Redirection\Flash Default behavior";
								Value = $tmp;
								}
								$SettingsWordTable += $WordTableRowHash;
								$CurrentServiceIndex++;
							}
							Else
							{
								OutputPolicySetting "ICA\Adobe Flash Delivery\Flash Redirection\Flash Default behavior: " $tmp
							}
							$tmp = $Null
						}
						If( ( validStateProp $Setting FlashEventLogging State ) -and ($Setting.FlashEventLogging.State -ne "NotConfigured"))
						{
							If($MSWord -or $PDF)
							{
								$WordTableRowHash = @{
								Text = "ICA\Adobe Flash Delivery\Flash Redirection\Flash event logging";
								Value = $Setting.FlashEventLogging.State;
								}
								$SettingsWordTable += $WordTableRowHash;
								$CurrentServiceIndex++;
							}
							Else
							{
								OutputPolicySetting "ICA\Adobe Flash Delivery\Flash Redirection\Flash event logging: " $Setting.FlashEventLogging.State
							}
						}
						If( ( validStateProp $Setting FlashIntelligentFallback State ) -and ($Setting.FlashIntelligentFallback.State -ne "NotConfigured"))
						{
							If($MSWord -or $PDF)
							{
								$WordTableRowHash = @{
								Text = "ICA\Adobe Flash Delivery\Flash Redirection\Flash intelligent fallback";
								Value = $Setting.FlashIntelligentFallback.State;
								}
								$SettingsWordTable += $WordTableRowHash;
								$CurrentServiceIndex++;
							}
							Else
							{
								OutputPolicySetting "ICA\Adobe Flash Delivery\Flash Redirection\Flash intelligent fallback: " $Setting.FlashIntelligentFallback.State
							}
						}
						If( ( validStateProp $Setting FlashLatencyThreshold State ) -and ($Setting.FlashLatencyThreshold.State -ne "NotConfigured"))
						{
							If($MSWord -or $PDF)
							{
								$WordTableRowHash = @{
								Text = "ICA\Adobe Flash Delivery\Flash Redirection\Flash latency threshold (milliseconds)";
								Value = $Setting.FlashLatencyThreshold.Value;
								}
								$SettingsWordTable += $WordTableRowHash;
								$CurrentServiceIndex++;
							}
							Else
							{
								OutputPolicySetting "ICA\Adobe Flash Delivery\Flash Redirection\Flash latency threshold (milliseconds): " $Setting.FlashLatencyThreshold.Value
							}
						}
						If( ( validStateProp $Setting FlashServerSideContentFetchingWhitelist State ) -and ($Setting.FlashServerSideContentFetchingWhitelist.State -ne "NotConfigured"))
						{
							If($MSWord -or $PDF)
							{
								$WordTableRowHash = @{
								Text = "ICA\Adobe Flash Delivery\Flash Redirection\Flash server-side content fetching";
								Value = "";
								}
								$SettingsWordTable += $WordTableRowHash;
								$CurrentServiceIndex++;
							}
							Else
							{
								OutputPolicySetting "ICA\Adobe Flash Delivery\Flash Redirection\Flash server-side content fetching " ""
							}
							$Values = $Setting.FlashServerSideContentFetchingWhitelist.Values
							$tmp = "URL list: "
							If($MSWord -or $PDF)
							{
								$WordTableRowHash = @{
								Text = "";
								Value = $tmp;
								}
								$SettingsWordTable += $WordTableRowHash;
								$CurrentServiceIndex++;
							}
							Else
							{
								OutputPolicySetting "" $tmp
							}
							ForEach($Value in $Values)
							{
								$tmp = "$($Value)"
								If($MSWord -or $PDF)
								{
									$WordTableRowHash = @{
									Text = "";
									Value = $tmp;
									}
									$SettingsWordTable += $WordTableRowHash;
									$CurrentServiceIndex++;
								}
								Else
								{
									OutputPolicySetting "" $tmp
								}
							}
							$tmp = " "
							If($MSWord -or $PDF)
							{
							}
							Else
							{
								OutputPolicySetting "" $tmp
							}
							$Values = $Null
							$tmp = $Null
						}
						If( ( validStateProp $Setting FlashUrlCompatibilityList State ) -and ($Setting.FlashUrlCompatibilityList.State -ne "NotConfigured"))
						{
							If($MSWord -or $PDF)
							{
								$WordTableRowHash = @{
								Text = "ICA\Adobe Flash Delivery\Flash Redirection\Flash URL compatibility list";
								Value = "";
								}
								$SettingsWordTable += $WordTableRowHash;
								$CurrentServiceIndex++;
							}
							Else
							{
								OutputPolicySetting "ICA\Adobe Flash Delivery\Flash Redirection\Flash URL compatibility list: " ""
							}
							$Values = $Setting.FlashUrlCompatibilityList.Values
							$tmp = ""
							ForEach($Value in $Values)
							{
								$Items = $Value.Split(' ')
								$Action = $Items[0]
								If($Action -eq "CLIENT")
								{
									$Action = "Render On Client"
								}
								ElseIf($Action -eq "SERVER")
								{
									$Action = "Render On Server"
								}
								ElseIf($Action -eq "BLOCK")
								{
									$Action = "BLOCK           "
								}
								$Url = $Items[1]
								If($Items.Count -eq 3)
								{
									$FlashInstance = $Items[2]
								}
								Else
								{
									$FlashInstance = "Any"
								}
								$tmp = "Action: $($Action)"
								If($MSWord -or $PDF)
								{
									$WordTableRowHash = @{
									Text = "";
									Value = $tmp;
									}
									$SettingsWordTable += $WordTableRowHash;
									$CurrentServiceIndex++;
								}
								Else
								{
									OutputPolicySetting "" $tmp
								}
								$tmp = "URL Pattern: $($Url)"
								If($MSWord -or $PDF)
								{
									$WordTableRowHash = @{
									Text = "";
									Value = $tmp;
									}
									$SettingsWordTable += $WordTableRowHash;
									$CurrentServiceIndex++;
								}
								Else
								{
									OutputPolicySetting "" $tmp
								}
								$tmp = "Flash Instance: $($FlashInstance)"
								If($MSWord -or $PDF)
								{
									$WordTableRowHash = @{
									Text = "";
									Value = $tmp;
									}
									$SettingsWordTable += $WordTableRowHash;
									$CurrentServiceIndex++;
								}
								Else
								{
									OutputPolicySetting "" $tmp
								}
								$tmp = " "
								If($MSWord -or $PDF)
								{
								}
								Else
								{
									OutputPolicySetting "" $tmp
								}
							}
							$Values = $Null
							$Action = $Null
							$Url = $Null
							$FlashInstance = $Null
							$tmp = $Null
						}

						Write-Verbose "$(Get-Date -Format G): `t`t`tICA\Audio"
						If( ( validStateProp $Setting AllowRtpAudio State ) -and ($Setting.AllowRtpAudio.State -ne "NotConfigured"))
						{
							If($MSWord -or $PDF)
							{
								$WordTableRowHash = @{
								Text = "ICA\Audio\Audio over UDP Real-time Transport";
								Value = $Setting.AllowRtpAudio.State;
								}
								$SettingsWordTable += $WordTableRowHash;
								$CurrentServiceIndex++;
							}
							Else
							{
								OutputPolicySetting "ICA\Audio\Audio over UDP Real-time Transport: " $Setting.AllowRtpAudio.State
							}
						}
						If( ( validStateProp $Setting AudioQuality State ) -and ($Setting.AudioQuality.State -ne "NotConfigured"))
						{
							$tmp = ""
							Switch ($Setting.AudioQuality.Value)
							{
								"Low"    {$tmp = "Low - for low-speed connections"; Break}
								"Medium" {$tmp = "Medium - optimized for speech"; Break}
								"High"   {$tmp = "High - high definition audio"; Break}
								Default {$tmp = "Audio quality could not be determined: $($Setting.AudioQuality.Value)"; Break}
							}
							
							If($MSWord -or $PDF)
							{
								$WordTableRowHash = @{
								Text = "ICA\Audio\Audio quality";
								Value = $tmp;
								}
								$SettingsWordTable += $WordTableRowHash;
								$CurrentServiceIndex++;
							}
							Else
							{
								OutputPolicySetting "ICA\Audio\Audio quality: " $tmp
							}
							$tmp = $Null
						}
						If( ( validStateProp $Setting ClientAudioRedirection State ) -and ($Setting.ClientAudioRedirection.State -ne "NotConfigured"))
						{
							If($MSWord -or $PDF)
							{
								$WordTableRowHash = @{
								Text = "ICA\Audio\Client audio redirection";
								Value = $Setting.ClientAudioRedirection.State;
								}
								$SettingsWordTable += $WordTableRowHash;
								$CurrentServiceIndex++;
							}
							Else
							{
								OutputPolicySetting "ICA\Audio\Client audio redirection: " $Setting.ClientAudioRedirection.State
							}
						}
						If( ( validStateProp $Setting MicrophoneRedirection State ) -and ($Setting.MicrophoneRedirection.State -ne "NotConfigured"))
						{
							If($MSWord -or $PDF)
							{
								$WordTableRowHash = @{
								Text = "ICA\Audio\Client microphone redirection";
								Value = $Setting.MicrophoneRedirection.State;
								}
								$SettingsWordTable += $WordTableRowHash;
								$CurrentServiceIndex++;
							}
							Else
							{
								OutputPolicySetting "ICA\Audio\Client microphone redirection: " $Setting.MicrophoneRedirection.State
							}
						}

						Write-Verbose "$(Get-Date -Format G): `t`t`tICA\Bandwidth"
						If( ( validStateProp $Setting AudioBandwidthLimit State ) -and ($Setting.AudioBandwidthLimit.State -ne "NotConfigured"))
						{
							If($MSWord -or $PDF)
							{
								$WordTableRowHash = @{
								Text = "ICA\Bandwidth\Audio redirection bandwidth limit (Kbps)";
								Value = $Setting.AudioBandwidthLimit.Value;
								}
								$SettingsWordTable += $WordTableRowHash;
								$CurrentServiceIndex++;
							}
							Else
							{
								OutputPolicySetting "ICA\Bandwidth\Audio redirection bandwidth limit (Kbps): " $Setting.AudioBandwidthLimit.Value
							}
						}
						If( ( validStateProp $Setting AudioBandwidthPercent State ) -and ($Setting.AudioBandwidthPercent.State -ne "NotConfigured"))
						{
							If($MSWord -or $PDF)
							{
								$WordTableRowHash = @{
								Text = "ICA\Bandwidth\Audio redirection bandwidth limit %";
								Value = $Setting.AudioBandwidthPercent.Value;
								}
								$SettingsWordTable += $WordTableRowHash;
								$CurrentServiceIndex++;
							}
							Else
							{
								OutputPolicySetting "ICA\Bandwidth\Audio redirection bandwidth limit %: " $Setting.AudioBandwidthPercent.Value
							}
						}
						If( ( validStateProp $Setting USBBandwidthLimit State ) -and ($Setting.USBBandwidthLimit.State -ne "NotConfigured"))
						{
							If($MSWord -or $PDF)
							{
								$WordTableRowHash = @{
								Text = "ICA\Bandwidth\Client USB device redirection bandwidth limit";
								Value = $Setting.USBBandwidthLimit.Value;
								}
								$SettingsWordTable += $WordTableRowHash;
								$CurrentServiceIndex++;
							}
							Else
							{
								OutputPolicySetting "ICA\Bandwidth\Client USB device redirection bandwidth limit: " $Setting.USBBandwidthLimit.Value
							}
						}
						If( ( validStateProp $Setting USBBandwidthPercent State ) -and ($Setting.USBBandwidthPercent.State -ne "NotConfigured"))
						{
							If($MSWord -or $PDF)
							{
								$WordTableRowHash = @{
								Text = "ICA\Bandwidth\Client USB device redirection bandwidth limit %";
								Value = $Setting.USBBandwidthPercent.Value;
								}
								$SettingsWordTable += $WordTableRowHash;
								$CurrentServiceIndex++;
							}
							Else
							{
								OutputPolicySetting "ICA\Bandwidth\Client USB device redirection bandwidth limit %: " $Setting.USBBandwidthPercent.Value
							}
						}
						If( ( validStateProp $Setting ClipboardBandwidthLimit State ) -and ($Setting.ClipboardBandwidthLimit.State -ne "NotConfigured"))
						{
							If($MSWord -or $PDF)
							{
								$WordTableRowHash = @{
								Text = "ICA\Bandwidth\Clipboard redirection bandwidth limit (Kbps)";
								Value = $Setting.ClipboardBandwidthLimit.Value;
								}
								$SettingsWordTable += $WordTableRowHash;
								$CurrentServiceIndex++;
							}
							Else
							{
								OutputPolicySetting "ICA\Bandwidth\Clipboard redirection bandwidth limit (Kbps): " $Setting.ClipboardBandwidthLimit.Value
							}
						}
						If( ( validStateProp $Setting ClipboardBandwidthPercent State ) -and ($Setting.ClipboardBandwidthPercent.State -ne "NotConfigured"))
						{
							If($MSWord -or $PDF)
							{
								$WordTableRowHash = @{
								Text = "ICA\Bandwidth\Clipboard redirection bandwidth limit %";
								Value = $Setting.ClipboardBandwidthPercent.Value;
								}
								$SettingsWordTable += $WordTableRowHash;
								$CurrentServiceIndex++;
							}
							Else
							{
								OutputPolicySetting "ICA\Bandwidth\Clipboard redirection bandwidth limit %: " $Setting.ClipboardBandwidthPercent.Value
							}
						}
						If( ( validStateProp $Setting ComPortBandwidthLimit State ) -and ($Setting.ComPortBandwidthLimit.State -ne "NotConfigured"))
						{
							If($MSWord -or $PDF)
							{
								$WordTableRowHash = @{
								Text = "ICA\Bandwidth\COM port redirection bandwidth limit (Kbps)";
								Value = $Setting.ComPortBandwidthLimit.Value;
								}
								$SettingsWordTable += $WordTableRowHash;
								$CurrentServiceIndex++;
							}
							Else
							{
								OutputPolicySetting "ICA\Bandwidth\COM port redirection bandwidth limit (Kbps): " $Setting.ComPortBandwidthLimit.Value
							}
						}
						If( ( validStateProp $Setting ComPortBandwidthPercent State ) -and ($Setting.ComPortBandwidthPercent.State -ne "NotConfigured"))
						{
							If($MSWord -or $PDF)
							{
								$WordTableRowHash = @{
								Text = "ICA\Bandwidth\COM port redirection bandwidth limit %";
								Value = $Setting.ComPortBandwidthPercent.Value;
								}
								$SettingsWordTable += $WordTableRowHash;
								$CurrentServiceIndex++;
							}
							Else
							{
								OutputPolicySetting "ICA\Bandwidth\COM port redirection bandwidth limit %: " $Setting.ComPortBandwidthPercent.Value
							}
						}
						If( ( validStateProp $Setting FileRedirectionBandwidthLimit State ) -and ($Setting.FileRedirectionBandwidthLimit.State -ne "NotConfigured"))
						{
							If($MSWord -or $PDF)
							{
								$WordTableRowHash = @{
								Text = "ICA\Bandwidth\File redirection bandwidth limit (Kbps)";
								Value = $Setting.FileRedirectionBandwidthLimit.Value;
								}
								$SettingsWordTable += $WordTableRowHash;
								$CurrentServiceIndex++;
							}
							Else
							{
								OutputPolicySetting "ICA\Bandwidth\File redirection bandwidth limit (Kbps): " $Setting.FileRedirectionBandwidthLimit.Value
							}
						}
						If( ( validStateProp $Setting FileRedirectionBandwidthPercent State ) -and ($Setting.FileRedirectionBandwidthPercent.State -ne "NotConfigured"))
						{
							If($MSWord -or $PDF)
							{
								$WordTableRowHash = @{
								Text = "ICA\Bandwidth\File redirection bandwidth limit %";
								Value = $Setting.FileRedirectionBandwidthPercent.Value;
								}
								$SettingsWordTable += $WordTableRowHash;
								$CurrentServiceIndex++;
							}
							Else
							{
								OutputPolicySetting "ICA\Bandwidth\File redirection bandwidth limit %: " $Setting.FileRedirectionBandwidthPercent.Value
							}
						}
						If( ( validStateProp $Setting HDXMultimediaBandwidthLimit State ) -and ($Setting.HDXMultimediaBandwidthLimit.State -ne "NotConfigured"))
						{
							If($MSWord -or $PDF)
							{
								$WordTableRowHash = @{
								Text = "ICA\Bandwidth\HDX MediaStream Multimedia Acceleration bandwidth limit (Kbps)";
								Value = $Setting.HDXMultimediaBandwidthLimit.Value;
								}
								$SettingsWordTable += $WordTableRowHash;
								$CurrentServiceIndex++;
							}
							Else
							{
								OutputPolicySetting "ICA\Bandwidth\HDX MediaStream Multimedia Acceleration bandwidth limit (Kbps): " $Setting.HDXMultimediaBandwidthLimit.Value
							}
						}
						If( ( validStateProp $Setting HDXMultimediaBandwidthPercent State ) -and ($Setting.HDXMultimediaBandwidthPercent.State -ne "NotConfigured"))
						{
							If($MSWord -or $PDF)
							{
								$WordTableRowHash = @{
								Text = "ICA\Bandwidth\HDX MediaStream Multimedia Acceleration bandwidth limit %";
								Value = $Setting.HDXMultimediaBandwidthPercent.Value;
								}
								$SettingsWordTable += $WordTableRowHash;
								$CurrentServiceIndex++;
							}
							Else
							{
								OutputPolicySetting "ICA\Bandwidth\HDX MediaStream Multimedia Acceleration bandwidth limit %: " $Setting.HDXMultimediaBandwidthPercent.Value
							}
						}
						If( ( validStateProp $Setting LptBandwidthLimit State ) -and ($Setting.LptBandwidthLimit.State -ne "NotConfigured"))
						{
							If($MSWord -or $PDF)
							{
								$WordTableRowHash = @{
								Text = "ICA\Bandwidth\LPT port redirection bandwidth limit (Kbps)";
								Value = $Setting.LptBandwidthLimit.Value;
								}
								$SettingsWordTable += $WordTableRowHash;
								$CurrentServiceIndex++;
							}
							Else
							{
								OutputPolicySetting "ICA\Bandwidth\LPT port redirection bandwidth limit (Kbps): " $Setting.LptBandwidthLimit.Value
							}
						}
						If( ( validStateProp $Setting LptBandwidthLimitPercent State ) -and ($Setting.LptBandwidthLimitPercent.State -ne "NotConfigured"))
						{
							If($MSWord -or $PDF)
							{
								$WordTableRowHash = @{
								Text = "ICA\Bandwidth\LPT port redirection bandwidth limit %";
								Value = $Setting.LptBandwidthLimitPercent.Value;
								}
								$SettingsWordTable += $WordTableRowHash;
								$CurrentServiceIndex++;
							}
							Else
							{
								OutputPolicySetting "ICA\Bandwidth\LPT port redirection bandwidth limit %: " $Setting.LptBandwidthLimitPercent.Value
							}
						}
						If( ( validStateProp $Setting OverallBandwidthLimit State ) -and ($Setting.OverallBandwidthLimit.State -ne "NotConfigured"))
						{
							If($MSWord -or $PDF)
							{
								$WordTableRowHash = @{
								Text = "ICA\Bandwidth\Overall session bandwidth limit (Kbps)";
								Value = $Setting.OverallBandwidthLimit.Value;
								}
								$SettingsWordTable += $WordTableRowHash;
								$CurrentServiceIndex++;
							}
							Else
							{
								OutputPolicySetting "ICA\Bandwidth\Overall session bandwidth limit (Kbps): " $Setting.OverallBandwidthLimit.Value
							}
						}
						If( ( validStateProp $Setting PrinterBandwidthLimit State ) -and ($Setting.PrinterBandwidthLimit.State -ne "NotConfigured"))
						{
							If($MSWord -or $PDF)
							{
								$WordTableRowHash = @{
								Text = "ICA\Bandwidth\Printer redirection bandwidth limit (Kbps)";
								Value = $Setting.PrinterBandwidthLimit.Value;
								}
								$SettingsWordTable += $WordTableRowHash;
								$CurrentServiceIndex++;
							}
							Else
							{
								OutputPolicySetting "ICA\Bandwidth\Printer redirection bandwidth limit (Kbps): " $Setting.PrinterBandwidthLimit.Value
							}
						}
						If( ( validStateProp $Setting PrinterBandwidthPercent State ) -and ($Setting.PrinterBandwidthPercent.State -ne "NotConfigured"))
						{
							If($MSWord -or $PDF)
							{
								$WordTableRowHash = @{
								Text = "ICA\Bandwidth\Printer redirection bandwidth limit %";
								Value = $Setting.PrinterBandwidthPercent.Value;
								}
								$SettingsWordTable += $WordTableRowHash;
								$CurrentServiceIndex++;
							}
							Else
							{
								OutputPolicySetting "ICA\Bandwidth\Printer redirection bandwidth limit %: " $Setting.PrinterBandwidthPercent.Value
							}
						}
						If( ( validStateProp $Setting TwainBandwidthLimit State ) -and ($Setting.TwainBandwidthLimit.State -ne "NotConfigured"))
						{
							If($MSWord -or $PDF)
							{
								$WordTableRowHash = @{
								Text = "ICA\Bandwidth\TWAIN device redirection bandwidth limit (Kbps)";
								Value = $Setting.TwainBandwidthLimit.Value;
								}
								$SettingsWordTable += $WordTableRowHash;
								$CurrentServiceIndex++;
							}
							Else
							{
								OutputPolicySetting "ICA\Bandwidth\TWAIN device redirection bandwidth limit (Kbps): " $Setting.TwainBandwidthLimit.Value
							}
						}
						If( ( validStateProp $Setting TwainBandwidthPercent State ) -and ($Setting.TwainBandwidthPercent.State -ne "NotConfigured"))
						{
							If($MSWord -or $PDF)
							{
								$WordTableRowHash = @{
								Text = "ICA\Bandwidth\TWAIN device redirection bandwidth limit %";
								Value = $Setting.TwainBandwidthPercent.Value;
								}
								$SettingsWordTable += $WordTableRowHash;
								$CurrentServiceIndex++;
							}
							Else
							{
								OutputPolicySetting "ICA\Bandwidth\TWAIN device redirection bandwidth limit %: " $Setting.TwainBandwidthPercent.Value
							}
						}

						Write-Verbose "$(Get-Date -Format G): `t`t`tICA\Desktop UI"
						If( ( validStateProp $Setting AeroRedirection State ) -and ($Setting.AeroRedirection.State -ne "NotConfigured"))
						{
							If($MSWord -or $PDF)
							{
								$WordTableRowHash = @{
								Text = "ICA\Desktop UI\Aero Redirection";
								Value = $Setting.AeroRedirection.State;
								}
								$SettingsWordTable += $WordTableRowHash;
								$CurrentServiceIndex++;
							}
							Else
							{
								OutputPolicySetting "ICA\Desktop UI\Aero Redirection: " $Setting.AeroRedirection.State
							}
						}
						If( ( validStateProp $Setting GraphicsQuality State ) -and ($Setting.GraphicsQuality.State -ne "NotConfigured"))
						{
							If($MSWord -or $PDF)
							{
								$WordTableRowHash = @{
								Text = "ICA\Desktop UI\Aero Redirection Graphics Quality";
								Value = $Setting.GraphicsQuality.Value;
								}
								$SettingsWordTable += $WordTableRowHash;
								$CurrentServiceIndex++;
							}
							Else
							{
								OutputPolicySetting "ICA\Desktop UI\Aero Redirection Graphics Quality: " $Setting.GraphicsQuality.Value
							}
						}
						If( ( validStateProp $Setting DesktopWallpaper State ) -and ($Setting.DesktopWallpaper.State -ne "NotConfigured"))
						{
							If($MSWord -or $PDF)
							{
								$WordTableRowHash = @{
								Text = "ICA\Desktop UI\Desktop wallpaper";
								Value = $Setting.DesktopWallpaper.State;
								}
								$SettingsWordTable += $WordTableRowHash;
								$CurrentServiceIndex++;
							}
							Else
							{
								OutputPolicySetting "ICA\Desktop UI\Desktop wallpaper: " $Setting.DesktopWallpaper.State
							}
						}
						If( ( validStateProp $Setting MenuAnimation State ) -and ($Setting.MenuAnimation.State -ne "NotConfigured"))
						{
							If($MSWord -or $PDF)
							{
								$WordTableRowHash = @{
								Text = "ICA\Desktop UI\Menu animation";
								Value = $Setting.MenuAnimation.State;
								}
								$SettingsWordTable += $WordTableRowHash;
								$CurrentServiceIndex++;
							}
							Else
							{
								OutputPolicySetting "ICA\Desktop UI\Menu animation: " $Setting.MenuAnimation.State
							}
						}
						If( ( validStateProp $Setting WindowContentsVisibleWhileDragging State ) -and ($Setting.WindowContentsVisibleWhileDragging.State -ne "NotConfigured"))
						{
							If($MSWord -or $PDF)
							{
								$WordTableRowHash = @{
								Text = "ICA\Desktop UI\View window contents while dragging";
								Value = $Setting.WindowContentsVisibleWhileDragging.State;
								}
								$SettingsWordTable += $WordTableRowHash;
								$CurrentServiceIndex++;
							}
							Else
							{
								OutputPolicySetting "ICA\Desktop UI\View window contents while dragging: " $Setting.WindowContentsVisibleWhileDragging.State
							}
						}

						Write-Verbose "$(Get-Date -Format G): `t`t`tICA\File Redirection"
						If( ( validStateProp $Setting AutoConnectDrives State ) -and ($Setting.AutoConnectDrives.State -ne "NotConfigured"))
						{
							If($MSWord -or $PDF)
							{
								$WordTableRowHash = @{
								Text = "ICA\File Redirection\Auto connect client drives";
								Value = $Setting.AutoConnectDrives.State;
								}
								$SettingsWordTable += $WordTableRowHash;
								$CurrentServiceIndex++;
							}
							Else
							{
								OutputPolicySetting "ICA\File Redirection\Auto connect client drives: " $Setting.AutoConnectDrives.State
							}
						}
						If( ( validStateProp $Setting ClientDriveRedirection State ) -and ($Setting.ClientDriveRedirection.State -ne "NotConfigured"))
						{
							If($MSWord -or $PDF)
							{
								$WordTableRowHash = @{
								Text = "ICA\File Redirection\Client drive redirection";
								Value = $Setting.ClientDriveRedirection.State;
								}
								$SettingsWordTable += $WordTableRowHash;
								$CurrentServiceIndex++;
							}
							Else
							{
								OutputPolicySetting "ICA\File Redirection\Client drive redirection: " $Setting.ClientDriveRedirection.State
							}
						}
						If( ( validStateProp $Setting ClientFixedDrives State ) -and ($Setting.ClientFixedDrives.State -ne "NotConfigured"))
						{
							If($MSWord -or $PDF)
							{
								$WordTableRowHash = @{
								Text = "ICA\File Redirection\Client fixed drives";
								Value = $Setting.ClientFixedDrives.State;
								}
								$SettingsWordTable += $WordTableRowHash;
								$CurrentServiceIndex++;
							}
							Else
							{
								OutputPolicySetting "ICA\File Redirection\Client fixed drives: " $Setting.ClientFixedDrives.State
							}
						}
						If( ( validStateProp $Setting ClientFloppyDrives State ) -and ($Setting.ClientFloppyDrives.State -ne "NotConfigured"))
						{
							If($MSWord -or $PDF)
							{
								$WordTableRowHash = @{
								Text = "ICA\File Redirection\Client floppy drives";
								Value = $Setting.ClientFloppyDrives.State;
								}
								$SettingsWordTable += $WordTableRowHash;
								$CurrentServiceIndex++;
							}
							Else
							{
								OutputPolicySetting "ICA\File Redirection\Client floppy drives: " $Setting.ClientFloppyDrives.State
							}
						}
						If( ( validStateProp $Setting ClientNetworkDrives State ) -and ($Setting.ClientNetworkDrives.State -ne "NotConfigured"))
						{
							If($MSWord -or $PDF)
							{
								$WordTableRowHash = @{
								Text = "ICA\File Redirection\Client network drives";
								Value = $Setting.ClientNetworkDrives.State;
								}
								$SettingsWordTable += $WordTableRowHash;
								$CurrentServiceIndex++;
							}
							Else
							{
								OutputPolicySetting "ICA\File Redirection\Client network drives: " $Setting.ClientNetworkDrives.State
							}
						}
						If( ( validStateProp $Setting ClientOpticalDrives State ) -and ($Setting.ClientOpticalDrives.State -ne "NotConfigured"))
						{
							If($MSWord -or $PDF)
							{
								$WordTableRowHash = @{
								Text = "ICA\File Redirection\Client optical drives";
								Value = $Setting.ClientOpticalDrives.State;
								}
								$SettingsWordTable += $WordTableRowHash;
								$CurrentServiceIndex++;
							}
							Else
							{
								OutputPolicySetting "ICA\File Redirection\Client optical drives: " $Setting.ClientOpticalDrives.State
							}
						}
						If( ( validStateProp $Setting ClientRemoveableDrives State ) -and ($Setting.ClientRemoveableDrives.State -ne "NotConfigured"))
						{
							If($MSWord -or $PDF)
							{
								$WordTableRowHash = @{
								Text = "ICA\File Redirection\Client removable drives";
								Value = $Setting.ClientRemoveableDrives.State;
								}
								$SettingsWordTable += $WordTableRowHash;
								$CurrentServiceIndex++;
							}
							Else
							{
								OutputPolicySetting "ICA\File Redirection\Client removable drives: " $Setting.ClientRemoveableDrives.State
							}
						}
						If( ( validStateProp $Setting ClientDriveLetterPreservation State ) -and ($Setting.ClientDriveLetterPreservation.State -ne "NotConfigured"))
						{
							If($MSWord -or $PDF)
							{
								$WordTableRowHash = @{
								Text = "ICA\File Redirection\Preserve client drive letters";
								Value = $Setting.ClientDriveLetterPreservation.State;
								}
								$SettingsWordTable += $WordTableRowHash;
								$CurrentServiceIndex++;
							}
							Else
							{
								OutputPolicySetting "ICA\File Redirection\Preserve client drive letters: " $Setting.ClientDriveLetterPreservation.State
							}
						}
						If( ( validStateProp $Setting ReadOnlyMappedDrive State ) -and ($Setting.ReadOnlyMappedDrive.State -ne "NotConfigured"))
						{
							If($MSWord -or $PDF)
							{
								$WordTableRowHash = @{
								Text = "ICA\File Redirection\Read-only client drive access";
								Value = $Setting.ReadOnlyMappedDrive.State;
								}
								$SettingsWordTable += $WordTableRowHash;
								$CurrentServiceIndex++;
							}
							Else
							{
								OutputPolicySetting "ICA\File Redirection\Read-only client drive access: " $Setting.ReadOnlyMappedDrive.State
							}
						}
						If( ( validStateProp $Setting AsynchronousWrites State ) -and ($Setting.AsynchronousWrites.State -ne "NotConfigured"))
						{
							If($MSWord -or $PDF)
							{
								$WordTableRowHash = @{
								Text = "ICA\File Redirection\Use asynchronous writes";
								Value = $Setting.AsynchronousWrites.State;
								}
								$SettingsWordTable += $WordTableRowHash;
								$CurrentServiceIndex++;
							}
							Else
							{
								OutputPolicySetting "ICA\File Redirection\Use asynchronous writes: " $Setting.AsynchronousWrites.State
							}
						}

						Write-Verbose "$(Get-Date -Format G): `t`t`tICA\Multi-Stream Connections"
						If( ( validStateProp $Setting MultiStream State ) -and ($Setting.MultiStream.State -ne "NotConfigured"))
						{
							If($MSWord -or $PDF)
							{
								$WordTableRowHash = @{
								Text = "ICA\Multi-Stream Connections\Multi-Stream";
								Value = $Setting.MultiStream.State;
								}
								$SettingsWordTable += $WordTableRowHash;
								$CurrentServiceIndex++;
							}
							Else
							{
								OutputPolicySetting "ICA\Multi-Stream Connections\Multi-Stream: " $Setting.MultiStream.State
							}
						}

						Write-Verbose "$(Get-Date -Format G): `t`t`tICA\Port Redirection"
						If( ( validStateProp $Setting ClientComPortsAutoConnection State ) -and ($Setting.ClientComPortsAutoConnection.State -ne "NotConfigured"))
						{
							If($MSWord -or $PDF)
							{
								$WordTableRowHash = @{
								Text = "ICA\Port Redirection\Auto connect client COM ports";
								Value = $Setting.ClientComPortsAutoConnection.State;
								}
								$SettingsWordTable += $WordTableRowHash;
								$CurrentServiceIndex++;
							}
							Else
							{
								OutputPolicySetting "ICA\Port Redirection\Auto connect client COM ports: " $Setting.ClientComPortsAutoConnection.State
							}
						}
						If( ( validStateProp $Setting ClientLptPortsAutoConnection State ) -and ($Setting.ClientLptPortsAutoConnection.State -ne "NotConfigured"))
						{
							If($MSWord -or $PDF)
							{
								$WordTableRowHash = @{
								Text = "ICA\Port Redirection\Auto connect client LPT ports";
								Value = $Setting.ClientLptPortsAutoConnection.State;
								}
								$SettingsWordTable += $WordTableRowHash;
								$CurrentServiceIndex++;
							}
							Else
							{
								OutputPolicySetting "ICA\Port Redirection\Auto connect client LPT ports: " $Setting.ClientLptPortsAutoConnection.State
							}
						}
						If( ( validStateProp $Setting ClientComPortRedirection State ) -and ($Setting.ClientComPortRedirection.State -ne "NotConfigured"))
						{
							If($MSWord -or $PDF)
							{
								$WordTableRowHash = @{
								Text = "ICA\Port Redirection\Client COM port redirection";
								Value = $Setting.ClientComPortRedirection.State;
								}
								$SettingsWordTable += $WordTableRowHash;
								$CurrentServiceIndex++;
							}
							Else
							{
								OutputPolicySetting "ICA\Port Redirection\Client COM port redirection: " $Setting.ClientComPortRedirection.State
							}
						}
						If( ( validStateProp $Setting ClientLptPortRedirection State ) -and ($Setting.ClientLptPortRedirection.State -ne "NotConfigured"))
						{
							If($MSWord -or $PDF)
							{
								$WordTableRowHash = @{
								Text = "ICA\Port Redirection\Client LPT port redirection";
								Value = $Setting.ClientLptPortRedirection.State;
								}
								$SettingsWordTable += $WordTableRowHash;
								$CurrentServiceIndex++;
							}
							Else
							{
								OutputPolicySetting "ICA\Port Redirection\Client LPT port redirection: " $Setting.ClientLptPortRedirection.State
							}
						}

						Write-Verbose "$(Get-Date -Format G): `t`t`tICA\Printing"
						If( ( validStateProp $Setting ClientPrinterRedirection State ) -and ($Setting.ClientPrinterRedirection.State -ne "NotConfigured"))
						{
							If($MSWord -or $PDF)
							{
								$WordTableRowHash = @{
								Text = "ICA\Printing\Client printer redirection";
								Value = $Setting.ClientPrinterRedirection.State;
								}
								$SettingsWordTable += $WordTableRowHash;
								$CurrentServiceIndex++;
							}
							Else
							{
								OutputPolicySetting "ICA\Printing\Client printer redirection: " $Setting.ClientPrinterRedirection.State
							}
						}
						If( ( validStateProp $Setting DefaultClientPrinter State ) -and ($Setting.DefaultClientPrinter.State -ne "NotConfigured"))
						{
							$tmp = ""
							Switch ($Setting.DefaultClientPrinter.Value)
							{
								"ClientDefault" {$tmp = "Set Default printer to the client's main printer"; Break}
								"DoNotAdjust"   {$tmp = "Do not adjust the user's Default printer"; Break}
								Default {$tmp = "Default printer could not be determined: $($Setting.DefaultClientPrinter.Value)"; Break}
							}
							If($MSWord -or $PDF)
							{
								$WordTableRowHash = @{
								Text = "ICA\Printing\Default printer - Choose client's Default printer";
								Value = $tmp;
								}
								$SettingsWordTable += $WordTableRowHash;
								$CurrentServiceIndex++;
							}
							Else
							{
								OutputPolicySetting "ICA\Printing\Default printer - Choose client's Default printer: " $tmp
							}
							$tmp = $Null
						}
						If( ( validStateProp $Setting AutoCreationEventLogPreference State ) -and ($Setting.AutoCreationEventLogPreference.State -ne "NotConfigured"))
						{
							$tmp = ""
							Switch ($Setting.AutoCreationEventLogPreference.Value)
							{
								"LogErrorsOnly"        {$tmp = "Log errors only"; Break}
								"LogErrorsAndWarnings" {$tmp = "Log errors and warnings"; Break}
								"DoNotLog"             {$tmp = "Do not log errors or warnings"; Break}
								Default {$tmp = "Printer auto-creation event log preference could not be determined: $($Setting.AutoCreationEventLogPreference.Value)"; Break}
							}
							If($MSWord -or $PDF)
							{
								$WordTableRowHash = @{
								Text = "ICA\Printing\Printer auto-creation event log preference";
								Value = $tmp;
								}
								$SettingsWordTable += $WordTableRowHash;
								$CurrentServiceIndex++;
							}
							Else
							{
								OutputPolicySetting "ICA\Printing\Printer auto-creation event log preference: " $tmp
							}
							$tmp = $Null
						}
						If( ( validStateProp $Setting SessionPrinters State ) -and ($Setting.SessionPrinters.State -ne "NotConfigured"))
						{
							If($MSWord -or $PDF)
							{
								$WordTableRowHash = @{
								Text = "ICA\Printing\Session printers";
								Value = "";
								}
								$SettingsWordTable += $WordTableRowHash;
								$CurrentServiceIndex++;
							}
							Else
							{
								OutputPolicySetting "ICA\Printing\Session printers:"  ""
							}
							$valArray = $Setting.SessionPrinters.Values
							$tmp = ""
							ForEach($printer in $valArray)
							{
								$prArray = $printer.Split(',')
								ForEach($element in $prArray)
								{
									if($element.SubString(0, 2) -eq "\\")
									{
										$index = $element.SubString(2).IndexOf('\')
										if($index -ge 0)
										{
											$server = $element.SubString(0, $index + 2)
											$share  = $element.SubString($index + 3)
											$tmp = "Server: $($server)"
											If($MSWord -or $PDF)
											{
												$WordTableRowHash = @{
												Text = "";
												Value = $tmp;
												}
												$SettingsWordTable += $WordTableRowHash;
												$CurrentServiceIndex++;
											}
											Else
											{
												OutputPolicySetting "" $tmp
											}
											$tmp = "Shared Name: $($share)"
											If($MSWord -or $PDF)
											{
												$WordTableRowHash = @{
												Text = "";
												Value = $tmp;
												}
												$SettingsWordTable += $WordTableRowHash;
												$CurrentServiceIndex++;
											}
											Else
											{
												OutputPolicySetting "" $tmp
											}
										}
										$index = $Null
									}
									Else
									{
										$tmp1 = $element.SubString(0, 4)
										$tmp = Get-PrinterModifiedSettings $tmp1 $element
										If(![String]::IsNullOrEmpty($tmp))
										{
											If($MSWord -or $PDF)
											{
												$WordTableRowHash = @{
												Text = "";
												Value = $tmp;
												}
												$SettingsWordTable += $WordTableRowHash;
												$CurrentServiceIndex++;
											}
											Else
											{
												OutputPolicySetting "" $tmp
											}
										}
										$tmp1 = $Null
										#$PrtString = $Null
										$tmp = $Null
									}
								}
								$tmp = " "
								If($MSWord -or $PDF)
								{
								}
								Else
								{
									OutputPolicySetting "" $tmp
								}
							}

							$valArray = $Null
							$prArray = $Null
							$tmp = $Null
						}
						If( ( validStateProp $Setting WaitForPrintersToBeCreated State ) -and ($Setting.WaitForPrintersToBeCreated.State -ne "NotConfigured"))
						{
							If($MSWord -or $PDF)
							{
								$WordTableRowHash = @{
								Text = "ICA\Printing\Wait for printers to be created (desktop)";
								Value = $Setting.WaitForPrintersToBeCreated.State;
								}
								$SettingsWordTable += $WordTableRowHash;
								$CurrentServiceIndex++;
							}
							Else
							{
								OutputPolicySetting "ICA\Printing\Wait for printers to be created (desktop): " $Setting.WaitForPrintersToBeCreated.State
							}
						}

						Write-Verbose "$(Get-Date -Format G): `t`t`tICA\Printing\Client Printers"
						If( ( validStateProp $Setting ClientPrinterAutoCreation State ) -and ($Setting.ClientPrinterAutoCreation.State -ne "NotConfigured"))
						{
							$tmp = ""
							Switch ($Setting.ClientPrinterAutoCreation.Value)
							{
								"DoNotAutoCreate"    {$tmp = "Do not auto-create client printers"; Break}
								"DefaultPrinterOnly" {$tmp = "Auto-create the client's Default printer only"; Break}
								"LocalPrintersOnly"  {$tmp = "Auto-create local (non-network) client printers only"; Break}
								"AllPrinters"        {$tmp = "Auto-create all client printers"; Break}
								Default {$tmp = "Auto-create client printers could not be determined: $($Setting.ClientPrinterAutoCreation.Value)"; Break}
							}
							If($MSWord -or $PDF)
							{
								$WordTableRowHash = @{
								Text = "ICA\Printing\Client Printers\Auto-create client printers";
								Value = $tmp;
								}
								$SettingsWordTable += $WordTableRowHash;
								$CurrentServiceIndex++;
							}
							Else
							{
								OutputPolicySetting "ICA\Printing\Client Printers\Auto-create client printers: " $tmp
							}
							$tmp = $Null
						}
						If( ( validStateProp $Setting GenericUniversalPrinterAutoCreation State ) -and ($Setting.GenericUniversalPrinterAutoCreation.State -ne "NotConfigured"))
						{
							If($MSWord -or $PDF)
							{
								$WordTableRowHash = @{
								Text = "ICA\Printing\Client Printers\Auto-create generic universal printer";
								Value = $Setting.GenericUniversalPrinterAutoCreation.State;
								}
								$SettingsWordTable += $WordTableRowHash;
								$CurrentServiceIndex++;
							}
							Else
							{
								OutputPolicySetting "ICA\Printing\Client Printers\Auto-create generic universal printer: " $Setting.GenericUniversalPrinterAutoCreation.State
							}
						}
						If( ( validStateProp $Setting ClientPrinterNames State ) -and ($Setting.ClientPrinterNames.State -ne "NotConfigured"))
						{
							$tmp = ""
							Switch ($Setting.ClientPrinterNames.Value)
							{
								"StandardPrinterNames" {$tmp = "Standard printer names"; Break}
								"LegacyPrinterNames"   {$tmp = "Legacy printer names"; Break}
								Default {$tmp = "Client printer names could not be determined: $($Setting.ClientPrinterNames.Value)"; Break}
							}
							If($MSWord -or $PDF)
							{
								$WordTableRowHash = @{
								Text = "ICA\Printing\Client Printers\Client printer names";
								Value = $tmp;
								}
								$SettingsWordTable += $WordTableRowHash;
								$CurrentServiceIndex++;
							}
							Else
							{
								OutputPolicySetting "ICA\Printing\Client Printers\Client printer names: " $tmp
							}
							$tmp = $Null
						}
						If( ( validStateProp $Setting DirectConnectionsToPrintServers State ) -and ($Setting.DirectConnectionsToPrintServers.State -ne "NotConfigured"))
						{
							If($MSWord -or $PDF)
							{
								$WordTableRowHash = @{
								Text = "ICA\Printing\Client Printers\Direct connections to print servers";
								Value = $Setting.DirectConnectionsToPrintServers.State;
								}
								$SettingsWordTable += $WordTableRowHash;
								$CurrentServiceIndex++;
							}
							Else
							{
								OutputPolicySetting "ICA\Printing\Client Printers\Direct connections to print servers: " $Setting.DirectConnectionsToPrintServers.State
							}
						}
						If( ( validStateProp $Setting PrinterDriverMappings State ) -and ($Setting.PrinterDriverMappings.State -ne "NotConfigured"))
						{
							If($MSWord -or $PDF)
							{
								$WordTableRowHash = @{
								Text = "ICA\Printing\Client Printers\Printer driver mapping and compatibility";
								Value = "";
								}
								$SettingsWordTable += $WordTableRowHash;
								$CurrentServiceIndex++;
							}
							Else
							{
								OutputPolicySetting "ICA\Printing\Client Printers\Printer driver mapping and compatibility: " ""
							}
							$array = $Setting.PrinterDriverMappings.Values
							$tmp = ""
							ForEach($element in $array)
							{
								$Items = $element.Split(',')
								$DriverName = $Items[0]
								$Action = $Items[1]
								If($Action -match 'Replace=')
								{
									$ServerDriver = $Action.substring($Action.indexof("=")+1)
									$Action = "Replace "
								}
								Else
								{
									$ServerDriver = ""
									If($Action -eq "Allow")
									{
										$Action = "Allow "
									}
									ElseIf($Action -eq "Deny")
									{
										$Action = "Do not create "
									}
									ElseIf($Action -eq "UPD_Only")
									{
										$Action = "Create with universal driver "
									}
								}
								$tmp = "Driver Name: $($DriverName)"
								If($MSWord -or $PDF)
								{
									$WordTableRowHash = @{
									Text = "";
									Value = $tmp;
									}
									$SettingsWordTable += $WordTableRowHash;
									$CurrentServiceIndex++;
								}
								Else
								{
									OutputPolicySetting "" $tmp
								}
								$tmp = "Action: $($Action)"
								If($MSWord -or $PDF)
								{
									$WordTableRowHash = @{
									Text = "";
									Value = $tmp;
									}
									$SettingsWordTable += $WordTableRowHash;
									$CurrentServiceIndex++;
								}
								Else
								{
									OutputPolicySetting "" $tmp
								}
								$tmp = "Settings: "
								If($MSWord -or $PDF)
								{
									$WordTableRowHash = @{
									Text = "";
									Value = $tmp;
									}
									$SettingsWordTable += $WordTableRowHash;
									$CurrentServiceIndex++;
								}
								Else
								{
									OutputPolicySetting "" $tmp
								}
								If($Items.count -gt 2)
								{
									[int]$BeginAt = 2
									[int]$EndAt = $Items.count
									for ($i=$BeginAt;$i -lt $EndAt; $i++) 
									{
										$tmp2 = $Items[$i].SubString(0, 4)
										$tmp = Get-PrinterModifiedSettings $tmp2 $Items[$i]
										If(![String]::IsNullOrEmpty($tmp))
										{
											If($MSWord -or $PDF)
											{
												$WordTableRowHash = @{
												Text = "";
												Value = $tmp;
												}
												$SettingsWordTable += $WordTableRowHash;
												$CurrentServiceIndex++;
											}
											Else
											{
												OutputPolicySetting "" $tmp
											}
										}
									}
								}
								Else
								{
									$tmp = "Unmodified "
									If($MSWord -or $PDF)
									{
										$WordTableRowHash = @{
										Text = "";
										Value = $tmp;
										}
										$SettingsWordTable += $WordTableRowHash;
										$CurrentServiceIndex++;
									}
									Else
									{
										OutputPolicySetting "" $tmp
									}
								}

								If(![String]::IsNullOrEmpty($ServerDriver))
								{
									$tmp = "Server Driver: $($ServerDriver)"
									If($MSWord -or $PDF)
									{
										$WordTableRowHash = @{
										Text = "";
										Value = $tmp;
										}
										$SettingsWordTable += $WordTableRowHash;
										$CurrentServiceIndex++;
									}
									Else
									{
										OutputPolicySetting "" $tmp
									}
								}
								$tmp = " "
								If($MSWord -or $PDF)
								{
								}
								Else
								{
									OutputPolicySetting "" $tmp
								}
								$tmp = $Null
							}
						}
						If( ( validStateProp $Setting PrinterPropertiesRetention State ) -and ($Setting.PrinterPropertiesRetention.State -ne "NotConfigured"))
						{
							$tmp = ""
							Switch ($Setting.PrinterPropertiesRetention.Value)
							{
								"SavedOnClientDevice"   {$tmp = "Saved on the client device only"; Break}
								"RetainedInUserProfile" {$tmp = "Retained in user profile only"; Break}
								"FallbackToProfile"     {$tmp = "Held in profile only if not saved on client"; Break}
								"DoNotRetain"           {$tmp = "Do not retain printer properties"; Break}
								Default {$tmp = "Printer properties retention could not be determined: $($Setting.PrinterPropertiesRetention.Value)"; Break}
							}

							If($MSWord -or $PDF)
							{
								$WordTableRowHash = @{
								Text = "ICA\Printing\Client Printers\Printer properties retention";
								Value = $tmp;
								}
								$SettingsWordTable += $WordTableRowHash;
								$CurrentServiceIndex++;
							}
							Else
							{
								OutputPolicySetting "ICA\Printing\Client Printers\Printer properties retention: " $tmp
							}
							$tmp = $Null
						}
						If( ( validStateProp $Setting RetainedAndRestoredClientPrinters State ) -and ($Setting.RetainedAndRestoredClientPrinters.State -ne "NotConfigured"))
						{
							If($MSWord -or $PDF)
							{
								$WordTableRowHash = @{
								Text = "ICA\Printing\Client Printers\Retained and restored client printers";
								Value = $Setting.RetainedAndRestoredClientPrinters.State;
								}
								$SettingsWordTable += $WordTableRowHash;
								$CurrentServiceIndex++;
							}
							Else
							{
								OutputPolicySetting "ICA\Printing\Client Printers\Retained and restored client printers: " $Setting.RetainedAndRestoredClientPrinters.State
							}
						}

						Write-Verbose "$(Get-Date -Format G): `t`t`tICA\Printing\Drivers"
						If( ( validStateProp $Setting InboxDriverAutoInstallation State ) -and ($Setting.InboxDriverAutoInstallation.State -ne "NotConfigured"))
						{
							If($MSWord -or $PDF)
							{
								$WordTableRowHash = @{
								Text = "ICA\Printing\Drivers\Automatic installation of in-box printer drivers";
								Value = $Setting.InboxDriverAutoInstallation.State;
								}
								$SettingsWordTable += $WordTableRowHash;
								$CurrentServiceIndex++;
							}
							Else
							{
								OutputPolicySetting "ICA\Printing\Drivers\Automatic installation of in-box printer drivers: " $Setting.InboxDriverAutoInstallation.State
							}
						}
						If( ( validStateProp $Setting UniversalDriverPriority State ) -and ($Setting.UniversalDriverPriority.State -ne "NotConfigured"))
						{
							If($MSWord -or $PDF)
							{
								$WordTableRowHash = @{
								Text = "ICA\Printing\Drivers\Universal driver preference";
								Value = "";
								}
								$SettingsWordTable += $WordTableRowHash;
								$CurrentServiceIndex++;
							}
							Else
							{
								OutputPolicySetting "ICA\Printing\Drivers\Universal driver preference: " ""
							}
							$TmpArray = $Setting.UniversalDriverPriority.Value.Split(';')
							$tmp = ""
							ForEach($Thing in $TmpArray)
							{
								$tmp = "$($Thing) "
								If($MSWord -or $PDF)
								{
									$WordTableRowHash = @{
									Text = "";
									Value = $tmp;
									}
									$SettingsWordTable += $WordTableRowHash;
									$CurrentServiceIndex++;
								}
								Else
								{
									OutputPolicySetting "" $tmp
								}
							}
							$tmp = " "
							If($MSWord -or $PDF)
							{
							}
							Else
							{
								OutputPolicySetting "" $tmp
							}
							$TmpArray = $Null
							$tmp = $Null
						}
						If( ( validStateProp $Setting UniversalPrintDriverUsage State ) -and ($Setting.UniversalPrintDriverUsage.State -ne "NotConfigured"))
						{
							$tmp = ""
							Switch ($Setting.UniversalPrintDriverUsage.Value)
							{
								"SpecificOnly"       {$tmp = "Use only printer model specific drivers"; Break}
								"UpdOnly"            {$tmp = "Use universal printing only"; Break}
								"FallbackToUpd"      {$tmp = "Use universal printing only if requested driver is unavailable"; Break}
								"FallbackToSpecific" {$tmp = "Use printer model specific drivers only if universal printing is unavailable"; Break}
								Default {$tmp = "Universal print driver usage could not be determined: $($Setting.UniversalPrintDriverUsage.Value)"; Break}
							}

							If($MSWord -or $PDF)
							{
								$WordTableRowHash = @{
								Text = "ICA\Printing\Drivers\Universal print driver usage";
								Value = $tmp;
								}
								$SettingsWordTable += $WordTableRowHash;
								$CurrentServiceIndex++;
							}
							Else
							{
								OutputPolicySetting "ICA\Printing\Drivers\Universal print driver usage: " $tmp
							}
							$tmp = $Null
						}

						Write-Verbose "$(Get-Date -Format G): `t`t`tICA\Printing\Universal Printing"
						If( ( validStateProp $Setting EMFProcessingMode State ) -and ($Setting.EMFProcessingMode.State -ne "NotConfigured"))
						{
							$tmp = ""
							Switch ($Setting.EMFProcessingMode.Value)
							{
								"ReprocessEMFsForPrinter" {$tmp = "Reprocess EMFs for printer"; Break}
								"SpoolDirectlyToPrinter"  {$tmp = "Spool directly to printer"; Break}
								Default {$tmp = "Universal printing EMF processing mode could not be determined: $($Setting.EMFProcessingMode.Value)"; Break}
							}
							 
							If($MSWord -or $PDF)
							{
								$WordTableRowHash = @{
								Text = "ICA\Printing\Universal Printing\Universal printing EMF processing mode";
								Value = $tmp;
								}
								$SettingsWordTable += $WordTableRowHash;
								$CurrentServiceIndex++;
							}
							Else
							{
								OutputPolicySetting "ICA\Printing\Universal Printing\Universal printing EMF processing mode: " $tmp
							}
							$tmp = $Null
						}
						If( ( validStateProp $Setting ImageCompressionLimit State ) -and ($Setting.ImageCompressionLimit.State -ne "NotConfigured"))
						{
							$tmp = ""
							Switch ($Setting.ImageCompressionLimit.Value)
							{
								"NoCompression"       {$tmp = "No compression"; Break}
								"LosslessCompression" {$tmp = "Best quality (lossless compression)"; Break}
								"MinimumCompression"  {$tmp = "High quality"; Break}
								"MediumCompression"   {$tmp = "Standard quality"; Break}
								"MaximumCompression"  {$tmp = "Reduced quality (maximum compression)"; Break}
								Default {$tmp = "Universal printing image compression limit could not be determined: $($Setting.ImageCompressionLimit.Value)"; Break}
							}
							
							If($MSWord -or $PDF)
							{
								$WordTableRowHash = @{
								Text = "ICA\Printing\Universal Printing\Universal printing image compression limit";
								Value = $tmp;
								}
								$SettingsWordTable += $WordTableRowHash;
								$CurrentServiceIndex++;
							}
							Else
							{
								OutputPolicySetting "ICA\Printing\Universal Printing\Universal printing image compression limit: " $tmp
							}
							$tmp = $Null
						}
						If( ( validStateProp $Setting UPDCompressionDefaults State ) -and ($Setting.UPDCompressionDefaults.State -ne "NotConfigured"))
						{
							If($MSWord -or $PDF)
							{
								$WordTableRowHash = @{
								Text = "ICA\Printing\Universal Printing\Universal printing optimization defaults";
								Value = "";
								}
								$SettingsWordTable += $WordTableRowHash;
								$CurrentServiceIndex++;
							}
							Else
							{
								OutputPolicySetting "ICA\Printing\Universal Printing\Universal printing optimization defaults: " ""
							}
							
							$TmpArray = $Setting.UPDCompressionDefaults.Value.Split(',')
							$tmp = ""
							ForEach($Thing in $TmpArray)
							{
								$TestLabel = $Thing.substring(0, $Thing.indexof("="))
								$TestSetting = $Thing.substring($Thing.indexof("=")+1)
								$TxtLabel = ""
								$TxtSetting = ""
								Switch($TestLabel)
								{
									"ImageCompression"
									{
										$TxtLabel = "Desired image quality:"
										Switch($TestSetting)
										{
											"StandardQuality"	{$TxtSetting = "Standard quality"; Break}
											"BestQuality"		{$TxtSetting = "Best quality (lossless compression)"; Break}
											"HighQuality"		{$TxtSetting = "High quality"; Break}
											"ReducedQuality"	{$TxtSetting = "Reduced quality (maximum compression)"; Break}
										}
									}
									"HeavyweightCompression"
									{
										$TxtLabel = "Enable heavyweight compression:"
										If($TestSetting -eq "True")
										{
											$TxtSetting = "Yes"
										}
										Else
										{
											$TxtSetting = "No"
										}
									}
									"ImageCaching"
									{
										$TxtLabel = "Allow caching of embedded images:"
										If($TestSetting -eq "True")
										{
											$TxtSetting = "Yes"
										}
										Else
										{
											$TxtSetting = "No"
										}
									}
									"FontCaching"
									{
										$TxtLabel = "Allow caching of embedded fonts:"
										If($TestSetting -eq "True")
										{
											$TxtSetting = "Yes"
										}
										Else
										{
											$TxtSetting = "No"
										}
									}
									"AllowNonAdminsToModify"
									{
										$TxtLabel = "Allow non-administrators to modify these settings:"
										If($TestSetting -eq "True")
										{
											$TxtSetting = "Yes"
										}
										Else
										{
											$TxtSetting = "No"
										}
									}
								}
								$tmp = "$($TxtLabel) $TxtSetting "
								If($MSWord -or $PDF)
								{
									$WordTableRowHash = @{
									Text = "";
									Value = $tmp;
									}
									$SettingsWordTable += $WordTableRowHash;
									$CurrentServiceIndex++;
								}
								Else
								{
									OutputPolicySetting "" $tmp
								}
							}
							$tmp = " "
							If($MSWord -or $PDF)
							{
							}
							Else
							{
								OutputPolicySetting "" $tmp
							}
							$TmpArray = $Null
							$tmp = $Null
							$TestLabel = $Null
							$TestSetting = $Null
							$TxtLabel = $Null
							$TxtSetting = $Null
						}
						If( ( validStateProp $Setting UniversalPrintingPreviewPreference State ) -and ($Setting.UniversalPrintingPreviewPreference.State -ne "NotConfigured"))
						{
							$tmp = ""
							Switch ($Setting.UniversalPrintingPreviewPreference.Value)
							{
								"NoPrintPreview"        {$tmp = "Do not use print preview for auto-created or generic universal printers"; Break}
								"AutoCreatedOnly"       {$tmp = "Use print preview for auto-created printers only"; Break}
								"GenericOnly"           {$tmp = "Use print preview for generic universal printers only"; Break}
								"AutoCreatedAndGeneric" {$tmp = "Use print preview for both auto-created and generic universal printers"; Break}
								Default {$tmp = "Universal printing preview preference could not be determined: $($Setting.UniversalPrintingPreviewPreference.Value)"; Break}
							}
							
							If($MSWord -or $PDF)
							{
								$WordTableRowHash = @{
								Text = "ICA\Printing\Universal Printing\Universal printing preview preference";
								Value = $tmp;
								}
								$SettingsWordTable += $WordTableRowHash;
								$CurrentServiceIndex++;
							}
							Else
							{
								OutputPolicySetting "ICA\Printing\Universal Printing\Universal printing preview preference: " $tmp
							}
							$tmp = $Null
						}
						If( ( validStateProp $Setting DPILimit State ) -and ($Setting.DPILimit.State -ne "NotConfigured"))
						{
							$tmp = ""
							Switch ($Setting.DPILimit.Value)
							{
								"Draft"				{$tmp = "Draft (150 DPI)"; Break}
								"LowResolution"		{$tmp = "Low Resolution (300 DPI)"; Break}
								"MediumResolution"	{$tmp = "Medium Resolution (600 DPI)"; Break}
								"HighResolution"	{$tmp = "High Resolution (1200 DPI)"; Break}
								"Unlimited"			{$tmp = "No Limit"; Break}
								Default {$tmp = "Universal printing print quality limit could not be determined: $($Setting.DPILimit.Value)"; Break}
							}
							
							If($MSWord -or $PDF)
							{
								$WordTableRowHash = @{
								Text = "ICA\Printing\Universal Printing\Universal printing print quality limit";
								Value = $tmp;
								}
								$SettingsWordTable += $WordTableRowHash;
								$CurrentServiceIndex++;
							}
							Else
							{
								OutputPolicySetting "ICA\Printing\Universal Printing\Universal printing print quality limit: " $tmp
							}
							$tmp = $Null
						}

						Write-Verbose "$(Get-Date -Format G): `t`t`tICA\Session Limits"
						If( ( validStateProp $Setting SessionDisconnectTimer State ) -and ($Setting.SessionDisconnectTimer.State -ne "NotConfigured"))
						{
							If($MSWord -or $PDF)
							{
								$WordTableRowHash = @{
								Text = "ICA\Session Limits\Disconnected session timer";
								Value = $Setting.SessionDisconnectTimer.State;
								}
								$SettingsWordTable += $WordTableRowHash;
								$CurrentServiceIndex++;
							}
							Else
							{
								OutputPolicySetting "ICA\Session Limits\Disconnected session timer: " $Setting.SessionDisconnectTimer.State
							}
						}
						If( ( validStateProp $Setting SessionDisconnectTimerInterval State ) -and ($Setting.SessionDisconnectTimerInterval.State -ne "NotConfigured"))
						{
							If($MSWord -or $PDF)
							{
								$WordTableRowHash = @{
								Text = "ICA\Session Limits\Disconnected session timer interval (minutes)";
								Value = $Setting.SessionDisconnectTimerInterval.Value;
								}
								$SettingsWordTable += $WordTableRowHash;
								$CurrentServiceIndex++;
							}
							Else
							{
								OutputPolicySetting "ICA\Session Limits\Disconnected session timer interval (minutes): " $Setting.SessionDisconnectTimerInterval.Value
							}
						}
						If( ( validStateProp $Setting SessionConnectionTimer State ) -and ($Setting.SessionConnectionTimer.State -ne "NotConfigured"))
						{
							If($MSWord -or $PDF)
							{
								$WordTableRowHash = @{
								Text = "ICA\Session Limits\Session connection timer";
								Value = $Setting.SessionConnectionTimer.State;
								}
								$SettingsWordTable += $WordTableRowHash;
								$CurrentServiceIndex++;
							}
							Else
							{
								OutputPolicySetting "ICA\Session Limits\Session connection timer: " $Setting.SessionConnectionTimer.State
							}
						}
						If( ( validStateProp $Setting SessionConnectionTimerInterval State ) -and ($Setting.SessionConnectionTimerInterval.State -ne "NotConfigured"))
						{
							If($MSWord -or $PDF)
							{
								$WordTableRowHash = @{
								Text = "ICA\Session Limits\Session connection timer interval - (minutes)";
								Value = $Setting.SessionConnectionTimerInterval.Value;
								}
								$SettingsWordTable += $WordTableRowHash;
								$CurrentServiceIndex++;
							}
							Else
							{
								OutputPolicySetting "ICA\Session Limits\Session connection timer interval - (minutes): " $Setting.SessionConnectionTimerInterval.Value
							}
						}
						If( ( validStateProp $Setting SessionIdleTimer State ) -and ($Setting.SessionIdleTimer.State -ne "NotConfigured"))
						{
							If($MSWord -or $PDF)
							{
								$WordTableRowHash = @{
								Text = "ICA\Session Limits\Session idle timer";
								Value = $Setting.SessionIdleTimer.State;
								}
								$SettingsWordTable += $WordTableRowHash;
								$CurrentServiceIndex++;
							}
							Else
							{
								OutputPolicySetting "ICA\Session Limits\Session idle timer: " $Setting.SessionIdleTimer.State
							}
						}
						If( ( validStateProp $Setting SessionIdleTimerInterval State ) -and ($Setting.SessionIdleTimerInterval.State -ne "NotConfigured"))
						{
							If($MSWord -or $PDF)
							{
								$WordTableRowHash = @{
								Text = "ICA\Session Limits\Session idle timer interval - (minutes)";
								Value = $Setting.SessionIdleTimerInterval.Value;
								}
								$SettingsWordTable += $WordTableRowHash;
								$CurrentServiceIndex++;
							}
							Else
							{
								OutputPolicySetting "ICA\Session Limits\Session idle timer interval - (minutes): " $Setting.SessionIdleTimerInterval.Value
							}
						}

						Write-Verbose "$(Get-Date -Format G): `t`t`tICA\Time Zone Control"
						If( ( validStateProp $Setting SessionTimeZone State ) -and ($Setting.SessionTimeZone.State -ne "NotConfigured"))
						{
							$tmp = ""
							Switch ($Setting.SessionTimeZone.Value)
							{
								"UseServerTimeZone" {$tmp = "Use server time zone"; Break}
								"UseClientTimeZone" {$tmp = "Use client time zone"; Break}
								Default {$tmp = "Use local time of client could not be determined: $($Setting.SessionTimeZone.Value)"; Break}
							}
							
							If($MSWord -or $PDF)
							{
								$WordTableRowHash = @{
								Text = "ICA\Time Zone Control\Use local time of client";
								Value = $tmp;
								}
								$SettingsWordTable += $WordTableRowHash;
								$CurrentServiceIndex++;
							}
							Else
							{
								OutputPolicySetting "ICA\Time Zone Control\Use local time of client: " $tmp
							}
							$tmp = $Null
						}

						Write-Verbose "$(Get-Date -Format G): `t`t`tICA\TWAIN Devices"
						If( ( validStateProp $Setting TwainRedirection State ) -and ($Setting.TwainRedirection.State -ne "NotConfigured"))
						{
							If($MSWord -or $PDF)
							{
								$WordTableRowHash = @{
								Text = "ICA\TWAIN devices\Client TWAIN device redirection";
								Value = $Setting.TwainRedirection.State;
								}
								$SettingsWordTable += $WordTableRowHash;
								$CurrentServiceIndex++;
							}
							Else
							{
								OutputPolicySetting "ICA\TWAIN devices\Client TWAIN device redirection: " $Setting.TwainRedirection.State
							}
						}
						If( ( validStateProp $Setting TwainCompressionLevel State ) -and ($Setting.TwainCompressionLevel.State -ne "NotConfigured"))
						{
							Switch ($Setting.TwainCompressionLevel.Value)
							{
								"None"   {$tmp = "None"; Break}
								"Low"    {$tmp = "Low"; Break}
								"Medium" {$tmp = "Medium"; Break}
								"High"   {$tmp = "High"; Break}
								Default {$tmp = "TWAIN compression level could not be determined: $($Setting.TwainCompressionLevel.Value)"; Break}
							}

							If($MSWord -or $PDF)
							{
								$WordTableRowHash = @{
								Text = "ICA\TWAIN devices\TWAIN compression level";
								Value = $tmp;
								}
								$SettingsWordTable += $WordTableRowHash;
								$CurrentServiceIndex++;
							}
							Else
							{
								OutputPolicySetting "ICA\TWAIN devices\TWAIN compression level: " $tmp
							}
							$tmp = $Null
						}

						Write-Verbose "$(Get-Date -Format G): `t`t`tICA\USB Devices"
						If( ( validStateProp $Setting UsbDeviceRedirection State ) -and ($Setting.UsbDeviceRedirection.State -ne "NotConfigured"))
						{
							If($MSWord -or $PDF)
							{
								$WordTableRowHash = @{
								Text = "ICA\USB devices\Client USB device redirection";
								Value = $Setting.UsbDeviceRedirection.State;
								}
								$SettingsWordTable += $WordTableRowHash;
								$CurrentServiceIndex++;
							}
							Else
							{
								OutputPolicySetting "ICA\USB devices\Client USB device redirection: " $Setting.UsbDeviceRedirection.State
							}
						}
						If( ( validStateProp $Setting UsbDeviceRedirectionRules State ) -and ($Setting.UsbDeviceRedirectionRules.State -ne "NotConfigured"))
						{
							$array = $Setting.UsbDeviceRedirectionRules.Values
							$tmp = ""
							If($MSWord -or $PDF)
							{
								$WordTableRowHash = @{
								Text = "ICA\USB devices\Client USB device redirection rules";
								Value = $tmp;
								}
								$SettingsWordTable += $WordTableRowHash;
								$CurrentServiceIndex++;
							}
							Else
							{
								OutputPolicySetting "ICA\USB devices\Client USB device redirection rules: " $tmp
							}

							ForEach($element in $array)
							{
								$tmp = "$($element) "
								If($MSWord -or $PDF)
								{
									$WordTableRowHash = @{
									Text = "";
									Value = $tmp;
									}
									$SettingsWordTable += $WordTableRowHash;
									$CurrentServiceIndex++;
								}
								Else
								{
									OutputPolicySetting "" $tmp
								}
							}
							$tmp = " "
							If($MSWord -or $PDF)
							{
							}
							Else
							{
								OutputPolicySetting "" $tmp
							}
							$array = $Null
							$tmp = $Null
						}

						Write-Verbose "$(Get-Date -Format G): `t`t`tICA\Visual Display"
						If( ( validStateProp $Setting FramesPerSecond State ) -and ($Setting.FramesPerSecond.State -ne "NotConfigured"))
						{
							If($MSWord -or $PDF)
							{
								$WordTableRowHash = @{
								Text = "ICA\Visual Display\Max Frames Per Second (fps)";
								Value = $Setting.FramesPerSecond.Value;
								}
								$SettingsWordTable += $WordTableRowHash;
								$CurrentServiceIndex++;
							}
							Else
							{
								OutputPolicySetting "ICA\Visual Display\Max Frames Per Second (fps): " $Setting.FramesPerSecond.Value
							}
						}

						Write-Verbose "$(Get-Date -Format G): `t`t`tICA\Visual Display\Moving Images"
						If( ( validStateProp $Setting MinimumAdaptiveDisplayJpegQuality State ) -and ($Setting.MinimumAdaptiveDisplayJpegQuality.State -ne "NotConfigured"))
						{
							If($MSWord -or $PDF)
							{
								$WordTableRowHash = @{
								Text = "ICA\Visual Display\Moving Images\Minimum Image Quality";
								Value = $Setting.MinimumAdaptiveDisplayJpegQuality.Value;
								}
								$SettingsWordTable += $WordTableRowHash;
								$CurrentServiceIndex++;
							}
							Else
							{
								OutputPolicySetting "ICA\Visual Display\Moving Images\Minimum Image Quality: " $Setting.MinimumAdaptiveDisplayJpegQuality.Value
							}
						}
						If( ( validStateProp $Setting MovingImageCompressionConfiguration State ) -and ($Setting.MovingImageCompressionConfiguration.State -ne "NotConfigured"))
						{
							If($MSWord -or $PDF)
							{
								$WordTableRowHash = @{
								Text = "ICA\Visual Display\Moving Images\Moving Image Compression";
								Value = $Setting.MovingImageCompressionConfiguration.State;
								}
								$SettingsWordTable += $WordTableRowHash;
								$CurrentServiceIndex++;
							}
							Else
							{
								OutputPolicySetting "ICA\Visual Display\Moving Images\Moving Image Compression: " $Setting.MovingImageCompressionConfiguration.State
							}
						}
						If( ( validStateProp $Setting ProgressiveCompressionLevel State ) -and ($Setting.ProgressiveCompressionLevel.State -ne "NotConfigured"))
						{
							$tmp = ""
							Switch ($Setting.ProgressiveCompressionLevel.Value)
							{
								"UltraHigh" {$tmp = "Ultra high"; Break}
								"VeryHigh"  {$tmp = "Very high"; Break}
								"High"      {$tmp = "High"; Break}
								"Normal"    {$tmp = "Normal"; Break}
								"Low"       {$tmp = "Low"; Break}
								"None"      {$tmp = "None"; Break}
								Default {$tmp = "Progressive compression level could not be determined: $($Setting.ProgressiveCompressionLevel.Value)"; Break}
							}
							
							If($MSWord -or $PDF)
							{
								$WordTableRowHash = @{
								Text = "ICA\Visual Display\Moving Images\Progressive compression level";
								Value = $tmp;
								}
								$SettingsWordTable += $WordTableRowHash;
								$CurrentServiceIndex++;
							}
							Else
							{
								OutputPolicySetting "ICA\Visual Display\Moving Images\Progressive compression level: " $tmp
							}
							$tmp = $Null
						}
						If( ( validStateProp $Setting ProgressiveCompressionThreshold State ) -and ($Setting.ProgressiveCompressionThreshold.State -ne "NotConfigured"))
						{
							If($MSWord -or $PDF)
							{
								$WordTableRowHash = @{
								Text = "ICA\Visual Display\Moving Images\Progressive compression threshold value (Kbps)";
								Value = $Setting.ProgressiveCompressionThreshold.Value;
								}
								$SettingsWordTable += $WordTableRowHash;
								$CurrentServiceIndex++;
							}
							Else
							{
								OutputPolicySetting "ICA\Visual Display\Moving Images\Progressive compression threshold value (Kbps): " $Setting.ProgressiveCompressionThreshold.Value
							}
						}
						If( ( validStateProp $Setting TargetedMinimumFramesPerSecond State ) -and ($Setting.TargetedMinimumFramesPerSecond.State -ne "NotConfigured"))
						{
							If($MSWord -or $PDF)
							{
								$WordTableRowHash = @{
								Text = "ICA\Visual Display\Moving Images\Target Minimum Frame Rate (fps)";
								Value = $Setting.TargetedMinimumFramesPerSecond.Value;
								}
								$SettingsWordTable += $WordTableRowHash;
								$CurrentServiceIndex++;
							}
							Else
							{
								OutputPolicySetting "ICA\Visual Display\Moving Images\Target Minimum Frame Rate (fps): " $Setting.TargetedMinimumFramesPerSecond.Value
							}
						}

						Write-Verbose "$(Get-Date -Format G): `t`t`tICA\Visual Display\Still Images"
						If( ( validStateProp $Setting ExtraColorCompression State ) -and ($Setting.ExtraColorCompression.State -ne "NotConfigured"))
						{
							If($MSWord -or $PDF)
							{
								$WordTableRowHash = @{
								Text = "ICA\Visual Display\Still Images\Extra Color Compression";
								Value = $Setting.ExtraColorCompression.State;
								}
								$SettingsWordTable += $WordTableRowHash;
								$CurrentServiceIndex++;
							}
							Else
							{
								OutputPolicySetting "ICA\Visual Display\Still Images\Extra Color Compression: " $Setting.ExtraColorCompression.State
							}
						}
						If( ( validStateProp $Setting ExtraColorCompressionThreshold State ) -and ($Setting.ExtraColorCompressionThreshold.State -ne "NotConfigured"))
						{
							If($MSWord -or $PDF)
							{
								$WordTableRowHash = @{
								Text = "ICA\Visual Display\Still Images\Extra Color Compression Threshold (Kbps)";
								Value = $Setting.ExtraColorCompressionThreshold.Value;
								}
								$SettingsWordTable += $WordTableRowHash;
								$CurrentServiceIndex++;
							}
							Else
							{
								OutputPolicySetting "ICA\Visual Display\Still Images\Extra Color Compression Threshold (Kbps): " $Setting.ExtraColorCompressionThreshold.Value
							}
						}
						If( ( validStateProp $Setting ProgressiveHeavyweightCompression State ) -and ($Setting.ProgressiveHeavyweightCompression.State -ne "NotConfigured"))
						{
							If($MSWord -or $PDF)
							{
								$WordTableRowHash = @{
								Text = "ICA\Visual Display\Still Images\Heavyweight compression";
								Value = $Setting.ProgressiveHeavyweightCompression.State;
								}
								$SettingsWordTable += $WordTableRowHash;
								$CurrentServiceIndex++;
							}
							Else
							{
								OutputPolicySetting "ICA\Visual Display\Still Images\Heavyweight compression: " $Setting.ProgressiveHeavyweightCompression.State
							}
						}
						If( ( validStateProp $Setting LossyCompressionLevel State ) -and ($Setting.LossyCompressionLevel.State -ne "NotConfigured"))
						{
							$tmp = ""
							Switch ($Setting.LossyCompressionLevel.Value)
							{
								"None"   {$tmp = "None"; Break}
								"Low"    {$tmp = "Low"; Break}
								"Medium" {$tmp = "Medium"; Break}
								"High"   {$tmp = "High"; Break}
								Default {$tmp = "Lossy compression level could not be determined: $($Setting.LossyCompressionLevel.Value)"; Break}
							}
							
							If($MSWord -or $PDF)
							{
								$WordTableRowHash = @{
								Text = "ICA\Visual Display\Still Images\Lossy compression level";
								Value = $tmp;
								}
								$SettingsWordTable += $WordTableRowHash;
								$CurrentServiceIndex++;
							}
							Else
							{
								OutputPolicySetting "ICA\Visual Display\Still Images\Lossy compression level: " $tmp
							}
							$tmp = $Null
						}
						If( ( validStateProp $Setting LossyCompressionThreshold State ) -and ($Setting.LossyCompressionThreshold.State -ne "NotConfigured"))
						{
							If($MSWord -or $PDF)
							{
								$WordTableRowHash = @{
								Text = "ICA\Visual Display\Still Images\Lossy compression threshold value (Kbps)";
								Value = $Setting.LossyCompressionThreshold.Value;
								}
								$SettingsWordTable += $WordTableRowHash;
								$CurrentServiceIndex++;
							}
							Else
							{
								OutputPolicySetting "ICA\Visual Display\Still Images\Lossy compression threshold value (Kbps): " $Setting.LossyCompressionThreshold.Value
							}
						}

						Write-Verbose "$(Get-Date -Format G): `t`t`tServer Session Settings"
						If( ( validStateProp $Setting SingleSignOn State ) -and ($Setting.SingleSignOn.State -ne "NotConfigured"))
						{
							If($MSWord -or $PDF)
							{
								$WordTableRowHash = @{
								Text = "Server Session Settings\Single Sign-On";
								Value = $Setting.SingleSignOn.State;
								}
								$SettingsWordTable += $WordTableRowHash;
								$CurrentServiceIndex++;
							}
							Else
							{
								OutputPolicySetting "Server Session Settings\Single Sign-On: " $Setting.SingleSignOn.State
							}
						}
						If( ( validStateProp $Setting SingleSignOnCentralStore State ) -and ($Setting.SingleSignOnCentralStore.State -ne "NotConfigured"))
						{
							If($MSWord -or $PDF)
							{
								$WordTableRowHash = @{
								Text = "Server Session Settings\Single Sign-On central store";
								Value = $Setting.SingleSignOnCentralStore.Value;
								}
								$SettingsWordTable += $WordTableRowHash;
								$CurrentServiceIndex++;
							}
							Else
							{
								OutputPolicySetting "Server Session Settings\Single Sign-On central store: " $Setting.SingleSignOnCentralStore.Value
							}
						}

						Write-Verbose "$(Get-Date -Format G): `t`t`tVirtual Desktop Agent Settings\HDX3DPro"
						If( ( validStateProp $Setting EnableLossless State ) -and ($Setting.EnableLossless.State -ne "NotConfigured"))
						{
							If($MSWord -or $PDF)
							{
								$WordTableRowHash = @{
								Text = "Virtual Desktop Agent Settings\HDX3DPro\EnableLossless";
								Value = $Setting.EnableLossless.State;
								}
								$SettingsWordTable += $WordTableRowHash;
								$CurrentServiceIndex++;
							}
							Else
							{
								OutputPolicySetting "Virtual Desktop Agent Settings\HDX3DPro\EnableLossless: " $Setting.EnableLossless.State
							}
						}
						If( ( validStateProp $Setting ProGraphicsObj State ) -and ($Setting.ProGraphicsObj.State -ne "NotConfigured"))
						{
							$tmp = ""
							$xMin = [math]::floor($Setting.ProGraphicsObj.Value%65536).ToString()
							$xMax = [math]::floor($Setting.ProGraphicsObj.Value/65536).ToString()
							$tmp = "Minimum: $($xMin) Maximum: $($xMax)"
							
							If($MSWord -or $PDF)
							{
								$WordTableRowHash = @{
								Text = "Virtual Desktop Agent Settings\HDX3DPro\HDX3DPro Quality Settings";
								Value = $tmp;
								}
								$SettingsWordTable += $WordTableRowHash;
								$CurrentServiceIndex++;
							}
							Else
							{
								OutputPolicySetting "Virtual Desktop Agent Settings\HDX3DPro\HDX3DPro Quality Settings: " $tmp
							}
							$tmp = $Null
						}

						Write-Verbose "$(Get-Date -Format G): `t`t`tVirtual Desktop Agent Settings\ICA Latency Monitoring"
						If( ( validStateProp $Setting ICALatencyMonitoring_Enable State ) -and ($Setting.ICALatencyMonitoring_Enable.State -ne "NotConfigured"))
						{
							If($MSWord -or $PDF)
							{
								$WordTableRowHash = @{
								Text = "Virtual Desktop Agent Settings\ICA Latency Monitoring\Enable Monitoring";
								Value = $Setting.ICALatencyMonitoring_Enable.State;
								}
								$SettingsWordTable += $WordTableRowHash;
								$CurrentServiceIndex++;
							}
							Else
							{
								OutputPolicySetting "Virtual Desktop Agent Settings\ICA Latency Monitoring\Enable Monitoring: " $Setting.ICALatencyMonitoring_Enable.State
							}
						}
						If( ( validStateProp $Setting ICALatencyMonitoring_Period State ) -and ($Setting.ICALatencyMonitoring_Period.State -ne "NotConfigured"))
						{
							If($MSWord -or $PDF)
							{
								$WordTableRowHash = @{
								Text = "Virtual Desktop Agent Settings\ICA Latency Monitoring\Monitoring Period seconds";
								Value = $Setting.ICALatencyMonitoring_Period.Value;
								}
								$SettingsWordTable += $WordTableRowHash;
								$CurrentServiceIndex++;
							}
							Else
							{
								OutputPolicySetting "Virtual Desktop Agent Settings\ICA Latency Monitoring\Monitoring Period seconds: " $Setting.ICALatencyMonitoring_Period.Value
							}
						}
						If( ( validStateProp $Setting ICALatencyMonitoring_Threshold State ) -and ($Setting.ICALatencyMonitoring_Threshold.State -ne "NotConfigured"))
						{
							If($MSWord -or $PDF)
							{
								$WordTableRowHash = @{
								Text = "Virtual Desktop Agent Settings\ICA Latency Monitoring\Threshold milliseconds";
								Value = $Setting.ICALatencyMonitoring_Threshold.Value;
								}
								$SettingsWordTable += $WordTableRowHash;
								$CurrentServiceIndex++;
							}
							Else
							{
								OutputPolicySetting "Virtual Desktop Agent Settings\ICA Latency Monitoring\Threshold milliseconds: " $Setting.ICALatencyMonitoring_Threshold.Value
							}
						}

						Write-Verbose "$(Get-Date -Format G): `t`t`tVirtual Desktop Agent Settings\Profile Load Time Monitoring"
						If( ( validStateProp $Setting ProfileLoadTimeMonitoring_Enable State ) -and ($Setting.ProfileLoadTimeMonitoring_Enable.State -ne "NotConfigured"))
						{
							If($MSWord -or $PDF)
							{
								$WordTableRowHash = @{
								Text = "Virtual Desktop Agent Settings\Profile Load Time Monitoring\Enable Monitoring";
								Value = $Setting.ProfileLoadTimeMonitoring_Enable.State;
								}
								$SettingsWordTable += $WordTableRowHash;
								$CurrentServiceIndex++;
							}
							Else
							{
								OutputPolicySetting "Virtual Desktop Agent Settings\Profile Load Time Monitoring\Enable Monitoring: " $Setting.ProfileLoadTimeMonitoring_Enable.State
							}
						}
						If( ( validStateProp $Setting ProfileLoadTimeMonitoring_Threshold State ) -and ($Setting.ProfileLoadTimeMonitoring_Threshold.State -ne "NotConfigured"))
						{
							If($MSWord -or $PDF)
							{
								$WordTableRowHash = @{
								Text = "Virtual Desktop Agent Settings\Profile Load Time Monitoring\Threshold seconds";
								Value = $Setting.ProfileLoadTimeMonitoring_Threshold.Value;
								}
								$SettingsWordTable += $WordTableRowHash;
								$CurrentServiceIndex++;
							}
							Else
							{
								OutputPolicySetting "Virtual Desktop Agent Settings\Profile Load Time Monitoring\Threshold seconds: " $Setting.ProfileLoadTimeMonitoring_Threshold.Value
							}
						}
					}
				}
				If($MSWord -or $PDF)
				{
					## Add the table to the document, using the hashtable (-Alt is short for -AlternateBackgroundColor!)
					$Table = AddWordTable -Hashtable $SettingsWordTable `
					-Columns  Text,Value `
					-Headers  "Setting Key","Value" `
					-Format $wdTableGrid `
					-AutoFit $wdAutoFitFixed;

					## IB - Set the header row format after the SetWordTableAlternateRowColor function as it will paint the header row!
					SetWordCellFormat -Collection $Table.Rows.Item(1).Cells -Bold -BackgroundColor $wdColorGray15;

					$Table.Columns.Item(1).Width = 300
					$Table.Columns.Item(2).Width = 200;

					#indent the entire table 1 tab stop
					$Table.Rows.SetLeftIndent($Indent0TabStops,$wdAdjustProportional)

					FindWordDocumentEnd
					$Table = $Null
				}
				ElseIf($Text)
				{
					Line 0 ""
				}
				ElseIf($HTML)
				{
					WriteHTMLLine 0 0 " "
				}
			}
			Else
			{
				$txt = "Unable to retrieve settings"
				If($MSWord -or $PDF)
				{
					WriteWordLine 0 1 $txt
				}
				ElseIf($Text)
				{
					Line 2 $txt
				}
				ElseIf($HTML)
				{
					WriteHTMLLine 0 1 $txt
				}
			}
			$Filter = $Null
			$Settings = $Null
			Write-Verbose "$(Get-Date -Format G): `t`tFinished $($Policy.PolicyName)`t$($Policy.Type)"
			Write-Verbose "$(Get-Date -Format G): "
		}
	}
	ElseIf(!$?)
	{
		Write-Warning "Citrix Policy information could not be retrieved"
	}
	Else
	{
		Write-Warning "No results returned for Citrix Policy information"
	}
	
	$Policies = $Null
	Write-Verbose "$(Get-Date -Format G): `tRemoving $($xDriveName) PSDrive"
	Remove-PSDrive $xDriveName -EA 0
	Write-Verbose "$(Get-Date -Format G): "
}

Function OutputPolicySetting
{
	Param([string] $outputText, [string] $outputData)
	
	If($MSWord -or $PDF)
	{
		WriteWordLine 0 1 $outputText $outputData
	}
	ElseIf($Text)
	{
		Line 2 $outputText $outputData
	}
	ElseIf($HTML)
	{
		WriteHTMLLine 0 1 $outputText $outputData
	}
}

Function Get-PrinterModifiedSettings
{
	Param([string]$Value, [string]$xelement)
	
	[string]$ReturnStr = ""

	Switch ($Value)
	{
		"copi" 
		{
			$txt="Copies: "
			$index = $xelement.SubString(0).IndexOf('=')
			if($index -ge 0)
			{
				$tmp2 = $xelement.SubString($index + 1)
				$ReturnStr = "$txt $tmp2"
			}
		}
		"coll"
		{
			$txt="Collate: "
			$index = $xelement.SubString(0).IndexOf('=')
			if($index -ge 0)
			{
				$tmp2 = $xelement.SubString($index + 1)
				$ReturnStr = "$txt $tmp2"
			}
		}
		"scal"
		{
			$txt="Scale (%): "
			$index = $xelement.SubString(0).IndexOf('=')
			if($index -ge 0)
			{
				$tmp2 = $xelement.SubString($index + 1)
				$ReturnStr = "$txt $tmp2"
			}
		}
		"colo"
		{
			$txt="Color: "
			$index = $xelement.SubString(0).IndexOf('=')
			if($index -ge 0)
			{
				$tmp1 = $xelement.SubString($index + 1)
				Switch ($tmp1)
				{
					1 {$tmp2 = "Monochrome"; Break}
					2 {$tmp2 = "Color"; Break}
					Default {$tmp2 = "Color could not be determined: $($xelement) "; Break}
				}
				$ReturnStr = "$txt $tmp2"
			}
		}
		"prin"
		{
			$txt="Print Quality: "
			$index = $xelement.SubString(0).IndexOf('=')
			if($index -ge 0)
			{
				$tmp1 = $xelement.SubString($index + 1)
				Switch ($tmp1)
				{
					-1 {$tmp2 = "150 dpi"; Break}
					-2 {$tmp2 = "300 dpi"; Break}
					-3 {$tmp2 = "600 dpi"; Break}
					-4 {$tmp2 = "1200 dpi"; Break}
					Default 
					{
						$tmp2 = "Custom...X resolution: $tmp1"; Break
					}
				}
				$ReturnStr = "$txt $tmp2"
			}
		}
		"yres"
		{
			$txt="Y resolution: "
			$index = $xelement.SubString(0).IndexOf('=')
			if($index -ge 0)
			{
				$tmp2 = $xelement.SubString($index + 1)
				$ReturnStr = "$txt $tmp2"
			}
		}
		"orie"
		{
			$txt="Orientation: "
			$index = $xelement.SubString(0).IndexOf('=')
			if($index -ge 0)
			{
				$tmp1 = $xelement.SubString($index + 1)
				Switch ($tmp1)
				{
					"portrait"  {$tmp2 = "Portrait"; Break}
					"landscape" {$tmp2 = "Landscape"; Break}
					Default {$tmp2 = "Orientation could not be determined: $($xelement) "; Break}
				}
				$ReturnStr = "$txt $tmp2"
			}
		}
		"dupl"
		{
			$txt="Duplex: "
			$index = $xelement.SubString(0).IndexOf('=')
			if($index -ge 0)
			{
				$tmp1 = $xelement.SubString($index + 1)
				Switch ($tmp1)
				{
					1 {$tmp2 = "Simplex"; Break}
					2 {$tmp2 = "Vertical"; Break}
					3 {$tmp2 = "Horizontal"; Break}
					Default {$tmp2 = "Duplex could not be determined: $($xelement) "; Break}
				}
				$ReturnStr = "$txt $tmp2"
			}
		}
		"pape"
		{
			$txt="Paper Size: "
			$index = $xelement.SubString(0).IndexOf('=')
			if($index -ge 0)
			{
				$tmp1 = $xelement.SubString($index + 1)
				Switch ($tmp1)
				{
					1   {$tmp2 = "Letter"; Break}
					2   {$tmp2 = "Letter Small"; Break}
					3   {$tmp2 = "Tabloid"; Break}
					4   {$tmp2 = "Ledger"; Break}
					5   {$tmp2 = "Legal"; Break}
					6   {$tmp2 = "Statement"; Break}
					7   {$tmp2 = "Executive"; Break}
					8   {$tmp2 = "A3"; Break}
					9   {$tmp2 = "A4"; Break}
					10  {$tmp2 = "A4 Small"; Break}
					11  {$tmp2 = "A5"; Break}
					12  {$tmp2 = "B4 (JIS)"; Break}
					13  {$tmp2 = "B5 (JIS)"; Break}
					14  {$tmp2 = "Folio"; Break}
					15  {$tmp2 = "Quarto"; Break}
					16  {$tmp2 = "10X14"; Break}
					17  {$tmp2 = "11X17"; Break}
					18  {$tmp2 = "Note"; Break}
					19  {$tmp2 = "Envelope #9"; Break}
					20  {$tmp2 = "Envelope #10"; Break}
					21  {$tmp2 = "Envelope #11"; Break}
					22  {$tmp2 = "Envelope #12"; Break}
					23  {$tmp2 = "Envelope #14"; Break}
					24  {$tmp2 = "C Size Sheet"; Break}
					25  {$tmp2 = "D Size Sheet"; Break}
					26  {$tmp2 = "E Size Sheet"; Break}
					27  {$tmp2 = "Envelope DL"; Break}
					28  {$tmp2 = "Envelope C5"; Break}
					29  {$tmp2 = "Envelope C3"; Break}
					30  {$tmp2 = "Envelope C4"; Break}
					31  {$tmp2 = "Envelope C6"; Break}
					32  {$tmp2 = "Envelope C65"; Break}
					33  {$tmp2 = "Envelope B4"; Break}
					34  {$tmp2 = "Envelope B5"; Break}
					35  {$tmp2 = "Envelope B6"; Break}
					36  {$tmp2 = "Envelope Italy"; Break}
					37  {$tmp2 = "Envelope Monarch"; Break}
					38  {$tmp2 = "Envelope Personal"; Break}
					39  {$tmp2 = "US Std Fanfold"; Break}
					40  {$tmp2 = "German Std Fanfold"; Break}
					41  {$tmp2 = "German Legal Fanfold"; Break}
					42  {$tmp2 = "B4 (ISO)"; Break}
					43  {$tmp2 = "Japanese Postcard"; Break}
					44  {$tmp2 = "9X11"; Break}
					45  {$tmp2 = "10X11"; Break}
					46  {$tmp2 = "15X11"; Break}
					47  {$tmp2 = "Envelope Invite"; Break}
					48  {$tmp2 = "Reserved - DO NOT USE"; Break}
					49  {$tmp2 = "Reserved - DO NOT USE"; Break}
					50  {$tmp2 = "Letter Extra"; Break}
					51  {$tmp2 = "Legal Extra"; Break}
					52  {$tmp2 = "Tabloid Extra"; Break}
					53  {$tmp2 = "A4 Extra"; Break}
					54  {$tmp2 = "Letter Transverse"; Break}
					55  {$tmp2 = "A4 Transverse"; Break}
					56  {$tmp2 = "Letter Extra Transverse"; Break}
					57  {$tmp2 = "A Plus"; Break}
					58  {$tmp2 = "B Plus"; Break}
					59  {$tmp2 = "Letter Plus"; Break}
					60  {$tmp2 = "A4 Plus"; Break}
					61  {$tmp2 = "A5 Transverse"; Break}
					62  {$tmp2 = "B5 (JIS) Transverse"; Break}
					63  {$tmp2 = "A3 Extra"; Break}
					64  {$tmp2 = "A5 Extra"; Break}
					65  {$tmp2 = "B5 (ISO) Extra"; Break}
					66  {$tmp2 = "A2"; Break}
					67  {$tmp2 = "A3 Transverse"; Break}
					68  {$tmp2 = "A3 Extra Transverse"; Break}
					69  {$tmp2 = "Japanese Double Postcard"; Break}
					70  {$tmp2 = "A6"; Break}
					71  {$tmp2 = "Japanese Envelope Kaku #2"; Break}
					72  {$tmp2 = "Japanese Envelope Kaku #3"; Break}
					73  {$tmp2 = "Japanese Envelope Chou #3"; Break}
					74  {$tmp2 = "Japanese Envelope Chou #4"; Break}
					75  {$tmp2 = "Letter Rotated"; Break}
					76  {$tmp2 = "A3 Rotated"; Break}
					77  {$tmp2 = "A4 Rotated"; Break}
					78  {$tmp2 = "A5 Rotated"; Break}
					79  {$tmp2 = "B4 (JIS) Rotated"; Break}
					80  {$tmp2 = "B5 (JIS) Rotated"; Break}
					81  {$tmp2 = "Japanese Postcard Rotated"; Break}
					82  {$tmp2 = "Double Japanese Postcard Rotated"; Break}
					83  {$tmp2 = "A6 Rotated"; Break}
					84  {$tmp2 = "Japanese Envelope Kaku #2 Rotated"; Break}
					85  {$tmp2 = "Japanese Envelope Kaku #3 Rotated"; Break}
					86  {$tmp2 = "Japanese Envelope Chou #3 Rotated"; Break}
					87  {$tmp2 = "Japanese Envelope Chou #4 Rotated"; Break}
					88  {$tmp2 = "B6 (JIS)"; Break}
					89  {$tmp2 = "B6 (JIS) Rotated"; Break}
					90  {$tmp2 = "12X11"; Break}
					91  {$tmp2 = "Japanese Envelope You #4"; Break}
					92  {$tmp2 = "Japanese Envelope You #4 Rotated"; Break}
					93  {$tmp2 = "PRC 16K"; Break}
					94  {$tmp2 = "PRC 32K"; Break}
					95  {$tmp2 = "PRC 32K(Big)"; Break}
					96  {$tmp2 = "PRC Envelope #1"; Break}
					97  {$tmp2 = "PRC Envelope #2"; Break}
					98  {$tmp2 = "PRC Envelope #3"; Break}
					99  {$tmp2 = "PRC Envelope #4"; Break}
					100 {$tmp2 = "PRC Envelope #5"; Break}
					101 {$tmp2 = "PRC Envelope #6"; Break}
					102 {$tmp2 = "PRC Envelope #7"; Break}
					103 {$tmp2 = "PRC Envelope #8"; Break}
					104 {$tmp2 = "PRC Envelope #9"; Break}
					105 {$tmp2 = "PRC Envelope #10"; Break}
					106 {$tmp2 = "PRC 16K Rotated"; Break}
					107 {$tmp2 = "PRC 32K Rotated"; Break}
					108 {$tmp2 = "PRC 32K(Big) Rotated"; Break}
					109 {$tmp2 = "PRC Envelope #1 Rotated"; Break}
					110 {$tmp2 = "PRC Envelope #2 Rotated"; Break}
					111 {$tmp2 = "PRC Envelope #3 Rotated"; Break}
					112 {$tmp2 = "PRC Envelope #4 Rotated"; Break}
					113 {$tmp2 = "PRC Envelope #5 Rotated"; Break}
					114 {$tmp2 = "PRC Envelope #6 Rotated"; Break}
					115 {$tmp2 = "PRC Envelope #7 Rotated"; Break}
					116 {$tmp2 = "PRC Envelope #8 Rotated"; Break}
					117 {$tmp2 = "PRC Envelope #9 Rotated"; Break}
					Default {$tmp2 = "Paper Size could not be determined: $($xelement) "; Break}
				}
				$ReturnStr = "$txt $tmp2"
			}
		}
		"form"
		{
			$txt="Form Name: "
			$index = $xelement.SubString(0).IndexOf('=')
			if($index -ge 0)
			{
				$tmp2 = $xelement.SubString($index + 1)
				If($tmp2.length -gt 0)
				{
					$ReturnStr = "$txt $tmp2"
				}
			}
		}
		"true"
		{
			$txt="TrueType: "
			$index = $xelement.SubString(0).IndexOf('=')
			if($index -ge 0)
			{
				$tmp1 = $xelement.SubString($index + 1)
				Switch ($tmp1)
				{
					1 {$tmp2 = "Bitmap"; Break}
					2 {$tmp2 = "Download"; Break}
					3 {$tmp2 = "Substitute"; Break}
					4 {$tmp2 = "Outline"; Break}
					Default {$tmp2 = "TrueType could not be determined: $($xelement) "; Break}
				}
			}
			$ReturnStr = "$txt $tmp2"
		}
		"mode" 
		{
			$txt="Printer Model: "
			$index = $xelement.SubString(0).IndexOf('=')
			if($index -ge 0)
			{
				$tmp2 = $xelement.SubString($index + 1)
				$ReturnStr = "$txt $tmp2"
			}
		}
		"loca" 
		{
			$txt="Location: "
			$index = $xelement.SubString(0).IndexOf('=')
			if($index -ge 0)
			{
				$tmp2 = $xelement.SubString($index + 1)
				If($tmp2.length -gt 0)
				{
					$ReturnStr = "$txt $tmp2"
				}
			}
		}
		Default {$ReturnStr = "Session printer setting could not be determined: $($xelement) "}
	}
	Return $ReturnStr
}

Function GetCtxGPOsInAD
{
	#thanks to the Citrix Engineering Team for pointers and for Michael B. Smith for creating the function
	#updated 07-Nov-13 to work in a Windows Workgroup environment
	Write-Verbose "$(Get-Date -Format G): Testing for an Active Directory environment"
	$root = [ADSI]"LDAP://RootDSE"
	If([String]::IsNullOrEmpty($root.PSBase.Name))
	{
		Write-Verbose "$(Get-Date -Format G): `tNot in an Active Directory environment"
		$root = $Null
		$xArray = @()
	}
	Else
	{
		Write-Verbose "$(Get-Date -Format G): `tIn an Active Directory environment"
		$domainNC = $root.defaultNamingContext.ToString()
		$root = $Null
		$xArray = @()

		$domain = $domainNC.Replace( 'DC=', '' ).Replace( ',', '.' )
		Write-Verbose "$(Get-Date -Format G): `tSearching \\$($domain)\sysvol\$($domain)\Policies"
		$sysvolFiles = @()
		$sysvolFiles = Get-ChildItem -Recurse ( '\\' + $domain  + '\sysvol\' + $domain + '\Policies' ) -EA 0
		If($sysvolFiles.Count -eq 0)
		{
			Write-Verbose "$(Get-Date -Format G): `tSearch timed out. Retrying. Searching \\ + $($domain)\sysvol\$($domain)\Policies a second time."
			$sysvolFiles = Get-ChildItem -Recurse ( '\\' + $domain  + '\sysvol\' + $domain + '\Policies' ) -EA 0
		}
		ForEach( $file in $sysvolFiles )
		{
			If( -not $file.PSIsContainer )
			{
				#$file.FullName  ### name of the policy file
				If( $file.FullName -like "*\Citrix\GroupPolicy\Policies.gpf" )
				{
					#"have match " + $file.FullName ### name of the Citrix policies file
					$array = $file.FullName.Split( '\' )
					If( $array.Length -gt 7 )
					{
						$gp = $array[ 6 ].ToString()
						$gpObject = [ADSI]( "LDAP://" + "CN=" + $gp + ",CN=Policies,CN=System," + $domainNC )
						If(!$xArray.Contains($gpObject.DisplayName))
						{
							$xArray += $gpObject.DisplayName	### name of the group policy object
						}
					}
				}
			}
		}
	}
	Return ,$xArray
}
#endregion

#region site configuration functions
Function ProcessConfiguration
{
	Write-Verbose "$(Get-Date -Format G): Process Configuration Settings"
	OutputSiteSettings
	Write-Verbose "$(Get-Date -Format G): "
}

Function OutputSiteSettings
{
	Write-Verbose "$(Get-Date -Format G): `tOutput Site Settings"
	#line starts with server=SQLServerName;
	#only need what is between the = and ;
	Write-Verbose "$(Get-Date -Format G): `t`tGetting database connection data"
	$ConfigDB = Get-ConfigDBConnection @XDParams1


	If( !($?) -or $Null -eq $ConfigDB)
	{
		Write-Warning "XenDesktop Config Database information could not be retrieved."
	}

	$ConfigSQLServerPrincipalName = ""
	$ConfigSQLServerMirrorName = ""
	$ConfigDatabaseName = ""

	$tmp = $ConfigDB
	$csitems = $tmp.Split(';')
	ForEach($csitem in $csitems)
	{
		$Pair = $csitem.split('=')
		Switch ($Pair[0])
		{
			"Server"						{$ConfigSQLServerPrincipalName = $Pair[1]; Break}
			{$Pair[0] -match "Failover"}	{$ConfigSQLServerMirrorName = $Pair[1]; Break}
			"Database"						{$ConfigDatabaseName = $Pair[1]; Break}
			{$Pair[0] -match "Initial"}		{$ConfigDatabaseName = $Pair[1]; Break}
		}
	}

	If($MSWord -or $PDF)
	{
		Write-Verbose "$(Get-Date -Format G): `tCreate Word Table for Site Settings"
		$Selection.InsertNewPage()
		WriteWordLine 1 0 "Configuration"
		WriteWordLine 2 0 "Site wide settings"
		WriteWordLine 3 0 "Site: " 
		WriteWordLine 0 0 $XDSiteName
		WriteWordLine 3 0 "Database"
		WriteWordLine 0 0 "Server name`t`t: " -NoNewLine
		WriteWordLine 0 0 $ConfigSQLServerPrincipalName
		If(![String]::IsNullOrEmpty($ConfigSQLServerMirrorName))
		{
			WriteWordLine 0 0 "Mirror Server name`t: $($ConfigSQLServerMirrorName)" 
		}
		WriteWordLine 3 0 "Access"
		WriteWordLine 0 0 "AD organization unit`t: " -NoNewLine
		If(![String]::IsNullOrEmpty($Script:XDSite.BaseOU))
		{
			WriteWordLine 0 0 $Script:XDSite.BaseOU
		}
		Else
		{
			WriteWordLine 0 0 "-"
		}
		WriteWordLine 0 0 "DNS resolution`t`t: " -NoNewLine
		If($Script:XDSite.DnsResolutionEnabled)
		{
			WriteWordLine 0 0 "Enabled"
		}
		Else
		{
			WriteWordLine 0 0 "Disabled"
		}
		WriteWordLine 0 0 "Trust XML service`t: " -NoNewLine
		If($Script:XDSite.TrustRequestsSentToTheXmlServicePort)
		{
			WriteWordLine 0 0 "Enabled"
		}
		Else
		{
			WriteWordLine 0 0 "Disabled"
		}
	}
	ElseIf($Text)
	{
		line 0 "Configuration"
		line 1 "Site wide settings"
		line 2 "Site`t`t`t: "  $XDSiteName
		line 0 ""
		
		line 2 "Database"
		line 2 "Server name`t`t: " $ConfigSQLServerPrincipalName
		If(![String]::IsNullOrEmpty($ConfigSQLServerMirrorName))
		{
			line 2 "Mirror Server name`t: $($ConfigSQLServerMirrorName)" 
		}
		line 0 ""
		
		line 2 "Access"
		$tmp = ""
		If(![String]::IsNullOrEmpty($Script:XDSite.BaseOU))
		{
			$tmp = $Script:XDSite.BaseOU
		}
		Else
		{
			$tmp = "-"
		}
		line 2 "AD organization unit`t: " $tmp
		
		$tmp = ""
		If($Script:XDSite.DnsResolutionEnabled)
		{
			$tmp = "Enabled"
		}
		Else
		{
			$tmp = "Disabled"
		}
		line 2 "DNS resolution`t`t: " $tmp
		
		$tmp = ""
		If($Script:XDSite.TrustRequestsSentToTheXmlServicePort)
		{
			$tmp = "Enabled"
		}
		Else
		{
			$tmp = "Disabled"
		}
		line 2 "Trust XML service`t: " $tmp
	}
	ElseIf($HTML)
	{
		WriteHTMLLine 1 0 "Configuration"
		WriteHTMLLine 2 0 "Site wide settings"
		WriteHTMLLine 3 0 "Site: "  $XDSiteName
		WriteHTMLLine 3 0 "Database"
		WriteHTMLLine 0 0 "Server name: " $ConfigSQLServerPrincipalName
		If(![String]::IsNullOrEmpty($ConfigSQLServerMirrorName))
		{
			WriteHTMLLine 0 0 "Mirror Server name: $($ConfigSQLServerMirrorName)" 
		}
		WriteHTMLLine 3 0 "Access"
		
		$tmp = ""
		If(![String]::IsNullOrEmpty($Script:XDSite.BaseOU))
		{
			$tmp = $Script:XDSite.BaseOU
		}
		Else
		{
			$tmp = "-"
		}
		WriteHTMLLine 0 0 "AD organization unit: " $tmp
		
		$tmp = ""
		If($Script:XDSite.DnsResolutionEnabled)
		{
			$tmp = "Enabled"
		}
		Else
		{
			$tmp = "Disabled"
		}
		WriteHTMLLine 0 0 "DNS resolution: " $tmp
		
		$tmp = ""
		If($Script:XDSite.TrustRequestsSentToTheXmlServicePort)
		{
			$tmp = "Enabled"
		}
		Else
		{
			$tmp = "Disabled"
		}
		WriteHTMLLine 0 0 "Trust XML service: " $tmp
	}
	$tmp = $Null
}
#endregion

#region Administrator, Scope and Roles functions
Function ProcessAdministrators
{
	Write-Verbose "$(Get-Date -Format G): Getting Administrator data"
	$Admins = Get-BrokerAdministrator @XDParams2 | Sort-Object Name

	If($? -and $Null -ne $Admins)
	{
		OutputAdministrators $Admins
	}
	ElseIf($? -and $Null -eq $Admins)
	{
		$txt = "No XenDesktop Administrators were retrieved."
		OutputWarning $txt
	}
	Else
	{
		$txt = "XenDesktop Administrator information could not be retrieved."
		OutputWarning $txt
	}
}

Function OutputAdministrators
{
	Param([object]$Admins)
	
	$txt = "Administrators"
	If($MSWord -or $PDF)
	{
		$Selection.InsertNewPage()
		WriteWordLine 1 0 $txt
		[System.Collections.Hashtable[]] $AdminsWordTable = @();
		[int] $CurrentServiceIndex = 2;
	}
	ElseIf($Text)
	{
		Line 0 $txt
		Line 0 ""
	}
	ElseIf($HTML)
	{
		WriteHTMLLine 1 0 $txt
	}

	ForEach($Admin in $Admins)
	{
		Write-Verbose "$(Get-Date -Format G): `tAdding row for $($Admin.Name)"
		$tmpRole = ""
		$AllCatalogs = " "
		$AllGroups   = " "
		If( $Admin.BrokerAdmin -eq $False -and $Admin.FullAdmin -eq $True -and $Admin.ProvisioningAdmin -eq $False -and $Admin.ReadOnly -eq $False )
		{
			$tmpRole = "Full"
			$AllCatalogs = "All Catalogs"
			$AllGroups   = "All Desktop Groups"
		}
		ElseIf( $Admin.BrokerAdmin -eq $False -and $Admin.FullAdmin -eq $False -and $Admin.ProvisioningAdmin -eq $True -and $Admin.ReadOnly -eq $False )
		{
			$tmpRole = "Machine"
			$AllCatalogs = "All Catalogs"
			$AllGroups   = "-"
		}
		ElseIf( $Admin.BrokerAdmin -eq $True -and $Admin.FullAdmin -eq $False -and $Admin.ProvisioningAdmin -eq $False -and $Admin.ReadOnly -eq $False )
		{
			$tmpRole = "Assignment"
			$AllCatalogs = " "
			$AllGroups   = "All Desktop Groups"
		}
		ElseIf( $Admin.BrokerAdmin -eq $False -and $Admin.FullAdmin -eq $False -and $Admin.ProvisioningAdmin -eq $False -and $Admin.ReadOnly -eq $True )
		{
			$tmpRole = "Read only"
			$AllCatalogs = "-"
			$AllGroups   = "-"
		}
		ElseIf( $Admin.BrokerAdmin -eq $False -and $Admin.FullAdmin -eq $False -and $Admin.ProvisioningAdmin -eq $False -and $Admin.ReadOnly -eq $False )
		{
			$tmpRole = "Help desk"
			$AllCatalogs = "-"
			$AllGroups   = " "
		}
		ElseIf( $Admin.BrokerAdmin -eq $True -and $Admin.FullAdmin -eq $False -and $Admin.ProvisioningAdmin -eq $True -and $Admin.ReadOnly -eq $False )
		{
			$tmpRole = "Machine; Assignment"
			$AllCatalogs = "All Catalogs"
			$AllGroups   = "All Desktop Groups"
		}

		$tmpCatalogs = ""
		If($AllCatalogs -eq " ")
		{
			$x = 0
			ForEach($Name in $Admin.CatalogNames)
			{
				$x++
				If($x -eq $Admin.CatalogNames.Count)
				{
					$tmpCatalogs += $Name
				}
				Else
				{
					$tmpCatalogs += $Name + "; " 
				}
			}
		}
		Else
		{
			$tmpCatalogs += $AllCatalogs
		}

		$tmpGroups = ""
		If($AllGroups -eq " ")
		{
			$x = 0
			ForEach($Name in $Admin.DesktopGroupNames)
			{
				$x++
				If($x -eq $Admin.DesktopGroupNames.Count)
				{
					$tmpGroups += $Name
				}
				Else
				{
					$tmpGroups += $Name + "; " 
				}
			}
		}
		Else
		{
			$tmpGroups += $AllGroups
		}

		$tmpEnabled = ""
		If($Admin.Enabled)
		{
			$tmpEnabled = "Enabled"
		}
		Else
		{
			$tmpEnabled = "Disabled"
		}

		If($MSWord -or $PDF)
		{
			$WordTableRowHash = @{ 
			Name = $Admin.Name; 
			Roles = $tmpRole; 
			Catalogs = $tmpCatalogs; 
			DesktopGroups = $tmpGroups; 
			Enabled = $tmpEnabled
			}
			$AdminsWordTable += $WordTableRowHash
			$CurrentServiceIndex++
		}
		ElseIf($Text)
		{
			Line 1 "Name`t`t`t: " $Admin.Name
			Line 1 "Roles`t`t`t: " $tmpRole
			Line 1 "Catalogs`t`t: " $tmpCatalogs
			Line 1 "Desktop Groups`t`t: " $tmpGroups
			Line 1 "Enabled`t`t`t: "$tmpEnabled
			Line 0 ""
		}
		ElseIf($HTML)
		{
			WriteHTMLLine 0 1 "Name: " $Admin.Name
			WriteHTMLLine 0 1 "Roles: " $tmpRole
			WriteHTMLLine 0 1 "Catalogs: " $tmpCatalogs
			WriteHTMLLine 0 1 "Desktop Groups: " $tmpGroups
			WriteHTMLLine 0 1 "Enabled: "$tmpEnabled
			WriteHTMLLine 0 0 " "
		}

	}

	If($MSWord -or $PDF)
	{
		$Table = AddWordTable -Hashtable $AdminsWordTable `
		-Columns Name,Roles,Catalogs,DesktopGroups,Enabled `
		-Headers "Name","Roles","Catalogs","Desktop Groups","Enabled" `
		-Format $wdTableGrid `
		-AutoFit $wdAutoFitContent;

		SetWordCellFormat -Collection $Table -Size 9
		SetWordCellFormat -Collection $Table.Rows.Item(1).Cells -Bold -BackgroundColor $wdColorGray15 -Size 9;

		$Table.Rows.SetLeftIndent($Indent0TabStops,$wdAdjustProportional)

		FindWordDocumentEnd
		$Table = $Null
	}
	Write-Verbose "$(Get-Date -Format G):"
}
#endregion

#region Controllers functions
Function ProcessControllers
{
	Write-Verbose "$(Get-Date -Format G): Getting Controller data"
	$Controllers = Get-BrokerController @XDParams2 | Sort-Object DNSName

	If($? -and $Null -ne $Controllers)
	{
		OutputControllers $Controllers
	}
	ElseIf($? -and $Null -eq $Controllers)
	{
		$txt = "No Controller data was returned"
		OutputWarning $txt
	}
	Else
	{
		$txt = "XenDesktop Controller information could not be retrieved."
		OutputWarning $txt
	}
	Write-Verbose "$(Get-Date -Format G):"
}

Function OutputControllers
{
	Param([object] $Controllers)
	
	$txt = "Controllers"
	If($MSWord -or $PDF)
	{
		$Selection.InsertNewPage()
		WriteWordLine 1 0 $txt
	}
	ElseIf($Text)
	{
		Line 0 $txt
		Line 0 ""
	}
	ElseIf($HTML)
	{
		WriteHTMLLine 1 0 $txt
	}
	
	If($MSWord -or $PDF)
	{
		[System.Collections.Hashtable[]] $ControllersWordTable = @();
		[int] $CurrentServiceIndex = 2;
		ForEach($Controller in $Controllers)
		{
			Write-Verbose "$(Get-Date -Format G): `tAdding row for $($Controller.DNSName)"
			$Table.Cell($xRow,1).Range.Text = $Controller.DNSName
			$Table.Cell($xRow,2).Range.Text = $Controller.LastActivityTime
			$Table.Cell($xRow,3).Range.Text = $Controller.DesktopsRegistered
			$WordTableRowHash = @{ 
			Name = $Controller.DNSName; 
			Time = $Controller.LastActivityTime; 
			Desktops = $Controller.DesktopsRegistered; 
			}
			$ControllersWordTable += $WordTableRowHash
			$CurrentServiceIndex++
		}
		$Table = AddWordTable -Hashtable $ControllersWordTable `
		-Columns Name,Time,Desktops `
		-Headers "Name","Last updated","Registered desktops" `
		-Format $wdTableGrid `
		-AutoFit $wdAutoFitContent;

		## IB - Set the header row format
		SetWordCellFormat -Collection $Table.Rows.Item(1).Cells -Bold -BackgroundColor $wdColorGray15;

		#indent the entire table 1 tab stop
		$Table.Rows.SetLeftIndent($Indent0TabStops,$wdAdjustProportional)

		FindWordDocumentEnd
		$Table = $Null
	}
	ElseIf($Text)
	{
		ForEach($Controller in $Controllers)
		{
			Write-Verbose "$(Get-Date -Format G): `tAdding row for $($Controller.DNSName)"
			Line 1 "Name`t`t`t: " $Controller.DNSName
			Line 1 "Last updated`t`t: " $Controller.LastActivityTime
			Line 1 "Registered desktops`t: " $Controller.DesktopsRegistered
			Line 0 ""
		}
	}
	ElseIf($HTML)
	{
		ForEach($Controller in $Controllers)
		{
			Write-Verbose "$(Get-Date -Format G): `tAdding row for $($Controller.DNSName)"
			WriteHTMLLine 0 1 "Name: " $Controller.DNSName
			WriteHTMLLine 0 1 "Last updated: " $Controller.LastActivityTime
			WriteHTMLLine 0 1 "Registered desktops: " $Controller.DesktopsRegistered
			WriteHTMLLine 0 0 " "
		}
	}
	
	If($Hardware)
	{
		ForEach($Controller in $Controllers)
		{
			$Script:Selection.InsertNewPage()
			GetComputerWMIInfo $Controller.DNSName
		}
	}
}
#endregion

#region Hosting functions
Function ProcessHosting
{
	#original work on the Hosting was done by Kenny Baldwin
	Write-Verbose "$(Get-Date -Format G): Processing Hosting"

	$txt = "Hosting"
	If($MSWord -or $PDF)
	{
		$Selection.InsertNewPage()
		WriteWordLine 1 0 $txt
	}
	ElseIf($Text)
	{
		Line 0 $txt
		Line 0 ""
	}
	ElseIf($HTML)
	{
		WriteHTMLLine 1 0 $txt
	}

	$vmstorage = @()
	$pvdstorage = @()
	$vmnetwork = @()

	Write-Verbose "$(Get-Date -Format G): `tProcessing Hosting Units"
	$HostingUnits = get-childitem @XDParams1 -path 'xdhyp:\hostingunits' 4>$Null
	If($? -and $Null -ne $HostingUnits)
	{
		ForEach ($item in $HostingUnits)
		{	
			ForEach ($storage in $item.Storage)
			{	
				$vmstorage += $storage.StoragePath
			}
			ForEach ($storage in $item.PersonalvDiskStorage)
			{	
				$pvdstorage += $storage.StoragePath
			}
			ForEach ($network in $item.NetworkPath)
			{	
				$vmnetwork += $network
			}
		}
	}
	ElseIf($? -and $Null -eq $HostingUnits)
	{
		$txt = "No Hosting Units found"
		OutputWarning $txt
	}
	Else
	{
		$txt = "Unable to retrieve Hosting Units"
		OutputWarning $txt
	}

	Write-Verbose "$(Get-Date -Format G): `tProcessing Hypervisors"
	$Hypervisors = Get-BrokerHypervisorConnection @XDParams1
	If($? -and $Null -ne $Hypervisors)
	{
		ForEach ($Hypervisor in $Hypervisors)
		{
			$hypvmstorage = @()
			$hyppvdstorage = @()
			$hypnetwork = @()
			$capabilities = $Hypervisor.Capabilities -join ', '	
			ForEach ($storage in $vmstorage)
			{
				If($storage.Contains($Hypervisor.Name))
				{		
					$hypvmstorage += $storage		
				}
			}
			ForEach ($storage in $pvdstorage)
			{
				If($storage.Contains($Hypervisor.Name))
				{
					$hyppvdstorage += $storage		
				}
			}
			ForEach ($network in $vmnetwork)
			{
				If($network.Contains($Hypervisor.Name))
				{
					$hypnetwork += $network
				}
			}
			$xStorageName = ""
			ForEach($Unit in $HostingUnits)
			{
				If($Unit.HypervisorConnection.HypervisorConnectionName -eq $Hypervisor.Name)
				{
					$xStorageName = $Unit.HostingUnitName
				}
			}
			$xAddress = ""
			$xHAAddress = @()
			$xUserName = ""
			$xMaintMode = $False
			$xConnectionType = ""
			$xState = ""
			$xPowerActions = @()
			Write-Verbose "$(Get-Date -Format G): `tProcessing Hosting Connections"
			$Connections = get-childitem @XDParams1 -path 'xdhyp:\connections' 4>$Null
			
			If($? -and $Null -ne $Connections)
			{
				ForEach($Connection in $Connections)
				{
					If($Connection.HypervisorConnectionName -eq $Hypervisor.Name)
					{
						$xAddress = $Connection.HypervisorAddress[0]
						ForEach($tmpaddress in $Connection.HypervisorAddress)
						{
							$xHAAddress += $tmpaddress
						}
						$xUserName = $Connection.UserName
						$xMaintMode = $Connection.MaintenanceMode
						$xConnectionType = $Connection.ConnectionType
						$xState = $Hypervisor.State
						$xPowerActions = $Connection.metadata
					}
				}
			}
			ElseIf($? -and $Null -eq $Connections)
			{
				$txt = "No Hosting Connections found"
				OutputWarning $txt
			}
			Else
			{
				$txt = "Unable to retrieve Hosting Connections"
				OutputWarning $txt
			}
			OutputHosting $Hypervisor $xConnectionType $xAddress $xState $xUserName $xMaintMode $xStorageName $xHAAddress $xPowerActions
		}
	}
	ElseIf($? -and $Null -eq $Hypervisors)
	{
		$txt = "No Hypervisors found"
		OutputWarning $txt
	}
	Else
	{
		$txt = "Unable to retrieve Hypervisors"
		OutputWarning $txt
	}
	Write-Verbose "$(Get-Date -Format G):"
}

Function OutputHosting
{
	Param([object] $Hypervisor, [string] $xConnectionType, [string] $xAddress, [string] $xState, [string] $xUserName, [bool] $xMaintMode, [string] $xStorageName, [array] $xHAAddress, [array]$xPowerActions)
	
	Write-Verbose "$(Get-Date -Format G): `t`t`tOutput $($Hypervisor.Name)"
	If($MSWord -or $PDF)
	{
		WriteWordLine 3 0 $Hypervisor.Name
		[System.Collections.Hashtable[]] $ScriptInformation = @()
		$ScriptInformation += @{ Data = "Connection Name"; Value = $Hypervisor.Name; }
		$ScriptInformation += @{ Data = "Type"; Value = $xConnectionTypeStr; }
		$ScriptInformation += @{ Data = "Address"; Value = $xAddress; }
		$ScriptInformation += @{ Data = "State"; Value = $xStateType; }
		$ScriptInformation += @{ Data = "Username"; Value = $xUserName; }
		$ScriptInformation += @{ Data = "Maintenance Mode"; Value = $xMaintModeType; }
		$ScriptInformation += @{ Data = "Storage resource name"; Value = $xStorageName; }
		$Table = AddWordTable -Hashtable $ScriptInformation `
		-Columns Data,Value `
		-List `
		-Format $wdTableGrid `
		-AutoFit $wdAutoFitFixed;

		## IB - Set the header row format
		SetWordCellFormat -Collection $Table.Columns.Item(1).Cells -Bold -BackgroundColor $wdColorGray15;

		$Table.Columns.Item(1).Width = 150;
		$Table.Columns.Item(2).Width = 200;

		$Table.Rows.SetLeftIndent($Indent1TabStops,$wdAdjustProportional)
		$Table.AutoFitBehavior($wdAutoFitFixed)

		FindWordDocumentEnd
		$Table = $Null
		
		WriteWordLine 4 0 "Advanced"
		$xHAAddress = $xHAAddress | Sort-Object
		$HAtmp = ""
		ForEach($tmpaddress in $xHAAddress)
		{
			$HAtmp += "$($tmpaddress) "
		}
		[System.Collections.Hashtable[]] $ScriptInformation = @()
		$ScriptInformation += @{ Data = "High Availability Servers"; Value = $HAtmp; }
		$ScriptInformation += @{ Data = "Max active actions"; Value = $xPowerActions[0].Value; }
		$ScriptInformation += @{ Data = "Max new actions per minute"; Value = $xPowerActions[1].Value; }
		$ScriptInformation += @{ Data = "Max power actions as % of desktops"; Value = $xPowerActions[2].Value; }
		If($CanUsePvD)
		{
			$ScriptInformation += @{ Data = "Max personal vDisk power actions as %"; Value = $xPowerActions[3].Value; }
		}
		$ScriptInformation += @{ Data = "Connection options"; Value = $xPowerActions[4].Value; }
		$Table = AddWordTable -Hashtable $ScriptInformation `
		-Columns Data,Value `
		-List `
		-Format $wdTableGrid `
		-AutoFit $wdAutoFitFixed;

		## IB - Set the header row format
		SetWordCellFormat -Collection $Table.Columns.Item(1).Cells -Bold -BackgroundColor $wdColorGray15;

		$Table.Columns.Item(1).Width = 150;
		$Table.Columns.Item(2).Width = 200;

		$Table.Rows.SetLeftIndent($Indent1TabStops,$wdAdjustProportional)
		$Table.AutoFitBehavior($wdAutoFitFixed)

		FindWordDocumentEnd
		$Table = $Null
	}
	ElseIf($Text)
	{
		Line 0 $Hypervisor.Name
		Line 0 ""
		Line 1 "Connection Name`t`t: " $Hypervisor.Name
		Line 1 "Type`t`t`t: " -nonewline
		Switch ($xConnectionType)
		{
			"XenServer" {Line 0 "XenServer"; Break}
			"SCVMM"     {Line 0 "Microsoft System Center Virtual Machine Manager"; Break}
			"vCenter"   {Line 0 "VMware virtualization"; Break}
			"Custom"    {Line 0 "Custom"; Break}
			Default     {Line 0 "Hypervisor Type could not be determined: $($xConnectionType)"; Break}
		}
		Line 1 "Address`t`t`t: " $xAddress
		Line 1 "State`t`t`t: " -nonewline
		If($xState -eq "On")
		{
			Line 0 "Enabled"
		}
		Else
		{
			Line 0 "Disabled"
		}
		Line 1 "Username`t`t: " $xUserName
		Line 1 "Maintenance Mode`t: " -nonewline
		If($xMaintMode)
		{
			Line 0 "On"
		}
		Else
		{
			Line 0 "Off"
		}
		Line 1 "Storage resource name`t: " $xStorageName
		Line 0 ""
		
		Line 1 "Advanced"
		$xHAAddress = $xHAAddress | Sort-Object
		Line 2 "High Availability Servers`t`t: " $xHAAddress[0]
		$cnt = 0
		ForEach($tmpaddress in $xHAAddress)
		{
			If($cnt -gt 0)
			{
				Line 7 "  " $tmpaddress
			}
			$cnt++
		}
		Line 2 "Max active actions`t`t`t: " $xPowerActions[0].Value
		Line 2 "Max new actions per minute`t`t: " $xPowerActions[1].Value
		Line 2 "Max power actions as % of desktops`t: " $xPowerActions[2].Value
		If($CanUsePvD)
		{
			Line 2 "Max personal vDisk power actions as %`t: " $xPowerActions[3].Value
		}
		Line 2 "Connection options`t`t`t: " $xPowerActions[4].Value
		
	}
	ElseIf($HTML)
	{
		WriteHTMLLine 3 0 $Hypervisor.Name
		WriteHTMLLine 0 1 "Connection Name: " $Hypervisor.Name

		$tmp = ""
		Switch ($xConnectionType)
		{
			"XenServer" {$tmp = "XenServer"; Break}
			"SCVMM"     {$tmp = "Microsoft System Center Virtual Machine Manager"; Break}
			"vCenter"   {$tmp = "VMware virtualization"; Break}
			"Custom"    {$tmp = "Custom"; Break}
			Default     {$tmp = "Hypervisor Type could not be determined: $($xConnectionType)"; Break}
		}

		WriteHTMLLine 0 1 "Type: " $tmp
		WriteHTMLLine 0 1 "Address: " $xAddress
		
		$tmp = ""
		If($xState -eq "On")
		{
			$tmp = "Enabled"
		}
		Else
		{
			$tmp = "Disabled"
		}
		WriteHTMLLine 0 1 "State: " $tmp
		WriteHTMLLine 0 1 "Username: " $xUserName
		
		$tmp = ""
		If($xMaintMode)
		{
			$tmp = "On"
		}
		Else
		{
			$tmp = "Off"
		}
		WriteHTMLLine 0 1 "Maintenance Mode: " $tmp
		WriteHTMLLine 0 1 "Storage resource name: " $xStorageName
		
		WriteHTMLLine 4 0 "Advanced"
		$xHAAddress = $xHAAddress | Sort-Object
		WriteHTMLLine 0 1 "High Availability Servers: " $xHAAddress[0]
		$cnt = 0
		ForEach($tmpaddress in $xHAAddress)
		{
			If($cnt -gt 0)
			{
				WriteHTMLLine 0 7 "  " $tmpaddress
			}
			$cnt++
		}
		WriteHTMLLine 0 1 "Max active actions: " $xPowerActions[0].Value
		WriteHTMLLine 0 1 "Max new actions per minute: " $xPowerActions[1].Value
		WriteHTMLLine 0 1 "Max power actions as % of desktops: " $xPowerActions[2].Value
		If($CanUsePvD)
		{
			WriteHTMLLine 0 1 "Max personal vDisk power actions as %: " $xPowerActions[3].Value
		}
		WriteHTMLLine 0 1 "Connection options: " $xPowerActions[4].Value
	}
	
	If($Hosting)
	{
		Write-Verbose "$(Get-Date -Format G): Retrieving Desktop OS Data"
		$DesktopOSMachines = Get-BrokerMachine @XDParams2 -hypervisorconnectionname $Hypervisor.Name

		If($? -and ($Null -ne $DesktopOSMachines))
		{
			[int]$cnt = 0
			If($DesktopOSMachines -is [array])
			{
				$cnt = $DesktopOSMachines.Count
			}
			Else
			{
				If(![String]::IsNullOrEmpty($DesktopOSMachines))
				{
					$cnt = 1
				}
				Else
				{
					$cnt = 0
				}
			}
			
			$txt = "Desktop OS Machines ($($cnt))"
			If($MSWord -or $PDF)
			{
				WriteWordLine 0 0 ""
				WriteWordLine 4 0 $txt
			}
			ElseIf($Text)
			{
				Line 0 $txt
				Line 0 ""
			}
			ElseIf($HTML)
			{
				WriteHTMLLine 4 0 $txt
			}

			ForEach($Desktop in $DesktopOSMachines)
			{
				OutputDesktopOSMachine $Desktop
			}
		}
		ElseIf($? -and ($Null -eq $DesktopOSMachines))
		{
			$txt = "There are no Desktop OS Machines"
			OutputWarning $txt
		}
		Else
		{
			$txt = "Unable to retrieve Desktop OS Machines"
			OutputWarning $txt
		}
	}
	$tmp = $Null
}

Function OutputDesktopOSMachine 
{
	Param([object]$Desktop)

	$xName = ""
	$xMaintMode = ""
	$xUserChanges = ""
	
	Write-Verbose "$(Get-Date -Format G): `t`t`tOutput desktop $($Desktop.DNSName)"
	If($MSWord -or $PDF)
	{
		If(![String]::IsNullOrEmpty($Desktop.AssociatedUserNames))
		{
			ForEach($AssociatedUserName in $Desktop.AssociatedUserNames)
			{
				$xName += $AssociatedUserName
			}
		}
		If($xName -eq "")
		{
			$xName = "Not assigned"
		}
		[System.Collections.Hashtable[]] $ScriptInformation = @()
		$ScriptInformation += @{ Data = "Name"; Value = $Desktop.DNSName; }
		$ScriptInformation += @{ Data = "Machine Catalog"; Value = $Desktop.CatalogName; }
		$ScriptInformation += @{ Data = "Delivery Group"; Value = $Desktop.DesktopGroupName; }
		$ScriptInformation += @{ Data = "User"; Value = $xName; }
		$ScriptInformation += @{ Data = "Power State"; Value = $Desktop.PowerState; }
		$ScriptInformation += @{ Data = "Registration State"; Value = $Desktop.RegistrationState; }
		$Table = AddWordTable -Hashtable $ScriptInformation `
		-Columns Data,Value `
		-List `
		-Format $wdTableGrid `
		-AutoFit $wdAutoFitFixed;

		## IB - Set the header row format
		SetWordCellFormat -Collection $Table.Columns.Item(1).Cells -Bold -BackgroundColor $wdColorGray15;

		$Table.Columns.Item(1).Width = 150;
		$Table.Columns.Item(2).Width = 200;

		$Table.Rows.SetLeftIndent($Indent1TabStops,$wdAdjustProportional)

		FindWordDocumentEnd
		$Table = $Null
		WriteWordLine 0 0 ""
	}
	ElseIf($Text)
	{
		Line 1 "Name`t`t`t: " $Desktop.DNSName
		Line 1 "Machine Catalog`t`t: " $Desktop.CatalogName
		If(![String]::IsNullOrEmpty($Desktop.DesktopGroupName))
		{
			Line 1 "Delivery Group`t`t: " $Desktop.DesktopGroupName
		}
		If(![String]::IsNullOrEmpty($Desktop.AssociatedUserNames))
		{
			ForEach($AssociatedUserName in $Desktop.AssociatedUserNames)
			{
				$xName += $AssociatedUserName
			}
			Line 1 "User`t`t`t: " $xName
		}
		If($Desktop.InMaintenanceMode)
		{
			$xMaintMode = "On"
		}
		Else
		{
			$xMaintMode = "Off"
		}
		Line 1 "Maintenance Mode`t: " $xMaintMode
		Switch($Desktop.PersistUserChanges)
		{
			"OnLocal" {$xUserChanges = "On Local"; Break}
			"Discard" {$xUserChanges = "Discard"; Break}
			"OnPvd"   {$xUserChanges = "Personal vDisk"; Break}
			Default   {$xUserChanges = "Unknown: $($Desktop.PersistUserChanges)"; Break}
		}
		Line 1 "Persist User Changes`t: " $xUserChanges
		Line 1 "Power State`t`t: " $Desktop.PowerState
		Line 1 "Registration State`t: " $Desktop.RegistrationState
		Line 0 ""
	}
	ElseIf($HTML)
	{
		WriteHTMLLine 0 1 "Name: " $Desktop.DNSName
		WriteHTMLLine 0 1 "Machine Catalog: " $Desktop.CatalogName
		If(![String]::IsNullOrEmpty($Desktop.DesktopGroupName))
		{
			WriteHTMLLine 0 1 "Delivery Group: " $Desktop.DesktopGroupName
		}
		If(![String]::IsNullOrEmpty($Desktop.AssociatedUserNames))
		{
			ForEach($AssociatedUserName in $Desktop.AssociatedUserNames)
			{
				$xName += $AssociatedUserName
			}
			WriteHTMLLine 0 1 "User: " $xName
		}
		If($Desktop.InMaintenanceMode)
		{
			$xMaintMode = "On"
		}
		Else
		{
			$xMaintMode = "Off"
		}
		WriteHTMLLine 0 1 "Maintenance Mode: " $xMaintMode
		Switch($Desktop.PersistUserChanges)
		{
			"OnLocal" {$xUserChanges = "On Local"; Break}
			"Discard" {$xUserChanges = "Discard"; Break}
			"OnPvd"   {$xUserChanges = "Personal vDisk"; Break}
			Default   {$xUserChanges = "Unknown: $($Desktop.PersistUserChanges)"; Break}
		}
		WriteHTMLLine 0 1 "Persist User Changes: " $xUserChanges
		WriteHTMLLine 0 1 "Power State: " $Desktop.PowerState
		WriteHTMLLine 0 1 "Registration State: " $Desktop.RegistrationState
		WriteHTMLLine 0 0 " "
	}
	
}
#endregion

#region Licensing functions
Function ProcessLicensing
{
	Write-Verbose "$(Get-Date -Format G): Processing Licensing"
	OutputLicensing
	Write-Verbose "$(Get-Date -Format G):"
}

Function OutputLicensing
{
	$LicenseEdition = ""
	$LicenseModel = ""

	Switch ($Script:XDSite.DesktopLicenseEdition)
	{
		"EXP" {$LicenseEdition = "Express Edition"; Break}
		"STD" {$LicenseEdition = "VDI Edition"; Break}
		"ENT" {$LicenseEdition = "Enterprise Edition"; Break}
		"PLT" { $LicenseEdition = "Platinum Edition"; Break}
		Default {$LicenseEdition = "License edition could not be determined: $($Script:XDSite.LicenseEdition)"; Break}
	}

	If($Script:XDSite.DesktopLicenseModel -eq "UserDevice")
	{
		$LicenseModel = "User/Device"
	}
	Else
	{
		$LicenseModel = $Script:XDSite.LicenseModel
	}
	
<#
	XenDesktop 5.6 Feature Pack 1 Platinum
	Release Date: Jun 29, 2012
	Subscription Advantage Eligibility Date: February 17, 2012
 
	XenDesktop 5.6 Platinum
	Release Date: Mar 9, 2012
	Subscription Advantage Eligibility Date: February 17, 2012
 
	XenDesktop 5.5 Platinum
	Release Date: Aug 24, 2011
	Subscription Advantage Eligibility Date: July 27, 2011
	
	XenDesktop 5 Service Pack 1 - Platinum Edition
	Release Date: May 13, 2011
	Subscription Advantage Eligibility Date: November 26, 2010
	
	XenDesktop 5 - Platinum Edition
	Release Date: Dec 4, 2010
	Subscription Advantage Eligibility Date: November 26, 2010
 #>

	$RequiredSADate = ""
 
	Switch ($XDVersion)
	{
		"5.6" {$RequiredSADate = "February 17, 2012"; Break}
		"5.5" {$RequiredSADate = "July 27, 2011"; Break}
		"5.1" {$RequiredSADate = "November 26, 2010"; Break}
		"5.0" {$RequiredSADate = "November 26, 2010"; Break}
		Default {$RequiredSADate = "Unable to determine SA date for XD version $($XDVersion)"; Break}
	}

	Write-Verbose "$(Get-Date -Format G): `tOutput licensing overview"
	If($MSWord -or $PDF)
	{
		$Selection.InsertNewPage()
		WriteWordLine 1 0 "Licensing"
		WriteWordLine 2 0 "Licensing Overview"
		
		[System.Collections.Hashtable[]] $ItemInformation = @();
		
		$ItemInformation += @{ Data = "Site name"; Value = $Script:XDSite.Name; }
		$ItemInformation += @{ Data = "Server name"; Value = $Script:XDSite.LicenseServerName; }
		$ItemInformation += @{ Data = "Port"; Value = $Script:XDSite.LicenseServerPort; }
		$ItemInformation += @{ Data = "Edition"; Value = $LicenseEdition; }
		$ItemInformation += @{ Data = "Model"; Value = $LicenseModel; }
		$ItemInformation += @{ Data = "Required SA date"; Value = $RequiredSADate; }
		$ItemInformation += @{ Data = "XenDesktop license use"; Value = $Script:XDSite.DesktopLicensedSessionsActive; }
		
		## Add the table to the document, using the hashtable (-Alt is short for -AlternateBackgroundColor!)
		$Table = AddWordTable -Hashtable $ItemInformation -Columns Data,Value -List -AutoFit $wdAutoFitFixed;

		## Set first column format
		SetWordCellFormat -Collection $Table.Columns.Item(1).Cells -Bold -BackgroundColor $wdColorGray15;

		## IB - set column widths without recursion
		$Table.Columns.Item(1).Width = 125;
		$Table.Columns.Item(2).Width = 150;

		$Table.Rows.SetLeftIndent($Indent0TabStops,$wdAdjustNone)

		FindWordDocumentEnd
		$Table = $Null
		
		WriteWordLine 3 0 "XenDesktop Licenses"
	}
	ElseIf($Text)
	{
		Line 0 "Licensing"
		Line 0 "Licensing Overview"
		Line 1 "Site name`t`t: " $Script:XDSite.Name
		Line 1 "Server name`t`t: " $Script:XDSite.LicenseServerName
		Line 1 "Port`t`t`t: " $Script:XDSite.LicenseServerPort
		Line 1 "Edition`t`t`t: " $LicenseEdition
		Line 1 "Model`t`t`t: " $LicenseModel
		Line 1 "Required SA date`t: " $RequiredSADate
		Line 1 "XenDesktop license use`t: " $Script:XDSite.DesktopLicensedSessionsActive
		Line 0 ""
		Line 0 "XenDesktop Licenses"
	}
	ElseIf($HTML)
	{
		WriteHTMLLine 1 0 "Licensing"
		WriteHTMLLine 2 0 "Licensing Overview"
		WriteHTMLLine 0 0 "Site name: " $Script:XDSite.Name
		WriteHTMLLine 0 0 "Server name: " $Script:XDSite.LicenseServerName
		WriteHTMLLine 0 0 "Port: " $Script:XDSite.LicenseServerPort
		WriteHTMLLine 0 0 "Edition: " $LicenseEdition
		WriteHTMLLine 0 0 "Model: " $LicenseModel
		WriteHTMLLine 0 0 "Required SA date: " $RequiredSADate
		WriteHTMLLine 0 0 "XenDesktop license use: " $Script:XDSite.DesktopLicensedSessionsActive
		WriteHTMLLine 0 0 " "
		WriteHTMLLine 3 0 "XenDesktop Licenses"
	}

	#get product license info
	Write-Verbose "$(Get-Date -Format G): `tRetrieve XenDesktop licenses"
	$ProductLicenses = Get-LicInventory -AdminAddress $Script:XDSite.LicenseServerName -EA 0
		
	If($? -and $Null -ne $ProductLicenses)
	{
		Write-Verbose "$(Get-Date -Format G): `tOutput XenDesktop licenses"
		
		If($MSWord -or $PDF)
		{
			[System.Collections.Hashtable[]] $LicensesWordTable = @();
			## Seed the $Services row index from the second row
			[int] $CurrentServiceIndex = 2;
		}
		ForEach($Product in $ProductLicenses)
		{
			If($Product.LicenseProductName -eq "XDT" -or $Product.LicenseProductName -eq "XDS")
			{
				Write-Verbose "$(Get-Date -Format G): `tAdding row for $($Product.LocalizedLicenseProductName)"
				If($Null -ne $Product.LicenseExpirationDate)
				{
					$tmpdate1 = '{0:d}' -f $Product.LicenseExpirationDate
				}
				Else
				{
					$tmpdate1 = "Permanent"
				}
				$tmpdate2 = '{0:d}' -f $Product.LicenseSubscriptionAdvantageDate
				
				If($MSWord -or $PDF)
				{
					$WordTableRowHash = @{
					Product = $Product.LocalizedLicenseProductName; 
					Mode = $Product.LocalizedLicenseModel; 
					ExpDate = $tmpdate1; 
					SADate = $tmpdate2;
					LicType = $Product.LocalizedLicenseType;
					Quantity = ($Product.LicensesAvailable - $Product.LicenseOverdraft);
					}
					$LicensesWordTable += $WordTableRowHash;
					$CurrentServiceIndex++;
				}
				ElseIf($Text)
				{
					Line 1 "Product`t`t: " $Product.LocalizedLicenseProductName
					Line 1 "Model`t`t: " $Product.LocalizedLicenseModel
					Line 1 "Expiration date`t: " $tmpdate1
					Line 1 "SA date`t`t: " $tmpdate2
					Line 1 "License type`t: " $Product.LocalizedLicenseType
					Line 1 "Total`t`t: " ($Product.LicensesAvailable - $Product.LicenseOverdraft)
					Line 0 ""
				}
				ElseIf($HTML)
				{
					WriteHTMLLine 0 0 "Product: " $Product.LocalizedLicenseProductName
					WriteHTMLLine 0 0 "Model: " $Product.LocalizedLicenseModel
					WriteHTMLLine 0 0 "Expiration date: " $tmpdate1
					WriteHTMLLine 0 0 "SA date: " $tmpdate2
					WriteHTMLLine 0 0 "License type: " $Product.LocalizedLicenseType
					WriteHTMLLine 0 0 "Total: " ($Product.LicensesAvailable - $Product.LicenseOverdraft)
					WriteHTMLLine 0 0 " "
				}
			}
		}
		
		If($MSWord -or $PDF)
		{
			## Add the table to the document, using the hashtable (-Alt is short for -AlternateBackgroundColor!)
			$Table = AddWordTable -Hashtable $LicensesWordTable `
			-Columns Product,Mode,ExpDate,SADate,LicType,Quantity `
			-Headers "Product","Model","Expiration date","SA date","License type","Total" `
			-Format $wdTableGrid `
			-AutoFit $wdAutoFitContent;

			## IB - Set the header row format after the SetWordTableAlternateRowColor function as it will paint the header row!
			SetWordCellFormat -Collection $Table.Rows.Item(1).Cells -Bold -BackgroundColor $wdColorGray15;

			#indent the entire table 1 tab stop
			$Table.Rows.SetLeftIndent($Indent0TabStops,$wdAdjustProportional)

			FindWordDocumentEnd
			$Table = $Null
		}
	}
	ElseIf($? -and $Null -eq $ProductLicenses)
	{
		$txt = "No Product Licenses exist"
		OutputWarning $txt
	}
	Else
	{
		$txt = "Unable to retrieve Product Licenses"
		OutputWarning $txt
	}
}
#endregion

#region script setup function
Function ProcessScriptSetup
{
	$script:startTime = Get-Date

	If(!(Check-NeededPSSnapins "Citrix.AdIdentity.Admin.V1",
	"Citrix.Broker.Admin.V1",
	"Citrix.Common.GroupPolicy",
	"Citrix.Configuration.Admin.V1",
	"Citrix.Host.Admin.V1",
	"Citrix.LicensingConfig.Admin.V1",
	"Citrix.MachineCreation.Admin.V1",
	"Citrix.MachineIdentity.Admin.V1"))
	{
		#We're missing Citrix Snapins that we need
		$ErrorActionPreference = $SaveEAPreference
		Write-Error "
		`n`n
		`t`t
		Missing Citrix PowerShell Snap-ins Detected, check the console above for more information.
		`n`n
		`t`t
		Are you sure you are running this script on a XenDesktop 5.x Server?
		`n`n
		`t`t
		Script will now close.
		`n`n
		"
		Break
	}

	$Global:DoPolicies = $True
	If(!(Check-LoadedModule "Citrix.GroupPolicy.Commands") -and $Policies -eq $False)
	{
		Write-Warning "The Citrix Group Policy module Citrix.GroupPolicy.Commands.psm1 could not be loaded `n
		Please see the Prerequisites section in the ReadMe file (https://dl.dropboxusercontent.com/u/43555945/XD7_Inventory_V1_ReadMe.rtf). 
		`n`n
		Citrix Policy documentation will not take place"
		Write-Verbose "$(Get-Date -Format G): "
		$Global:DoPolicies = $False
	}
	If(!(Check-LoadedModule "Citrix.GroupPolicy.Commands") -and $Policies -eq $True)
	{
		Write-Error "
		`n`n
		`t`t
		The Citrix Group Policy module Citrix.GroupPolicy.Commands.psm1 could not be loaded 
		`n`n
		`t`t
		Please see the Prerequisites section in the ReadMe file (https://dl.dropboxusercontent.com/u/43555945/XD7_Inventory_V1_ReadMe.rtf). 
		`n`n
		`t`t
		Because the Policies parameter was used the script will now close.
		`n`n
		"
		Write-Verbose "$(Get-Date -Format G): "
		Break
	}

	#set value for MaxRecordCount
	$Script:MaxRecordCount = [int]::MaxValue 

	If([String]::IsNullOrEmpty($AdminAddress))
	{
		$AdminAddress = "LocalHost"
	}

	$Script:XDParams1 = @{
	adminaddress = $AdminAddress; 
	EA = 0;
	}

	$Script:XDParams2 = @{
	adminaddress = $AdminAddress; 
	EA = 0;
	MaxRecordCount = $Script:MaxRecordCount;
	}
	# Get Site information
	Write-Verbose "$(Get-Date -Format G): Gathering initial Site data"

	$Script:XDSite = Get-BrokerSite @XDParams1

	If( !($?) -or $Null -eq $Script:XDSite)
	{
		$ErrorActionPreference = $SaveEAPreference
		Write-Warning "XenDesktop Site information could not be retrieved.  Script cannot continue"
		Write-Error "
		`n`n
		`t`t
		cmdlet failed $($error[ 0 ].ToString())
		`n`n
		"
		AbortScript
	}

	$Controllers = Get-BrokerController @XDParams2 | Sort-Object DNSName

	If( !($?) -or $Null -eq $Controllers)
	{
		$ErrorActionPreference = $SaveEAPreference
		Write-Warning "XenDesktop Controller information could not be retrieved.  Script cannot continue"
		Write-Error "
		`n`n
		`t`t
		cmdlet failed $($error[ 0 ].ToString())
		`n`n
		"
		AbortScript
	}

	#need to use the registry to get the version info
	#get-brokercontroller is not an accurate method to get the info
	#using get-brokercontroller, XD5.0 SP1 and XD 5.5 have a version number of 5.1
	#need the real version number to get an accurate SA date for license info
	$Script:XDVersion = (Get-RegistryValue "HKLM:\SOFTWARE\Microsoft\Windows\CurrentVersion\Uninstall\Citrix Desktop Delivery Controller" "DisplayVersion").Substring(0,3)
	$Script:CanUsePvD = ((get-brokerserviceaddedcapability) -contains "PersonalvDiskStorage")
	#first check to make sure this is a XenDesktop 5.x Site
	If($XDVersion.Substring(0,1) -eq "5")
	{
		#this is a XenDesktop 5.x Site, script can proceed
	}
	Else
	{
		#this is not a XenDesktop 5.x Site, script cannot proceed
		Write-Warning "This script is designed for XenDesktop 5.x and should not be run on other versions of XenDesktop"
		AbortScript
	}

	[string]$Script:XDSiteName = $Script:XDSite.Name
	[string]$Script:Title      = "Inventory Report for the $($XDSiteName) Site"
}
#endregion

#region script core
#Script begins
ProcessScriptSetup

SetFileName1andFileName2 "$($XDSiteName)"

#START BUILDING XENDESKTOP REPORT

ProcessMachines

ProcessAssignments

ProcessApplications

If($NoPolicies -or $DoPolicies -eq $False)
{
	#don't process policies
}
Else
{
	ProcessPolicies
}

ProcessConfiguration

ProcessAdministrators

ProcessControllers

ProcessHosting

ProcessLicensing
#endregion

#region finish script
Write-Verbose "$(Get-Date -Format G): Finishing up document"
#end of document processing

$AbstractTitle = "Citrix XenDesktop V1.20 $($XDVersion) Inventory"
$SubjectTitle = "XenDesktop V1.20 $($XDVersion) Site Inventory"
UpdateDocumentProperties $AbstractTitle $SubjectTitle

ProcessDocumentOutput

Write-Verbose "$(Get-Date -Format G): Script has completed"
Write-Verbose "$(Get-Date -Format G): "

#http://poshtips.com/measuring-elapsed-time-in-powershell/
Write-Verbose "$(Get-Date -Format G): Script started: $($Script:StartTime)"
Write-Verbose "$(Get-Date -Format G): Script ended: $(Get-Date)"
$runtime = $(Get-Date) - $Script:StartTime
$Str = [string]::format("{0} days, {1} hours, {2} minutes, {3}.{4} seconds", `
	$runtime.Days, `
	$runtime.Hours, `
	$runtime.Minutes, `
	$runtime.Seconds,
	$runtime.Milliseconds)
Write-Verbose "$(Get-Date -Format G): Elapsed time: $($Str)"
$runtime = $Null
$Str = $Null
$ErrorActionPreference = $SaveEAPreference
#endregion

# SIG # Begin signature block
# MIItewYJKoZIhvcNAQcCoIItbDCCLWgCAQExCzAJBgUrDgMCGgUAMGkGCisGAQQB
# gjcCAQSgWzBZMDQGCisGAQQBgjcCAR4wJgIDAQAABBAfzDtgWUsITrck0sYpfvNR
# AgEAAgEAAgEAAgEAAgEAMCEwCQYFKw4DAhoFAAQUE/q8GQMoYD+Okm+GrOGApJyF
# yFeggibbMIIFkDCCA3igAwIBAgIQBZsbV56OITLiOQe9p3d1XDANBgkqhkiG9w0B
# AQwFADBiMQswCQYDVQQGEwJVUzEVMBMGA1UEChMMRGlnaUNlcnQgSW5jMRkwFwYD
# VQQLExB3d3cuZGlnaWNlcnQuY29tMSEwHwYDVQQDExhEaWdpQ2VydCBUcnVzdGVk
# IFJvb3QgRzQwHhcNMTMwODAxMTIwMDAwWhcNMzgwMTE1MTIwMDAwWjBiMQswCQYD
# VQQGEwJVUzEVMBMGA1UEChMMRGlnaUNlcnQgSW5jMRkwFwYDVQQLExB3d3cuZGln
# aWNlcnQuY29tMSEwHwYDVQQDExhEaWdpQ2VydCBUcnVzdGVkIFJvb3QgRzQwggIi
# MA0GCSqGSIb3DQEBAQUAA4ICDwAwggIKAoICAQC/5pBzaN675F1KPDAiMGkz7MKn
# JS7JIT3yithZwuEppz1Yq3aaza57G4QNxDAf8xukOBbrVsaXbR2rsnnyyhHS5F/W
# BTxSD1Ifxp4VpX6+n6lXFllVcq9ok3DCsrp1mWpzMpTREEQQLt+C8weE5nQ7bXHi
# LQwb7iDVySAdYyktzuxeTsiT+CFhmzTrBcZe7FsavOvJz82sNEBfsXpm7nfISKhm
# V1efVFiODCu3T6cw2Vbuyntd463JT17lNecxy9qTXtyOj4DatpGYQJB5w3jHtrHE
# tWoYOAMQjdjUN6QuBX2I9YI+EJFwq1WCQTLX2wRzKm6RAXwhTNS8rhsDdV14Ztk6
# MUSaM0C/CNdaSaTC5qmgZ92kJ7yhTzm1EVgX9yRcRo9k98FpiHaYdj1ZXUJ2h4mX
# aXpI8OCiEhtmmnTK3kse5w5jrubU75KSOp493ADkRSWJtppEGSt+wJS00mFt6zPZ
# xd9LBADMfRyVw4/3IbKyEbe7f/LVjHAsQWCqsWMYRJUadmJ+9oCw++hkpjPRiQfh
# vbfmQ6QYuKZ3AeEPlAwhHbJUKSWJbOUOUlFHdL4mrLZBdd56rF+NP8m800ERElvl
# EFDrMcXKchYiCd98THU/Y+whX8QgUWtvsauGi0/C1kVfnSD8oR7FwI+isX4KJpn1
# 5GkvmB0t9dmpsh3lGwIDAQABo0IwQDAPBgNVHRMBAf8EBTADAQH/MA4GA1UdDwEB
# /wQEAwIBhjAdBgNVHQ4EFgQU7NfjgtJxXWRM3y5nP+e6mK4cD08wDQYJKoZIhvcN
# AQEMBQADggIBALth2X2pbL4XxJEbw6GiAI3jZGgPVs93rnD5/ZpKmbnJeFwMDF/k
# 5hQpVgs2SV1EY+CtnJYYZhsjDT156W1r1lT40jzBQ0CuHVD1UvyQO7uYmWlrx8Gn
# qGikJ9yd+SeuMIW59mdNOj6PWTkiU0TryF0Dyu1Qen1iIQqAyHNm0aAFYF/opbSn
# r6j3bTWcfFqK1qI4mfN4i/RN0iAL3gTujJtHgXINwBQy7zBZLq7gcfJW5GqXb5JQ
# bZaNaHqasjYUegbyJLkJEVDXCLG4iXqEI2FCKeWjzaIgQdfRnGTZ6iahixTXTBmy
# UEFxPT9NcCOGDErcgdLMMpSEDQgJlxxPwO5rIHQw0uA5NBCFIRUBCOhVMt5xSdko
# F1BN5r5N0XWs0Mr7QbhDparTwwVETyw2m+L64kW4I1NsBm9nVX9GtUw/bihaeSbS
# pKhil9Ie4u1Ki7wb/UdKDd9nZn6yW0HQO+T0O/QEY+nvwlQAUaCKKsnOeMzV6ocE
# GLPOr0mIr/OSmbaz5mEP0oUA51Aa5BuVnRmhuZyxm7EAHu/QD09CbMkKvO5D+jpx
# pchNJqU1/YldvIViHTLSoCtU7ZpXwdv6EM8Zt4tKG48BtieVU+i2iW1bvGjUI+iL
# UaJW+fCmgKDWHrO8Dw9TdSmq6hN35N6MgSGtBxBHEa2HPQfRdbzP82Z+MIIFsTCC
# BJmgAwIBAgIQASQK+x44C4oW8UtxnfTTwDANBgkqhkiG9w0BAQwFADBlMQswCQYD
# VQQGEwJVUzEVMBMGA1UEChMMRGlnaUNlcnQgSW5jMRkwFwYDVQQLExB3d3cuZGln
# aWNlcnQuY29tMSQwIgYDVQQDExtEaWdpQ2VydCBBc3N1cmVkIElEIFJvb3QgQ0Ew
# HhcNMjIwNjA5MDAwMDAwWhcNMzExMTA5MjM1OTU5WjBiMQswCQYDVQQGEwJVUzEV
# MBMGA1UEChMMRGlnaUNlcnQgSW5jMRkwFwYDVQQLExB3d3cuZGlnaWNlcnQuY29t
# MSEwHwYDVQQDExhEaWdpQ2VydCBUcnVzdGVkIFJvb3QgRzQwggIiMA0GCSqGSIb3
# DQEBAQUAA4ICDwAwggIKAoICAQC/5pBzaN675F1KPDAiMGkz7MKnJS7JIT3yithZ
# wuEppz1Yq3aaza57G4QNxDAf8xukOBbrVsaXbR2rsnnyyhHS5F/WBTxSD1Ifxp4V
# pX6+n6lXFllVcq9ok3DCsrp1mWpzMpTREEQQLt+C8weE5nQ7bXHiLQwb7iDVySAd
# YyktzuxeTsiT+CFhmzTrBcZe7FsavOvJz82sNEBfsXpm7nfISKhmV1efVFiODCu3
# T6cw2Vbuyntd463JT17lNecxy9qTXtyOj4DatpGYQJB5w3jHtrHEtWoYOAMQjdjU
# N6QuBX2I9YI+EJFwq1WCQTLX2wRzKm6RAXwhTNS8rhsDdV14Ztk6MUSaM0C/CNda
# SaTC5qmgZ92kJ7yhTzm1EVgX9yRcRo9k98FpiHaYdj1ZXUJ2h4mXaXpI8OCiEhtm
# mnTK3kse5w5jrubU75KSOp493ADkRSWJtppEGSt+wJS00mFt6zPZxd9LBADMfRyV
# w4/3IbKyEbe7f/LVjHAsQWCqsWMYRJUadmJ+9oCw++hkpjPRiQfhvbfmQ6QYuKZ3
# AeEPlAwhHbJUKSWJbOUOUlFHdL4mrLZBdd56rF+NP8m800ERElvlEFDrMcXKchYi
# Cd98THU/Y+whX8QgUWtvsauGi0/C1kVfnSD8oR7FwI+isX4KJpn15GkvmB0t9dmp
# sh3lGwIDAQABo4IBXjCCAVowDwYDVR0TAQH/BAUwAwEB/zAdBgNVHQ4EFgQU7Nfj
# gtJxXWRM3y5nP+e6mK4cD08wHwYDVR0jBBgwFoAUReuir/SSy4IxLVGLp6chnfNt
# yA8wDgYDVR0PAQH/BAQDAgGGMBMGA1UdJQQMMAoGCCsGAQUFBwMIMHkGCCsGAQUF
# BwEBBG0wazAkBggrBgEFBQcwAYYYaHR0cDovL29jc3AuZGlnaWNlcnQuY29tMEMG
# CCsGAQUFBzAChjdodHRwOi8vY2FjZXJ0cy5kaWdpY2VydC5jb20vRGlnaUNlcnRB
# c3N1cmVkSURSb290Q0EuY3J0MEUGA1UdHwQ+MDwwOqA4oDaGNGh0dHA6Ly9jcmwz
# LmRpZ2ljZXJ0LmNvbS9EaWdpQ2VydEFzc3VyZWRJRFJvb3RDQS5jcmwwIAYDVR0g
# BBkwFzAIBgZngQwBBAIwCwYJYIZIAYb9bAcBMA0GCSqGSIb3DQEBDAUAA4IBAQCa
# FgKlAe+B+w20WLJ4ragjGdlzN9pgnlHXy/gvQLmjH3xATjM+kDzniQF1hehiex1W
# 4HG63l7GN7x5XGIATfhJelFNBjLzxdIAKicg6okuFTngLD74dXwsgkFhNQ8j0O01
# ldKIlSlDy+CmWBB8U46fRckgNxTA7Rm6fnc50lSWx6YR3zQz9nVSQkscnY2W1ZVs
# RxIUJF8mQfoaRr3esOWRRwOsGAjLy9tmiX8rnGW/vjdOvi3znUrDzMxHXsiVla3R
# y7sqBiD5P3LqNutFcpJ6KXsUAzz7TdZIcXoQEYoIdM1sGwRc0oqVA3ZRUFPWLvdK
# RsOuECxxTLCHtic3RGBEMIIGrjCCBJagAwIBAgIQBzY3tyRUfNhHrP0oZipeWzAN
# BgkqhkiG9w0BAQsFADBiMQswCQYDVQQGEwJVUzEVMBMGA1UEChMMRGlnaUNlcnQg
# SW5jMRkwFwYDVQQLExB3d3cuZGlnaWNlcnQuY29tMSEwHwYDVQQDExhEaWdpQ2Vy
# dCBUcnVzdGVkIFJvb3QgRzQwHhcNMjIwMzIzMDAwMDAwWhcNMzcwMzIyMjM1OTU5
# WjBjMQswCQYDVQQGEwJVUzEXMBUGA1UEChMORGlnaUNlcnQsIEluYy4xOzA5BgNV
# BAMTMkRpZ2lDZXJ0IFRydXN0ZWQgRzQgUlNBNDA5NiBTSEEyNTYgVGltZVN0YW1w
# aW5nIENBMIICIjANBgkqhkiG9w0BAQEFAAOCAg8AMIICCgKCAgEAxoY1BkmzwT1y
# SVFVxyUDxPKRN6mXUaHW0oPRnkyibaCwzIP5WvYRoUQVQl+kiPNo+n3znIkLf50f
# ng8zH1ATCyZzlm34V6gCff1DtITaEfFzsbPuK4CEiiIY3+vaPcQXf6sZKz5C3GeO
# 6lE98NZW1OcoLevTsbV15x8GZY2UKdPZ7Gnf2ZCHRgB720RBidx8ald68Dd5n12s
# y+iEZLRS8nZH92GDGd1ftFQLIWhuNyG7QKxfst5Kfc71ORJn7w6lY2zkpsUdzTYN
# XNXmG6jBZHRAp8ByxbpOH7G1WE15/tePc5OsLDnipUjW8LAxE6lXKZYnLvWHpo9O
# dhVVJnCYJn+gGkcgQ+NDY4B7dW4nJZCYOjgRs/b2nuY7W+yB3iIU2YIqx5K/oN7j
# PqJz+ucfWmyU8lKVEStYdEAoq3NDzt9KoRxrOMUp88qqlnNCaJ+2RrOdOqPVA+C/
# 8KI8ykLcGEh/FDTP0kyr75s9/g64ZCr6dSgkQe1CvwWcZklSUPRR8zZJTYsg0ixX
# NXkrqPNFYLwjjVj33GHek/45wPmyMKVM1+mYSlg+0wOI/rOP015LdhJRk8mMDDtb
# iiKowSYI+RQQEgN9XyO7ZONj4KbhPvbCdLI/Hgl27KtdRnXiYKNYCQEoAA6EVO7O
# 6V3IXjASvUaetdN2udIOa5kM0jO0zbECAwEAAaOCAV0wggFZMBIGA1UdEwEB/wQI
# MAYBAf8CAQAwHQYDVR0OBBYEFLoW2W1NhS9zKXaaL3WMaiCPnshvMB8GA1UdIwQY
# MBaAFOzX44LScV1kTN8uZz/nupiuHA9PMA4GA1UdDwEB/wQEAwIBhjATBgNVHSUE
# DDAKBggrBgEFBQcDCDB3BggrBgEFBQcBAQRrMGkwJAYIKwYBBQUHMAGGGGh0dHA6
# Ly9vY3NwLmRpZ2ljZXJ0LmNvbTBBBggrBgEFBQcwAoY1aHR0cDovL2NhY2VydHMu
# ZGlnaWNlcnQuY29tL0RpZ2lDZXJ0VHJ1c3RlZFJvb3RHNC5jcnQwQwYDVR0fBDww
# OjA4oDagNIYyaHR0cDovL2NybDMuZGlnaWNlcnQuY29tL0RpZ2lDZXJ0VHJ1c3Rl
# ZFJvb3RHNC5jcmwwIAYDVR0gBBkwFzAIBgZngQwBBAIwCwYJYIZIAYb9bAcBMA0G
# CSqGSIb3DQEBCwUAA4ICAQB9WY7Ak7ZvmKlEIgF+ZtbYIULhsBguEE0TzzBTzr8Y
# +8dQXeJLKftwig2qKWn8acHPHQfpPmDI2AvlXFvXbYf6hCAlNDFnzbYSlm/EUExi
# HQwIgqgWvalWzxVzjQEiJc6VaT9Hd/tydBTX/6tPiix6q4XNQ1/tYLaqT5Fmniye
# 4Iqs5f2MvGQmh2ySvZ180HAKfO+ovHVPulr3qRCyXen/KFSJ8NWKcXZl2szwcqMj
# +sAngkSumScbqyQeJsG33irr9p6xeZmBo1aGqwpFyd/EjaDnmPv7pp1yr8THwcFq
# cdnGE4AJxLafzYeHJLtPo0m5d2aR8XKc6UsCUqc3fpNTrDsdCEkPlM05et3/JWOZ
# Jyw9P2un8WbDQc1PtkCbISFA0LcTJM3cHXg65J6t5TRxktcma+Q4c6umAU+9Pzt4
# rUyt+8SVe+0KXzM5h0F4ejjpnOHdI/0dKNPH+ejxmF/7K9h+8kaddSweJywm228V
# ex4Ziza4k9Tm8heZWcpw8De/mADfIBZPJ/tgZxahZrrdVcA6KYawmKAr7ZVBtzrV
# FZgxtGIJDwq9gdkT/r+k0fNX2bwE+oLeMt8EifAAzV3C+dAjfwAL5HYCJtnwZXZC
# pimHCUcr5n8apIUP/JiW9lVUKx+A+sDyDivl1vupL0QVSucTDh3bNzgaoSv27dZ8
# /DCCBrAwggSYoAMCAQICEAitQLJg0pxMn17Nqb2TrtkwDQYJKoZIhvcNAQEMBQAw
# YjELMAkGA1UEBhMCVVMxFTATBgNVBAoTDERpZ2lDZXJ0IEluYzEZMBcGA1UECxMQ
# d3d3LmRpZ2ljZXJ0LmNvbTEhMB8GA1UEAxMYRGlnaUNlcnQgVHJ1c3RlZCBSb290
# IEc0MB4XDTIxMDQyOTAwMDAwMFoXDTM2MDQyODIzNTk1OVowaTELMAkGA1UEBhMC
# VVMxFzAVBgNVBAoTDkRpZ2lDZXJ0LCBJbmMuMUEwPwYDVQQDEzhEaWdpQ2VydCBU
# cnVzdGVkIEc0IENvZGUgU2lnbmluZyBSU0E0MDk2IFNIQTM4NCAyMDIxIENBMTCC
# AiIwDQYJKoZIhvcNAQEBBQADggIPADCCAgoCggIBANW0L0LQKK14t13VOVkbsYhC
# 9TOM6z2Bl3DFu8SFJjCfpI5o2Fz16zQkB+FLT9N4Q/QX1x7a+dLVZxpSTw6hV/yI
# mcGRzIEDPk1wJGSzjeIIfTR9TIBXEmtDmpnyxTsf8u/LR1oTpkyzASAl8xDTi7L7
# CPCK4J0JwGWn+piASTWHPVEZ6JAheEUuoZ8s4RjCGszF7pNJcEIyj/vG6hzzZWiR
# ok1MghFIUmjeEL0UV13oGBNlxX+yT4UsSKRWhDXW+S6cqgAV0Tf+GgaUwnzI6hsy
# 5srC9KejAw50pa85tqtgEuPo1rn3MeHcreQYoNjBI0dHs6EPbqOrbZgGgxu3amct
# 0r1EGpIQgY+wOwnXx5syWsL/amBUi0nBk+3htFzgb+sm+YzVsvk4EObqzpH1vtP7
# b5NhNFy8k0UogzYqZihfsHPOiyYlBrKD1Fz2FRlM7WLgXjPy6OjsCqewAyuRsjZ5
# vvetCB51pmXMu+NIUPN3kRr+21CiRshhWJj1fAIWPIMorTmG7NS3DVPQ+EfmdTCN
# 7DCTdhSmW0tddGFNPxKRdt6/WMtyEClB8NXFbSZ2aBFBE1ia3CYrAfSJTVnbeM+B
# Sj5AR1/JgVBzhRAjIVlgimRUwcwhGug4GXxmHM14OEUwmU//Y09Mu6oNCFNBfFg9
# R7P6tuyMMgkCzGw8DFYRAgMBAAGjggFZMIIBVTASBgNVHRMBAf8ECDAGAQH/AgEA
# MB0GA1UdDgQWBBRoN+Drtjv4XxGG+/5hewiIZfROQjAfBgNVHSMEGDAWgBTs1+OC
# 0nFdZEzfLmc/57qYrhwPTzAOBgNVHQ8BAf8EBAMCAYYwEwYDVR0lBAwwCgYIKwYB
# BQUHAwMwdwYIKwYBBQUHAQEEazBpMCQGCCsGAQUFBzABhhhodHRwOi8vb2NzcC5k
# aWdpY2VydC5jb20wQQYIKwYBBQUHMAKGNWh0dHA6Ly9jYWNlcnRzLmRpZ2ljZXJ0
# LmNvbS9EaWdpQ2VydFRydXN0ZWRSb290RzQuY3J0MEMGA1UdHwQ8MDowOKA2oDSG
# Mmh0dHA6Ly9jcmwzLmRpZ2ljZXJ0LmNvbS9EaWdpQ2VydFRydXN0ZWRSb290RzQu
# Y3JsMBwGA1UdIAQVMBMwBwYFZ4EMAQMwCAYGZ4EMAQQBMA0GCSqGSIb3DQEBDAUA
# A4ICAQA6I0Q9jQh27o+8OpnTVuACGqX4SDTzLLbmdGb3lHKxAMqvbDAnExKekESf
# S/2eo3wm1Te8Ol1IbZXVP0n0J7sWgUVQ/Zy9toXgdn43ccsi91qqkM/1k2rj6yDR
# 1VB5iJqKisG2vaFIGH7c2IAaERkYzWGZgVb2yeN258TkG19D+D6U/3Y5PZ7Umc9K
# 3SjrXyahlVhI1Rr+1yc//ZDRdobdHLBgXPMNqO7giaG9OeE4Ttpuuzad++UhU1rD
# yulq8aI+20O4M8hPOBSSmfXdzlRt2V0CFB9AM3wD4pWywiF1c1LLRtjENByipUuN
# zW92NyyFPxrOJukYvpAHsEN/lYgggnDwzMrv/Sk1XB+JOFX3N4qLCaHLC+kxGv8u
# GVw5ceG+nKcKBtYmZ7eS5k5f3nqsSc8upHSSrds8pJyGH+PBVhsrI/+PteqIe3Br
# 5qC6/To/RabE6BaRUotBwEiES5ZNq0RA443wFSjO7fEYVgcqLxDEDAhkPDOPriiM
# PMuPiAsNvzv0zh57ju+168u38HcT5ucoP6wSrqUvImxB+YJcFWbMbA7KxYbD9iYz
# DAdLoNMHAmpqQDBISzSoUSC7rRuFCOJZDW3KBVAr6kocnqX9oKcfBnTn8tZSkP2v
# hUgh+Vc7tJwD7YZF9LRhbr9o4iZghurIr6n+lB3nYxs6hlZ4TjCCBsYwggSuoAMC
# AQICEAp6SoieyZlCkAZjOE2Gl50wDQYJKoZIhvcNAQELBQAwYzELMAkGA1UEBhMC
# VVMxFzAVBgNVBAoTDkRpZ2lDZXJ0LCBJbmMuMTswOQYDVQQDEzJEaWdpQ2VydCBU
# cnVzdGVkIEc0IFJTQTQwOTYgU0hBMjU2IFRpbWVTdGFtcGluZyBDQTAeFw0yMjAz
# MjkwMDAwMDBaFw0zMzAzMTQyMzU5NTlaMEwxCzAJBgNVBAYTAlVTMRcwFQYDVQQK
# Ew5EaWdpQ2VydCwgSW5jLjEkMCIGA1UEAxMbRGlnaUNlcnQgVGltZXN0YW1wIDIw
# MjIgLSAyMIICIjANBgkqhkiG9w0BAQEFAAOCAg8AMIICCgKCAgEAuSqWI6ZcvF/W
# SfAVghj0M+7MXGzj4CUu0jHkPECu+6vE43hdflw26vUljUOjges4Y/k8iGnePNIw
# UQ0xB7pGbumjS0joiUF/DbLW+YTxmD4LvwqEEnFsoWImAdPOw2z9rDt+3Cocqb0w
# xhbY2rzrsvGD0Z/NCcW5QWpFQiNBWvhg02UsPn5evZan8Pyx9PQoz0J5HzvHkwdo
# aOVENFJfD1De1FksRHTAMkcZW+KYLo/Qyj//xmfPPJOVToTpdhiYmREUxSsMoDPb
# TSSF6IKU4S8D7n+FAsmG4dUYFLcERfPgOL2ivXpxmOwV5/0u7NKbAIqsHY07gGj+
# 0FmYJs7g7a5/KC7CnuALS8gI0TK7g/ojPNn/0oy790Mj3+fDWgVifnAs5SuyPWPq
# yK6BIGtDich+X7Aa3Rm9n3RBCq+5jgnTdKEvsFR2wZBPlOyGYf/bES+SAzDOMLeL
# D11Es0MdI1DNkdcvnfv8zbHBp8QOxO9APhk6AtQxqWmgSfl14ZvoaORqDI/r5LEh
# e4ZnWH5/H+gr5BSyFtaBocraMJBr7m91wLA2JrIIO/+9vn9sExjfxm2keUmti39h
# hwVo99Rw40KV6J67m0uy4rZBPeevpxooya1hsKBBGBlO7UebYZXtPgthWuo+epiS
# Uc0/yUTngIspQnL3ebLdhOon7v59emsCAwEAAaOCAYswggGHMA4GA1UdDwEB/wQE
# AwIHgDAMBgNVHRMBAf8EAjAAMBYGA1UdJQEB/wQMMAoGCCsGAQUFBwMIMCAGA1Ud
# IAQZMBcwCAYGZ4EMAQQCMAsGCWCGSAGG/WwHATAfBgNVHSMEGDAWgBS6FtltTYUv
# cyl2mi91jGogj57IbzAdBgNVHQ4EFgQUjWS3iSH+VlhEhGGn6m8cNo/drw0wWgYD
# VR0fBFMwUTBPoE2gS4ZJaHR0cDovL2NybDMuZGlnaWNlcnQuY29tL0RpZ2lDZXJ0
# VHJ1c3RlZEc0UlNBNDA5NlNIQTI1NlRpbWVTdGFtcGluZ0NBLmNybDCBkAYIKwYB
# BQUHAQEEgYMwgYAwJAYIKwYBBQUHMAGGGGh0dHA6Ly9vY3NwLmRpZ2ljZXJ0LmNv
# bTBYBggrBgEFBQcwAoZMaHR0cDovL2NhY2VydHMuZGlnaWNlcnQuY29tL0RpZ2lD
# ZXJ0VHJ1c3RlZEc0UlNBNDA5NlNIQTI1NlRpbWVTdGFtcGluZ0NBLmNydDANBgkq
# hkiG9w0BAQsFAAOCAgEADS0jdKbR9fjqS5k/AeT2DOSvFp3Zs4yXgimcQ28BLas4
# tXARv4QZiz9d5YZPvpM63io5WjlO2IRZpbwbmKrobO/RSGkZOFvPiTkdcHDZTt8j
# ImzV3/ZZy6HC6kx2yqHcoSuWuJtVqRprfdH1AglPgtalc4jEmIDf7kmVt7PMxafu
# DuHvHjiKn+8RyTFKWLbfOHzL+lz35FO/bgp8ftfemNUpZYkPopzAZfQBImXH6l50
# pls1klB89Bemh2RPPkaJFmMga8vye9A140pwSKm25x1gvQQiFSVwBnKpRDtpRxHT
# 7unHoD5PELkwNuTzqmkJqIt+ZKJllBH7bjLx9bs4rc3AkxHVMnhKSzcqTPNc3LaF
# wLtwMFV41pj+VG1/calIGnjdRncuG3rAM4r4SiiMEqhzzy350yPynhngDZQooOvb
# GlGglYKOKGukzp123qlzqkhqWUOuX+r4DwZCnd8GaJb+KqB0W2Nm3mssuHiqTXBt
# 8CzxBxV+NbTmtQyimaXXFWs1DoXW4CzM4AwkuHxSCx6ZfO/IyMWMWGmvqz3hz8x9
# Fa4Uv4px38qXsdhH6hyF4EVOEhwUKVjMb9N/y77BDkpvIJyu2XMyWQjnLZKhGhH+
# MpimXSuX4IvTnMxttQ2uR2M4RxdbbxPaahBuH0m3RFu0CAqHWlkEdhGhp3cCExww
# ggdeMIIFRqADAgECAhAFulYuS3p29y1ilWIrK5dmMA0GCSqGSIb3DQEBCwUAMGkx
# CzAJBgNVBAYTAlVTMRcwFQYDVQQKEw5EaWdpQ2VydCwgSW5jLjFBMD8GA1UEAxM4
# RGlnaUNlcnQgVHJ1c3RlZCBHNCBDb2RlIFNpZ25pbmcgUlNBNDA5NiBTSEEzODQg
# MjAyMSBDQTEwHhcNMjExMjAxMDAwMDAwWhcNMjMxMjA3MjM1OTU5WjBjMQswCQYD
# VQQGEwJVUzESMBAGA1UECBMJVGVubmVzc2VlMRIwEAYDVQQHEwlUdWxsYWhvbWEx
# FTATBgNVBAoTDENhcmwgV2Vic3RlcjEVMBMGA1UEAxMMQ2FybCBXZWJzdGVyMIIC
# IjANBgkqhkiG9w0BAQEFAAOCAg8AMIICCgKCAgEA98Xfb+rSvcKK6oXU0jjumwlQ
# CG2EltgTWqBp3yIWVJvPgbbryZB0JNT3vWbZUOnqZxENFG/YxDdR88ByukOAeveR
# E1oeYNva7kbEpQ7vH9sTNiVFsglOQRtSyBch3353BZ51gIESO1sxW9dw41rMdUw6
# AhxoMxwhX0RTV25mUVAadNzDEuZzTP3zXpWuoAeYpppe8yptyw8OR79Ad83ttDPL
# r6o/SwXYH2EeaQu195FFq7Fn6Yp/kLYAgOrpJFJpRxd+b2kWxnOaF5RI/EcbLH+/
# 20xTDOho3V7VGWTiRs18QNLb1u14wiBTUnHvLsLBT1g5fli4RhL7rknp8DHksuIS
# IIQVMWVfgFmgCsV9of4ymf4EmyzIJexXcdFHDw2x/bWFqXti/TPV8wYKlEaLa2Mr
# SMH1Jrnqt/vcP/DP2IUJa4FayoY2l8wvGOLNjYvfQ6c6RThd1ju7d62r9EJI8aPX
# PvcrlyZ3y6UH9tiuuPzsyNVnXKyDphJm5I57tLsN8LSBNVo+I227VZfXq3MUuhz0
# oyErzFeKnLsPB1afLLfBzCSeYWOMjWpLo+PufKgh0X8OCRSfq6Iigpj9q5KzjQ29
# L9BVnOJuWt49fwWFfmBOrcaR9QaN4gAHSY9+K7Tj3kUo0AHl66QaGWetR7XYTel+
# ydst/fzYBq6SafVOt1kCAwEAAaOCAgYwggICMB8GA1UdIwQYMBaAFGg34Ou2O/hf
# EYb7/mF7CIhl9E5CMB0GA1UdDgQWBBQ5WnsIlilu682kqvRMmUxb5DHugTAOBgNV
# HQ8BAf8EBAMCB4AwEwYDVR0lBAwwCgYIKwYBBQUHAwMwgbUGA1UdHwSBrTCBqjBT
# oFGgT4ZNaHR0cDovL2NybDMuZGlnaWNlcnQuY29tL0RpZ2lDZXJ0VHJ1c3RlZEc0
# Q29kZVNpZ25pbmdSU0E0MDk2U0hBMzg0MjAyMUNBMS5jcmwwU6BRoE+GTWh0dHA6
# Ly9jcmw0LmRpZ2ljZXJ0LmNvbS9EaWdpQ2VydFRydXN0ZWRHNENvZGVTaWduaW5n
# UlNBNDA5NlNIQTM4NDIwMjFDQTEuY3JsMD4GA1UdIAQ3MDUwMwYGZ4EMAQQBMCkw
# JwYIKwYBBQUHAgEWG2h0dHA6Ly93d3cuZGlnaWNlcnQuY29tL0NQUzCBlAYIKwYB
# BQUHAQEEgYcwgYQwJAYIKwYBBQUHMAGGGGh0dHA6Ly9vY3NwLmRpZ2ljZXJ0LmNv
# bTBcBggrBgEFBQcwAoZQaHR0cDovL2NhY2VydHMuZGlnaWNlcnQuY29tL0RpZ2lD
# ZXJ0VHJ1c3RlZEc0Q29kZVNpZ25pbmdSU0E0MDk2U0hBMzg0MjAyMUNBMS5jcnQw
# DAYDVR0TAQH/BAIwADANBgkqhkiG9w0BAQsFAAOCAgEAGcm1xuESCj6YVIf55C/g
# tmnsRJWtf7zEyqUtXhYU+PMciHnjnUbOmuF1+jKTA6j9FN0Ktv33fVxtWQ+ZisNs
# sZbfwaUd3goBQatFF2TmUc1KVsRUj/VU+uVPcL++tzaYkDydowhiP+9DIEOXOYxu
# njlwFppOGrk3edKRj8p7puv9sZZTdPiUHmJ1GvideoXTAJ1Db6Jmn6eetnl4m6zx
# 9CCDJF9z8KexKS1bSpJBbdKz71H1PlgI7Tu4ntLyyaRVOpan8XYWmu9k35TOfHHl
# 8Cvbg6itg0fIJgvqnLJ4Huc+y6o/zrvj6HrFSOK6XowdQLQshrMZ2ceTu8gVkZsK
# Ztu0JeMpkbVKmKi/7RXIZdh9bn0NhzslioXEX+s70d60kntMsBAQX0ArOpKmrqZZ
# JuxNMGAIXpEwSTeyqu0ujZI9eE1AU7EcZsYkZawdyLmilZdw1qwEQlAvEqyjbjY8
# 1qtpkORAeJSpnPelUlyyQelJPLWFR0syKsUyROqg5OFXINxkHaJcuWLWRPFJOEoo
# SWPEid4rHMftaG2gOPg35o7yPzzHd8Y9pCX2v55NYjLrjUkz9JCjQ/g0LiOo3a+y
# vot+7izsaJEs8SAdhG7RZ/fdsyv+SyyoEzsd1iO/mZ2DQ0rKaU/fiCXJpvrNmEwg
# +pbeIOCOgS0x5pQ0dyMlBZoxggYKMIIGBgIBATB9MGkxCzAJBgNVBAYTAlVTMRcw
# FQYDVQQKEw5EaWdpQ2VydCwgSW5jLjFBMD8GA1UEAxM4RGlnaUNlcnQgVHJ1c3Rl
# ZCBHNCBDb2RlIFNpZ25pbmcgUlNBNDA5NiBTSEEzODQgMjAyMSBDQTECEAW6Vi5L
# enb3LWKVYisrl2YwCQYFKw4DAhoFAKBAMBkGCSqGSIb3DQEJAzEMBgorBgEEAYI3
# AgEEMCMGCSqGSIb3DQEJBDEWBBSMA1B5yQccC5BOoVRdIOS4sXMcVTANBgkqhkiG
# 9w0BAQEFAASCAgBJKjq7WvwRDJq6f2ydeqedlJ/JFPqVL2VC6S0H/g8jDyk3HFf/
# TSG16svcL7Mxmfe7jnqsf34BlTa5XAaI5avvGxqFrZNSAuo+WVV5QyjWGOOJulai
# lcj/v9CN5FJrGIRwPpn3E41xDtLOsxm7IBG1Ap36+gOb2IImJCSlUAUy9QSjIxcg
# uNzDOi94hIBHvJrlcqXQWcEHr3Bfrrt7phs9HF5EpC3R4me/ViqVoVvx9TPOTbVX
# LdTPp+oWpZ+OsPbEG7ARbKJnTZomVr6E0B7aq+B3U+/qlUf/eYgX3OTHtYNkJOBD
# PfpcTy1i5CLt2L0J7W8IV0AZYO011npjHQaFUHa9+J7bgAm+4RNeRN4SkrHPuGGR
# okEn+I4Ya/SJC9t9YwhOSwxW6+p5QTk5mbM22dbOgVXqIxo8+L1KcSRqqTJqKhHt
# PZgpwKlXUczSj/K8buqPCeysBUHHTUxPm+V30ntTtZJXMuRb8NkI2YRPRzhyUswa
# pTrnQ2PJMI8R5hDKNZmZNizOWq2EnOlLm9fNkFoxV6TvakqKbn8JCxQR6UNNjxQH
# ZfGuny4qhWYSX261vtTzd8tjWpetlvwqrXjgtegN7n6K+zhQMAjjLOvSnbid/MZo
# 6haovoc5PFPlDZY+XOM/sLp30++VCnCp+hitStnyTRPfyplRRTDQ0CsLM6GCAyAw
# ggMcBgkqhkiG9w0BCQYxggMNMIIDCQIBATB3MGMxCzAJBgNVBAYTAlVTMRcwFQYD
# VQQKEw5EaWdpQ2VydCwgSW5jLjE7MDkGA1UEAxMyRGlnaUNlcnQgVHJ1c3RlZCBH
# NCBSU0E0MDk2IFNIQTI1NiBUaW1lU3RhbXBpbmcgQ0ECEAp6SoieyZlCkAZjOE2G
# l50wDQYJYIZIAWUDBAIBBQCgaTAYBgkqhkiG9w0BCQMxCwYJKoZIhvcNAQcBMBwG
# CSqGSIb3DQEJBTEPFw0yMjA3MTUyMzA3MzZaMC8GCSqGSIb3DQEJBDEiBCAqLE7Z
# RNckuzXN+itIehXbNXyuohWigxv65lWjl77GYTANBgkqhkiG9w0BAQEFAASCAgB5
# 73J+6mISRioPegTDzJx8ORUnVZ2aTQ9wLuBJvLMU7+TiPmg1UN7SyHoIgEHInCi3
# TBs1AJ0ByddCGoqwj7t7GY1cJQDhQ4iDj7vZJWUmQB/pQJV84hkrcAl9olh7QETC
# fYhYKjfjgfr6AidoW7UeR4UgVwdbrvBQAHLBSYHUMO6bOBlnMhBiebKMuDO/h4Qe
# NDwUUcZiUpBD78UPUgNSPFczNk/cdBSo0Us4OZrK5Dq5inKviuIj7StnCzZLACQ6
# RhTWeIKNCEwLOXMYllk43QUyplcJGRGQaJBmTHxvjWy1MGuY15UA3TEEtu7uRczC
# Adh/t/42R46lepXWSmJX9AFkouyWhW4cg+GJWKDilbeBuV0vdhGtTnLt0BDu1FVu
# n+w3cSnYgOX/4IoZkuB31IAfpsyo0/jeAtXk8WUk8JnHU6qrknSDGPGriJgYRHyH
# 0YT1IlWe6Vbp0jdgHEjWhlBLK7Etx7BUZv3p0haCopmIL+Ekl8IhVWktBcnrQqMr
# +CSaoIxR+NsRyGCxUfyOp9FUcUkf9TZ6q/pt6SH7iuhVIptrI8+tQ49aoCZZzDqD
# BgaeuL516d9+DNVJzVUWN96r+0MwFx0dTebuHWMqUng4jy9FKUI9+/voHJaEAH2Z
# bpaf92ynA7JgcftKXRGi10gZ5eD1sSonY5e1N68IeA==
# SIG # End signature block
