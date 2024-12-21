// Sample 5.25 Passing Objects

// Task to transmit a packet
task transmit(input Transaction tr); 
    // tr ek handle hai jo Transaction object ko point karta hai.
    // Is task ke andar, hum tr ke object ko modify karenge.

    tr.data[0] = ~tr.data[0]; // Pehla data corrupt kar diya (invert kar diya)
    CBbux.rx_data <= tr.data[0]; // Bus pe data bhej diya
endtask

module sample_5_25;
    Transaction tr; // Ek Transaction ka handle declare kiya

    initial begin
        tr = new();       // Object allocate kiya (memory di)
        tr.addr = 42;     // Object ke andar value set ki
        transmit(tr);     // Object ko transmit task mein bheja

        // transmit task ne tr ke andar ka data modify kiya hoga.
        // Lekin tr handle khud unchanged rahega.
    end
endmodule
