#!/bin/zsh

OUTFILE="all-assignments.pdf"
BOOKMARKS=all-bookmarks.txt
ALL=(assignments.pdf "Contents" \
               at-readme "Advanced Topics (HIS393)"\
               dom-readme.pdf "DOM and Data (HIS393)" \
               newone-journal.pdf "Technology Journal (NEW103)"\
               02-galileo.pdf "Understanding Galileo (RLG231)"  \
               implosion.pdf "Implosion Assignment (INF1501)" \
               encountering-the-mad.pdf "Encountering the Madawaska (NEW271)"\
               madawaska-package.pdf "Madawaska Package (NEW271)")

# pdftk A=matt-price-dossier.pdf B=teaching-statement-2018.pdf C=HIS495Syllabus.pdf D=His393Syllabus.pdf E=RLG231Syllabus.pdf F=RLG231Syllabus.pdf H=implosion.pdf I=01-galileo.pdf Z=cv_2018_matt_price.pdf   cat A1 B Z A5 C D E F A2 A3 A4    H I output matt-price-teaching-dossier.pdf

# pdftk A=His393Syllabus.pdf B=wdw235.pdf C=WDW436Syllabus.pdf D=mapping.pdf E=RLG231Syllabus.pdf cat A B C D E output all-syllabi.pdf 

cpdf merge -merge-add-bookmarks assignments.pdf at-readme.pdf dom-readme.pdf newone-journal.pdf 02-galileo.pdf implosion.pdf  encountering-the-mad.pdf  madawaska-package.pdf  -o $OUTFILE

cpdf -list-bookmarks $OUTFILE > $BOOKMARKS

for name newstring in "${ALL[@]}"; do
 echo "changing ${name} to ${newstring}"
 sed -i "s/${name}/${newstring}/g" $BOOKMARKS
done                      

cpdf -add-bookmarks $BOOKMARKS $OUTFILE -o $OUTFILE

# emacs all-bookmarks.txt

# cpdf -add-bookmarks all-bookmarks.txt all-syllabi.pdf > rebookmarked-syllabi.pdf
# mv rebookmarked-syllabi.pdf all-syllabi.pdf
# mv all-syllabu.pdf Syllabi.pdf
