#!/bin/bash
# shell-quiz-game.sh
# Interactive Bash knowledge quiz

clear
echo "==== Shell Quiz Game ===="
echo "Test your Bash scripting knowledge. Each correct answer is worth 1 point."
echo ""

score=0

read -p "1) What command prints text to the terminal? " q1
[[ "$q1" =~ ^[Ee]cho$ ]] && ((score++))

read -p "2) What symbol starts a variable in Bash? " q2
[[ "$q2" == '$' ]] && ((score++))

read -p "3) What file extension is commonly used for Bash scripts? " q3
[[ "$q3" =~ \.sh$ ]] && ((score++))

read -p "4) What does 'chmod +x script.sh' do? " q4
[[ "$q4" =~ .*executable.* || "$q4" =~ .*permission.* ]] && ((score++))

read -p "5) What command do you use to read input from the user? " q5
[[ "$q5" =~ ^[Rr]ead$ ]] && ((score++))

echo ""
echo "Quiz Complete!"
echo "Your Score: $score / 5"
case $score in
  5) echo "Excellent!" ;;
  4) echo "Great job!" ;;
  3) echo "Good effort!" ;;
  *) echo "Keep practicing!" ;;
esac