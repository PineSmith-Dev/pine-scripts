//+------------------------------------------------------------------+
//| EMA Cross (MQL4) - the "before" side of a conversion example      |
//+------------------------------------------------------------------+
#property strict
#property indicator_chart_window
#property indicator_buffers 2
#property indicator_color1 clrAqua
#property indicator_color2 clrOrange

extern int FastLen = 9;
extern int SlowLen = 21;

double Fast[];
double Slow[];

int OnInit()
{
   SetIndexBuffer(0, Fast);
   SetIndexBuffer(1, Slow);
   SetIndexLabel(0, "Fast EMA");
   SetIndexLabel(1, "Slow EMA");
   return(INIT_SUCCEEDED);
}

int OnCalculate(const int rates_total,
                const int prev_calculated,
                const datetime &time[],
                const double &open[],
                const double &high[],
                const double &low[],
                const double &close[],
                const long &tick_volume[],
                const long &volume[],
                const int &spread[])
{
   int limit = rates_total - prev_calculated;
   if (prev_calculated > 0) limit++;
   for (int i = limit - 1; i >= 0; i--)
   {
      Fast[i] = iMA(NULL, 0, FastLen, 0, MODE_EMA, PRICE_CLOSE, i);
      Slow[i] = iMA(NULL, 0, SlowLen, 0, MODE_EMA, PRICE_CLOSE, i);
   }
   return(rates_total);
}
