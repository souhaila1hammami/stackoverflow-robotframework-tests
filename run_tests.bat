@echo off
echo 🧪 Execution de tous les tests...
robot --outputdir results tests
echo ✅ Tests completes!
robot --listener allure_robotframework:results\allure-results tests\multi_user_tests.robot
allure generate results\allure-results --clean -o results\allure-report
allure open results\allure-report
pause