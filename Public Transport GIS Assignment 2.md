# Public Transport GIS Assignment 2

A091005 周秉宇

![](https://github.com/pcchou/PublicTransport_110-1/blob/main/HW2.png?raw=true =100%x)



### Notes: 
#### 觀察出圖的結果，您覺得哪裡還可以再調整，以提升視覺化呈現

- 尚未解決 ggsflabel 標站名的問題，台北等站因重疊問題未標出

#### 補充說明程式碼撰寫問題，若出現錯誤訊息也請貼上

- 產圖的速度太慢了，希望能找到效能的癥結點，可能也需要簡化地理資料的細緻度才能加速。
- `Aesthetics must be either length 1 or the same as the data (1): label and geometry`
- `1: 於 st_point_on_surface.sfc(data$geometry)：
  st_point_on_surface may not give correct results for longitude/latitude data`
- `2: ggrepel: 17 unlabeled data points (too many overlaps). Consider increasing max.overlaps `