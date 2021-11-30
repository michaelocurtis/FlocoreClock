/*
 * SPDX-License-Identifier: MIT
 * SPDX-FileCopyrightText: 2021 Flocore
 */

public class ClockApp : Gtk.Application {
    public ClockApp () {
        Object (
            application_id: "com.github.flocore.flocoreclock",
            flags: ApplicationFlags.FLAGS_NONE
        );
    }

    public string current_utc_time () {
        var time = new DateTime.now_utc ();
        var formatted_time = time.format ("%a %Y-%m-%d %H:%M:%S %Z");
        return formatted_time;
    }

    public string current_local_time () {
        var time = new DateTime.now_local ();
        var formatted_time = time.format ("%a %Y-%m-%d %H:%M:%S %Z");
        return formatted_time;
    }

    protected override void activate () {
        var main_window = new Gtk.ApplicationWindow (this) {
            default_height = 300,
            default_width = 300,
            title = "Flocore Clock"
        };

        // add clock grid
        var grid = new Gtk.Grid() {
            valign = Gtk.Align.CENTER,
            halign = Gtk.Align.CENTER,
            expand = true
        };

        var utc_time = new Gtk.Label (current_utc_time());
        var local_time = new Gtk.Label (current_local_time());

        grid.attach (new Gtk.Label("Current UTC Time:"), 0, 0);
        grid.attach (utc_time, 0, 1);

        grid.attach (new Gtk.Label(" "), 1, 2);

        grid.attach (new Gtk.Label("Current Local Time:"), 0, 3);
        grid.attach (local_time, 0, 4);
        main_window.add (grid);
        main_window.show_all ();

        // timeout for time update (in ms)
        Timeout.add (1000, () => {
            utc_time.set_label(current_utc_time());
            local_time.set_label(current_local_time());
            main_window.show_all ();

            return true;
        });

    }
    public static int main (string[] args) {
        return new ClockApp ().run (args);
    
    }
}