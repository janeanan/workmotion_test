
# 👨‍💼 Employee Management App (Flutter + GetX)

ระบบจัดการพนักงานภายในองค์กรและพนักงาน Outsource  
พัฒนาด้วย **Flutter** โดยใช้แนวทาง **Clean Architecture + MVVM Pattern**

---

## 🧱 สถาปัตยกรรม: Clean Architecture + MVVM

> ✨ แนวคิดคือการแยกความรับผิดชอบออกเป็น 3 ส่วนหลัก:  
> `View` ↔ `ViewModel` ↔ `Model` เพื่อให้โค้ดสะอาด แก้ไขง่าย และทดสอบได้

```
View (UI)        
  ↕ Bindings (GetX) 
ViewModel (State & Logic)
  ↕ Call API / Entities
Model (Data Layer)
```

| Layer         | Folder / ไฟล์ | หน้าที่หลัก |
|---------------|----------------|--------------|
| **View**      | `lib/view/`     | UI, ฟอร์ม, รายการ |
| **ViewModel** | `lib/viewmodel/`| จัดการสถานะ และ logic |
| **Model**     | `lib/model/`    | โครงสร้างข้อมูล, เรียก API |
| **Utils**     | `lib/utills/`   | ตัวช่วย, enum, config |

---

## 📁 โครงสร้างโปรเจกต์

```bash
lib/
├── component/                # ปุ่มหรือ widget ย่อย ๆ
├── model/                    # ชั้นข้อมูล (API + Entities)
│   ├── api/                  # กำหนด endpoints
│   ├── service/              # เชื่อมต่อ API ด้วย dio/retrofit
│   ├── employ.dart           # Entity: พนักงานบริษัท
│   └── out_source.dart       # Entity: พนักงาน outsource
├── utills/                   # ตัวช่วยทั่วไป เช่น enum, dio config
├── view/                     # หน้าจอ UI
│   ├── employee/             # หน้าจัดการพนักงานบริษัท
│   ├── outsource/            # หน้าจัดการพนักงาน outsource
│   └── viewmanage.dart       # รวมการจัดการหน้า (routing)
├── viewmodel/                # ViewModel (GetX Controller)
│   └── employee_model.dart
└── main.dart                 # runApp
```

---

## ✅ Features

- ✅ แสดงรายชื่อพนักงาน (แยก In-house / Outsource)
- ✅ เพิ่ม / แก้ไข / ลบ พนักงาน
- ✅ ดึงข้อมูลพนักงาน Outsource จาก API
- ✅ ใช้ GetX จัดการ state และ routing
- ✅ สร้าง ID ด้วย `uuid`

---

## 🛠 Tech Stack

- 💙 Flutter 3.x
- ⚡ [GetX](https://pub.dev/packages/get)
- 🌐 [Dio](https://pub.dev/packages/dio) + [Retrofit](https://pub.dev/packages/retrofit)
- 🆔 [uuid](https://pub.dev/packages/uuid)

---

## 🚀 เริ่มต้นใช้งาน

```bash
flutter pub get
flutter run
```

---