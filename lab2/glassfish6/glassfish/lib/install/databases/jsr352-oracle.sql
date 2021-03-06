/*
 * Copyright (c) 2018 Oracle and/or its affiliates. All rights reserved.
 *
 * This program and the accompanying materials are made available under the
 * terms of the Eclipse Public License v. 2.0, which is available at
 * http://www.eclipse.org/legal/epl-2.0.
 *
 * This Source Code may also be made available under the following Secondary
 * Licenses when the conditions for such availability set forth in the
 * Eclipse Public License v. 2.0 are satisfied: GNU General Public License,
 * version 2 with the GNU Classpath Exception, which is available at
 * https://www.gnu.org/software/classpath/license.html.
 *
 * SPDX-License-Identifier: EPL-2.0 OR GPL-2.0 WITH Classpath-exception-2.0
 */

DROP TABLE JOBSTATUS;
DROP TABLE STEPSTATUS;
DROP TABLE CHECKPOINTDATA;
DROP TABLE JOBINSTANCEDATA;
DROP TABLE EXECUTIONINSTANCEDATA;
DROP TABLE STEPEXECUTIONINSTANCEDATA;

CREATE TABLE JOBINSTANCEDATA
(
    jobinstanceid NUMBER(19,0) PRIMARY KEY,
    name          VARCHAR2(512),
    apptag        VARCHAR(512)
);
CREATE SEQUENCE JOBINSTANCEDATA_SEQ;

CREATE
OR REPLACE TRIGGER JOBINSTANCEDATA_TRG
BEFORE INSERT ON JOBINSTANCEDATA
FOR EACH ROW
BEGIN
SELECT JOBINSTANCEDATA_SEQ.nextval
INTO :new.jobinstanceid
FROM dual;
END;

CREATE TABLE EXECUTIONINSTANCEDATA
(
    jobexecid     NUMBER(19,0) PRIMARY KEY,
    jobinstanceid NUMBER(19,0),
    createtime    TIMESTAMP,
    starttime     TIMESTAMP,
    endtime       TIMESTAMP,
    updatetime    TIMESTAMP,
    parameters    BLOB,
    batchstatus   VARCHAR2(512),
    exitstatus    VARCHAR2(512),
    CONSTRAINT JOBINST_JOBEXEC_FK FOREIGN KEY (jobinstanceid) REFERENCES JOBINSTANCEDATA (jobinstanceid)
);
CREATE SEQUENCE EXECUTIONINSTANCEDATA_SEQ;

CREATE
OR REPLACE TRIGGER EXECUTIONINSTANCEDATA_TRG
BEFORE INSERT ON EXECUTIONINSTANCEDATA
FOR EACH ROW
BEGIN
SELECT EXECUTIONINSTANCEDATA_SEQ.nextval
INTO :new.jobexecid
FROM dual;
END;

CREATE TABLE STEPEXECUTIONINSTANCEDATA
(
    stepexecid       NUMBER(19,0) PRIMARY KEY,
    jobexecid        NUMBER(19,0),
    batchstatus      VARCHAR2(512),
    exitstatus       VARCHAR2(512),
    stepname         VARCHAR2(512),
    readcount        NUMBER(11, 0),
    writecount       NUMBER(11, 0),
    commitcount      NUMBER(11, 0),
    rollbackcount    NUMBER(11, 0),
    readskipcount    NUMBER(11, 0),
    processskipcount NUMBER(11, 0),
    filtercount      NUMBER(11, 0),
    writeskipcount   NUMBER(11, 0),
    startTime        TIMESTAMP,
    endTime          TIMESTAMP,
    persistentData   BLOB,
    CONSTRAINT JOBEXEC_STEPEXEC_FK FOREIGN KEY (jobexecid) REFERENCES EXECUTIONINSTANCEDATA (jobexecid)
);
CREATE SEQUENCE STEPEXECUTIONINSTANCEDATA_SEQ;

CREATE
OR REPLACE TRIGGER STEPEXECUTIONINSTANCEDATA_TRG
BEFORE INSERT ON STEPEXECUTIONINSTANCEDATA
FOR EACH ROW
BEGIN
SELECT STEPEXECUTIONINSTANCEDATA_SEQ.nextval
INTO :new.stepexecid
FROM dual;
END;

CREATE TABLE JOBSTATUS
(
    id  NUMBER(19,0) PRIMARY KEY,
    obj BLOB,
    CONSTRAINT JOBSTATUS_JOBINST_FK FOREIGN KEY (id) REFERENCES JOBINSTANCEDATA (jobinstanceid) ON DELETE CASCADE
);

CREATE TABLE STEPSTATUS
(
    id  NUMBER(19,0) PRIMARY KEY,
    obj BLOB,
    CONSTRAINT STEPSTATUS_STEPEXEC_FK FOREIGN KEY (id) REFERENCES STEPEXECUTIONINSTANCEDATA (stepexecid) ON DELETE CASCADE
);

CREATE TABLE CHECKPOINTDATA
(
    id  VARCHAR2(512),
    obj BLOB
);
