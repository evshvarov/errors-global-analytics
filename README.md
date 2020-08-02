## errors-global-analytics
Shows errors in ^ERRORS global in an IRIS Analytics Dashboard
![errors dashboard](https://user-images.githubusercontent.com/2781759/89131782-051dec80-d518-11ea-8b30-8e0acc5235e9.png "Errors dashboard")
<img width="943" alt="Screenshot 2020-08-02 at 23 33 36" src="https://user-images.githubusercontent.com/2781759/89131862-98efb880-d518-11ea-9b59-c3971f691ad1.png">


## Installation ZPM

zpm "install objectscript-errors-analytics"
You need ZPM starting from 0.2.5

## What does it do with your system

it also installs (or checks for) modules: [dsw](https://openexchange.intersystems.com/package/DeepSeeWeb), [sql-for-error-global](https://openexchange.intersystems.com/package/SQL-for--%5EERRORS-Global-1), [objectscript-errors](https://openexchange.intersystems.com/package/objectscript-errors)

it creates classes:
shvarov.objectscript.errors.analytics.errorlog
shvarov.objectscript.errors.analytics.ErrorsCube
and imports 3 pivots and one dashboard

## how to make it work

Once module is installed open the dashboard:
```
http://localhost:yourport/dsw/index.html#!/d/Errors/Overview.dashboard?ns=namespace
```

To refresh the data do:
```
do ##class(shvarov.objectscript.errors.analytics.setup).Run()
```
To load test data do:
```
do ##class(shvarov.objectscript.errors.analytics.setup).GenerateErrors()
```

## Collaboration

### Prerequisites
Make sure you have [git](https://git-scm.com/book/en/v2/Getting-Started-Installing-Git) and [Docker desktop](https://www.docker.com/products/docker-desktop) installed.


### starting it in Docker

Clone/git pull the repo into any local directory

```
$ git clone git@github.com:evshvarov/errors-global-analytics.git
```

Open the terminal in this directory and run:

```
$ docker-compose up -d
```

## Prerequisites
Make sure you have [git](https://git-scm.com/book/en/v2/Getting-Started-Installing-Git) and [Docker desktop](https://www.docker.com/products/docker-desktop) installed.


## How to start coding
This repository is ready to code in VSCode with ObjectScript plugin.
Install [VSCode](https://code.visualstudio.com/), [Docker](https://marketplace.visualstudio.com/items?itemName=ms-azuretools.vscode-docker) and [ObjectScript](https://marketplace.visualstudio.com/items?itemName=daimor.vscode-objectscript) plugin and open the folder in VSCode.
Open /src/cls/PackageSample/ObjectScript.cls class and try to make changes - it will be compiled in running IRIS docker container.
![docker_compose](https://user-images.githubusercontent.com/2781759/87149599-3c063700-c2b9-11ea-9250-9b5d42ec4932.gif)

Feel free to delete PackageSample folder and place your ObjectScript classes in a form
/src/Package/Classname.cls
[Read more about folder setup for InterSystems ObjectScript](https://community.intersystems.com/post/simplified-objectscript-source-folder-structure-package-manager)

The script in Installer.cls will import everything you place under /src into IRIS.


