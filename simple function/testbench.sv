module testbench();
logic clk, reset;
logic a, b, c, y, yexpected; 
logic [31:0] vectornum, errors; 
logic [3:0] testvectors[10000:0];
// задание (определение) тестируемого 
// устройства
simplefunction dut(a, b, c, y);
// генерировать такты 
always
begin
clk = 1; #5; clk = 0; #5;
end

// при старте теста загрузить векторы 
// и дать импульс сброса
initial
begin
$readmemb("example.txt", testvectors); 
vectornum = 0; errors = 0;
reset = 1; #27; reset = 0;
end
// подать тестовые векторы по переднему 
// фронту такта
always @(posedge clk)
begin
#1; {a, b, c, yexpected} =
testvectors[vectornum];
    end
// проверить результаты по заднему 
// фронту такта
always @(negedge clk)
if (~reset) begin // пропустить проверку 
                  // при сбросе
// проверить результаты
if (y !== yexpected) begin
$display("Error: inputs = %b", {a, b, c});
$display(" outputs = %b (%b expected)", y, yexpected);
errors = errors + 1; 
end
vectornum = vectornum + 1;
if (testvectors[vectornum] === 4'bx) 
begin
$display("%d tests completed with %d errors", vectornum, errors);
$finish; 
  end
 end
endmodule