@echo off

IF "%~1"=="" (
    set IM_PATH=./input/test.jpg
) ELSE (
    set IM_PATH=%~1
)

IF "%~2"=="" (
    set TASK=dewarping
) ELSE (
    set TASK=%~2
)

IF "%~3"=="" (
    set RUN_PX_BY_PX=true
) ELSE (
    set RUN_PX_BY_PX=%~3
)
IF "%~4"=="" (
    set "ARG1=./restorted/MyTest.jpg"
) ELSE (
    set "ARG1=%~4"
)

IF "%~5"=="" (
    set "ARG2=./restorted/test_dewarping.jpg"
) ELSE (
    set "ARG2=%~5"
)

docker run --name docres -e IM_PATH=%IM_PATH% -e TASK=%TASK% -e RUN_PX_BY_PX=%RUN_PX_BY_PX% -e ARG1=%ARG1% -e ARG2=%ARG2% --gpus all -it docres
docker cp docres:/app/restorted/. ./docker_output
docker rm docres
pause