@ECHO OFF

REM ************************************************
REM Copy Files.
REM Author: Alexander Gotfrid
REM ************************************************

REM ************************************************
REM Begin process
REM ************************************************

:beginning

ECHO .
ECHO Search and Bulk Copy All Files From Folder and Subfolders
ECHO That match the entered extension (jpeg, mp4, mp3,jpg)
ECHO .

:extension (
   SET /P ext="Enter the desired file extension to copy ex: jpg, mp3, mp4 ...: "

   IF NOT DEFINED ext (
         ECHO Error - No extension entered. please retry
         GOTO extension
   ) ELSE (
      ECHO You chose %ext% extension
      GOTO origin
   )
)

:origin (
   SET /P originpath="What is origin path you want to copy from? ex: S:\Pictures :"

   IF NOT DEFINED originpath (
         ECHO Error - No path entered. please retry
         GOTO origin
   ) ELSE (
      IF NOT EXIST "%originpath%" (
         ECHO Error - Path entered %originpath% does not exist. please retry
         GOTO origin
      )
      ECHO You chose %originpath% path
      GOTO destination
)

:destination (
   SET /P destinationpath="What is the destination path you want to copy to? ex: H:\Camping Pictures : "

   IF NOT DEFINED destinationpath (
         ECHO Error - No path entered. please retry
         GOTO destination
   ) ELSE (
      ECHO You chose %destinationpath% path
      IF NOT EXIST "%destinationpath%" (
         ECHO %destinationpath% does not exist
         ECHO Creating %destinationpath% path
         mkdir %destinationpath%
      )
      
      GOTO confirmation
)

:confirmation (
   SET /p answer=Are you ready to start copying files (Y/N)?
   IF /i "%answer:~,1%" EQU "Y" (
      ECHO "STARTED COPYING FILES"
      ECHO "!!!DO NOT CLOSE THE APPLICATION UNTIL ALL FILES COPIED OR YOU MAY LOSE SOME!!!"
      FOR /R "%originpath%" %%i IN (*.%ext%) DO (
         >NUL COPY "%%i" "%destinationpath%"
         ECHO "%%~nxi" copied
      )
   )
   IF /i "%answer:~,1%" EQU "N" (
      goto begining
   )
)

   
   

