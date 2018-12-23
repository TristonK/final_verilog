module ascii(clk,key_code,out);
    input clk;
    input [7:0]key_code;
    output reg[7:0]out;

    always @(posedge clk)
        begin
            case (key_code)

                8'h1c:out<="A";
                8'h32:out<="B";
                8'h21:out<="C";
                8'h23:out<="D";
                8'h24:out<="E";
                8'h2b:out<="F";
                8'h34:out<="G";
                8'h33:out<="H";
                8'h43:out<="I";
                8'h3b:out<="J";

                8'h42:out<="K";
                8'h4b:out<="L";
                8'h3a:out<="M";
                8'h31:out<="N";
                8'h44:out<="O";
                8'h4d:out<="P";
                8'h15:out<="Q";
                8'h2d:out<="R";
                8'h1b:out<="S";
                8'h2c:out<="T";
                8'h3c:out<="U";
                8'h2a:out<="V";
                8'h1d:out<="W";

                8'h22:out<="X";
                8'h35:out<="Y";
                8'h1a:out<="Z";
                8'h45:out<="0";
                8'h16:out<="1";
                8'h1e:out<="2";
                8'h26:out<="3";
                8'h25:out<="4";
                8'h2e:out<="5";
                8'h36:out<="6";
                8'h3d:out<="7";
                8'h3e:out<="8";
                8'h46:out<="9";

                8'h4e:out<="-";
                8'h55:out<="=";
                8'h0e:out<="`";
                8'h5a:out<=8'h0d;//换行
                8'h66:out<=8'h08;//换行
                8'h29:out<=" ";//空格
                8'h54:out<="[";
                8'h5b:out<="]";
                8'h4c:out<=";";
                8'h52:out<="'";
                8'h41:out<=",";
                8'h49:out<=".";
                8'h4a:out<="/";
                8'h5d:out<=8'h5c;

                8'h0f:out<=8'hff;
                default:out<=8'hff;
            endcase

        end
endmodule 