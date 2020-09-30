class Solution {
    public static int countWithRemovedDuplicates(int[] numbers) {
      int uniqueCount = 0;
      int counter = 1;

      if (numbers.length ==0 ) {
        return 0;
      }
        
      while(counter < numbers.length) {

          if (numbers[uniqueCount] != numbers[counter]) {
            uniqueCount++;
            numbers[uniqueCount] = numbers[counter];
          }

        counter++;
      }
      return uniqueCount + 1;
  }


  public static void main(String[] args) {
    int[] numbers = {1,3,3,10};

    System.out.println(countWithRemovedDuplicates(numbers));
    System.out.println(Arrays.toString(numbers));
  }
}
