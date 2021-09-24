# Introduction-to-Using-PowerShell-with-the-PI-System

PowerShell is a useful programming language that can be run on just about any Windows machine "out of the box" with no installation required. This combined with its tight integration with the .NET framework makes it a very useful tool for working with the PI System in client environments.
 
This session will first provide a basic introduction to PowerShell. Once we've warmed up with this, we'll go over the ways in which we can use it to interact with the PI System. Then, as time permits, we'll go over the process of building some useful scripts that can make many PI System tasks less tedious (OSIsoft's PowerShell module, direct .NET bindings for AF SDK, etc.). Attendees can expect to walk away with a useful script or two but more importantly, they'll have a good starting point and be pointed in the right direction for learning more.
 
This is intended to be a hands on session! To take full advantage of this, you will need a PI System you can connect to from your own workstation. (Please don't use a client's system for this, of course.)
 
A recording will be made available for those who are unable to make this time work for them.

NOTE: If you're the type of person interested in this material, we're the type of person we're interested in hiring 😀! (https://www.linkedin.com/company/radix-us/jobs/)

# Introduction

## What is PowerShell and Why Should I Care?

## Who this course is for

## What will you learn?

## What will you need?


# PowerShell Basics

## Choose Your Editor

## Running Code

## Creating Variables

## Object Types and .NET Bindings

## Arrays

## Objects

## Exporting Output

## Creating Functions


## What I Hate About PowerShell
- Too many creative freedoms with syntax.
- Similar to C# but syntax is much more verbose.
- Arrays of one are automatically converted from arrays.
- Stuck on PowerShell 5 (everything beyond this isn't bundled with Windows).
- Performance (can get around this by compiling C# code or using prepackaged dll's.)

# PowerShell and the PI System

## Means through which to interact
- OSIsoft's PowerShell module
- AF SDK .NET Binding
- Other Dll's

## OSIsoft's Documentation
docs.osisoft.com

## Examples

### Getting an Attribute's Data

### Finding Objects in AF.

### Quality Checking in data for a set of Attributes.


### Finding Analysis Output PI Points

#
Other use cases:
- Integrating with command line tools
- Collecting Analysis service statistics
- Studying AF Analyses
- Tracking out of order events
- Refactoring AF Element Templates
- Closing orphaned / long-running event frames
- Automating PI Vision
- Parsing log files from applications
- Interacting with SQL databases

Additional resources:
- Linq with PowerShell
- OSIsoft AF SDK docs
- Creating functions
- PSCustomObjects
- PowerShell classes
- PowerShell in VSCode
- PowerShell in a month of lunches
- Approved Verbs for PowerShell Commands - PowerShell
- Executing C# code using PowerShell script – Random IT Utensils
- PowerShell - Read an Excel file using COM Interface
- https://foxdeploy.com/2015/04/16/part-ii-deploying-powershell-guis-in-minutes-using-visual-studio/
- Using Windows Task Manager for PowerShell
- https://powershellexplained.com/2016-10-28-powershell-everything-you-wanted-to-know-about-pscustomobject/
- https://lazywinadmin.github.io/2014/03/powershell-read-excel-file-using-com.html
- https://blog.adamfurmanek.pl/2016/03/19/executing-c-code-using-powershell-script/
- https://docs.microsoft.com/en-us/powershell/scripting/developer/cmdlet/approved-verbs-for-windows-powershell-commands?view=powershell-5.1
- https://www.koupi.io/post/creating-a-powershell-console-menu	
- https://michlstechblog.info/blog/- powershell-working-with-a-sqlite-database/
- Pester
- PowerShell Styling
- PowerShell pipeline
- PowerShell credentials and how to store them safel
- Execution policy
- https://docs.microsoft.com/en-us/powershell/module/microsoft.powershell.security/set-executionpolicy?view=powershell-5.1