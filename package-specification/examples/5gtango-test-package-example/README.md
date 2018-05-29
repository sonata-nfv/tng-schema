# Test Package


## Manual test steps on pre-int-vnv-bcn environment

ASSUMPTION: assume the NS (`eu.sonata-nfv.service-descriptor:sonata-vtc-only:0.1`) under test is already in SP catalog.

1. zip the folder as `5gtango-test-package-example.zip`
2. rename `5gtango-test-package-example.zip` as `5gtango-test-package-example.tgo`
3. upload the package via VnV Gatekeeper, it will return `package_process_uuid` for query later:
    ```
    curl -v -X POST -F "package=@5gtango-test-package-example/5gtango-test-package-example.tgo" \
      http://pre-int-vnv-bcn.5gtango.eu:32002/api/v3/packages
    ```
4. find the package id via stats endpoint:
    ```
    curl -v http://pre-int-vnv-bcn.5gtango.eu:32002/api/v3/packages/status/b400b995-4a08-4f96-845f-d725547a3633
    ```
5. trigger the test with the package id:
    ```
    curl -v -X POST "http://pre-int-vnv-bcn.5gtango.eu:6100/tng-vnv-lcm/api/v1/packages/on-change"  \
     -H "Content-Type: application/json" -d '{ "event_name": "UPDATED", "package_id": "09f24889-fae5-46ca-8862-95d913bc2ead"}'
    ```
6. query the result via Test Result Repository:
    ```
    curl -v -X POST "http://pre-int-vnv-bcn.5gtango.eu:6100/tng-vnv-lcm/api/v1/packages/on-change"  \
     -H "Content-Type: application/json" -d '{ "event_name": "UPDATED", "package_id": "09f24889-fae5-46ca-8862-95d913bc2ead"}'
    ```
7. a success test would have status:  `SUCCESS`:
    ```
    [
      {
        "created_at": "2018-05-29T15:21:45.957+00:00",
        "details": {
          "none": 1,
          "pass": 0,
          "inconc": 0,
          "fail": 0,
          "error": 0
        },
        "network_service_instance_id": "ed036e6a-faeb-4ae0-838f-b8618901ae17",
        "package_id": "25adbc52-3488-443e-bdb2-2c641b113dac",
        "status": "SUCCESS",
        "sterr": "",
        "stout": "ttcn3_start: Starting the test suite\nspawn /home/node/titan/bin/mctr_cli ...................ted from MC. Terminating HC.\nMC@c838258ada7f: Shutdown complete.\n",
        "test_plan_id": "5b0d6fb53ac8300001000001",
        "test_suite_id": "abb83bbc-69de-41f3-9606-fdd1f88f6256",
        "tester_result_text": "15:20:54.044121 - TTCN-3 Main Test Component started on c838258ada7f. Version: CRL 113 2......................ase.\n15:21:44.825975 HTTP_Test.ttcn:251 Local verdict of MTC: none\n15:21:44.826047 HTTP_Test.ttcn:251 No PTCs were created.\n15:21:44.826118 HTTP_Test.ttcn:251 Test case tc_http_getResult finished. Verdict: none\n15:21:44.826470 - Verdict statistics: 1 none (100.00 %), 0 pass (0.00 %), 0 inconc (0.00 %), 0 fail (0.00 %), 0 error (0.00 %).\n15:21:44.826588 - Test execution summary: 1 test case was executed. Overall verdict: none\n15:21:44.826669 - Exit was requested from MC. Terminating MTC.\n",
        "updated_at": "2018-05-29T15:21:45.957+00:00",
        "uuid": "5b0d70093ac8300001000003"
      }
    ]
    ```

