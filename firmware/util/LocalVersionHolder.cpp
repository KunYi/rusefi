/**
 * @file	LocalVersionHolder.cpp
 *
 * @date Mar 19, 2014
 * @author Andrey Belomutskiy, (c) 2012-2018
 */

#include "LocalVersionHolder.h"

LocalVersionHolder::LocalVersionHolder() {
	/**
	 * we want local version to be 'old' on instantiation
	 */
	localVersion = -1;
}

int LocalVersionHolder::getVersion() {
	return localVersion;
}

bool LocalVersionHolder::isOld(int globalVersion) {
	if (globalVersion > localVersion) {
		localVersion = globalVersion;
		return true;
	}
	return false;
}
