#!/bin/bash

JRE_NAME=myjre

# Get all module dependencies
MODULE_DEPS=$(jdeps --ignore-missing-deps --print-module-deps target/spring-boot-app-*.jar)
DEFAULT_DEPS="java.xml,jdk.unsupported,java.sql,java.naming,java.desktop,java.management,java.security.jgss,java.instrument"

# Create custom JRE
jlink --add-modules $MODULE_DEPS,$DEFAULT_DEPS --output $JRE_NAME
