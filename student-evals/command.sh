#!/bin/zsh

OUTFILE="all-evals.pdf"
BOOKMARKS=allbookmarks.txt
ALL=(evals.pdf "Contents" \
               "Student Evaluations" "Contents"\  ## almost certainly unnecessary!
               his393-summer-2020.pdf "HIS393: Digital History, Summer 2020"\
               his393-2019.pdf "HIS393: Digital History, Spring 2020" \
               mapping-spring-2020.pdf "HIS389: Maps and History, Spring 2020"\
               wdw436-summer-2020.pdf "WDW436 The Current Plague, Summer 2020"  \
               new271-2018.pdf "NEW271: Wild Waters II, 2018" \
               wildwater-2018-winter.pdf "RLG238: Wild Waters II, 2018"\
               new103-2016.pdf "NEW103: Digital Technology In Society, 2016")

cpdf merge -merge-add-bookmarks evals.pdf his393-summer-2020.pdf his393-2019.pdf mapping-spring-2020.pdf wdw436-summer-2020.pdf  new271-2018.pdf wildwater-2018-winter.pdf new103-2016.pdf -o $OUTFILE 



cpdf -list-bookmarks $OUTFILE > $BOOKMARKS

for name newstring in "${ALL[@]}"; do
 echo "changing ${name} to ${newstring}"
 sed -i "s/${name}/${newstring}/g" $BOOKMARKS
done                      

# sed -i 's/his393-summer-2020.pdf/HIS393: Digital History, Summer 2020/g' all-bookmarks.txt
# sed -i 's/his393-2019.pdf/HIS393: Digital History, Spring 2020/g' all-bookmarks.txt
# sed -i 's/mapping-spring-2020.pdf/HIS389: Maps and History, Spring 2020/g' all-bookmarks.txt
# sed -i 's/wdw436-summer-2020.pdf/WDW436: The Current Plague, Summer 2020/g' all-bookmarks.txt
# sed -i 's/new271-2018.pdf/NEW271: Wildwaters, 2018/g' all-bookmarks.txt
# sed -i 's/wildwater-2018-winter.pdf/RLG238: Wildwaters II, 2017/g' all-bookmarks.txt
# sed -i 's/new103-2016.pdf/NEW103: Digital Technology In Society, 2016/g' all-bookmarks.txt

cpdf -add-bookmarks $BOOKMARKS $OUTFILE -o $OUTFILE
# emacs all-bookmarks.txt

# cpdf -add-bookmarks all-bookmarks.txt all-syllabi.pdf > rebookmarked-syllabi.pdf
# mv rebookmarked-syllabi.pdf all-syllabi.pdf
# mv all-syllabu.pdf Syllabi.pdf
