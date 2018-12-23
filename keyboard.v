module keyboard(clk,clrn,ps2_clk,ps2_data,asc,en,
                status1
                );

    input clk,clrn;
    input ps2_clk,ps2_data;
    output [7:0]asc;
    output reg en;
    output [1:0]status1;
    assign status1=status;

    wire ready;

    wire overflow;
    wire [7:0]key_code;//键码

    reg [7:0] data;
    reg [1:0] status;

    initial begin status=2;en=0; end


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
        .nextdata_n(0),
        .overflow(overflow)
    );

    always @(posedge clk)
        begin
            if(ready)begin
                case(status[1:0])
                    0:
                        if(key_code==8'hf0 )begin//通码状态
                            status<=1;
                        end else begin data<=key_code; end
                    1:
                        if(key_code!=8'hf0)begin//接收到一个f0
                          //  data<=8'hf0;
                            status<=2;
                        end
                    2:
                        begin
                            if( key_code!=8'hf0 )begin//断码状态
                                status<=0;
                                data<=key_code;
                            end else if(key_code==8'hf0)begin
                               status<=1;
                            end
                        end
                endcase
            end
        end

    ascii kcode2_asc(.clk(clk),.key_code(data),.out(asc));

endmodule