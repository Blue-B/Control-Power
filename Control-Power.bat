@echo off

:menu
cls
echo 원하시는 동작 모드를 선택하세요. (Please select your desired operating mode.)
echo 1. 절전모드 (Sleep Mode)
echo 2. 종료 (Shutdown)
echo 3. 다시시작 (Restart)
echo 4. 화면 끄기 (Turn Off Screen)
echo 5. 프로그램 종료 (Exit Program)
set /p choice=선택하세요 (Select 1/2/3/4/5): 

if "%choice%"=="1" (
    echo 절전 모드로 진입합니다... (Entering sleep mode...)
    echo 취소하려면 Ctrl+C를 누르세요. (Press Ctrl+C to cancel.)
    timeout /t 5
    rundll32.exe powrprof.dll,SetSuspendState 0,1,0
    goto end
)
if "%choice%"=="2" (
    echo 종료 모드로 진입합니다... (Shutting down...)
    echo 취소하려면 Ctrl+C를 누르세요. (Press Ctrl+C to cancel.)
    timeout /t 5
    shutdown /s /t 0
    goto end
)
if "%choice%"=="3" (
    echo 재시작 모드로 진입합니다... (Restarting...)
    echo 취소하려면 Ctrl+C를 누르세요. (Press Ctrl+C to cancel.)
    timeout /t 5
    shutdown /r /t 0
    goto end
)
if "%choice%"=="4" (
    echo 화면을 끕니다... (Turning off screen...)
    %windir%\system32\cmd.exe /c powershell (Add-Type '[DllImport(\"user32.dll\")]^public static extern int SendMessage(int hWnd, int hMsg, int wParam, int lParam);' -Name a -Pas)::SendMessage(-1,0x0112,0xF170,2)
    goto end
)
if "%choice%"=="5" exit

echo 잘못된 선택입니다. 다시 선택해주세요. (Invalid selection. Please choose again.)
timeout /t 2 >nul
goto menu

:end
echo 작업이 완료되었습니다. 3초 후 메인 메뉴로 돌아갑니다. (Operation completed. Returning to main menu in 3 seconds.)
timeout /t 3 >nul
goto menu