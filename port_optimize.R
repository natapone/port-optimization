# source("port_utils.R")

library('quantmod')

library('tseries')
library('zoo')

tickers = spl('SPY,EFA,EWJ,EEM,IYR,RWX,IEF,TLT,DBC,GLD')


getSymbols(c('QQQ','SPY'))

require("zoo")			# For diff() method.
X <- diff(log(as.zoo(EuStockMarkets)))
res <- portfolio.optim(X)


xxx = get_hist()
xxx = ts(xxx, frequency = 1) # convert to time serie obj
yyy <- diff(log(as.zoo(xxx)))
max_limit = c(0.1,0.1,0.1,0.15,1,1,1,1,1,1,1,1,1,1)
max_limit = c(0,0,0,0,0,0,0,0,0,0,1,1,1,1)
max_limit = c(0.1,0,0.1,0.15,0,0,0,0,0,0,1,1,1,1)
max_limit = c(0.05,0.05,0,0.15,1,1,1,1,0.5,0.1,0,1,1,1) # current
res <- portfolio.optim(yyy,reshigh = max_limit, rf=0.05)
round(res$pw, digits = 2)

op_port = data.frame(
    code = colnames(xxx),
    weight = round(res$pw, digits = 2)
)
op_port

# P01I01 - นโยบายกองทุนเปิดทหารไทย World Equity Index [DI]
# P01I02 - นโยบายกองทุนเปิดทหารไทย Emerging Markets Equity Index [DI]
# P01I03 - นโยบาย กองทุนเปิดทหารไทย China Equity Index [DI]
# P01I07 - นโยบายกองทุนเปิดทหารไทย โกลด์ สิงคโปร์ [AI]
# P01T01 - นโยบายกองทุนเปิดทหารไทยจัดทัพลงทุน ระยะสั้น
# P01T02 - นโยบายกองทุนเปิดทหารไทยจัดทัพลงทุน ระยะปานกลาง
# P01T03 - นโยบายกองทุนเปิดทหารไทยจัดทัพลงทุน ระยะยาว
# P01TB1 - นโยบายกองทุนเปิดทหารไทยธนบดี
# P01TB3 - นโยบายกองทุนเปิดทหารไทย SET50
# P01TB4 - นโยบายกองทุนเปิดทหารไทยธนรัฐ
# P01TB6 - นโยบายกองทุนเปิด JUMBO 25
# P01TB7 - นโยบายกองทุนเปิดทหารไทย โกลด์ ฟันด์ [AI]
# P01TB8 - นโยบายกองทุนเปิดทหารไทยธนพลัส
# P01TB9 - นโยบายกองทุนเปิดทหารไทยธนไพศาล

