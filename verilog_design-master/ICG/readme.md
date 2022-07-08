# 基于latch的ICG(集成门控时钟)
## 当时钟为低电平时，锁存器被打开，en信号可以传播到与门的输入, 此时与门的另一个输入clk_in为低电平，所以输出为地
## 当时钟为高电平时，锁存器关闭，en信号的值被阻止传播到与门，这就不会产生毛刺

## 与based Flip-Flop ICG相比，based latch ICG具有以下优点
### 1 触发器通常由两个锁存器（主从）组成，所以based latch ICG面积比based Flip-Flop ICG减小了一倍
### 2 Flip-Flop ICG 与 Latch ICG 减小了功耗
### 3 最重要的是，Flip-Flop-based ICG在时钟下降沿捕获使能输入，必须在半个时钟周期内完成。而使用锁存器，能够占用整个时钟周期（time borrow），因为Latch在有效电平是一直能够传播数据的，触发器只能在边沿传播数据

## 所以，based Latch ICG 比 based Flip-Flop具有更好地面积，功耗和时序