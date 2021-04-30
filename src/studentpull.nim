import strutils
import parseutils
import parsecfg
import os

let 
    originalUrl = paramStr(1)
    newUrl = originalUrl.replace("git@github.com", "git@gitstudent")
    dir = newUrl.captureBetween('/', '.')
    configFile = dir & "/.git/config"
discard execShellCmd("git clone " & newUrl)

const extraConfig = """

[user]
    name=JakeLeahyRMIT
    email="s3900927@student.rmit.edu.au"
"""

configFile.writeFile(readFile(configFile) & extraConfig)


