/// 竞猜活动类型
enum GuessType {
  dice, /// 骰子
  turntable, /// 俄罗斯转盘
  racecourse, /// 跑马场
  fruit, /// 水果机
  m10, /// 快乐10分钟
  very32, /// 非常3+2
}

/// 竞猜状态
enum GuessStatus {
  none, /// 无状态
  betting, /// 投注中
  revealing, /// 开奖中
}
