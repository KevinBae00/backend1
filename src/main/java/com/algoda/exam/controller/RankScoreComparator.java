//
// Source code recreated from a .class file by IntelliJ IDEA
// (powered by FernFlower decompiler)
//

package com.algoda.exam.controller;

import java.util.Comparator;

class RankScoreComparator implements Comparator<Rankdto> {
    RankScoreComparator() {
    }

    public int compare(Rankdto f1, Rankdto f2) {
        if (Float.compare(f1.getScore(), f2.getScore()) > 0) {
            return 1;
        } else {
            return Float.compare(f1.getScore(), f2.getScore()) < 0 ? -1 : 0;
        }
    }
}
