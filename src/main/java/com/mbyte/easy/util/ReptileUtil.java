package com.mbyte.easy.util;

import com.mbyte.easy.admin.entity.Zbj;
import com.mbyte.easy.admin.service.IZbjService;
import org.jsoup.Jsoup;
import org.jsoup.nodes.Document;
import org.jsoup.nodes.Element;
import org.jsoup.select.Elements;

import java.io.IOException;
import java.io.UnsupportedEncodingException;
import java.net.URLEncoder;
import java.util.regex.Matcher;
import java.util.regex.Pattern;

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
     * 字符串中提取数字
     */
    public void enNum(String url){
        String regEx = "[^0-9]";
        Pattern p = Pattern.compile(regEx);
        Matcher m = p.matcher(url);
        System.out.println( m.replaceAll("").trim());

    }

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
     * 爬取分页的url,规则
     */
    public Integer[] sePageUrl(String pageUrl) {
        Document doc = null;
        Integer[] arr = new Integer[3];
        try {
            doc = Jsoup.connect(pageUrl).get();
            Elements listDiv = doc.getElementsByAttributeValue("class","pagination");
            for (Element text: listDiv) {
                Elements a = text.getElementsByTag("a");
                Elements p = text.getElementsByTag("p");

                //String y = a.attr("href");
                String b = a.get(2).attr("href");                 //获取第二页的url
                String c = a.get(3).attr("href");                 //获取第三页的url
                System.out.println(b);
                System.out.println(c);

                String f = p.text();                                           //获取总页数
                String regEx = "[^0-9]";
                Pattern pattern = Pattern.compile(regEx);
                Matcher m = pattern.matcher(b);                                //只保留第二页的数字
                Matcher n = pattern.matcher(c);                                //只保留第三页的数字
                Matcher h = pattern.matcher(f);                                //只保留总页数的数字

                String d = m.replaceAll("").trim();               //只保留第二页的数字
                String e = n.replaceAll("").trim();               //只保留第三页的数字
                String w = h.replaceAll("").trim();               //只保留总页数的数字

                String z = d.substring(0,2);
                String q = e.substring(0,2);
                Integer i = Integer.valueOf(z);
                Integer j = Integer.valueOf(q);
                Integer g = j - i;

                Integer t = Integer.valueOf(w);
                arr[0] = i;
                arr[1] = t;
                arr[2] = g;


            }
        } catch (IOException e) {
            // TODO Auto-generated catch block
            e.printStackTrace();
        }
        //return g;
        return arr;
    }

    /**
     * 爬取详细信息
     * @param url
     */
    public void geInfo(String url, Long id, IZbjService zbjService) {

        Document doc = null;
        try {
            //获取html文件
            doc = Jsoup.connect(url).get();

            Elements listDiv = doc.getElementsByAttributeValue("class", "witkey-info");

                for (Element text : listDiv) {

                    Elements a = text.getElementsByTag("a");                       //公司名称
                    Elements s0 = text.getElementsByClass("city-icon");           //所在地区
                    Elements s1 = text.getElementsByClass("score");               //综合评分
                    Elements s2 = text.getElementsByAttribute("title");                 //所属类型
                    Elements s3 = text.getElementsByClass("bz-border");           //信誉度

                    Zbj zbj = new Zbj();

                    zbj.setFenleiId(id);

                    zbj.setName(a.get(1).text());

                    zbj.setAddr(s0.text());

                    String html = a.get(1).attr("href");
                    String ht = "https:";
                    String link = ht.concat(html);
                    zbj.setLink(link);

                    zbj.setType(s2.get(0).html());

                    zbj.setCredit(s3.text());

                    zbj.setScore(s1.get(0).html());

                    zbjService.save(zbj);

                }

        } catch (IOException e) {
            // TODO Auto-generated catch block
            e.printStackTrace();
        }


    }

}
