# sjsu_prereq_tree

give a url and get a printed tree of the required courses to take it 

example:
```
BIOL 205 - Advanced Molecular Techniques (https://catalog.sjsu.edu/preview_course.php?catoid=15&coid=132160)
  BIOL 135L - Molecular Cell Biology Lab (https://catalog.sjsu.edu/preview_course_nopop.php?catoid=15&coid=132141)
    BIOL 135A - Eukaryotic Cell and Molecular Biology I (https://catalog.sjsu.edu/preview_course_nopop.php?catoid=15&coid=132208)
      BIOL 115 - General Genetics (https://catalog.sjsu.edu/preview_course_nopop.php?catoid=15&coid=132130)
        BIOL 30 - Principles of Biology I (https://catalog.sjsu.edu/preview_course_nopop.php?catoid=15&coid=132116)
          ENGL 1AF - First-Year Writing: Stretch English I (https://catalog.sjsu.edu/preview_course_nopop.php?catoid=15&coid=133775)
            ENGL 1A - First Year Writing (https://catalog.sjsu.edu/preview_course_nopop.php?catoid=15&coid=131729)
        BIOL 31 - Principles of Biology II (https://catalog.sjsu.edu/preview_course_nopop.php?catoid=15&coid=132118)
        CHEM 1A - General Chemistry (https://catalog.sjsu.edu/preview_course_nopop.php?catoid=15&coid=131789)
          CHEM 10 - Chemical Calculations and Concepts (https://catalog.sjsu.edu/preview_course_nopop.php?catoid=15&coid=132788)
          MATH 19 - Precalculus (https://catalog.sjsu.edu/preview_course_nopop.php?catoid=15&coid=132194)
            MATH 1 - Mathematical Reasoning (https://catalog.sjsu.edu/preview_course_nopop.php?catoid=15&coid=132257)
              MATH 1001S - Supported Instruction for MATH 1 (https://catalog.sjsu.edu/preview_course_nopop.php?catoid=15&coid=135117)
            MATH 1019S - Supported Instruction for MATH 19 (https://catalog.sjsu.edu/preview_course_nopop.php?catoid=15&coid=135120)
        CHEM 1B - General Chemistry (https://catalog.sjsu.edu/preview_course_nopop.php?catoid=15&coid=131793)
      CHEM 112A - Organic Chemistry (https://catalog.sjsu.edu/preview_course_nopop.php?catoid=15&coid=132795)
      CHEM 112B - Organic Chemistry (https://catalog.sjsu.edu/preview_course_nopop.php?catoid=15&coid=132796)
      CHEM 135 - General Biochemistry (https://catalog.sjsu.edu/preview_course_nopop.php?catoid=15&coid=132811)
        CHEM 130A - Biochemistry (https://catalog.sjsu.edu/preview_course_nopop.php?catoid=15&coid=132804)
```

todo: 
* make it show the full dep tree not just unvisited nodes
* courses in the "notes" section get picked up (ie 130A is not a prereq of 135 )
