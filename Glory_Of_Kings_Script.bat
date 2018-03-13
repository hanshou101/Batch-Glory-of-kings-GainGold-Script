::adb shell input tap 100 100
::for /l %%i in ( 1,2,10 ) do (
::  echo %%i
::)
::pause
::cmd /k dir
@echo off

::if 2 GTR 3 (
::  echo 前者大于后者
::) else (
::  echo 前者小于后者
::)

set /p width=输入屏幕宽度;

set /p height=输入屏幕高度：

echo 以下是高度和宽度 : %width% * %height%

set /a w_ratio=width*1000/1920

set /a h_ratio=height*1000/1080

::echo width

::echo height

set /p times=下面请输入你要循环执行的次数：

echo 将会循环执行  %times% 次。

set /p ready=如果你已经准备好开始了，请输入 yes   ：

if "%ready%" == "yes"  (
    echo 好，现在开始
) else (
    echo %ready%
    echo "你退出了该程序"  
    pause
    exit
)

for /l %%i in (1,1, %times% ) do (
    echo 这局游戏开始了
    call :money 3 1600 970
    echo Ready , Go !
    call :money 15 1450 910
    echo Auto Power On !
    call :money 0 1780 40

        for /l %%i in ( 1 , 1 , 25 ) do (
            call :money 1 1000 500
        )

    echo 一二三四，再来一次！
    call :money 3 1430 980
) 

echo ——————————
echo 程序执行完毕。———
echo ——————————
pause



exit

:money
    ::ping命令实际运行时，运行的实际时间，总是比-n 后面的数，少1秒。时间众筹。所以这里补上1秒。
    set /a delay_s=%1 + 1
    set /a pos_X=%2*%w_ratio%/1000
    set /a pos_Y=%3*%h_ratio%/1000
    ::echo %delay_s% , %pos_X% , %pos_Y%
    adb shell input tap %pos_X% %pos_Y%
    echo 执行了 一 次点击操作 %pos_X%,%pos_Y%


    ::实际是等待delay_s - 1秒。
    ping -n %delay_s% 127.0.0.1>nul

goto:eof
