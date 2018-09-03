timeString=$(date +%Y%m%d%H%M%S)
timeString=$timeString |sed s/[[:space:]]//g
mailTitle=TestReport-crm-offline
echo $timeString
jmxPath=./scripts/*.jmx
echo $jmxPath
jtlPath=./results/crmApiTest_${timeString}.jtl
echo $jtlPath
logPath=./logs/crmApiTest_${timeString}.log
echo $logPath
echo start jmeter test...
/usr/local/jmeter/apache-jmeter-3.3/bin/jmeter -n -t ${jmxPath} -l ${jtlPath} -j ${logPath}
echo start jmeter report...
/usr/local/jmeter/apache-ant-1.10.5/bin/ant -DtimeString=${timeString} -DmailTitle=${mailTitle} -buildfile ./build_linux.xml