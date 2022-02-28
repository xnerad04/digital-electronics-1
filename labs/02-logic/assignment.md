# Lab 2: Adam Neradilek

### 2-bit comparator

1. Karnaugh maps for other two functions:

   Greater than:

   ![K-maps](https://github.com/xnerad04/digital-electronics-1/blob/main/B_greater_A.JPG)

   Less than:

   ![K-maps](https://github.com/xnerad04/digital-electronics-1/blob/main/B_less_A.JPG)

2. Equations of simplified SoP (Sum of the Products) form of the "greater than" function and simplified PoS (Product of the Sums) form of the "less than" function.

   ![Logic functions](https://github.com/xnerad04/digital-electronics-1/blob/main/SoP_PoS.JPG)

### 4-bit comparator

1. Listing of VHDL stimulus process from testbench file (`testbench.vhd`) with at least one assert (use BCD codes of your student ID digits as input combinations). Always use syntax highlighting, meaningful comments, and follow VHDL guidelines:

   Last two digits of my student ID: **xxxx92**

```vhdl
    p_stimulus : process
    begin
        -- Report a note at the beginning of stimulus process
        report "Stimulus process started" severity note;

        -- First test case
        s_b <= "1001"; -- Such as "0101" if ID = xxxx56
        s_a <= "0010";        -- Such as "0110" if ID = xxxx56
        wait for 100 ns;
        -- Expected output
        assert ((s_B_greater_A = '1') and
                (s_B_equals_A  = '0') and
                (s_B_less_A    = '0'))
        -- If false, then report an error
        report "Input combination 1001, 0010 FAILED" severity error;

        -- Report a note at the end of stimulus process
        report "Stimulus process finished" severity note;
        wait;
    end process p_stimulus;
```

2. Text console screenshot during your simulation, including reports.

   ![your figure](https://github.com/xnerad04/digital-electronics-1/blob/main/Report.JPG)

3. Link to your public EDA Playground example:

   [https://www.edaplayground.com/...](https://www.edaplayground.com/...)
