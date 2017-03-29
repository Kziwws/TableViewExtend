一、加载cell的时候动态的计算高度

```Java
OrderDetailTableViewCell *cell = [self cellAtCellDicWithIndexPath:indexPath];

float cellHight=cell?(cell.isExpand?cell.cellHight.selectedHight:cell.cellHight.normalHight):cell.cellHight.normalHight;

return cellHight;
```

二、HUD 基础的文本展示
调用方法 afterDelay为关闭的延时秒数
```Java
[KziwwsTextIndicatorView showTextIndicatorViewMessage:@"这是Kziwws HUD,一个善良有梦想安静的程序员" afterDelay:0.5 isMaskGray:NO];
```

三、效果图
![image](>效果图

![image](https://github.com/Kziwws/ZoomImageView/blob/master/ZoomImageView/68e6be8c213b3995d327670906acd94f.gif)
)
