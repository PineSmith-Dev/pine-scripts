# MQL4 → Pine v6: EMA cross

This is a small conversion example. [`ema_cross.mq4`](ema_cross.mq4) is a MetaTrader 4 indicator, and [`ema_cross.pine`](ema_cross.pine) is the same logic in TradingView Pine Script v6.

| MQL4 | Pine v6 |
|---|---|
| `extern int FastLen = 9;` | `input.int(9, "Fast length")` |
| index buffers + `SetIndexBuffer` | `plot()` |
| `iMA(..., MODE_EMA, PRICE_CLOSE, i)` in a loop | `ta.ema(close, len)` (series, no loop) |
| — | `ta.crossover` markers and `alertcondition` (added) |

Pine works on a whole series at once, so the MQL4 bar loop and buffer bookkeeping disappear. That's why most conversions end up shorter than the original.
