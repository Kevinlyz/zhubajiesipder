package com.mbyte.easy.util;

import com.mbyte.easy.admin.entity.TCompany;
import com.mbyte.easy.admin.entity.Vk;
import com.mbyte.easy.admin.entity.Zbj;
import com.mbyte.easy.admin.service.ITCompanyService;
import com.mbyte.easy.admin.service.IVkService;
import com.mbyte.easy.admin.service.IZbjService;
import org.apache.poi.ss.formula.functions.T;
import org.jsoup.Jsoup;
import org.jsoup.nodes.Document;
import org.jsoup.nodes.Element;
import org.jsoup.select.Elements;

import java.io.IOException;
import java.io.UnsupportedEncodingException;
import java.math.BigInteger;
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
public class VkReptileUtil {


    /**
     * 字符串中提取数字
     */
    public void enNum(String url) {
        String regEx = "[^0-9]";
        Pattern p = Pattern.compile(regEx);
        Matcher m = p.matcher(url);
        System.out.println(m.replaceAll("").trim());

    }

    /**
     * 将汉字转码
     *
     * @param tiao
     * @return
     */
    public static String urlEncodeURL(String tiao) {
        try {

            String result = URLEncoder.encode(tiao, "UTF-8");
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
            Elements listDiv = doc.getElementsByAttributeValue("class", "page pt_15 pb_15");
            for (Element text : listDiv) {
                Elements a = text.getElementsByTag("a");
                Elements span = text.getElementsByTag("span");

                //  String b = a.get(2).attr("href");                 //获取第二页的url
                //  String c = a.get(3).attr("href");                 //获取第三页的url

                String f = span.text();                                           //获取总页数
                String regEx = "[^0-9]";
                Pattern pattern = Pattern.compile(regEx);
                //  Matcher m = pattern.matcher(b);                                //只保留第二页的数字
                //  Matcher n = pattern.matcher(c);                                //只保留第三页的数字
                Matcher h = pattern.matcher(f);                                //只保留总页数的数字

                //   String d = m.replaceAll("").trim();               //只保留第二页的数字
                //  String e = n.replaceAll("").trim();               //只保留第三页的数字
                String w = h.replaceAll("").trim();               //只保留总页数的数字

                String w1 = w.substring(1);

                Integer t = Integer.valueOf(w1); //总页数转为Integer类型
                arr[1] = t;  //将总页数放到数组arr里

                //  if(t > 1) {  //如果总页数大于1


                //  Integer i = Integer.valueOf(d);
                //  Integer j = Integer.valueOf(e);
                //  arr[0] = i; //存储第二页url上的数字 2
                //   arr[2] = j; //存储第三页url上的数字 3
                //   }

            }
        } catch (IOException e) {
            // TODO Auto-generated catch block
            e.printStackTrace();
        }
        return arr;
    }

    /**
     * 爬取详细信息
     *
     * @param url
     */
    public void geInfo(String url, Long id, IVkService vkService) {
        Document doc = null;
        try {
            //获取html文件
            doc = Jsoup.connect(url).get();
            String aaa = doc.getElementsByAttributeValue("id", "textfield").val(); //获取查询类别
            System.out.println("返回type==========" + aaa);
            Elements listDiv = doc.getElementsByAttributeValue("class", "w_servicslist_box_txt");
            //Elements listDiv1 = doc.getElementsByAttributeValue("class", "w_servicslist_box_txt");
            for (Element text : listDiv) {
                Elements a = text.getElementsByTag("a");                            //title
                Elements s0 = text.getElementsByClass("red");                     //price
                Elements s11 = text.getElementsByAttributeValue("class", "f_l");  //num province
                Elements s12 = text.getElementsByAttributeValue("class", "f_r");  //score

                String regEx = "[^0-9.]";
                Pattern pattern = Pattern.compile(regEx);
                Matcher m = pattern.matcher(s11.get(0).text());
                String num = m.replaceAll("").trim();
                Matcher n = pattern.matcher(s12.get(0).text());
                String score = n.replaceAll("").trim();
                if (s11.get(1).text().indexOf("河北省") > -1) {
                    Vk vk = new Vk();
                    vk.setSortId(id);
                    vk.setTitle(a.get(0).text());
                    vk.setPrice(s0.text());
                    vk.setNum(Integer.parseInt(num));
                    vk.setProvince(s11.get(1).text());
                    vk.setScore(score + "%");
                    vk.setCompany(a.get(1).text());
                    vk.setType(aaa);
                    String html = a.get(1).attr("href");
                    vk.setLink(html);

                    /*获取 公司/个人/工作室 类型*/
                    Document doc1 = null;
                    doc1 = Jsoup.connect(html).get();
                    Elements list1 = doc1.getElementsByClass("iico");

                    String companyType = list1.get(2).text();

                    vk.setCompanyType(companyType);
                    // System.out.println("======dddddd=======");
                    //System.out.println(companyType);

                    /*获取类型*/
                    vkService.save(vk);
                }
            }
        } catch (IOException e) {
            // TODO Auto-generated catch block
            e.printStackTrace();
        }
    }

    /**
     * @Author wangxudong
     * @Description: 生成规则
     * @Date:
     **/
    public void vkGenerateInfo(String url, Long id, ITCompanyService tCompanyService) {
        Document doc = null;
        try {
            //获取html文件
            doc = Jsoup.connect(url).get();

            String aaa = doc.getElementsByAttributeValue("id", "textfield").val(); //获取查询类别

            System.out.println("返回type==========" + aaa);

            Elements listDiv = doc.getElementsByAttributeValue("class", "w_servicslist_box_txt");

            for (Element text : listDiv) {
                Elements a = text.getElementsByTag("a");                            //title
                Elements s0 = text.getElementsByClass("red");                     //price
                Elements s11 = text.getElementsByAttributeValue("class", "f_l");  //num province
                Elements s12 = text.getElementsByAttributeValue("class", "f_r");  //score

                String regEx = "[^0-9.]";
                Pattern pattern = Pattern.compile(regEx);
                Matcher m = pattern.matcher(s11.get(0).text());

                String num = m.replaceAll("").trim();

                Matcher n = pattern.matcher(s12.get(0).text());
                String score = n.replaceAll("").trim();

                if (s11.get(1).text().indexOf("河北省") > -1) {
                    String html = a.get(1).attr("href");
                    Document doc1 = null;
                    doc1 = Jsoup.connect(html).get();
                    Elements list1 = doc1.getElementsByClass("iico");
                    String companyType = list1.get(2).text();
                    if (companyType.equals("企业")) {
                        TCompany tCompany = new TCompany();
                        tCompany.setCompanyName(a.get(1).text());
                        tCompany.setCompanyStates(1);
                        tCompany.setCompanyUrl(html);
                        if (score.equals("")) {
                            score = 0 + "";
                        }
                        tCompany.setScore(String.valueOf(Math.round(Float.parseFloat(score) * 10) / 10));
                        tCompany.setCredit(0);
                        tCompany.setNum(Integer.parseInt(num));
                        tCompanyService.selectByUrl(html);
                        if (tCompanyService.selectByUrl(html) == null) {
                            tCompanyService.save(tCompany);
                        }
                    }
                }
            }
        } catch (IOException e) {
            // TODO Auto-generated catch block
            e.printStackTrace();
        }


    }

}
