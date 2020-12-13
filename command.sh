#!/bin/zsh

# pdftk A=matt-price-dossier.pdf B=teaching-statement-2018.pdf C=HIS495Syllabus.pdf D=His393Syllabus.pdf E=RLG231Syllabus.pdf F=RLG231Syllabus.pdf H=implosion.pdf I=01-galileo.pdf Z=cv_2018_matt_price.pdf   cat A1 B Z A5 C D E F A2 A3 A4    H I output matt-price-teaching-dossier.pdf

# pdftk A=His393Syllabus.pdf B=wdw235.pdf C=WDW436Syllabus.pdf D=mapping.pdf E=RLG231Syllabus.pdf cat A B C D E output all-syllabi.pdf 
OUTFILE="matt-price-teaching-dossier.pdf"
BOOKMARKS=all-bookmarks.txt
ALL=(Contents.pdf "Contents" \
                  teaching-statement.pdf "Teaching Statement"
                  all-syllabi.pdf "Course Syllabi"\
                  all-assignments.pdf "Sample Assignments" \
                  all-evals.pdf "Student Evaluations")

cpdf merge -merge-add-bookmarks Contents.pdf ../teaching-statement.pdf syllabi/all-syllabi.pdf assignments/all-assignments.pdf  student-evals/all-evals.pdf -o matt-price-teaching-dossier.pdf

cpdf -list-bookmarks $OUTFILE > $BOOKMARKS

for name newstring in "${ALL[@]}"; do
 echo "changing ${name} to ${newstring}"
 sed -i "s/${name}/${newstring}/g" $BOOKMARKS
done                      

cpdf -add-bookmarks all-bookmarks.txt $OUTFILE -o $OUTFILE

cpdf -set-title "Teaching Dossier, Matt Price" $OUTFILE -o $OUTFILE
cpdf -set-author "Matt Price" $OUTFILE -o $OUTFILE
