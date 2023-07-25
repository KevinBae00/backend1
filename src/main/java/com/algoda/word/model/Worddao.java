//
// Source code recreated from a .class file by IntelliJ IDEA
// (powered by FernFlower decompiler)
//

package com.algoda.word.model;

import java.util.List;
import java.util.Map;

public interface Worddao {
    List<Worddto> selectListPage(Map<String, Object> var1);

    int selectCount(Map<String, Object> var1);

    void close();

    int insertMyvoc(String var1);
}
