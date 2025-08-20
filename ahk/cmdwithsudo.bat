start cmd /k ""

if not "%errorlevel%" == "0" (
  echo You must run this script as administrator.
  exit /b 1
)

rem Your commands requiring administrator privileges go here

cd C:\Users\Ratsucksatmath\
