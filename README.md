# لينك محلك — ملفات النشر على GitHub Pages

الملفات:
- index.html : المنصة كاملة (متوصلة بـ Supabase)
- logo.svg / favicon.svg : شعار المنصة وأيقونة التبويب
- setup.sql : سكريبت قاعدة البيانات (اتنفّذ بالفعل على المشروع، للرجوع إليه فقط)

الخطوات:
1) Supabase > Authentication > Users > Add user: اعمل حساب المدير بنفس الإيميل المكتوب في القواعد.
2) Supabase > Authentication > Providers > Email: اقفل "Allow new users to sign up".
3) ارفع الملفات كلها (بدون مجلد فوقها) على مستودع GitHub، وفعّل Settings > Pages (Deploy from branch).
4) افتح  الرابط/#/admin  وسجّل دخول وضيف أول محل.
