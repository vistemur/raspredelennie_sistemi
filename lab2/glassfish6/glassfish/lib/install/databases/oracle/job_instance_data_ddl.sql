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

SET
SERVEROUTPUT ON;

DECLARE
vCtr     Number;
 vSQL
VARCHAR2(1000);
 vcurrSchema
VARCHAR2(256);
BEGIN

SELECT sys_context('userenv', 'current_schema')
into vcurrSchema
from dual;
dbms_output
.
put_line
('Current Schema: '||vcurrSchema);

SELECT COUNT(*)
INTO vCtr
FROM user_tables
WHERE table_name = 'JOBINSTANCEDATA';

IF
vCtr = 0 THEN
    dbms_output.put_line('Creating JOBINSTANCEDATA table');
    vSQL
:= 'CREATE TABLE JOBINSTANCEDATA
    (
      jobinstanceid        NUMBER(19,0) PRIMARY KEY,
      name                 VARCHAR2(512),
      apptag               VARCHAR(512)
    )';
EXECUTE IMMEDIATE vSQL;
END IF;

  -- create the sequence if necessary
SELECT COUNT(*)
INTO vCtr
FROM user_sequences
WHERE sequence_name = 'JOBINSTANCEDATA_SEQ';
IF
vCtr = 0 THEN
    vSQL := 'CREATE SEQUENCE JOBINSTANCEDATA_SEQ';
EXECUTE IMMEDIATE vSQL;
END IF;

  -- create index trigger if necessary
SELECT COUNT(*)
INTO vCtr
FROM user_triggers
WHERE table_name = 'JOBINSTANCEDATA_TRG';
IF
vCtr = 0 THEN
    vSQL := 'CREATE OR REPLACE TRIGGER JOBINSTANCEDATA_TRG
                 BEFORE INSERT ON JOBINSTANCEDATA
                 FOR EACH ROW
                 BEGIN
                   SELECT JOBINSTANCEDATA_SEQ.nextval INTO :new.jobinstanceid FROM dual;
                 END;';
EXECUTE IMMEDIATE vSQL;
END IF;

END;
/
