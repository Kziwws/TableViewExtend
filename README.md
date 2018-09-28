一、加载cell的时候动态的计算高度

```Java
OrderDetailTableViewCell *cell = [self cellAtCellDicWithIndexPath:indexPath];

float cellHight=cell?(cell.isExpand?cell.cellHight.selectedHight:cell.cellHight.normalHight):cell.cellHight.normalHight;

return cellHight;
```

二、HUD 基础的文本展示
调用方法 afterDelay为关闭的延时秒数
```Java
[KziwwsTextIndicatorView showTextIndicatorViewMessage:@"这是Kziwws HUD" afterDelay:0.5 isMaskGray:NO];
```

三、效果图
>效果图

![image](https://github.com/Kziwws/TableViewExtend/blob/master/KziwwsTableViewExtend/d121de7dd2731a4de88025661acb342b.gif)


