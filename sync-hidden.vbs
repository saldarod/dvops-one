' Executa o sync-run.bat de forma oculta (sem janela de console)
Dim here, shell
here = Left(WScript.ScriptFullName, InStrRev(WScript.ScriptFullName, "\"))
Set shell = CreateObject("WScript.Shell")
shell.CurrentDirectory = here
shell.Run """" & here & "sync-run.bat""", 0, False
