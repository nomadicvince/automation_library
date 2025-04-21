#!/bin/bash
# teach-bash.sh
# Interactive Bash Scripting Tutor with Quiz, Progress Tracker, and Visual Mode Option

clear

# Global progress tracker
PROGRESS=0
TOTAL_STEPS=10
LOG_FILE="$HOME/.bash_tutor_progress.log"

function pause() {
  echo ""
  read -p "Press Enter to continue..."
}

function show_progress() {
  PROGRESS=$((PROGRESS + 1))
  echo "[Step $PROGRESS of $TOTAL_STEPS completed]"
}

function quiz() {
  echo ""
  echo "==== Bash Basics Quiz ===="
  local score=0

  read -p "1) What symbol starts a Bash comment? " a1
  [[ "$a1" == "#" ]] && ((score++))

  read -p "2) What command outputs text to the screen? " a2
  [[ "$a2" =~ ^(echo|Echo)$ ]] && ((score++))

  read -p "3) What command reads user input? " a3
  [[ "$a3" =~ ^(read|Read)$ ]] && ((score++))

  read -p "4) Which file extension is most common for Bash scripts? (.sh/.bash/.bin): " a4
  [[ "$a4" == ".sh" ]] && ((score++))

  read -p "5) What command makes a script executable? " a5
  [[ "$a5" =~ ^(chmod.*\+x|chmod\s+\+x)$ ]] && ((score++))

  echo ""
  echo "Quiz completed. Score: $score out of 5."
  echo "[Quiz Score: $score/5]" >> "$LOG_FILE"
  pause
}

function tutorial() {
  echo "===== Bash Scripting Tutor ====="
  echo "This guide walks you through essential scripting concepts step-by-step."
  pause

  echo ""
  echo "Step 1: Shebang Line"
  echo "---------------------"
  echo "#!/bin/bash"
  echo "This line tells the system to use Bash as the script interpreter."
  show_progress
  pause

  echo ""
  echo "Step 2: Echo"
  echo "---------------------"
  echo 'echo "Hello, World!"'
  echo "Prints text output to the terminal."
  show_progress
  pause

  echo ""
  echo "Step 3: Variables"
  echo "------------------"
  echo 'name="User"'
  echo 'echo "Hello, $name"'
  echo "Variables are referenced with \$ but assigned without it."
  show_progress
  pause

  echo ""
  echo "Step 4: User Input"
  echo "-------------------"
  echo 'read -p "Enter your name: " name'
  echo 'echo "Hi, $name!"'
  show_progress
  pause

  echo ""
  echo "Step 5: If Statements"
  echo "----------------------"
  echo 'if [[ $name == "Admin" ]]; then'
  echo '  echo "Access granted."'
  echo 'else'
  echo '  echo "Access denied."'
  echo 'fi'
  show_progress
  pause

  echo ""
  echo "Step 6: Loops"
  echo "--------------"
  echo 'for i in {1..5}; do echo $i; done'
  show_progress
  pause

  echo ""
  echo "Step 7: Functions"
  echo "------------------"
  echo 'greet() { echo "Hello, $1"; }'
  echo 'greet User'
  show_progress
  pause

  echo ""
  echo "Step 8: Running Scripts"
  echo "------------------------"
  echo 'chmod +x script.sh'
  echo './script.sh'
  show_progress
  pause

  echo ""
  echo "Step 9: Debugging"
  echo "------------------"
  echo 'bash -x script.sh'
  echo "Runs the script with execution tracing."
  show_progress
  pause

  echo ""
  echo "Step 10: Best Practices"
  echo "------------------------"
  echo "- Use comments"
  echo "- Indent consistently"
  echo "- Validate input"
  echo "- Keep functions reusable"
  show_progress
  pause
}

function export_markdown() {
  TUTORIAL="$HOME/bash_scripting_basics.md"
  cat << 'EOF' > "$TUTORIAL"
# Bash Scripting Basics

## 1. Shebang
```bash
#!/bin/bash
```

## 2. Echo
```bash
echo "Hello, World!"
```

## 3. Variables
```bash
name="User"
echo "Hello, $name"
```

## 4. User Input
```bash
read -p "Enter your name: " name
```

## 5. If Statement
```bash
if [[ $name == "Admin" ]]; then
  echo "Access granted."
else
  echo "Access denied."
fi
```

## 6. Loops
```bash
for i in {1..5}; do echo "Number: $i"; done
```

## 7. Functions
```bash
greet() {
  echo "Hello, $1"
}
greet User
```

## 8. Execution
```bash
chmod +x script.sh
./script.sh
```

## 9. Debugging
```bash
bash -x script.sh
```

## 10. Best Practices
- Use comments
- Indent clearly
- Validate input
- Reuse code
EOF

  echo "Tutorial exported to: $TUTORIAL"
}

function tui_mode() {
  dialog --title "Bash Scripting Tutor" --msgbox "Welcome to the Visual TUI version of the Bash Scripting Tutor. Press OK to begin." 8 60
  tutorial | dialog --title "Tutorial Output" --textbox /dev/stdin 20 80
  dialog --yesno "Would you like to take the quiz now?" 7 40 && quiz
  dialog --yesno "Would you like to export this tutorial as Markdown?" 7 50 && export_markdown
  dialog --msgbox "Thank you for learning Bash scripting!" 6 40
}

# === BEGIN ===
echo "Choose your tutorial mode:"
echo "1) Terminal (Standard CLI)"
echo "2) Visual (TUI - requires 'dialog')"
read -p "Select 1 or 2: " mode

if [[ "$mode" == "2" ]]; then
  if ! command -v dialog &> /dev/null; then
    echo "'dialog' is required for TUI mode. Installing..."
    sudo dnf install -y dialog
  fi
  tui_mode
else
  tutorial
  quiz
  echo ""
  read -p "Would you like to export this tutorial as Markdown? (y/n): " export
  [[ "$export" == "y" ]] && export_markdown
fi

echo ""
echo "Progress logged to: $LOG_FILE"
echo "Tutorial complete."