package demo;

import cn.hutool.core.util.CharsetUtil;
import cn.hutool.core.util.HexUtil;
import cn.hutool.core.util.StrUtil;
import cn.hutool.crypto.asymmetric.KeyType;
import cn.hutool.crypto.asymmetric.RSA;
import org.junit.Assert;

public class Test {
    public static void main(String[] args) {
        //RSA rsa = new RSA();
        //
        //System.out.println(rsa.getPrivateKeyBase64());
        //
        //System.out.println(rsa.getPublicKeyBase64());

        RSA rsa = new RSA(null, "MIGfMA0GCSqGSIb3DQEBAQUAA4GNADCBiQKBgQCKOdKuuqofqZpRV3DgO4iAntJjZZR2iVTUqRV4gooTMjZg+Zy/jZca0N/BGKhZHWIyXTVLZQaKd9wwcBE7su4dtRHGcOvh0f5EQsT33fh09rdqfBRonktDZpwpfG+tWB1fvk/5MF1xJyWPyf7PxKzegZc5WD9HHHvxXhFgGNZwgwIDAQAB");
        byte[] encrypt = rsa.encrypt(StrUtil.bytes("admin",CharsetUtil.CHARSET_ISO_8859_1), KeyType.PublicKey);
        System.out.println(HexUtil.encodeHexStr(encrypt));


        //RSA rsa = new RSA("MIICdgIBADANBgkqhkiG9w0BAQEFAASCAmAwggJcAgEAAoGBAIo50q66qh+pmlFXcOA7iICe0mNllHaJVNSpFXiCihMyNmD5nL+NlxrQ38EYqFkdYjJdNUtlBop33DBwETuy7h21EcZw6+HR/kRCxPfd+HT2t2p8FGieS0NmnCl8b61YHV++T/kwXXEnJY/J/s/ErN6BlzlYP0cce/FeEWAY1nCDAgMBAAECgYBX8KfAcJPRpxa9z3LJxjZ3FhRmFndY3tBwp844KFzuD5EXK1d1awCKl/7zG9vnLlGOF0zT1cdOiyk0S+g64gCpR/4Z2HGySL6frt+KgTOJkjYDq0MAHLNkmPvX8doXmp/5ET/ZIaQuc/xsejSf+6SXCQd0MAugiTL1EHQ0X1Ni8QJBAMf8a4hQ3KzTzHO4rW8HLpbyz7vHBIh1FMbVVD/Qf1eKGP+WDQtRg88FW0LYPkWFjdqD/LDzhkGwSGlbLvJXd+kCQQCw8QVHfkNInJYX7rgS5Nr9dz5SEFP+oZMDm4d6UIUEgFGGcvsGTwdYakXvxcwi8sQp20b4suer9Tsqy7aQxY2LAkBchLN+weIFdoqccrCRr+Hm5XgjKAQ52Oh+wAyU5TE0X2gHPfTU6qYu7Qx2VTIh2ZJxqCQL/O18kEA/tXZ3mO2ZAkEAq4ic45hGRih3YbAthzOSEVL+ebQWma2txjuK9UsGCT0Uy9DABneq2U39itsocWEERserYAKgkZXlzDE9RdAezQJAMsFpsvllZe6Asm/vWH1nz4Lk/1daRgFWq4G6jMS+eJxkmidmy1kbgBsymtatL0J9HBZm4S+wf2I9R+5qbYFtkg==", null);
        //byte[] aByte = HexUtil.decodeHex("iPjxXn8fdj4azKb7ArLGZmkGHFUbphM9SMM5cdDdWLmYNsV3UfmZLkvz59ZCINMBq+kTkhxRrGeUrovVFyoXjfua3ZAeR5oCpuFAcopLACYGiPT2ldcpd4mDCje3vWj+zP47uDV70VA5Z37KQLplew7zw5ddQigh/6En41MMV24=");
        //byte[] decrypt = rsa.decrypt(aByte, KeyType.PrivateKey);
        //System.out.println( StrUtil.str(decrypt, CharsetUtil.CHARSET_UTF_8));

//        RSA rsa = new RSA();
//
////获得私钥
//        rsa.getPrivateKey();
//        rsa.getPrivateKeyBase64();
////获得公钥
//        rsa.getPublicKey();
//        rsa.getPublicKeyBase64();
//
////公钥加密，私钥解密
//        byte[] encrypt = rsa.encrypt(StrUtil.bytes("我是一段测试aaaa", CharsetUtil.CHARSET_UTF_8), KeyType.PublicKey);
//        byte[] decrypt = rsa.decrypt(encrypt, KeyType.PrivateKey);
//        Assert.assertEquals("我是一段测试aaaa", StrUtil.str(decrypt, CharsetUtil.CHARSET_UTF_8));
//
////私钥加密，公钥解密
//        byte[] encrypt2 = rsa.encrypt(StrUtil.bytes("我是一段测试aaaa", CharsetUtil.CHARSET_UTF_8), KeyType.PrivateKey);
//        byte[] decrypt2 = rsa.decrypt(encrypt2, KeyType.PublicKey);
//        Assert.assertEquals("我是一段测试aaaa", StrUtil.str(decrypt2, CharsetUtil.CHARSET_UTF_8));
    }
}
