*** Settings ***
Suite Setup     Run Tests  ${EMPTY}
...   test_libraries/as_listener/suite_scope_java.robot
...   test_libraries/as_listener/multiple_listeners_java.robot
Force Tags      regression  jybot
Resource        atest_resource.robot

*** Test Cases ***
Java suite scope library gets events
    Check Test Case  ${TESTNAME}
New java test gets previous suite scope events
    Check Test Case  ${TESTNAME}
Listener methods in library are keywords
    Check Test Case  ${TESTNAME}
Listener methods starting with underscore are not keywords
    Check Test Case  ${TESTNAME}
Multiple library listeners in java gets events
    Check Test Case  ${TESTNAME}
Check closing
    Stderr Should Match
        ...     SEPARATOR=\n
        ...     *CLOSING IN JAVA SUITE LIBRARY LISTENER
        ...     CLOSING IN JAVA SUITE LIBRARY LISTENER
        ...     CLOSING IN JAVA SUITE LIBRARY LISTENER
