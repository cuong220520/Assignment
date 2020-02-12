/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.fgw.gch0712;

import org.junit.After;
import org.junit.AfterClass;
import org.junit.Before;
import org.junit.BeforeClass;
import org.junit.runner.RunWith;
import org.junit.runners.Suite;

/**
 *
 * @author cuong
 */
@RunWith(Suite.class)
@Suite.SuiteClasses({com.fgw.gch0712.StackTest.class, com.fgw.gch0712.Assigment2Test.class, com.fgw.gch0712.QueueTest.class, com.fgw.gch0712.MessageBoxEmptyTest.class, com.fgw.gch0712.MenuSystemTest.class, com.fgw.gch0712.MessageEmptyExceptionTest.class, com.fgw.gch0712.NodeTest.class})
public class Gch0712Suite {

    @BeforeClass
    public static void setUpClass() throws Exception {
    }

    @AfterClass
    public static void tearDownClass() throws Exception {
    }

    @Before
    public void setUp() throws Exception {
    }

    @After
    public void tearDown() throws Exception {
    }
    
}
