# readmemb 从文件中读取二进制
# readmemh 从文件中读取十六进制

### 定义一个有256个地址的字节存储器mem
reg [7:0]mem[1:256];
initial $readmemh("mem.data", mem);  // 默认从起始地址开始读取存放到存储器mem中
initial $readmemh("mem.data", mem, 16);  // 从地址单元是16的存储器单元为起始存放单元的存储器中去，一直到地址是256的单元
initial $readmemh("mem.data", mem, 128, 1);  / 从128的地址单元开始装载数据，一直到地址位1的单元