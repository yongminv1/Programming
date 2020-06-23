package a.b.c;

public class 형변환 {

	public static void main(String[] args) {
		// TODO Auto-generated method stub
		String s = "용민천재";
		System.out.println("s >>> : " + s);
		Object obj = new Object();
		System.out.println("obj >>> : " + obj);
		
		
		
		//원래는 s(String)타입을 obj에 넣어도
		//java.lang.Object@70dea4e 이 값이 나와야되는데
		//이제는 java에서 자동으로 형변환을 해주기때문에
		//obj >>> : 용민천재 가 나온다.
		obj = s;
		//println 함수는 print 함수 호출하고  ln을 호출하는 두번 호출
		//문자열을 return한다.
		//
		System.out.println("obj >>> : " + obj);
		
		// Object 클래스에 있는  toString() 함수를 String 클래스에서 오버라이딩에서 
		// 사용하는 중 
		s = obj.toString();
		//String 타입와  Object타입은 전혀 다른 타입이다.
		// Object 형에서 String 형을 형변환 
		String s1 = (String)obj;
		
		// String 클래스에 데이터를 변형(String형으로)
		String s2 = String.valueOf(obj);
		
		// "" String타입과 함께쓰면 자동으로 String으로 형변환
		//  옛날 개발자들이 자바를 잘 모를 때 
		//  c 규칙 또는 불편해서 썻던 방번 
		String s3 = obj + ""; // String + 연산지양(스트링 클래스의 불변성)
		//불변성이란?
		//이렇게쓰면 a 와 b가 고정된값으로 메모리 용량이 차서 추천하지 않는다.
		String a = "1";
		String b = "2";
		String c = a + b;
//		StringBuffer 클래스에 있는  append()를 사용하여 메모리 공간을 줄인다.
		
		
		//숫자도 똑같이 String 형변환처럼 쓰면된다.
		int i = 1;
		//그냥 toString()만 쓰게되면 객체가 아니기때문에 못쓴다.
		String i0 = new Integer(i).toString(); 
		//String (String)i1 = i + "";  이렇게 쓰면안된다.
		String i1 = String.valueOf(i);
		//이렇게는 쓰지말자!!
		String i2 = i + ""; //지양
				
		
		System.out.println("s >>> : " + s);
		System.out.println("s1 >>> : " + s1);
		System.out.println("s2 >>> : " + s2);
		System.out.println("s3 >>> : " + s3);
	}

}
