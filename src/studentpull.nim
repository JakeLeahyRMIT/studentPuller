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

var config = loadConfig(configFile)
config.setSectionKey("user", "name", "JakeLeahyRMIT")
config.setSectionKey("user", "email", "s3900927@student.rmit.edu.au")
config.writeConfig(configFile)
