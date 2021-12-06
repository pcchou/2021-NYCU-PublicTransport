# Public Transport GIS Assignment 1

A091005 周秉宇


## Task 1

![](https://github.com/pcchou/PublicTransport_110-1/blob/main/HW1_Task1.png?raw=true)





### Notes: 
#### 觀察出圖的結果，您覺得哪裡還可以再調整，以提升視覺化呈現

1. 改以人口點圖（散布圖或隨機點子圖）或密度面量圖顯示以避免誤判
2. 以其他顏色繪製周圍的直轄市/縣界輪廓

#### 補充說明程式碼撰寫問題，若出現錯誤訊息也請貼上

- 玩了一下 Windows 的字體問題，發現一定要透過 `windowsFonts` 來解決
- 一開始誤會 `fill` 跟 `color` 的差異，另外對於 `aes`、+、%+% 等 ggplot2 的使用也不是太理解，有遇到一些小問題
- 好奇 `scale_fill_distiller` 跟 `scale_fill_brewer` 的使用方式詳情


## Task 2

![](https://github.com/pcchou/PublicTransport_110-1/blob/main/HW1_Task2.png?raw=true)

### Notes: 
#### 觀察出圖的結果，您覺得哪裡還可以再調整，以提升視覺化呈現

1. 調整 label 位置
2. 調整配色、車站大小

#### 補充說明程式碼撰寫問題，若出現錯誤訊息也請貼上

- `ggsfrepel` 實在是非常難纏
- 原先以為 `dplyr` 的可以吃，所以雖然測試時用了 vectorized 的 filter 函數，但後來去掉之後就噴錯了

```
警告訊息：
1: 於 st_point_on_surface.sfc(data$geometry)：
  st_point_on_surface may not give correct results for longitude/latitude data
2: 於 st_point_on_surface.sfc(data$geometry)：
  st_point_on_surface may not give correct results for longitude/latitude data
3: 於 st_point_on_surface.sfc(data$geometry)：
  st_point_on_surface may not give correct results for longitude/latitude data
4: 於 st_point_on_surface.sfc(data$geometry)：
  st_point_on_surface may not give correct results for longitude/latitude data
5: ggrepel: 5 unlabeled data points (too many overlaps). Consider increasing max.overlaps 
6: ggrepel: 8 unlabeled data points (too many overlaps). Consider increasing max.overlaps 
7: ggrepel: 5 unlabeled data points (too many overlaps). Consider increasing max.overlaps 
8: ggrepel: 5 unlabeled data points (too many overlaps). Consider increasing max.overlaps 
```