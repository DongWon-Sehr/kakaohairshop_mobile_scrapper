:: filename	: hairshop_existing_check.bat
:: path		: D:\bigdata10\99.team_project\shell script\hairshop_existing_check.bat

@echo off

cls

echo.
echo ::::::::::::::::::::::::::::::::
echo ::                            ::
echo ::       Kakao Hairshop       ::
echo ::     Mobile App Scrapper    ::
echo ::                            ::
echo ::           Hello ^!          ::
echo ::                            ::
echo ::                            ::
echo ::      press any key to      ::
echo ::           START            ::
echo ::                            ::
echo ::::::::::::::::::::::::::::::::
echo                  by.DongWon SEHR
echo                ddoro36@gamil.com
pause>nul
________________________________________________________________________________________

	:Menu							
cls

echo.
echo ::::::::::::::::::::::::::::::::
echo ::                            ::
echo ::        SELECT MENU         ::
echo ::                            ::
echo ::   (1) Shop Existing Check  ::
echo ::   (2) Review Scrap         ::
echo ::   (3) Quit                 ::
echo ::                            ::
echo ::                            ::
echo ::::::::::::::::::::::::::::::::
echo                  by.DongWon SEHR
echo                ddoro36@gamil.com
echo.
set /p choice= Select Menu by Number:

:: ���� �ʱ�ȭ(����)
set file_path=
set diff=
set difference=


if %choice%==1 (call :StartKakaoHairshop && goto ShopExistingCheck)
if %choice%==2 (call :StartKakaoHairshop && goto ReviewScrap)
if %choice%==3 (goto Quit) else (
echo.
echo Misstyped the menu
echo Select the right number
echo.
pause
goto Menu
)
________________________________________________________________________________________

	:StartKakaoHairshop				
:: adb.exe�� magick.exe ������ �ִ� ���丮 �̵�
d:
cd D:\Program Files\Nox\bin
:: īī���� �� ���� -> �˻�â �ٷ� �̵�
adb shell am start com.kakao.beauty.hairshop/com.kakao.beauty.hairshop.ui.activity.SearchActivity
goto :EOF
________________________________________________________________________________________

	:ShopExistingCheck				
cls
echo.
echo ::::::::::::::::::::::::::::::::
echo ::                            ::
echo ::       Kakao Hairshop       ::
echo ::     Mobile App Scrapper    ::
echo ::                            ::
echo ::  (1) Shop Existing Check   ::
echo ::                            ::
echo ::          START ^!           ::
echo ::                            ::
echo ::::::::::::::::::::::::::::::::
echo                  by.DongWon SEHR
echo                ddoro36@gamil.com

:: ���� ��� ����
set file_path=D:\bigdata10\99.team_project\shell script\naver_place_count_total_2020-05-01_final_ansi.csv

setlocal ENABLEEXTENSIONS ENABLEDELAYEDEXPANSION

::::::::::::::::::::::::
:: input start number ::
set index=0
::::::::::::::::::::::::

set count=0
for /f "usebackq skip=1 tokens=4 delims=," %%A in ("%file_path%") do (
	set /a count+=1
	set /a rest=!count! %% 15
	if !rest! == 0 echo.&&echo 15ȸ ���� time sleep 10 sec&&timeout 10

	set title=%%A
	echo.
	echo :::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::
	echo      !index! : !title! [ Existing Check START ]		
	echo :::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::
	:: �˻��� �Է� �� �˻� ����Ʈ ��ȸ������ Ȯ��
	adb shell input tap 200 100
	timeout 1 /nobreak
	adb shell am broadcast -a ADB_INPUT_TEXT --es msg '%%A'
	timeout 1 /nobreak
	adb shell input tap 100 200
	timeout 2 /nobreak
	call :SearchAgain1
	echo.
	echo :::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::
	echo      !index! : !title! [ Existing Check END ]	
	echo :::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::
	set /a index+=1
)

endlocal

echo.
echo ::::::::::::::::::::::::::::::::
echo ::                            ::
echo ::       Kakao Hairshop       ::
echo ::     Mobile App Scrapper    ::
echo ::                            ::
echo ::  (1) Shop Existing Check   ::
echo ::                            ::
echo ::           Done ^!           ::
echo ::                            ::
echo ::                            ::
echo ::      press any key to      ::
echo ::      GO BACK to MENU       ::
echo ::                            ::
echo ::::::::::::::::::::::::::::::::
echo                  by.DongWon SEHR
echo                ddoro36@gamil.com
pause>nul
goto Menu
________________________________________________________________________________________

	:ReviewScrap					
cls
echo.
echo ::::::::::::::::::::::::::::::::
echo ::                            ::
echo ::       Kakao Hairshop       ::
echo ::     Mobile App Scrapper    ::
echo ::                            ::
echo ::     (2) Review Scrap       ::
echo ::                            ::
echo ::          START ^!           ::
echo ::                            ::
echo ::::::::::::::::::::::::::::::::
echo                  by.DongWon SEHR
echo                ddoro36@gamil.com


set file_path=D:\bigdata10\99.team_project\shell script\data\kakao_hairshop_input_data_2nd_2020-05-21_ansi.csv

setlocal ENABLEEXTENSIONS ENABLEDELAYEDEXPANSION

::::::::::::::::::::::::::::::::
:: input start number 
set index=45
:: line 174 > skip = index + 1
::::::::::::::::::::::::::::::::
set count=0

for /f "usebackq skip=46 tokens=3,4 delims=," %%A in ("%file_path%") do (
	set /a count+=1
	set /a rest=!count! %% 30
	if !rest! == 0 echo.&&echo 30ȸ ���� time sleep 10 sec&&timeout 10
	set count_scroll=
	set title=%%A
	echo.
	echo :::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::
	echo      !index! : !title! [ Review Scrap START ]		
	echo :::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::
	:: �˻��� �Է� �� �˻� ����Ʈ ��ȸ������ Ȯ��
	adb shell input tap 200 100
	timeout 1 /nobreak
	adb shell am broadcast -a ADB_INPUT_TEXT --es msg '%%A'
	timeout 1 /nobreak
	adb shell input tap 100 200
	timeout 2 /nobreak
	adb shell input tap 100 350
	timeout 2 /nobreak
	if %%B==True (adb shell input tap 470 650.5)
	if %%B==False (adb shell input tap 470 625)
	call :ScrollDown
	call :SearchAgain2
	echo.
	echo :::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::
	echo      !index! : !title! [ Review Scrap END ]	
	echo :::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::
	set /a index+=1
)

endlocal

echo.
echo ::::::::::::::::::::::::::::::::
echo ::                            ::
echo ::       Kakao Hairshop       ::
echo ::     Mobile App Scrapper    ::
echo ::                            ::
echo ::     (2) Review Scrap       ::
echo ::                            ::
echo ::           Done ^!           ::
echo ::                            ::
echo ::                            ::
echo ::      press any key to      ::
echo ::      GO BACK to MENU       ::
echo ::                            ::
echo ::::::::::::::::::::::::::::::::
echo                  by.DongWon SEHR
echo                ddoro36@gamil.com
pause>nul
goto Menu
________________________________________________________________________________________

	:ScrollDown						
:: ��ũ�� �� ȭ�� ĸ��
adb exec-out screencap -p > screen_old.png

:: ��ũ�Ѵٿ� 40ȸ���� 30�� ����
set /a count_scroll+=1
set /a count_rest=%count_scroll% %% 10
if %count_rest% == 0 echo.&&echo 10ȸ ���� time sleep 5 sec&&timeout 5

echo.
echo ==========================================
echo [ %index% : %title% ]
echo ��ũ�� �̺�Ʈ %count_scroll%
adb shell input swipe 880 1370 880 750 20
adb shell input swipe 880 1370 880 750 20
adb shell input swipe 880 1370 880 750 20
timeout 1 /nobreak
adb shell input swipe 880 1370 880 750 20
adb shell input swipe 880 1370 880 750 20
adb shell input swipe 880 1370 880 750 20
timeout 1 /nobreak
adb shell input swipe 880 1370 880 750 20
adb shell input swipe 880 1370 880 750 20
adb shell input swipe 880 1370 880 750 20
timeout 2 /nobreak
:: ��ũ�� �� ȭ�� ĸ��
adb exec-out screencap -p > screen_new.png

:: ��ũ�� �� �� ���� ���� �� > ������ 0.01 ���ϸ� ������ ���ϴ����� �Ǵ�
for /f %%a in ('magick screen_old.png screen_new.png -metric RMSE -compare -format "%%[distortion]" info^:') do set diff=%%a
echo.
echo ������ %diff%
echo ==========================================
if %diff% gtr 0.01 goto ScrollDown
goto :EOF
________________________________________________________________________________________

	:SearchAgain1					
:: �˻��� �����
adb shell input tap 750 100
goto :EOF
________________________________________________________________________________________

	:SearchAgain2					
:: �˻�â���� �ǵ��ư���
adb shell input keyevent 4
adb shell input keyevent 4
:: �˻��� �����
adb shell input tap 750 100
goto :EOF
________________________________________________________________________________________
	:Quit							
:: �� ����
adb shell am force-stop com.kakao.beauty.hairshop
:: script file�� �ִ� ���丮�� ����
cd D:\bigdata10\99.team_project\shell script

cls

echo.
echo ::::::::::::::::::::::::::::::::
echo ::                            ::
echo ::       Kakao Hairshop       ::
echo ::     Mobile App Scrapper    ::
echo ::                            ::
echo ::         Terminated         ::
echo ::                            ::
echo ::                            ::
echo ::            BYE ^!           ::
echo ::                            ::
echo ::::::::::::::::::::::::::::::::
echo                  by.DongWon SEHR
echo                ddoro36@gamil.com