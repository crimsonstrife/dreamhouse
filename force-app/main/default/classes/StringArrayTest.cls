public class StringArrayTest {
    // create a public static method called generateStringArray that uses an provided integer to create a string array of that size
    public static String[] generateStringArray(Integer size) {
        String[] str = new String[size];
        for (Integer i = 0; i < size; i++) {
            str[i] = 'Test ' + i;
        }
        // return the string array
        return str;
    }
}