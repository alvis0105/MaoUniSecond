package com.item.model;

import java.util.List;
import java.util.Map;



public class ItemService {

	private ItemDAO_interface dao;

	public ItemService() {
		dao = new ItemDAO();
	}

	public ItemVO addItem(Integer itemTypeId, String itemPetType, String itemName, String itemContent,
			Integer itemPrice, Integer itemAmount) {
		
		ItemVO itemVO = new ItemVO();

		itemVO.setItemTypeId(itemTypeId);
		itemVO.setItemPetType(itemPetType);
		itemVO.setItemName(itemName);
		itemVO.setItemContent(itemContent);
		itemVO.setItemPrice(itemPrice);
		itemVO.setItemAmount(itemAmount);
		Integer itemId = dao.insert(itemVO);
		itemVO.setItemStatus(1);
		itemVO.setItemId(itemId);
		return itemVO;
	}

	public ItemVO updateItem(Integer itemId, Integer itemTypeId, String itemPetType, String itemName, String itemContent,
			Integer itemPrice, Integer itemAmount, Integer itemStatus) {

		ItemVO itemVO = new ItemVO();
		
		
		itemVO.setItemTypeId(itemTypeId);
		itemVO.setItemPetType(itemPetType);
		itemVO.setItemName(itemName);
		itemVO.setItemContent(itemContent);
		itemVO.setItemPrice(itemPrice);
		itemVO.setItemAmount(itemAmount);
		itemVO.setItemStatus(itemStatus);
		itemVO.setItemId(itemId);
		dao.update(itemVO);

		return itemVO;
	}
	
	public ItemVO updateItemStatus(Integer itemId, Integer itemStatus) {

		ItemVO itemVO = new ItemVO();
		
		itemVO.setItemStatus(itemStatus);
		itemVO.setItemId(itemId);
		dao.update(itemVO);

		return itemVO;
	}

	public ItemVO getOneItem(Integer itemId) {
		return dao.findByPrimaryKey(itemId);
	}

	public ItemVO getOneItem2(String itemName) {
		return dao.findByPrimaryKey(itemName);
	}
	
	public List<ItemVO> getAll() {
		return dao.getAll();
	}
	
	public List<ItemVO> getAllByStatus() {
		return dao.getAllByStatus();
	}
	
	public List<ItemVO> getAll(Map<String, String[]> map) {
		return dao.getAll(map);
	}
	
	
	
//----------------------------TestMainMethod----------------------------
//public static void main(String [] args) throws ClassNotFoundException, SQLException {
//		  ItemDAO dao = new ItemDAO();

	  
// ----------------------------??????insert----------------------------
//			ItemVO itemVO = new ItemVO();
//			itemVO.setItemTypeId(1);
//			itemVO.setItemPetType("???");
//			itemVO.setItemName("????????????1");
//			itemVO.setItemContent("??????????????????1");
//			itemVO.setItemPrice(777);
//			itemVO.setItemAmount(77);
//			dao.insert(itemVO);
//			System.out.println("OK");

	  
// ----------------------------??????Update----------------------------
//			ItemVO itemVO2 = new ItemVO();
//			itemVO2.setItemId(1);
//			itemVO2.setItemTypeId(1);
//			itemVO2.setItemPetType("???");
//			itemVO2.setItemName("????????????");
//			itemVO2.setItemContent("?????????????????????");
//			itemVO2.setItemPrice(999);
//			itemVO2.setItemAmount(50);
//			itemVO2.setItemStatus(1);
//			dao.update(itemVO2);
//			System.out.println("OK");
	  

		
// ----------------------------??????getAll----------------------------	  
//		  List<ItemVO> list = dao.getAll();
//		  for(ItemVO aitem : list) {
//		   System.out.println(aitem.getItemId()+",");
//		   System.out.println(aitem.getItemTypeId()+",");
//		   System.out.println(aitem.getItemPetType()+",");
//		   System.out.println(aitem.getItemName()+",");
//		   System.out.println(aitem.getItemContent()+",");
//		   System.out.println(aitem.getItemPrice()+",");
//		   System.out.println(aitem.getItemAmount()+",");
//		   System.out.println(aitem.getItemStatus()+",");
//		   System.out.println(aitem.getItemUpdate()+",");
//		   System.out.println("-------------------------------------");
//		  }
//		}
	
}
