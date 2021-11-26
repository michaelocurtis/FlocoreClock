/*
 * SPDX-License-Identifier: MIT
 * SPDX-FileCopyrightText: 2021 Michael Curtis
 */

public class ClockApp : Gtk.Application {
    public ClockApp () {
        Object (
            application_id: "com.github.michael-curtis0.michaels-clock-app",
            flags: ApplicationFlags.FLAGS_NONE
        );
    }

    protected override void activate () {
        var main_window = new Gtk.ApplicationWindow (this) {
            default_height = 300,
            default_width = 300,
            title = "Michael's Clock"
        };
        var label = new Gtk.Label ("Clock");

        main_window.add (label);
        main_window.show_all ();
    }
    public static int main (string[] args) {
        return new ClockApp ().run (args);
    }
}