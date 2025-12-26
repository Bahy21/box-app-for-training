# 🔄 AppTextStyles Migration Guide

## What Changed?

`AppTextStyles` is now **theme-aware**! All text styles automatically use the correct colors for light/dark mode.

### Before (Static Fields):
```dart
static final TextStyle textStyle16 = TextStyle(...);
```

### After (Methods with Context):
```dart
static TextStyle textStyle16(BuildContext context) => TextStyle(...);
```

## Why This Change?

✅ **Auto-adapting text colors** - Text changes color with theme  
✅ **No manual color updates** - Colors built into styles  
✅ **Better dark mode** - Perfect text contrast in both themes  
✅ **Centralized** - Update once, applies everywhere  

---

## 📝 How to Migrate Your Code

You need to add `(context)` to all `AppTextStyles` usages.

### Migration Pattern

#### **Before:**
```dart
Text(
  'العنوان',
  style: AppTextStyles.textStyle16,  // ❌ Won't compile now
)
```

#### **After:**
```dart
Text(
  'العنوان',
  style: AppTextStyles.textStyle16(context),  // ✅ Now theme-aware!
)
```

---

## 🚀 Automated Migration

### Option 1: Find & Replace (Recommended)

Use your IDE's find & replace with regex:

**Find:** `AppTextStyles\.(\w+)`  
**Replace:** `AppTextStyles.$1(context)`

This will convert all usages in one go!

### Option 2: Manual Migration

Search for `AppTextStyles.` and add `(context)` after each style name.

---

## 📋 Common Replacements

| Before | After |
|--------|-------|
| `AppTextStyles.textStyle24` | `AppTextStyles.textStyle24(context)` |
| `AppTextStyles.textStyle20` | `AppTextStyles.textStyle20(context)` |
| `AppTextStyles.textStyle18` | `AppTextStyles.textStyle18(context)` |
| `AppTextStyles.textStyle16` | `AppTextStyles.textStyle16(context)` |
| `AppTextStyles.textStyle14(context)(context)` | `AppTextStyles.textStyle14(context)(context)(context)` |
| `AppTextStyles.textStyle12` | `AppTextStyles.textStyle12(context)` |
| `AppTextStyles.heading18Bold` | `AppTextStyles.heading18Bold(context)` |
| `AppTextStyles.text16Medium` | `AppTextStyles.text16Medium(context)` |
| `AppTextStyles.buttonText` | `AppTextStyles.buttonText(context)` |

### With .copyWith():
```dart
// Before
AppTextStyles.textStyle16.copyWith(fontWeight: FontWeight.bold)

// After
AppTextStyles.textStyle16(context).copyWith(fontWeight: FontWeight.bold)
```

---

## 💡 Examples

### Example 1: Simple Text
```dart
// Before
Text(
  'النص',
  style: AppTextStyles.textStyle16,
)

// After
Text(
  'النص',
  style: AppTextStyles.textStyle16(context),
)
```

### Example 2: Text with .copyWith()
```dart
// Before
Text(
  'العنوان',
  style: AppTextStyles.textStyle18.copyWith(
    fontWeight: FontWeight.bold,
    color: AppColors.blackColor,
  ),
)

// After
Text(
  'العنوان',
  style: AppTextStyles.textStyle18(context).copyWith(
    fontWeight: FontWeight.bold,
    // No need for color! Already theme-aware ✅
  ),
)
```

### Example 3: In Custom Widgets
```dart
class MyWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text('Title', style: AppTextStyles.heading18Bold(context)),
        Text('Body', style: AppTextStyles.textStyle14(context)(context)(context)),
        Text('Caption', style: AppTextStyles.caption(context)),
      ],
    );
  }
}
```

---

## 🔍 Finding All Usages

Run this command to see all files that need updating:
```bash
cd /Users/mac/StudioProjects/box
grep -r "AppTextStyles\." lib/features lib/core/widgets --include="*.dart" -l
```

Count of usages:
```bash
grep -r "AppTextStyles\." lib/features lib/core/widgets --include="*.dart" | wc -l
```

---

## ⚠️ Important Notes

1. **You MUST add `(context)` to ALL usages** - Code won't compile without it
2. **Inside build methods** - `context` is already available
3. **Outside build methods** - Pass context as parameter
4. **Static methods** - They need context parameter now

### If you get "Undefined name 'context'" error:

```dart
// ❌ Won't work - no context here
class MyClass {
  final style = AppTextStyles.textStyle16(context);  // ERROR!
}

// ✅ Works - context available in build
class MyWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Text(
      'text',
      style: AppTextStyles.textStyle16(context),  // ✅ OK!
    );
  }
}
```

---

## 🎯 Quick Migration Steps

1. **Open file using AppTextStyles**
2. **Find:** `AppTextStyles.textStyle16` (or any style name)
3. **Replace with:** `AppTextStyles.textStyle16(context)`
4. **Repeat for all styles**
5. **Test:** Toggle theme in settings to see colors change!

---

## 🎨 Result

After migration:
- ✅ All text automatically has correct color for theme
- ✅ Light mode: Black text
- ✅ Dark mode: White text
- ✅ Gray styles: Different shades for each theme
- ✅ Brand colors (orange): Same in both themes

**Your entire app text will be theme-aware!** 🌙☀️

---

## Need Help?

If you want me to migrate all files automatically, just let me know and I'll do a project-wide update! 😊





