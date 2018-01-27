# xsort

[![](https://img.shields.io/badge/Twitter-O--Liker%20Error-blue.svg)](https://twitter.com/O_Linker_Error)
[![](https://img.shields.io/badge/Language-Ruby-red.svg)](https://www.ruby-lang.org/ja/)
[![](https://img.shields.io/apm/l/vim-mode.svg)](https://github.com/keisukeYamagishi/xsort/blob/master/LICENSE)

## Overview

Sort the file tree next to Xcode by file name.

## git clone

***Via SSH***: For those who plan on regularly making direct commits, cloning over SSH may provide a better experience (which requires uploading SSH keys to GitHub):

```
$ mkdir gitrepo

$ cd gitrepo

$ git clone git@github.com:keisukeYamagishi/xsort.git

```

***Via https***: For those checking out sources as read-only, HTTPS works best:

```
$ mkdir gitrepo

$ cd gitrepo

$ git clone https://github.com/keisukeYamagishi/xsort.git

```

## Usage 

```

Usage: xsort [-v] [<path>] [-o] 
These are common detect commands used in various situations:
xsort version: 1.1.1
option:
-v: display xsort version number
-o: output result
-r: Just extracting output.pbxproj will not write to pbxproj of Xcode project

Regars !

```

## Run

⚠️Please do version control and back up before doing.⚠️

```
xsort ./xsort ./project.pbxproj
```

this will sort files in the Xcode directory

Output.pbxproj file will be output so copy and paste it.

## Use it

```

./xsort path_to_project.pbxproj

```

## option

***Display result log***

if you want to display result log

```
./xsort ./path/to/project.pbxproj -o
```

result
```
// !$*UTF8*$!
{
	archiveVersion = 1;
	classes = {
	};
	objectVersion = 46;
	objects = {

/* Begin PBXBuildFile section */
		BA218946A1F8E64C27B613CD /* Pods_Breris.framework in Frameworks */ = {isa = PBXBuildFile; fileRef = F0B2DD76AFE7C2922950BB5D /* Pods_Breris.framework */; };
		C704FFE71FB0A67D0043E7BD /* bggfg.jpg in Resources */ = {isa = PBXBuildFile; fileRef = C704FFE61FB0A67D0043E7BD /* bggfg.jpg */; };
		C704FFE91FB0A68C0043E7BD /* world.jpg in Resources */ = {isa = PBXBuildFile; fileRef = C704FFE81FB0A68C0043E7BD /* world.jpg */; };
		C7080F921FFC317F0077A4AD /* TwitterAuth.swift in Sources */ = {isa = PBXBuildFile; fileRef = C7080F911FFC317F0077A4AD /* TwitterAuth.swift */; };
		C7080FB21FFC97F60077A4AD /* Capture.swift in Sources */ = {isa = PBXBuildFile; fileRef = C7080FB11FFC97F60077A4AD /* Capture.swift */; };
		C7080FC81FFE49A30077A4AD /* checkmark-flat.png in Resources */ = {isa = PBXBuildFile; fileRef = C7080FC71FFE49A30077A4AD /* checkmark-flat.png */; };
		C7080FCA1FFE4A0B0077A4AD /* TwtterStatus.swift in Sources */ = {isa = PBXBuildFile; fileRef = C7080FC91FFE4A0B0077A4AD /* TwtterStatus.swift */; };
		C7080FCC1FFE4A200077A4AD /* TwitterStatus.xib in Resources */ = {isa = PBXBuildFile; fileRef = C7080FCB1FFE4A200077A4AD /* TwitterStatus.xib */; };
		C7080FCE1
....... any
..... any
... any
.. any
any
```

**Looking at Xcode**

![](https://github.com/keisukeYamagishi/xsort/blob/master/res/result.png)


***Use -r options***

Do not overwrite pbxproj of Xcode project and output.pbxproj.
You can test the output pbxproj file.

```
./xsort ../App/App.xcodeproj -r
```



***Display version number***

```
->> ./xsort -v

Version: 1.0.1
```

