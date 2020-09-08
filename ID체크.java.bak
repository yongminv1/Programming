package a.b.c;

public class StringIDCheck{
	// ID 는 6 ~ 12자 
	// 영문자 소문자 대문자 숫자 포함 
	// 특수기호 @ # & 중 하나 포함 
	public static boolean checkID(String str){
		//str 값을 콘솔에 출력한다.
		System.out.println("str >>> : " + str);
		boolean bool = false; 
		char charInput = '\u0000'; 
		int nCnt0 = 0;
		int nCnt1 = 0;
		int nCnt2 = 0;
		int nnCnt = 0;
		
		for (int i=0; i < str.length(); i++ ){
			charInput = str.charAt(i);

			// 특수기호 @ : 0x40 # : 0x23 & : 0x26
			// 특수기호가 들어가면 nnCnt 값이 증가한다.
			if (charInput == 0x40 || charInput == 0x23 || charInput == 0x26){
				nnCnt++;
			} 
			// 0x61 0x7a 영문자 소문자
			//영문자 소문자가 있으면 nCnt0값이 증가한다.
			if (charInput >= 0x61 && charInput <= 0x7a) {
				nCnt0++;
			}
			// 0x61 0x7a 영문자 대문자
			// 영문자 대문자가 있으면 nCnt1값이 중가한다.
			if (charInput >= 0x41 && charInput <= 0x5a) {
				nCnt1++;
			}
			// 0x30 0x39 숫자
			// 숫자가 있으면 nCnt2 값이 증가한다.
			if (charInput >= 0x30 && charInput <= 0x39) {
				nCnt2++;
			}			
		}
		System.out.println("nnCnt >>> : " + nnCnt);
		System.out.println("nCnt0 >>> : " + nCnt0);
		System.out.println("nCnt1 >>> : " + nCnt1);
		System.out.println("nCnt2 >>> : " + nCnt2); 
		System.out.println("str.length() >>> : " + str.length());
		int nCntSum = nCnt0 + nCnt1 + nCnt2;
		
		if (nnCnt == 1){
			if (str.length() == (nnCnt + nCntSum)){
				bool = true;
			}else{
				bool = false;
			}
		}

		return bool;
	}
		
	public static void main(String args[]){

		// 정규식 : Reqular Expression
		// Validation
		//str 값에 abcABc@# 을 넣었다.
		String str = "abcABc@#";
		//str이 null이 아니거나 str.length()가 0보다 크면,
		if (str !=null && str.length() > 0)
		{
			//str.length()를 int형인 nStr에 넣는다.
			int nStr = str.length();
			//nStr이 6글자~ 12글자 사이면
			//IDChect를 걸쳐 bool값이 false가 된다.
			//nStr 값의 글자가 부족하거나 12글자보다 많으면
			//"아이디를 6 ~ 12 자로 입력하세요. !!!" 라고 뜬다.
			if (nStr >= 6 && nStr <= 12)
			{
				boolean bool = StringIDCheck.checkID(str);
				System.out.println("bool >>> : " + bool);	
			}else{
				System.out.println("아이디를 6 ~ 12 자로 입력하세요. !!!");						
			}
		}else{
			System.out.println("아이디를 입력하세요. !!!");		
		}
	}
}