#!/usr/bin/env bash

set -e
set -u
set -o pipefail

NUM_OK="20"
NUM_ERR="0"


###
### dvlbox-ok
###

printf "[TEST] dvlbox-ok"
# 1st Try
TEST_OK="$( curl -sS localhost/index.php | grep -c 'dvlbox-ok' || true )"
if [ "${TEST_OK}" != "${NUM_OK}" ]; then
	# 2nd Try
	TEST_OK="$( curl -sS localhost/index.php | grep -c 'dvlbox-ok' || true )"
	if [ "${TEST_OK}" != "${NUM_OK}" ]; then
		# 3rd Try
		TEST_OK="$( curl -sS localhost/index.php | grep -c 'dvlbox-ok' || true )"
		if [ "${TEST_OK}" != "${NUM_OK}" ]; then
			printf "\r[FAIL] dvlbox-ok\n"
			curl -sS localhost/index.php | grep -c 'dvlbox-ok' || true
			exit 1
		else
			printf "\r[OK]   dvlbox-ok (3 rounds)\n"
		fi
	else
		printf "\r[OK]   dvlbox-ok (2 rounds)\n"
	fi
else
	printf "\r[OK]   dvlbox-ok (1 round)\n"
fi


###
### dvlbox-err
###

printf "[TEST] dvlbox-err"
# 1st Try
TEST_ERR="$( curl -sS localhost/index.php | grep -c 'dvlbox-err' || true )"
if [ "${TEST_ERR}" != "${NUM_ERR}" ]; then
	# 2nd Try
	TEST_ERR="$( curl -sS localhost/index.php | grep -c 'dvlbox-err' || true )"
	if [ "${TEST_ERR}" != "${NUM_ERR}" ]; then
		# 3rd Try
		TEST_ERR="$( curl -sS localhost/index.php | grep -c 'dvlbox-err' || true )"
		if [ "${TEST_ERR}" != "${NUM_ERR}" ]; then
			printf "\r[FAIL] dvlbox-err\n"
			curl -sS localhost/index.php | grep -c 'dvlbox-err' || true
			exit 1
		else
			printf "\r[OK]   dvlbox-err (3 rounds)\n"
		fi
	else
		printf "\r[OK]   dvlbox-err (2 rounds)\n"
	fi
else
	printf "\r[OK]   dvlbox-err (1 round)\n"
fi
