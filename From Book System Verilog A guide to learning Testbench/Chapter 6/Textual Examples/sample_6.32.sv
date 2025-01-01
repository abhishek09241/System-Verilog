// Sample 6.32 Using Constraint_mode

class Packet;

    rand bit [31:0] length;

    // Constraint for short packets
    constraint c_short {
        length inside {[1:32]};
    }

    // Constraint for long packets
    constraint c_long {
        length inside {[1000:1023]};
    }
endclass : Packet

module sample_6_32;

    Packet p;

    initial begin
        p = new();

        // Generate a long packet by disabling the short constraint
        p.c_short.constraint_mode(0); // Disable short packet constraint
        `SV_RAND_CHECK(p.randomize());
        $display("Generated long packet with length: %0d", p.length);

        // Generate a short packet by disabling all constraints and enabling only the short constraint
        p.constraint_mode(0);        // Disable all constraints
        p.c_short.constraint_mode(1); // Enable short packet constraint
        `SV_RAND_CHECK(p.randomize());
        $display("Generated short packet with length: %0d", p.length);
    end
endmodule : sample_6_32
