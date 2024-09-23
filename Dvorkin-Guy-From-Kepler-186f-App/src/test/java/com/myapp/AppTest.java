package com.myapp;

import static org.junit.Assert.*;
import org.junit.Test;

public class AppTest {

    @Test
    public void testGreeting() {
        // Expected message with the current version number
        String expected = "Hello World, this is Dvorkin Guy v0.0.10!";  // Update to match the current version
        assertEquals(expected, App.getGreeting());
    }
}
