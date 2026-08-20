Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D9CBFC5DF85
	for <ath11k@archiver.kernel.org>; Thu, 20 Aug 2026 17:56:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=qGTHQM6yXTCq7iCsg06gYiI/zbE8XuFZp0lB3XIIEd8=; b=kAsXWaAr+cK6O07dwkaSkjGIHf
	WMQuJPiX7/QxQzbBoRPO7g88vOnc/SWh1AM3cfGk3uDsn3XWWRuRSNSQY2cJYG6VwpuHvcBzfxizi
	5uGDHVLPb2vXLFes2eLViZF/4nu8Np5q0rGYlgkm9pbP3LH7kC4kRbyFwHcSXzmzZcwna3xa1IENQ
	nmxP/fNuVRjgrtVp7jWVdoEaq0mWPytTl2xo/pDxIO3L93F35DQHnumsKzqe4uVxKT+nEKbRPbOze
	cmBnppOR+6CKiSbYDusRo96tAk5x1qeCH0hx9pzePw7OmNUpe0m9Mozo2dnj9/UYBA4u4/4697IeE
	gy16irpw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wx701-0000000C09d-3h1m;
	Thu, 20 Aug 2026 17:56:21 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wx6zz-0000000C08U-3FDN
	for ath11k@lists.infradead.org;
	Thu, 20 Aug 2026 17:56:21 +0000
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 67KHXRc83158808
	for <ath11k@lists.infradead.org>; Thu, 20 Aug 2026 17:56:19 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	qGTHQM6yXTCq7iCsg06gYiI/zbE8XuFZp0lB3XIIEd8=; b=VR/Eg9Ty9X+sPHRH
	vlDtUh/9W2Vgu/NdlrP37kJkqWRCh3jbrtERm2JMqAGCaiRsO4LMM1UXja60GjMW
	LmryfAy/XQz9bfqXFZxRLwdu6T8QpuNA5MoIOXniGw9rFU+pG/IA6BB9dKc6ITlQ
	L/vo5Jmev94R3NKBUOcBBckJ16UXNY9FkN2X5VvTYm1YVZZ5G5s3lOs7jOeyy9VO
	2P36Zel3sGU+x8KMxl6Uqp0AtuQ1TVK46hlEG94fY0/nROEMxNyuMdXjnpBvuAyE
	oIFu8dByausdXSafifshJobofGutW2HpsvmQSZUwa3dQK/8tXkhyD11lkI7Y8EGU
	5kSwZw==
Received: from mail-pg1-f197.google.com (mail-pg1-f197.google.com [209.85.215.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4g5ytca2eg-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <ath11k@lists.infradead.org>; Thu, 20 Aug 2026 17:56:19 +0000 (GMT)
Received: by mail-pg1-f197.google.com with SMTP id 41be03b00d2f7-c89704da8c7so218884a12.0
        for <ath11k@lists.infradead.org>; Thu, 20 Aug 2026 10:56:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1787248579; x=1787853379; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=qGTHQM6yXTCq7iCsg06gYiI/zbE8XuFZp0lB3XIIEd8=;
        b=BhofrPPV1BbFbIrLsoxfML3eWPv4wlaT6q3/qt7XE+tmPS3u5M06phmApZcm306SIp
         FFkn+k8WSAjXMThCLMQlkqpRcNorUT6O4se21eNw3ZSHVUUPgvu4s3OlfE1Opz6SmUOL
         Am3kf4fCx8rjIQ9zexFZGYa6W4LkAHBrpFZ8FWAlpMSMky98b79TfjTOqjHv6U7ph2XR
         3IdIkc7Qggr/C9L5EEZ7xBEGR9EjnX24IyJlvTAIlAQdGyTlj1n2kv3AfuhFIQxxvh2Z
         gEyWN23n1u1LIOm9DqyDcpQfOGk0lHbRw84BipXsVNy3BuxCTEybJlmDBYKeiKZ08boa
         knug==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787248579; x=1787853379;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=qGTHQM6yXTCq7iCsg06gYiI/zbE8XuFZp0lB3XIIEd8=;
        b=bDGTzMCtS1C7frkXVrLVbPbBm+bcmwHrNyNDpvMUkYXaQ46jBzWtsxT7aZUlO8JxWW
         JASJ/LrhLqDVa3W0/itz2lDdqf6I48E7MHGVXd3wtyLAOokmqjvs3KvYbWSC97hrlo45
         MDElubzTm7Qeu1kZJhci5B7mvdjrLDMGZDcIAwvAwT5pMpg8zr/0JXPc0Y5DP2DyWr/3
         Ow3cTiWTWJy/l6EmEdBRx40mKgbvEFRCtnQyhBZbua42v9KRI4fxFPEcRbJWTbZoG0+H
         L7uN1T5swXIXxOh1f+P/nUvQlYDEpYKqfBM7WkEw3OuABVUIXkyVkwDz9ko265wIIFuM
         yVFA==
X-Forwarded-Encrypted: i=1; AHgh+Rr/eOzlIGX+I68eFqu4jo8re56tEyLoVJ8SusJw5nAN0aATUKT2MV54hEcCdJ/sTQRsocwcvx0=@lists.infradead.org
X-Gm-Message-State: AOJu0YxJ6I78MwPyWI9H5/6ruWnmrv54zWgpS1/8mgUqBwrFQGnjWeFl
	Qw9BiCPzdmyaFbOlJH4jdawZcLLJVRY+2q4BrJJz6yje3IrP4sjxjJ9AbeUMd0WSELZGEZbio86
	By2DFTTQHWht6UmeTfzGypipV4b370scMauFKr1wfJ7Squ3CVhc8lX6/cU+7Remud
X-Gm-Gg: AR+sD13bk69Pn/pyPF9bEjxKjHelEESrtmhlh7WsgneBCQonyg1R0ytL70Xk9uhwJ/k
	FlHJI/CJTv+90sj1nzcfIoVZgryS4L52OdNAMw5S/nXtV7Dr2qyDn4ihY/5fC65mT9XcIJ/+R73
	eehe0EgyGdnLwCQmC4opx7VSYTl2Flkc5LWotcrGQ7dQ0AMrwwLSc+5/4FMkGk1D4M1Xu/v2fKW
	Vv0LHtzVqr1xjE7K/hMe+f9OxAgr66oa9rGGw2Zr2Qkk1r+96ggslbLZl+a7q9iKVWRJPBGhSzF
	3DuwxU5rzGZZuaTN3moqIvYzsBQjqRiKCszpNAUMfyVNf3okCHkdBSkAljN5vQbbp+ileH56AVR
	8Um8fuHPLYuvDnlMbCFjD8PTiXe2BrmXCd/qfLbYFjdqcOgQaYZST9E8=
X-Received: by 2002:a05:6a21:600c:b0:3b4:61f:1fec with SMTP id adf61e73a8af0-3cd2fd8e339mr427557637.2.1787248578405;
        Thu, 20 Aug 2026 10:56:18 -0700 (PDT)
X-Received: by 2002:a05:6a21:600c:b0:3b4:61f:1fec with SMTP id adf61e73a8af0-3cd2fd8e339mr427415637.2.1787248577835;
        Thu, 20 Aug 2026 10:56:17 -0700 (PDT)
Received: from [192.168.1.20] (163.sub-97-215-3.myvzw.com. [97.215.3.163])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-cc15523489fsm2134371a12.5.2026.08.20.10.56.15
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 20 Aug 2026 10:56:17 -0700 (PDT)
Message-ID: <1bdf4b7d-2f05-4ae3-8304-60697d2c849d@oss.qualcomm.com>
Date: Thu, 20 Aug 2026 10:56:14 -0700
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH wireless-next v3 2/8] wifi: mac80211: change public RX API
 to use link stations
To: Benjamin Berg <benjamin@sipsolutions.net>, linux-wireless@vger.kernel.org
Cc: Jeff Johnson <jjohnson@kernel.org>,
        Miri Korenblit <miriam.rachel.korenblit@intel.com>,
        Felix Fietkau <nbd@nbd.name>, Lorenzo Bianconi <lorenzo@kernel.org>,
        Ryder Lee <ryder.lee@mediatek.com>, Ping-Ke Shih <pkshih@realtek.com>,
        Johannes Berg <johannes@sipsolutions.net>, ath11k@lists.infradead.org,
        ath12k@lists.infradead.org, Benjamin Berg <benjamin.berg@intel.com>
References: <20260819135703.4072215-10-benjamin@sipsolutions.net>
 <20260819155703.af6d319e6b61.I4a2d45609e94b52654b10ec572e59a45d09c41f4@changeid>
From: Jeff Johnson <jeff.johnson@oss.qualcomm.com>
Content-Language: en-US
In-Reply-To: <20260819155703.af6d319e6b61.I4a2d45609e94b52654b10ec572e59a45d09c41f4@changeid>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=OqZ/DS/t c=1 sm=1 tr=0 ts=6a873fc3 cx=c_pps
 a=rz3CxIlbcmazkYymdCej/Q==:117 a=7QqFuFOOHQR3GLhHC5mhXA==:17
 a=IkcTkHD0fZMA:10 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22
 a=hwlI8agmJUGWGRcycR8A:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=bFCP_H2QrGi7Okbo017w:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODIwMDEzNCBTYWx0ZWRfX5/pHl3oJPa8L
 wtMAuyoAyrqbCflUBxpaP7A9rKH4a4wUWm9bTVEBl2FqqCqFWklv/hS9pn204YjigOfGQxyPgZy
 hgxh0KtJ3KSiJjbGWWKRzePiZrDNIe3ugMMYu3yqP38Ryr0tS0VMFGbbP+foin+Fwr8TyXfm54M
 Zo9Z9YKMer3NeupBHt4JINNshfWIl9P+6tSQKJVrEvukolbKwA0YG6CO1c6Q6gIWdBju3SZx2oU
 FWie2Xy3+KtgPHmwuhV6zpPgfrRXN+63opJ1ezXNDvxNAOonKkmky415YEVUnJoUFL7wm107Dy/
 ZxbylfiZmZ2haSpOwbvU7iOf5RClQ87TTyJoMw1bemTIGvMPCbW2uhdUVBt7nUYQjYEW2+0rkCX
 SuBk1n6Eq3MQ4O5WZgPjxTLm9RwKKGfwXAwU2VtMqBWL6bbcpswkroVnbVo+16x5ds0gIvKziSW
 74IbQyOZrzkt5ZTmRvw==
X-Proofpoint-ORIG-GUID: CXzrdqPdgqrqOIdiVItXklWV7IApUk-a
X-Proofpoint-GUID: CXzrdqPdgqrqOIdiVItXklWV7IApUk-a
X-Proofpoint-Spam-Info: AW1haW4tMjYwODIwMDEzNCBTYWx0ZWRfX+NmQHE/xHdxQ
 3mDit72Gaqn2ICj1wIcyOzAGExuyJG6kOBkwtx/4+In/7vmmuTOLtQesG0RIkkRyZjq2+mKn4L8
 NTVRPehc1dzDd8o7dsBy7RjKCdOjFXs=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-20_01,2026-08-20_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 spamscore=0 malwarescore=0 clxscore=1015 adultscore=0
 bulkscore=0 suspectscore=0 lowpriorityscore=0 priorityscore=1501
 impostorscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2608200134
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260820_105619_811547_11203235 
X-CRM114-Status: GOOD (  15.22  )
X-BeenThere: ath11k@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <ath11k.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/ath11k>,
 <mailto:ath11k-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/ath11k/>
List-Post: <mailto:ath11k@lists.infradead.org>
List-Help: <mailto:ath11k-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/ath11k>,
 <mailto:ath11k-request@lists.infradead.org?subject=subscribe>
Sender: "ath11k" <ath11k-bounces@lists.infradead.org>
Errors-To: ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org

On 8/19/2026 6:57 AM, Benjamin Berg wrote:
> diff --git a/drivers/net/wireless/mediatek/mt76/mac80211.c b/drivers/net/wireless/mediatek/mt76/mac80211.c
> index abbe65cbcd89..3da06a55913e 100644
> --- a/drivers/net/wireless/mediatek/mt76/mac80211.c
> +++ b/drivers/net/wireless/mediatek/mt76/mac80211.c
> @@ -1255,7 +1255,7 @@ EXPORT_SYMBOL(mt76_rx_signal);
>  static void
>  mt76_rx_convert(struct mt76_dev *dev, struct sk_buff *skb,
>  		struct ieee80211_hw **hw,
> -		struct ieee80211_sta **sta)
> +		struct ieee80211_link_sta **link_sta)
>  {
>  	struct ieee80211_rx_status *status = IEEE80211_SKB_RXCB(skb);
>  	struct ieee80211_hdr *hdr = mt76_skb_get_hdr(skb);
> @@ -1302,11 +1302,15 @@ mt76_rx_convert(struct mt76_dev *dev, struct sk_buff *skb,
>  	       sizeof(mstat.chain_signal));
>  
>  	if (mstat.wcid) {
> -		status->link_valid = mstat.wcid->link_valid;
> -		status->link_id = mstat.wcid->link_id;
> +		struct ieee80211_sta *sta = wcid_to_sta(mstat.wcid);
> +
> +		if (mstat.wcid->link_valid)
> +			*link_sta =
> +				rcu_dereference(sta->link[mstat.wcid->link_id]);
> +		else
> +			*link_sta = &sta->deflink;
>  	}
>  
> -	*sta = wcid_to_sta(mstat.wcid);
>  	*hw = mt76_phy_hw(dev, mstat.phy_idx);
>  }
>  
> @@ -1530,7 +1534,7 @@ mt76_check_sta(struct mt76_dev *dev, struct sk_buff *skb)
>  void mt76_rx_complete(struct mt76_dev *dev, struct sk_buff_head *frames,
>  		      struct napi_struct *napi)
>  {
> -	struct ieee80211_sta *sta;
> +	struct ieee80211_link_sta *link_sta;

My review agent says:
**Issue 1 — mt76: uninitialized `link_sta` pointer on the no-wcid path.**

In `mt76_rx_complete()`, `link_sta` is declared but not initialized to NULL.

Then `mt76_rx_convert()` is called, which only sets `*link_sta` when
`mstat.wcid != NULL`. If `mstat.wcid` is NULL, `link_sta` remains
uninitialized and is then passed to `ieee80211_rx_list()`. This is a use of
an uninitialized pointer. The fix is trivially `= NULL`.

>  	struct ieee80211_hw *hw;
>  	struct sk_buff *skb, *tmp;
>  	LIST_HEAD(list);
> @@ -1541,8 +1545,8 @@ void mt76_rx_complete(struct mt76_dev *dev, struct sk_buff_head *frames,
>  
>  		mt76_check_ccmp_pn(skb);
>  		skb_shinfo(skb)->frag_list = NULL;
> -		mt76_rx_convert(dev, skb, &hw, &sta);
> -		ieee80211_rx_list(hw, sta, skb, &list);
> +		mt76_rx_convert(dev, skb, &hw, &link_sta);
> +		ieee80211_rx_list(hw, link_sta, skb, &list);
>  
>  		/* subsequent amsdu frames */
>  		while (nskb) {
> @@ -1550,8 +1554,8 @@ void mt76_rx_complete(struct mt76_dev *dev, struct sk_buff_head *frames,
>  			nskb = nskb->next;
>  			skb->next = NULL;
>  
> -			mt76_rx_convert(dev, skb, &hw, &sta);
> -			ieee80211_rx_list(hw, sta, skb, &list);
> +			mt76_rx_convert(dev, skb, &hw, &link_sta);
> +			ieee80211_rx_list(hw, link_sta, skb, &list);
>  		}
>  	}
>  	spin_unlock(&dev->rx_lock);

