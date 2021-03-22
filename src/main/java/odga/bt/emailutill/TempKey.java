package odga.bt.emailutill;

public class TempKey {
	
    private char[] keySet = new char[] { 
            '0', '1', '2', '3', '4', '5', '6', '7', '8', '9',
            'A', 'B', 'C', 'D', 'E', 'F', 'G', 'H', 'I', 'J',
            'K', 'L', 'M', 'N', 'O', 'P', 'Q', 'R', 'S', 'T',
            'U', 'V', 'W', 'X', 'Y', 'Z',
            'a', 'b', 'c', 'd', 'e', 'f', 'g', 'h', 'i', 'j',
            'k', 'l', 'm', 'n', 'o', 'p', 'q', 'r', 's', 't',
            'u', 'v', 'w', 'x', 'y', 'z'};
 
    public String generateKey(int keyLength) {
        StringBuffer sb = new StringBuffer();
        
        for (int i = 0 ; i < keyLength ; i++) {
            
            int idx = (int) (keySet.length * Math.random()); // 62 * 생성된 난수를 Int로 추출 (소숫점제거)
            sb.append(keySet[idx]);
        }
        return sb.toString();
    }
}
