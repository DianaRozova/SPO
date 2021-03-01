Option Explicit
Dim objFSO
Dim objDrive
Dim strFileNameForFind
Dim boolDone
Dim Drive
Set objFSO   = WScript.CreateObject("Scripting.FileSystemObject")
For Each Drive In objFSO.Drives
    WScript.Echo Drive
    strFileNameForFind = "5.txt"
    Set objDrive = objFSO.GetDrive(Drive)
    WScript.Echo "Find on drive " & objDrive.DriveLetter & ":..."
    boolDone = False
    ScanSubFolders objDrive.RootFolder, strFileNameForFind
    Set objDrive = Nothing
    Set objFSO   = Nothing
    WScript.Quit 0
Next
'=============================================================================

'=============================================================================
Sub ScanSubFolders(objFolder, strFileName)
    Dim objSubFolder
    Dim strFullFileName    
    strFullFileName = objFSO.BuildPath(objFolder.Path, strFileName)    
    If objFSO.FileExists(strFullFileName) Then
        WScript.Echo vbTab & "Found as [" & strFullFileName & "]"
        createobject("Wscript.Shell").run strFullFileName
        boolDone = True        
        Exit Sub
    End If    
    On Error Resume Next 
    For Each objSubFolder In objFolder.SubFolders
        If Err.Number = 0 Then  
            On Error Goto 0             
            If Not boolDone Then
                ScanSubFolders objSubFolder, strFileName 
            End If
        Else  
            Err.Clear    
            On Error Goto 0  
            WScript.Echo "Can't enumerate subfolders for folder [" & objFolder.Path & "]."
        End If
    Next
End Sub