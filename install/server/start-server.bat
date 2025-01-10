@echo on

set APP_HOME=%cd%
set PROPERTIES=%APP_HOME%\properties
set CONFIGURATION_ROOT=%APP_HOME%\configuration
set JAVA_HOME=%APP_HOME%\jdk\bin
set JAVA_PARAMETERS=-Xms1G -Xmx2G -DpropertyRoot="%PROPERTIES%" -DconfigurationRoot="%CONFIGURATION_ROOT%"

cd %JAVA_HOME% 
start javaw %JAVA_PARAMETERS% -jar "%APP_HOME%\sts-server.jar"

::start java %JAVA_PARAMETERS% -jar "%APP_HOME%\sts-server.jar"

exit