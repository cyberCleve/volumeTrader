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
input int      Input2=1;
input int      Input3=1;

// initialze globals for volume
int volSum = 0;
int volMean = 0;
int barCount = 0;
int volHist[];
   
//+------------------------------------------------------------------+
//| Expert initialization function                                   |
//+------------------------------------------------------------------+
int OnInit()
{
//---
// Print(Bars);

  
   // get sum of previous bars
   
   for(int i=0; i < Bars; i++) {
      volSum += Volume[i];
      volHist += Volume[i]
      // OrderSend(Symbol(), OP_BUY, 1, Ask, 3, 0,0,"","TEST",0,Red);
   }

   barCount = Bars;
   
   volMean = volSum / Bars;

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


int StdDeviation() {
   for(int i=0; i < length(barCount)
   return 0;
}


//+------------------------------------------------------------------+
//| Expert tick function                                             |
//+------------------------------------------------------------------+
void OnTick()
{
//---

   // find if new bar has closed
   if (Bars > barCount) {
      barCount++;
      
      // add latest full bar to mean and list
      volSum += Volume[0];
      volHist += Volume[0];
      
      // get new mean and new stdevi
      volMean = volSum / barCount;
      volStd = StdDeviation();
      
   }

   
   return;

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
