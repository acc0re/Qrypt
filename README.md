# Qrypt

**Qrypt** is an offline password generator built with **Qt 6 (Qt Quick)**.  
It focuses on strong randomness, transparent security guarantees, and a clean desktop user interface.

---

## Features

- Cryptographically secure random password generation  
- Configurable password length  
- Uppercase, lowercase, numbers, and symbols selection  
- Guaranteed inclusion of selected character classes  
- Modern Qt Quick UI with Material styling  
- Portable distribution (ZIP / SFX)

---

## Screenshots

<img width="372" height="515" alt="Qrypt screenshot" src="https://github.com/user-attachments/assets/f4fef197-dea2-43e3-9479-1d7ac72b81d7" />

---

## Technology Stack

- **C++** (Qt 6)
- **Qt Quick / QML**
- **Qt Quick Controls 2**
- Dynamic linking (LGPL-compliant)

---

## Download & Usage

1. Download the latest release from the **Releases** section  
2. Extract the archive  
3. Run `qrypt.exe`  
4. Generate passwords locally

No installation and no administrator privileges required.

---

## Security Notes

- Randomness is provided by `QRandomGenerator`, backed by the operating system’s cryptographically secure random source.
- Password generation guarantees that each selected character group contributes at least one character.
- The final password is shuffled to avoid structural patterns.
- All password generation happens locally on your machine.

---

## Licensing

### Application Code
This project is licensed under the **MIT License**.  
See the `LICENSE` file for details.

### Third-Party Components
This application uses the **Qt framework**, which is licensed under the **GNU Lesser General Public License v3 (LGPLv3)**.

- Qt © The Qt Company Ltd.
- Qt is dynamically linked and can be replaced by the user.
- See `LGPL-3.0.txt` and `THIRD_PARTY_LICENSES.txt` for details.
