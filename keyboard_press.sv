module keyboard(clk,clrn,ps2_clk,ps2_data,asc,en);

    input clk,clrn;
    input ps2_clk,ps2_data;
    output [7:0]asc;
    output reg en;

    wire ready;

    reg nextdata_n;
    wire overflow;
    wire [7:0]key_code;//键码

    reg [7:0] data;
    reg [1:0] status;

    reg [7:0] memorydata;
    initial begin nextdata_n=0;status=0;en=0; end

    always @(posedge clk)begin
        if(status==0 )en<=1;
        else en<=0;
    end
    ps2_keyboard keyboard_1(
        .clk(clk),
        .clrn(clrn),
        .ps2_clk(ps2_clk),
        .ps2_data(ps2_data),
        .data(key_code),
        .ready(ready),
        .nextdata_n(nextdata_n),
        .overflow(overflow)
    );

    always @(posedge clk)
        begin
            if(ready)begin
                nextdata_n<=1;
                case(status[1:0])
                    0:
                        if(key_code==8'hf0 )begin//通码状态
                            data<=key_code;
                            status<=1;
                        end
                    1:
                        if(key_code!=8'hf0)begin//接收到一个f0
                            data<=8'hf0;
                            status<=2;
                        end
                    2:
                        if(key_code!=8'hf0 && (nextdata_n==0))begin//断码状态
                            data<=key_code;
                            status<=0;
                        end

                endcase
            end
            else
                nextdata_n<=0;
        end

    ascii kcode2_asc(.clk(clk),.key_code(data),.out(asc));

endmodule