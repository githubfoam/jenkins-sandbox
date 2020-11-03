package com.githubfoam.test1;

import org.junit.Before;
import org.junit.Test;

import static org.junit.Assert.assertEquals;

public class HelloWorldTest {

    private HelloWorld subject;

    @Before
    public void setup() {
        subject = new HelloWorld();
    }

    @Test
    public void testGetMessage() {
        assertEquals("Hello Universe!", subject.getMessage(false));
    }

    @Test
    public void testGetMessage2() {
        assertEquals("Hello Galaxy!", subject.getMessage(true));
    }

}
