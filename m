Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8A0F9C5516D
	for <ath11k@archiver.kernel.org>; Fri, 31 Jul 2026 08:48:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=FKqhQPZyBwZ4oy7X/APXLY0ykWXFwIpRNGZDu5Vj7iw=; b=Zw/dcyRc+D0Nwj4INmpR0AC28Q
	eoegNqvr9Zi+Hj+nGrAFycerfOrqcZJ/Lie2VH1wnn6wd4mrDvFG9fllCx6ciEUQ69y+6dpzriq1m
	xPeNWi+Cck6Q8vqGebagL8NzdMzRuuPV8x42biLVYILFEZwHbEPcuZ8lwsr0QnsuVcZ3aqjN0uqzG
	fPFxHWkrM6S+fYOV6Fa/q3K2C7e5eLmGv5RXtvwdMS7N/DCa8K1TkTWeVltrBCXoXbHULwIkCAAp3
	XPSJAF0etARPQy4XsbRr/ygUVbO1pTVW91P1QwQsfXALjuxup0OSrM0QRLKoRJvonw72rtopeyRdB
	3+efgGBw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wpiv4-0000000C6cK-3v1V;
	Fri, 31 Jul 2026 08:48:42 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wpiuz-0000000C6Zt-0YPB
	for ath11k@lists.infradead.org;
	Fri, 31 Jul 2026 08:48:41 +0000
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66V8caqF484360
	for <ath11k@lists.infradead.org>; Fri, 31 Jul 2026 08:48:36 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	FKqhQPZyBwZ4oy7X/APXLY0ykWXFwIpRNGZDu5Vj7iw=; b=ZFER2MqW0V669Z9o
	0G/Uf8oyXbDt2XRwQ6DhHWatjPP1fATBHeCrNppbMT1uubhNyM9cD4k5PU1bsA4g
	XwAPBDhFngkGkyDUTepJPPFia5B3PtvJh02WTV1FpYeRORGH/CGlOyJnvgHPpjbx
	5Hvmk3xtc2vXLlmVvxJL8jTOogP1ND++p+npcLSAkztisrP2yhnowvMWNa5ajwin
	24xSqUjpDDS+nfyBr2fTD7+rD065yjD46yP/MOstiG9GWqki6MTKgQbOsS84wPOc
	nlLo6LQpLxAnNl6cKx4qHjkrHUoUqs4OLW484sHESy0NTvus071C0vd0EEdWyU4K
	oSTntw==
Received: from mail-pl1-f199.google.com (mail-pl1-f199.google.com [209.85.214.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4frrc8g1df-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <ath11k@lists.infradead.org>; Fri, 31 Jul 2026 08:48:36 +0000 (GMT)
Received: by mail-pl1-f199.google.com with SMTP id d9443c01a7336-2cfc52ddc55so9179045ad.3
        for <ath11k@lists.infradead.org>; Fri, 31 Jul 2026 01:48:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1785487716; x=1786092516; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=FKqhQPZyBwZ4oy7X/APXLY0ykWXFwIpRNGZDu5Vj7iw=;
        b=UiDAoMIDd3TkrftMkrBdHRnmJbu+pQMo3YUNectvqzsg8Bsjx3nWr9rb03D+MYTLJQ
         nphjEWg69/557Dh3MqZYzUZ/RODq/VUeUH+QrbLi424VGIBgBmqnjK9pHUUVEvC2IBNJ
         z2zrzF4uA4Fh77695DqtMiikYUesOpkcSJwY21tJVw5yJFqAEdx5FgOQFcrjRDHiaJYW
         uhYkx+1BC+ByRpRaRxFjaOvlCj6R202rM3/UrOXFLERJEfGA7SsDDvJdg4ug+mx4iR0P
         JUQI6bqKQdyKUVRGWXZrxvmf5VvVV4Bvs/7soIAa9DFRtIP182nEsxk/x9SrRqJkvCC+
         CGyA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785487716; x=1786092516;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=FKqhQPZyBwZ4oy7X/APXLY0ykWXFwIpRNGZDu5Vj7iw=;
        b=eXwUPaPBYJcqrNZxbkTZtzBWGYFX7TBfLX54xd/BI0eyb/SFkkUv/6AXSbPm5KBK7S
         Fiquvrtj0tgEW/qW1kXIMWu3IhDAT5TyOWuZ+N/7x5fjlbGLqIuQCjnCM96E90kzrl1G
         rShEGWh4p+oBnUUJxNaielTiU9Myad8Em/Nqj5L2YciUzBoovpirLFf6ZGYodsRU16Gf
         0+CUqpz47SdR0V5t9SEOyayexFhW4QJ2GX7WN/yc0yEbJ1VTZQRoURLi4FGq2M9/1IcD
         fhlniIo+QV/8DawtK5vFlu//LKZaQjmeRk4UoUfyECsXxBXm6+P5cWABULmF0hHMy+9V
         fogA==
X-Gm-Message-State: AOJu0YzBXa6KciUcy9HjuOjuGAo/aeQ5PFP1oKA1GvZak1tY4A/fE+CI
	fvI/tUrlhvsPsHwPOW2M0A/9CbGDh1YFUD5wExCjB6pPktlaFw/K/g4QrUcV38VDT7yhxA13BoK
	Sf//sQH4eark7Svs7XBGOOv2j87Igc7UhwQ3iIy7fTU0C7ncyo0zIE6wqs8EFfHJy
X-Gm-Gg: AR+sD10kyZ4jQOVVrKRU5z+mJARhD37nMLOh+1wE9WMmv5deddQoUqjmYi9zyh3WliF
	llJixKbIHEPpMes4G7gL7Q57yRw00fXs9/ED6Ayi36apuqKkP91Pxz9k4foYoRoEub+NclIzQ/U
	aLY4meFs+Cip2g1NL5pYVlBM12yDmni2BAwlwKX1vRDWg8lHH+EI+P4oEnTVB+aQTB21OEduZNy
	FXbT48cZhnRRk1IZoHJ2O4F5Do7pnvWZW2O4Up0EFFcEqsPKJfeydtjeiFLioeomKAPQPtFeR63
	MUN2wNnrfT3lEJ28EwD+B7fSV79/frbRhaL69EgWQlVTruNMOXQ7yVeWQSLnyVEX+eLeSB6kobv
	+Ju9Nyyp+2WGa6SOypf0TlXQdlYpeXF2brqAObB2mr3d0G3ygiQktVs1QBIYCnRBcpcoC1wri5w
	==
X-Received: by 2002:a17:903:191:b0:2ca:bf8e:35fe with SMTP id d9443c01a7336-2d046da5e90mr12155955ad.16.1785487715799;
        Fri, 31 Jul 2026 01:48:35 -0700 (PDT)
X-Received: by 2002:a17:903:191:b0:2ca:bf8e:35fe with SMTP id d9443c01a7336-2d046da5e90mr12155795ad.16.1785487715368;
        Fri, 31 Jul 2026 01:48:35 -0700 (PDT)
Received: from [10.133.33.123] (tpe-colo-wan-fw-bordernet.qualcomm.com. [103.229.16.4])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2d04b12202bsm2603905ad.66.2026.07.31.01.48.33
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 31 Jul 2026 01:48:35 -0700 (PDT)
Message-ID: <87f02c36-6257-4713-8d39-370f575ecd1a@oss.qualcomm.com>
Date: Fri, 31 Jul 2026 16:48:31 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 4/5] wifi: ath12k: fix MLO beacon handling using per-link
 addressing
To: Jose Ignacio Tornos Martinez <jtornosm@redhat.com>, jjohnson@kernel.org
Cc: ath11k@lists.infradead.org, ath12k@lists.infradead.org,
        linux-wireless@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20260727162748.963275-1-jtornosm@redhat.com>
 <20260727162748.963275-5-jtornosm@redhat.com>
From: Baochen Qiang <baochen.qiang@oss.qualcomm.com>
Content-Language: en-US
In-Reply-To: <20260727162748.963275-5-jtornosm@redhat.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: GBwk9agbigIZ8lbj0ncgkaKYcMoCXtgY
X-Proofpoint-ORIG-GUID: GBwk9agbigIZ8lbj0ncgkaKYcMoCXtgY
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzMxMDA2MyBTYWx0ZWRfXw8Hpln9vwk44
 6LOy3GSg4CHTBNnSGb5DzqVvpvmwG5YrWEVz6bm07pdook9BACGhhc7XSZ/TqLsFsHr6/wbJkOI
 5IqzKycN7Vx4r0d9DKljlbi1jICygyzCgRkdSECAVSPW0FY6YLc8LLCQMf+ob4vRAQA1WHJ4M9i
 dYOooqM8ywAtTbiDtRWGADYZI3hqIobICbdCG9KgENM+gx1V7YcCJEphbBJGyVEi4zxYazD4y+J
 KdibjmXHdteE1lB4Rf+ag44/TVXZFVnc8VaL02Vw2ippJZkyA/1jdyhSjiWqoJtk+odgEBE0SZS
 0knaIR6U9Q2fN4e8/wdUkep9/c8b5/eEp//lnDjOtvzx4uOLDWYkGxFfh8pxb16hJ2ITOXLfAw8
 YibY8X+sL/+nQtthQuoJ1LbsPhHsgFcOBcnfil6MH9lxBO3W0nXSJlP0YALbZLaM1+EErdT7Quo
 zJFDqjD4MEHOYkpQ0Ng==
X-Authority-Analysis: v=2.4 cv=EcL4hvmC c=1 sm=1 tr=0 ts=6a6c6164 cx=c_pps
 a=JL+w9abYAAE89/QcEU+0QA==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22
 a=20KFwNOVAAAA:8 a=wMn7BGEeBF2Z8DAmW_4A:9 a=QEXdDO2ut3YA:10
 a=324X-CrmTo6CU4MGRt3R:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzMxMDA2MyBTYWx0ZWRfX+6J5DZhC00Zd
 FMNfA6aEIfX6NfFKQS5qIFg7R3yckCtzpt8Mp9hkX0CYJGNQO7RC+ixsXOrp8ZzNOlOp45yL/gx
 C2f4akqH3r56bACq7oW1sACwIeDmn9I=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-31_03,2026-07-30_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 impostorscore=0 malwarescore=0 phishscore=0 priorityscore=1501
 adultscore=0 lowpriorityscore=0 suspectscore=0 clxscore=1015 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607310063
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260731_014837_183198_CFAD84D4 
X-CRM114-Status: GOOD (  27.30  )
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



On 7/28/2026 12:27 AM, Jose Ignacio Tornos Martinez wrote:
> ath12k_mac_handle_beacon_iter() uses ahvif->deflink for both BSSID
> matching and connection_loss_work cancellation. In MLO, deflink is
> only the first link created for the MLD VIF and does not represent
> the other links. This causes two problems:
> 
> 1. Beacon BSSID matching only checks deflink's BSS config
>    (vif->bss_conf.bssid), so beacons received on non-deflink links
>    never match and never cancel connection_loss_work.
> 
> 2. Only deflink's connection_loss_work is cancelled, leaving
>    non-deflink connection_loss_work timers running even when beacons
>    are being received normally.
> 
> When the firmware reports a beacon miss event on any link,
> ath12k_mac_handle_beacon_miss() queues connection_loss_work on that
> link with a 3-second timeout. If a beacon is received before the
> timeout, ath12k_mac_handle_beacon_iter() should cancel it. But the
> deflink-only handling means that for non-deflink MLO links, beacons
> are never matched and connection_loss_work is never cancelled through
> this path.
> 
> Fix by handling non-MLO and MLO cases separately. For non-MLO, keep
> the existing deflink behavior. For MLO, iterate all active links to
> match the beacon BSSID against each link's BSS config. When a match
> is found, cancel connection_loss_work on all links because the
> work callback calls per-VIF ieee80211_connection_loss() regardless
> of which link queued it.

is it legitimate to change mac80211 to support per-link connection loss? if not, better to
move connection_loss_work from ath12k_link_vif to ath12k_vif ?

> 
> Tested on WCN7850 with MLO (Wi-Fi 7).
> 
> Signed-off-by: Jose Ignacio Tornos Martinez <jtornosm@redhat.com>
> ---
>  drivers/net/wireless/ath/ath12k/mac.c | 36 ++++++++++++++++++++++++---
>  1 file changed, 32 insertions(+), 4 deletions(-)
> 
> diff --git a/drivers/net/wireless/ath/ath12k/mac.c b/drivers/net/wireless/ath/ath12k/mac.c
> index e36a37852fab..ebc35636b4ef 100644
> --- a/drivers/net/wireless/ath/ath12k/mac.c
> +++ b/drivers/net/wireless/ath/ath12k/mac.c
> @@ -1946,15 +1946,43 @@ static void ath12k_mac_handle_beacon_iter(void *data, u8 *mac,
>  	struct sk_buff *skb = data;
>  	struct ieee80211_mgmt *mgmt = (void *)skb->data;
>  	struct ath12k_vif *ahvif = ath12k_vif_to_ahvif(vif);
> -	struct ath12k_link_vif *arvif = &ahvif->deflink;
> +	struct ieee80211_bss_conf *link_conf;
> +	struct ath12k_link_vif *arvif;
> +	unsigned long links;
> +	u8 link_id;
>  
> -	if (vif->type != NL80211_IFTYPE_STATION || !arvif->is_created)
> +	if (vif->type != NL80211_IFTYPE_STATION)
>  		return;
>  
> -	if (!ether_addr_equal(mgmt->bssid, vif->bss_conf.bssid))
> +	if (!ieee80211_vif_is_mld(vif)) {
> +		arvif = &ahvif->deflink;
> +		if (arvif->is_created &&
> +		    ether_addr_equal(mgmt->bssid, vif->bss_conf.bssid))
> +			cancel_delayed_work(&arvif->connection_loss_work);
>  		return;
> +	}
>  
> -	cancel_delayed_work(&arvif->connection_loss_work);
> +	/* For MLO, each link has a different AP BSSID. Check the beacon
> +	 * against all link BSS configs. If any matches, cancel
> +	 * connection_loss_work on all links since it calls per-VIF
> +	 * ieee80211_connection_loss() regardless of which link queued it.
> +	 */
> +	links = ahvif->links_map;
> +	for_each_set_bit(link_id, &links, IEEE80211_MLD_MAX_NUM_LINKS) {
> +		link_conf = rcu_dereference(vif->link_conf[link_id]);
> +		if (link_conf &&
> +		    ether_addr_equal(mgmt->bssid, link_conf->bssid))
> +			goto found;
> +	}
> +
> +	return;
> +
> +found:
> +	for_each_set_bit(link_id, &links, IEEE80211_MLD_MAX_NUM_LINKS) {
> +		arvif = rcu_dereference(ahvif->link[link_id]);
> +		if (arvif && arvif->is_created)
> +			cancel_delayed_work(&arvif->connection_loss_work);
> +	}
>  }
>  
>  void ath12k_mac_handle_beacon(struct ath12k *ar, struct sk_buff *skb)


