#!/bin/zsh

OUTFILE="all-syllabi.pdf"
BOOKMARKS=all-bookmarks.txt
ALL=(syllabi.pdf "Contents" \
                 His393Syllabus.pdf "HIS393: Digital History"\
                 WDW436Syllabus.pdf "WDW436: The Current Plague" \
                 wdw235.pdf "WDW235: Introduction to Digital Humanities"\
                 mapping.pdf "HIS389: Maps and History"  \
                 RLG231Syllabus.pdf "RLG231: Religion ahd Science")


cpdf merge -merge-add-bookmarks syllabi.pdf His393Syllabus.pdf WDW436Syllabus.pdf wdw235.pdf mapping.pdf RLG231Syllabus.pdf -o all-syllabi.pdf

cpdf -list-bookmarks $OUTFILE > $BOOKMARKS

for name newstring in "${ALL[@]}"; do
 echo "changing ${name} to ${newstring}"
 sed -i "s/${name}/${newstring}/g" $BOOKMARKS
done                      

cpdf -add-bookmarks $BOOKMARKS $OUTFILE -o $OUTFILE

