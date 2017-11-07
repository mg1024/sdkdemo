# 代码混淆压缩比，在0~7之间，默认为5,一般不下需要修改
-optimizationpasses 5

# 混淆时不使用大小写混合，混淆后的类名为小写
# windows下的同学还是加入这个选项吧(windows大小写不敏感)
-dontusemixedcaseclassnames

# 指定不去忽略非公共的库的类
# 默认跳过，有些情况下编写的代码与类库中的类在同一个包下，并且持有包中内容的引用，此时就需要加入此条声明
-dontskipnonpubliclibraryclasses

# 指定不去忽略非公共的库的类的成员
-dontskipnonpubliclibraryclassmembers

# 不做预检验，preverify是proguard的四个步骤之一
# Android不需要preverify，去掉这一步可以加快混淆速度
-dontpreverify

# 有了verbose这句话，混淆后就会生成映射文件
# 包含有类名->混淆后类名的映射关系
# 然后使用printmapping指定映射文件的名称
-verbose
-printmapping priguardMapping.txt

# 指定混淆时采用的算法，后面的参数是一个过滤器
# 这个过滤器是谷歌推荐的算法，一般不改变
-optimizations !code/simplification/artithmetic,!field/*,!class/merging/*

# 保护代码中的Annotation不被混淆
# 这在JSON实体映射时非常重要，比如fastJson
-keepattributes *Annotation*

# 避免混淆泛型
# 这在JSON实体映射时非常重要，比如fastJson
-keepattributes Signature

# 抛出异常时保留代码行号
-keepattributes SourceFile,LineNumberTable

# For R
-keep class **.R$* {*;}

# For Serializable
-keep class * implements java.io.Serializable {*;}

# For Parcelable
-keep class * implements android.os.Parcelable {*;}

# For Annotation
-keep class * extends java.lang.annotation.Annotation {*;}

# For FastJson
-dontwarn com.alibaba.fastjson.**
-keep class com.alibaba.fastjson.** {*;}

# For ButterKnife
-keep class butterknife.** { *; }
-dontwarn butterknife.internal.**
-keep class **$$ViewBinder { *; }

-keepclasseswithmembernames class * {
    @butterknife.* <fields>;
}

-keepclasseswithmembernames class * {
    @butterknife.* <methods>;
}

# For UmengTools
-dontwarn com.umeng.**
-keep class com.umeng.** {*;}

# For Android Support
-dontwarn android.support.**

# For Apache Commons
-dontwarn org.apache.commons.**

#For debug
-renamesourcefileattribute unknown
-keepattributes SourceFile,LineNumberTable

#for http
-keep class android.net.http.** { *; }
-dontwarn android.net.http.**
-dontnote android.net.http.*
-dontnote org.apache.commons.codec.**
-dontnote org.apache.http.**
-keep class org.apache.http.** { *; }
-dontwarn org.apache.http.**

-dontwarn org.slf4j.**

-keepclasseswithmembers class ** {
    public static void registerRouter();
}

-keepattributes SourceFile,LineNumberTable
-keep class com.parse.*{ *; }
-dontwarn com.parse.**
-dontwarn com.squareup.picasso.**
-keepclasseswithmembernames class * {
    native <methods>;
}