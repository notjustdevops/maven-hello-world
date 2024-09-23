package com.myapp;

import static org.junit.Assert.*;
import org.junit.Test;

public class AppTest {

    @Test
    public void testGreeting() {
        // Expected message with the version number
        String expected = "Hello World, this is Dvorkin Guy v1.0.2!";  // Update this to match the new version
        assertEquals(expected, App.getGreeting());
    }
}