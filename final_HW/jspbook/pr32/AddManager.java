package jspbook.pr32;

import java.util.*;

public class AddManager {
	private ArrayList<AddrBean> addrList =  new ArrayList<AddrBean>();
	
	public ArrayList<AddrBean> getAddrList() {
		return addrList;
	}
	
	public void add(AddrBean ad) { //매개변수 받은 값을 addrList에 추가하는 함수
		if (ad != null) { // null 체크를 통해 유효한 주소인지 확인
	        addrList.add(ad);
	    }
	}
	
	public String printList(int startIndex, int lastIndex) {
		String s = "";
		for(int i = startIndex ; i < lastIndex ; i++) {
			s += "<tr>";
			s += "<td>" +  addrList.get(i).getUsername() + "</td>";
			s += "<td>" + addrList.get(i).getTel() +"</td>";
			s += "<td>"  +addrList.get(i).getEmail() + "</td>";
			s += "<td>" + addrList.get(i).getGender()+ "</td>";
			s += "<td>" + addrList.get(i).getGroup() + "</td>";
			s += "</tr>"; 
		}
		return s;
	}

	public HashSet<String> groupIs(){ //주소 내 그룹 뭐 있는지 저장
		HashSet<String> set = new HashSet<String>();
		
		for (AddrBean address : addrList){
			set.add(address.getGroup());
		}
		
		return set;
	}
	
	public String printByGroup(String groupName){
		String s = "";
		for (AddrBean address : addrList){
			if(address.getGroup().equals(groupName)) {
				s += "<tr>";
				s += "<td>" + address.getUsername() + "</td>";
				s += "<td>" + address.getTel() +"</td>";
				s += "<td>"  + address.getEmail() + "</td>";
				s += "<td>" + address.getGender()+ "</td>";
				s += "<td>" + address.getGroup() + "</td>";
				s += "</tr>"; 
			}
		}
		return s;
	}
}
