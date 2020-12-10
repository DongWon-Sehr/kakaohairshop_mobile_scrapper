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

:: 변수 초기화(제거)
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
:: adb.exe와 magick.exe 파일이 있는 디렉토리 이동
d:
cd D:\Program Files\Nox\bin
:: 카카오헤어샵 앱 실행 -> 검색창 바로 이동
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

:: 파일 경로 지정
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
	if !rest! == 0 echo.&&echo 15회 마다 time sleep 10 sec&&timeout 10

	set title=%%A
	echo.
	echo :::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::
	echo      !index! : !title! [ Existing Check START ]		
	echo :::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::
	:: 검색어 입력 후 검색 리스트 조회까지만 확인
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
	if !rest! == 0 echo.&&echo 30회 마다 time sleep 10 sec&&timeout 10
	set count_scroll=
	set title=%%A
	echo.
	echo :::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::
	echo      !index! : !title! [ Review Scrap START ]		
	echo :::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::
	:: 검색어 입력 후 검색 리스트 조회까지만 확인
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
:: 스크롤 전 화면 캡쳐
adb exec-out screencap -p > screen_old.png

:: 스크롤다운 40회마다 30초 슬립
set /a count_scroll+=1
set /a count_rest=%count_scroll% %% 10
if %count_rest% == 0 echo.&&echo 10회 마다 time sleep 5 sec&&timeout 5

echo.
echo ==========================================
echo [ %index% : %title% ]
echo 스크롤 이벤트 %count_scroll%
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
:: 스크롤 후 화면 캡쳐
adb exec-out screencap -p > screen_new.png

:: 스크롤 전 후 찍은 사진 비교 > 오차율 0.01 이하면 페이지 최하단으로 판단
for /f %%a in ('magick screen_old.png screen_new.png -metric RMSE -compare -format "%%[distortion]" info^:') do set diff=%%a
echo.
echo 오차율 %diff%
echo ==========================================
if %diff% gtr 0.01 goto ScrollDown
goto :EOF
________________________________________________________________________________________

	:SearchAgain1					
:: 검색어 지우기
adb shell input tap 750 100
goto :EOF
________________________________________________________________________________________

	:SearchAgain2					
:: 검색창으로 되돌아가기
adb shell input keyevent 4
adb shell input keyevent 4
:: 검색어 지우기
adb shell input tap 750 100
goto :EOF
________________________________________________________________________________________
	:Quit							
:: 앱 종료
adb shell am force-stop com.kakao.beauty.hairshop
:: script file이 있는 디렉토리로 복귀
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