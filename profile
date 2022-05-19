eval $(/opt/homebrew/bin/brew shellenv)

# Setting PATH for Python 3.9
# The original version is saved in .profile.pysave
PATH="/Library/Frameworks/Python.framework/Versions/3.9/bin:${PATH}"
# PATH="/Library/Frameworks/Python.framework/Versions/3.9/bin:/Applications/Visual Studio Code.app/Contents/Resources/app/bin;${PATH}"
export PATH
export NODE_ENV=HBC
export NODE_APP_INSTANCE=qa05
export LOCALE=en_US
# used on debug session - impact directly the wdio.config file on timeout value (mochaopts)
export DEBUG=true

# necessary to run Android Studio Emulator
export ANDROID_HOME=/Users/marco/Library/Android/sdk
export PATH=${PATH}:$ANDROID_HOME/tools:$ANDROID_HOME/platform-tools


alias getenv='echo $NODE_ENV - $NODE_APP_INSTANCE - $LOCALE';
alias profile='echo "source ~/.profile"; source ~/.profile;';
alias lintall='echo running eslint for all folders; eslint --ext .js test config pages lib';
alias resetpw='npx wdio --spec=utils/resetpassword';
alias lastcommit='echo git log --name-status HEAD^..HEAD; git log --name-status HEAD^..HEAD; ';
alias alluregen='echo generate allure report \(npx allure generate -c\); npx allure generate -c';
alias allurerep='echo open allure report \(npx allure open\) - Do not forget CTRL+C to close the allure server; npx allure open';
alias allure='echo generate and open allure report; alluregen && allurerep';
alias resetpw='echo reset pw on current environment; wd /test/utils/resetpassword.spec.js';
alias appiumsrv='echo "run appium server with  ChromeDriver. Do not forget to change the nodejs to version 10 ;)"; appium --chromedriver-executable /Users/marco/chromedriver';


#functions like Alias
#change retailer = cr
cr() {
    export NODE_ENV="$1"
}
# change environment
ce() {
    export NODE_APP_INSTANCE="$1"
}

#change language = cr
cl() {
    if [ "$1" == "fr" ]; then
        export LOCALE=fr_CA
    else
        export LOCALE=en_US
    fi
}

# run Web test with wdio in local computer
wdw() {
    npx wdio ./wdio.conf.js --spec=$1
}

# run Web test with wdio in browserstack
wdb() {
    npx wdio ./wdio.conf.browserstack.js --spec=$1
}

# run Web test with wdio in browserstack
wdbs() {
    npx wdio ./wdio.conf.browserstack.js --suite $1
}

# run Android test in local computer
wda() {
    npx wdio ./android_emu.js --spec=$1
}
# run iOS test in local computer
wdi() {
    npx wdio ./ios_sim.js --spec=$1
}

# GIT sync fork with master
# source: https://docs.github.com/en/github/collaborating-with-issues-and-pull-requests/syncing-a-fork
syncfork() {
    git remote -v
    git fetch upstream
    git checkout master
    git merge upstream/master
}

#Holt MFA enabled
retailers=(Arnotts Bash Benbridge Bloom Brownt Buckle Chicos COTR Cosbar dxl HBC Holt Humantouch Jwas Lilly Pandora perrysport Peru pharmaprix RTB Saks shiseido Shoppers Sjk Soma WHBM)


retList() {
    for ret in ${retailers[@]}; do
        echo $ret
    done
}

runTest() {
    for ret in ${retailers[@]}; do
        export NODE_ENV=$ret
        echo "Running " $ret
        npx wdio --spec=test/storefront/request.badge.spec.js
        # npx wdio --spec=sidebar/appntrequest,sidebar/emailrequest,test/storefront/request.badge,footer/appntrequest,footer/emailrequest,footer/psrequest
        #npx wdio --spec /Users/marco/QA/wdioTest/test/backoffice/crud_products.spec.js
        #npx wdio --spec /Users/marco/QA/wdioTest/test/utils/resetpassword.spec.js
        #npx wdio --spec /Users/marco/QA/wdioTest/test/backoffice/webonboarding.spec.js
        #npx wdio --spec=sidebar/emailreque
        #npx wdio --spec=request.badchico
        
        
        # npx wdio --suite backoffice,footer_sup,salestracing,footer,sidebar,storefront
    done
}

runTestBs() {
    echo "running tests on browser stack"
    echo "runTestBs testfilename"
    for ret in ${retailers[@]}; do
        export NODE_ENV=$ret
        echo "Running " $ret
        npx wdio wdio.conf.browserstack.js --spec=$1
    done
}

lint() {
    echo "running eslint with Parameters"
    echo "eslint filename parameter"
     eslint $1 $2
}

eval "$(/opt/homebrew/bin/brew shellenv)"
