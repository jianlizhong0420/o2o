package com.imooc.o2o.service;

import static org.junit.Assert.assertEquals;

import java.io.File;
import java.io.FileInputStream;
import java.io.FileNotFoundException;
import java.util.Date;

import org.junit.Test;
import org.springframework.beans.factory.annotation.Autowired;

import com.imooc.o2o.BaseTest;
import com.imooc.o2o.dto.ImageHolder;
import com.imooc.o2o.dto.ShopExecution;
import com.imooc.o2o.entity.Area;
import com.imooc.o2o.entity.PersonInfo;
import com.imooc.o2o.entity.Shop;
import com.imooc.o2o.entity.ShopCategory;
import com.imooc.o2o.enums.ShopStateEnum;

public class ShopServiceTest extends BaseTest{
	@Autowired
	private ShopService shopService;
	
	@Test
	public void testAddShop() {
		Shop shop = new Shop();
		PersonInfo owner = new PersonInfo();
		Area area = new Area();
		ShopCategory shopCategory = new ShopCategory();
		
		owner.setUserId(1L);
		area.setAreaId(2);
		shopCategory.setShopCategoryId(2L);
		
		shop.setOwner(owner);
		shop.setArea(area);
		shop.setShopCategory(shopCategory);
		shop.setShopName("张三的小店");
		shop.setShopDesc("张三小店的店铺描述");
		shop.setShopAddr("张三小店的店铺地址");
		shop.setPhone("88555666");
		shop.setPriority(3);
		shop.setAdvice("店铺申请通过");
		shop.setCreateTime(new Date());
		shop.setLastEditTime(new Date());
		shop.setEnableStatus(1);
		File file = new File("C:\\Users\\Administrator\\Pictures\\zhaomin.png");
		ImageHolder thumbnail;
		try {
			thumbnail = new ImageHolder("zhaomin.png",new FileInputStream(file));
			ShopExecution se = shopService.addShop(shop,thumbnail);
			assertEquals(ShopStateEnum.CHECK.getState(),se.getState());
		} catch (FileNotFoundException e) {
			e.printStackTrace();
		}
	}
	
}
