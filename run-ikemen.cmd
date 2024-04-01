@echo off

CD Ikemen_GO

SET configPath="../save/config.json"
SET motifDirectory="../motifs"
SET lifebarDirectory="../lifebars"
SET stageDirectory="../stages"
SET characterDirectory="../chars"

SET motif="system.def"
SET lifebar="VHD/fight.def"
SET /A rounds=2
SET /A characterOneColor=1
SET /A characterTwoColor=1
SET /A characterTwoAI=0

SET characterOne=
SET characterTwo=
SET stage=

:nextParam
  SET "param=%~1"

  IF "%param:~0,6%" EQU "-motif" (
    IF "%param:~6,1%" EQU "=" (
      SET "motif=%param:~7%"
    ) ELSE (
      SET "motif=%~2"
      SHIFT
    )
  ) ELSE IF "%param:~0,8%" EQU "-lifebar" (
    IF "%param:~8,1%" EQU "=" (
      SET "lifebar=%param:~9%"
    ) ELSE (
      SET "lifebar=%~2"
      SHIFT
    )
  ) ELSE IF "%param:~0,7%" EQU "-rounds" (
    SET "rounds=%~2"
    SHIFT
  ) ELSE IF "%param:~0,9%" EQU "-p1.color" (
    SET "characterOneColor=%~2"
    SHIFT
  ) ELSE IF "%param:~0,9%" EQU "-p2.color" (
    SET "characterTwoColor=%~2"
    SHIFT
  ) ELSE IF "%param:~0,6%" EQU "-p2.ai" (
    SET "characterTwoAI=%~2"
    SHIFT
  ) ELSE IF "%param:~0,3%" EQU "-p1" (
    IF "%param:~3,1%" EQU "=" (
      SET "characterOne=%param:~4%"
    ) ELSE (
      SET "characterOne=%~2"
      SHIFT
    )
  ) ELSE IF "%param:~0,3%" EQU "-p2" (
    IF "%param:~3,1%" EQU "=" (
      SET "characterTwo=%param:~4%"
    ) ELSE (
      SET "characterTwo=%~2"
      SHIFT
    )
  ) ELSE IF "%param:~0,2%" EQU "-s" (
    IF "%param:~2,1%" EQU "=" (
      SET "stage=%param:~3%"
    ) ELSE (
      SET "stage=%~2"
      SHIFT
    )
  )

  SHIFT
IF "%~1" NEQ "" GOTO nextParam

.\Ikemen_GO.exe -p1 "%characterDirectory:"=%/%characterOne:"=%" -p1.color %characterOneColor% -p2 "%characterDirectory:"=%/%characterTwo:"=%" -p2.color %characterTwoColor% -p2.ai %characterTwoAI% -s "%stageDirectory:"=%/%stage:"=%" -config "%configPath:"=%" -r "%motifDirectory:"=%/%motif:"=%" -lifebar "%lifebarDirectory:"=%/%lifebar:"=%" -rounds %rounds%
