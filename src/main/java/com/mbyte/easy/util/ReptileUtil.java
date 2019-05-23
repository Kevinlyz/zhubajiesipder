package com.mbyte.easy.util;

import com.mbyte.easy.admin.entity.Zbj;
import com.mbyte.easy.admin.service.IZbjService;
import org.jsoup.*;
import org.jsoup.nodes.*;
import org.jsoup.select.Elements;
import java.io.IOException;
import java.io.UnsupportedEncodingException;
import java.net.URLEncoder;

/**
 * 〈p〉
 * 爬虫
 * 〈/p〉
 *
 * @author 刘雪奇
 * @create 2019/5/18
 * @since 1.0.0
 */
public class ReptileUtil {

    /**
     * 将汉字转码
     * @param tiao
     * @return
     */
    public static String urlEncodeURL(String tiao) {
        try {

            String result = URLEncoder.encode( tiao, "UTF-8");
            result = result.replaceAll("%3A", ":").replaceAll("%2F", "/").replaceAll("\\+", "%20");//+实际上是 空格 url encode而来
            return result;
        } catch (UnsupportedEncodingException e) {
            e.printStackTrace();
        }
        return null;
    }

    /**
     * 爬取方法
     * @param url
     * @param tiaojian1
     * @param zbjService
     */
    public void getInfo(String url,String tiaojian1,IZbjService zbjService) {


        Document doc = null;
        try {
            //获取html文件
            doc = Jsoup.connect(url).get();
            //获取总页数
            //int sumpages = Integer.parseInt(doc.select("div[class=pagination]").select("p[class=pagination-total]").text().replaceAll("\\D",""));

            //for(int i = 1; i < sumpages; i++) {
            Elements listDiv = doc.getElementsByAttributeValue("class", "witkey-info");

            //if(listDiv != null){
            for (Element text : listDiv) {

                Elements a = text.getElementsByTag("a");                       //公司名称
                Elements s0 = text.getElementsByClass("city-icon");           //所在地区
                Elements s1 = text.getElementsByClass("score");               //综合评分
                Elements s2 = text.getElementsByAttribute("title");                 //所属类型
                Elements s3 = text.getElementsByClass("bz-border");           //信誉度

                Zbj zbj = new Zbj();

                zbj.setFenlei(tiaojian1);

                zbj.setName(a.get(1).text());

                zbj.setAddr(s0.text());

                String html = a.get(1).attr("href");
                String ht = "https:";
                String link = ht.concat(html);
                zbj.setLink(link);

                zbj.setType(s2.get(0).html());

                zbj.setCredit(s3.text());

                zbj.setScore(s1.get(0).html());

                System.out.println(zbj);
                zbjService.save(zbj);

            }


            //}
        } catch (IOException e) {
            // TODO Auto-generated catch block
            e.printStackTrace();
        }


    }

}
