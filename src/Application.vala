/*
 * SPDX-License-Identifier: MIT
 * SPDX-FileCopyrightText: 2021 Michael Curtis
 */

public class ClockApp : Gtk.Application {
    public ClockApp () {
        Object (
            application_id: "com.github.michael_curtis0.michaels-clock-app",
            flags: ApplicationFlags.FLAGS_NONE
        );
    }

    public string current_time () {
        var time = new DateTime.now ();
        var formatted_time = time.format ("%a %Y-%m-%d %H:%M:%S %Z");
        return formatted_time;
    }

    protected override void activate () {
        var main_window = new Gtk.ApplicationWindow (this) {
            default_height = 300,
            default_width = 300,
            title = "Michael's Clock"
        };

        // add clock grid
        var grid = new Gtk.Grid() {
            halign = Gtk.Align.CENTER
        };

        var label = new Gtk.Label (current_time());

        grid.add (new Gtk.Label("Current Time:"));
        grid.attach (label, 0, 1);
        main_window.add (grid);
        main_window.show_all ();

        // timeout for time update (in ms)
        Timeout.add (1000, () => {
            label.set_label(current_time());
            main_window.show_all ();

            return true;
        });

    }
    public static int main (string[] args) {

        return new ClockApp ().run (args);
    }
}