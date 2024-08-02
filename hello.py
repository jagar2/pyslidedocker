import sys
from PySide6.QtWidgets import QApplication, QWidget, QPushButton, QVBoxLayout, QMessageBox

class HelloWorldApp(QWidget):
    def __init__(self):
        super().__init__()

        self.initUI()

    def initUI(self):
        self.setWindowTitle('Hello World with PySide6')

        layout = QVBoxLayout()

        self.button = QPushButton('Click me', self)
        self.button.clicked.connect(self.show_message)

        layout.addWidget(self.button)

        self.setLayout(layout)

    def show_message(self):
        QMessageBox.information(self, "Hello World", "Hello, World!")

if __name__ == '__main__':
    app = QApplication(sys.argv)
    mainWin = HelloWorldApp()
    mainWin.show()
    sys.exit(app.exec())
