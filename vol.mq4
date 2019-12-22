//+------------------------------------------------------------------+
//|                                                         test.mq4 |
//|                                                    Graham Cleven |
//|                                                                  |
//+------------------------------------------------------------------+
#property copyright "Graham Cleven"
#property link      ""
#property version   "1.00"
#property strict
//--- input parameters
input int      Input1=1;

   
//+------------------------------------------------------------------+
//| Expert initialization function                                   |
//+------------------------------------------------------------------+
int OnInit()
{
//---

//---
   return(INIT_SUCCEEDED);
}
//+------------------------------------------------------------------+
//| Expert deinitialization function                                 |
//+------------------------------------------------------------------+
void OnDeinit(const int reason)
{
//---



}


//+------------------------------------------------------------------+
//| Expert tick function                                             |
//+------------------------------------------------------------------+

int stdDev(string symbol) {
   
   // init
   int volumes[1440];
   // int sqrdVolumes[1440];
   int sqrdSum = 0;
   int stdDev = 0;
   int sum = 0;
   int mean = 0;

   // compute mean
   for (int i = 0; i < 1440; i++) {
      volumes[i] = iVolume(symbol, PERIOD_M1, i);
      sum += volumes[i];
   }
   
   mean = sum / 1440;
   
   // for each value, subtract mean and square result
   for (int i = 0; i < 1440; i++) {
      sqrdSum += (volumes[i] - mean)^2;
   }
   
   // sqrt of mean of sqrd volumes
   stdDev = sqrt(sqrdSum / 1400);
   
   // 2 stddeviations above mean
   return mean + (stdDev * 2);

}

void OnTick()
{
//---
   // initialze globals for volume
   string insturments[2] = {"USD/JPY", "EUR/USD"};

   for (int i = 0; i < ArraySize(insturments); i++) {
   
      Print(insturments[i]);
   
      // check if postion is already open in security 
      bool open = 0;
      for(int order_counter = 0; order_counter < OrdersTotal(); order_counter++)
      {
         if (OrderSelect(order_counter, SELECT_BY_POS, MODE_TRADES) == true && OrderSymbol() == insturments[i])
         {
            open = 1; 
         
     
         }
      
      // position already open
      if (open) {
         break;
      }
   
      // compute outlier cutoff of volume on M1
      cutoff = stdDev(insturments[i]);
      
      // determine if last 10 bars incl. current are outliers 
      for (int bar = 0; bar < 10; bar++) {
         if (iVolume(insturments[i], PERIOD_M1, bar) >= cutoff){
             // compute R^2 for last 10 ticks 
      
            // check spread?
            
            // Compute SL and TP as % move
            
            // place order
         }
      }
      
     
   
   }
   
   return;

}

}
//+------------------------------------------------------------------+
//| Tester function                                                  |
//+------------------------------------------------------------------+
double OnTester()
{
//---
   double ret=0.0;
//---

//---
   return(ret);
}
//+------------------------------------------------------------------+
//| ChartEvent function                                              |
//+------------------------------------------------------------------+
void OnChartEvent(const int id,
                  const long &lparam,
                  const double &dparam,
                  const string &sparam)
{
//---


}
//+------------------------------------------------------------------+
