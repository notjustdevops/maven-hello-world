package com.myapp;

import static spark.Spark.*;

public class App {
    public static void main(String[] args) {
        // Set the port to 8080
        port(8080);

        // Define a route for the root URL that returns the "Hello World" message
        get("/", (req, res) -> {
            return getGreeting(); // Use the method below
        });

        // Print a message to the console to confirm the server is running
        System.out.println("Server is running on http://localhost:8080/");
    }

    // Method that returns the greeting message
    public static String getGreeting() {
        return "Hello World, this is Dvorkin Guy v1.0.2";  // Update version string
    }
}
