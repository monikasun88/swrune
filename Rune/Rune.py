# This constructs the rune class in Python

class Rune:

  def __init__(self, name):
  

  // Initialize basic variables
  public final int stars;
  public final String runeClass;
  public final int runeSlot;
  
  // Initialize rune attributes in an array of length 2 with the first entry being the 
  // amount and the second entry being the level (1-3) 1=primary, 2=secondary, 3=tertiary
  private int ATK;
  private int ATKPerc;
  private int DEF;
  private int DEFPerc;
  private int HP;
  private int HPPerc;
  private int SPD;
  private int CRIRatePerc;
  private int CRIDmgPerc;
  private int ResPerc;
  private int AccPerc;
  
  // Initialize other variables
  public String currLoc;
  
  public void Rune(String runeClassInput, int[] otherAttr, String currLocInput) {
    runeClass = runeClassInput;
    stars = otherAttr[0];
    runeSlot = otherAttr[1];
    ATK = otherAttr[2];
    ATKPerc = otherAttr[3];
    DEF = otherAttr[4];
    DEFPerc = otherAttr[5];
    HP = otherAttr[6];
    HPPerc = otherAttr[7];
    SPD = otherAttr[8];
    CRIRatePerc = otherAttr[9];
    CRIDmgPerc = otherAttr[10];
    ResPerc = otherAttr[11];
    AccPerc = otherAttr[12];
    currLoc = currLocInput;
  }
  
  public static void main() {
    int[] anArray = new int[] {0, 1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12};
    String derp = "Roeroero";
    String derp2 = "ewftrwefew";
    Rune CoolRune = new Rune(derp, anArray, derp2);
    System.out.println(CoolRune.runeClass);
  }

}
