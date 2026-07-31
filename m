Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8F108C55167
	for <ath11k@archiver.kernel.org>; Fri, 31 Jul 2026 03:46:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=9b8YMivGLuRGJ7njNNRJjG4dhOdOjQ2LVlgcWgR8Vd8=; b=vd1g9TC5Cel+z/E8LaiytSa3l0
	f4kEdL097gZ48CUp9GQ++7rPRErqCs2ix5e/npB7lNfEoRs+KiMMFmN1SbUcjyU/cqjnMvx72rZhm
	CtUhM6d07BPaPq5Wdw6QxQ02pGsT3nliCezvJUA7VbTdNVfxi+3Qb/N+3WZ2p7AJkGVLIQlZYMkNg
	A9+k0yLcoSTDatGZVwAXE+j/wSNQYXZpfZrRSPFD1qn+TJYU8kmJQgrg+bLIlNVUba1o5KaMvBNjF
	52/0I4sb509SSS7FlJ99PNOpB9OHS6DKn2E8ZMR5ttA3a1yzdUgP+NhEXoeuPerb/SCIBW5QCTcV8
	ccMOi5dQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wpeCt-0000000BhuD-2OGq;
	Fri, 31 Jul 2026 03:46:47 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wpeCr-0000000Bhtn-0pU2
	for ath11k@lists.infradead.org;
	Fri, 31 Jul 2026 03:46:46 +0000
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66V3AZc32249080
	for <ath11k@lists.infradead.org>; Fri, 31 Jul 2026 03:46:44 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	9b8YMivGLuRGJ7njNNRJjG4dhOdOjQ2LVlgcWgR8Vd8=; b=KL+tviAtk9a3zcxs
	d5uGNorZlf45tdkfa2wuB3bH7BBWAT6GPwbFUsL9ISBOjYPjiXO9K76h1b9Dnl0x
	N4b8omMT7XaS2vMGmsmQAMwqJy7fcbVip7tViutrrxxS6io3MMkFdXi0Y/OSs73i
	/iyuUMZI8ToLcRFwkPnltOBD69jNcRfFeTPaJqrcRHTuQr1x2TKmy2o86Ul1SmeP
	2vDdS1zThSnqYeyVvaqxRyNnQX5ufXPHAh6RcfXLbDsi6QhqFTwrBL8vBUtroXjc
	vYfp2Gct6Sfpsn0Qhbv8jeZaASIp9nZbqWjOJ9AeDH8PQHyPnlxQy53IsZAKwI4e
	E4C0uQ==
Received: from mail-pl1-f198.google.com (mail-pl1-f198.google.com [209.85.214.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4frkjpg3fn-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <ath11k@lists.infradead.org>; Fri, 31 Jul 2026 03:46:44 +0000 (GMT)
Received: by mail-pl1-f198.google.com with SMTP id d9443c01a7336-2ccb6f6a3f4so6120315ad.1
        for <ath11k@lists.infradead.org>; Thu, 30 Jul 2026 20:46:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1785469603; x=1786074403; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=9b8YMivGLuRGJ7njNNRJjG4dhOdOjQ2LVlgcWgR8Vd8=;
        b=B4Kfm2Myj/mzS9wShiDmcbc7vhfZJqIu/UbI5+YxMkP8D0H/nctUvr7bPw9sTl2hQG
         gDTxVnHn/s6Ok9zWSagh1ZKIiumGkkslcQgxdyGuo+jrafJ3vovP6ekH/1rDAT3u00jP
         pH1Mempcm6Bl/vBj7W0RUN+fCYJ+P6nqXQYrJTZR5UlP79MqXAbDix6rkaDwgUAp/Lj1
         fctuVyAIsxV1YSc0nXo3wcqLkjcOEzA//QDBgIGXlUGUGj84foAuq5x3kdyecmLQUZpI
         HrpUgrEX0KE6kwu1G8wi0HEYZhZskpfdO8scqkvvhIJrZM+UEMIEfUPm14Ie8qhNTgiV
         rJwQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785469603; x=1786074403;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=9b8YMivGLuRGJ7njNNRJjG4dhOdOjQ2LVlgcWgR8Vd8=;
        b=Cww4jvvkxOH2REjj95wb/SuL1uK0LojLvLVQIMF+tmPccYn8SRypJPvKbLKs0X3I0F
         yfMRa78WJTWS1gUfyzATzZS05V/HaAHSb+ep9dQrKnwEROAOCR5X0hRoMYs2ABscsHrW
         TlptYuWgp+FUhzeY01f+qtySuvW0nFE0PFxpLadmU738wyODsDwD0ygqmAKRacIgJyec
         cIQ4v6zihKPu4akNiQqatKjiF8LTNlRMYUX2uz1S9mYJcKlFFK7Ny9H3WW3AqM1AEipA
         Qr5Kc+rGNxzTDh4QValwTsq1+SkJfH/X95HYaP0l+EM5RRjTc2R4VEnRB/vGic/AioAa
         6h3w==
X-Forwarded-Encrypted: i=1; AHgh+RrQ+s8t1DrK1ybjleFRaN485xeq/cDnOAnegFkzDTXFu1Q3dhadl9WaogfIVjD0+gCWTJU3SCE=@lists.infradead.org
X-Gm-Message-State: AOJu0YxbZ8DWRRq/WjOUOAzpFMBuWB6mzFBg42x5trhWE9tKito7/4g2
	8/9N0kP+ceKUpwA6ELEJBxIoptaF610ioNoj6o4bG7pu+mJ18+EeCcOz4iL6Y56dGgxzKglnOF4
	qORplv5Vf2Kts3RmrWowXNbLy6K2qmt8UlOhPXXR9NSQVNgJ++kRZi/zaFKJjjdjth5biZbHH
X-Gm-Gg: AR+sD10wvHp9BZeeH+Gsj0GDBNbZ2JHxSKOk7V5naXVCmfJ7LjJkRFqvz4/q9tT/jJl
	7J/XZ/bOhK86VCl053E4QaJCGk7abit2a2oS3bOPzXnUkmBDz5HxzxpktfhO5jZmtWUfWnt1ZPU
	7PRN2LjXE/Z+TRTk/tY54fkw3vQUdmrMOWrphSvjQ2NjKOAeVZt/q3WXT1HIs0uUlvwe+te6cLv
	HDjs0JCQdqYvRsp1M0NfHd0+DgSd7qz9XgZ5HKzA984IguWN96xNfiryHGSmjRQiUPHveVL4HGx
	rJrFHJw+eFmbLWAyhH44kxrvTe6M5jnsXxmQJ2mrpb7kNeBDeqnPKDw38j9wUE3qjBPOs29YFVF
	JqD3YGU7Ofl9j1FNrDgwb8YybMPwZ960ly/d3McIWqIit4GfrksXDyoqSLIs1Ef6EHM6JkB2YVg
	==
X-Received: by 2002:a17:902:dac4:b0:2c9:e846:a589 with SMTP id d9443c01a7336-2d04834f2f0mr2097135ad.13.1785469603582;
        Thu, 30 Jul 2026 20:46:43 -0700 (PDT)
X-Received: by 2002:a17:902:dac4:b0:2c9:e846:a589 with SMTP id d9443c01a7336-2d04834f2f0mr2096955ad.13.1785469603172;
        Thu, 30 Jul 2026 20:46:43 -0700 (PDT)
Received: from [10.133.33.108] (tpe-colo-wan-fw-bordernet.qualcomm.com. [103.229.16.4])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2d04793f650sm1173805ad.29.2026.07.30.20.46.41
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 30 Jul 2026 20:46:42 -0700 (PDT)
Message-ID: <94fd180a-2288-4894-931d-109cef042479@oss.qualcomm.com>
Date: Fri, 31 Jul 2026 11:46:40 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH ath-current v2] wifi: ath11k: cleanup arsta in
 ath11k_mac_peer_cleanup_all()
To: Nicolas Escande <nico.escande@gmail.com>, ath11k@lists.infradead.org
Cc: linux-wireless@vger.kernel.org
References: <20260730140232.133500-1-nico.escande@gmail.com>
From: Baochen Qiang <baochen.qiang@oss.qualcomm.com>
Content-Language: en-US
In-Reply-To: <20260730140232.133500-1-nico.escande@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzMxMDAyMSBTYWx0ZWRfX9NLajjuDD+xp
 5EXIrOQU0WsQyloa2pkSmw3jOuOgE63LdA4koxGfBBsqNgsH9UpWqC/oRpOplJp3vA60LfKLBKb
 VplOW6ZRHHafMG6ikcnFb1Fb4U3RNeVGAxdiF8n9NW+PDTx9dvvmLeLzEIlNilk4J43Dxu49zgq
 eM0eMir+bpuOHQdfsfBqMsr4oq8MY7dxwaGyekY82HZ+ckI5kb/95qiPv2/isUcat4+3drecjSI
 vpExRLTJjXtJ1U0ACGtvYXeSpBAOFen6IT+JL/ykIk+Gam56VvDXNGx3olbmFvlTkxs0KsxprW7
 UFXE4facfaPrTMR3semnZNCG1sO5FGO/iEcDwScHLVjkkq7/+ySbEvWtf8NYk8CiYhAFXiw0YY/
 RkyS4Mwge2ax0ls0fr5L8I99VBVQgc6X9pDbXulZVJtymBUDDPNlkhXlqszj7DLhNThpNjk9nfE
 y2sg2i/rI+iiz9CBtMA==
X-Proofpoint-GUID: 7ouyp-kZnkK5ErxunqJL1v1RfL0rVsxT
X-Authority-Analysis: v=2.4 cv=e+w2j6p/ c=1 sm=1 tr=0 ts=6a6c1aa4 cx=c_pps
 a=MTSHoo12Qbhz2p7MsH1ifg==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22
 a=pGLkceISAAAA:8 a=EUspDBNiAAAA:8 a=fPzbls-HzLpkS3J7q7oA:9 a=QEXdDO2ut3YA:10
 a=GvdueXVYPmCkWapjIL-Q:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzMxMDAyMSBTYWx0ZWRfXxytlznU1vkXm
 FJ/kfdEnhleQO3VvA/QwVZI7ThAjUl5GuJ/pUXwGOi45aHDIzW455GhnRUP2kmuqGRd/+Lg1RCT
 ZHmk4FK47ZKE03BJOuMDv5nMvtLljRU=
X-Proofpoint-ORIG-GUID: 7ouyp-kZnkK5ErxunqJL1v1RfL0rVsxT
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-31_01,2026-07-30_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 suspectscore=0 priorityscore=1501 clxscore=1015 phishscore=0
 lowpriorityscore=0 impostorscore=0 malwarescore=0 adultscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607310021
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260730_204645_247902_19DB6A65 
X-CRM114-Status: GOOD (  12.49  )
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



On 7/30/2026 10:02 PM, Nicolas Escande wrote:
> When mac80211 removes a sta, it calls .sta_state() which in turn calls
> ath11k_mac_station_remove(). In that function we clean up both  peers &
> arsta related resources.
> 
> But when the firmware crashes, ath11k calls ieee80211_restart_hw(), which
> assumes that all driver related resources are cleanup up beforehand. This
> cleanup is supposedly done by ath11k_mac_peer_cleanup_all() but does not
> in fact free arsta->rx_stats / tx_stats.
> 
> So lets extract the arsta cleanup from ath11k_mac_station_remove() into a
> new ath11k_mac_station_cleanup() and call it from both there and
> ath11k_mac_peer_cleanup_all().
> 
> This should handle kmemleaks reports like:
> 	unreferenced object 0xffffff801ae66400 (size 1024):
> 	  comm "hostapd", pid 1306, jiffies 4295011565
> 	  hex dump (first 32 bytes):
> 	    00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00  ................
> 	    00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00  ................
> 	  backtrace (crc d61c08ec):
> 	    kmemleak_alloc+0x3c/0x50
> 	    __kmalloc_cache_noprof+0x2b0/0x3e0
> 	    ath11k_mac_op_sta_state+0x1dc/0xb10
> 	    drv_sta_state+0xac/0x6f8
> 	    sta_info_insert_rcu+0x314/0x5e0
> 	    sta_info_insert+0x14/0x38
> 	    ieee80211_add_station+0x10c/0x1a0
> 	    nl80211_new_station+0x3e8/0x680
> 	    genl_family_rcv_msg_doit+0xc0/0x120
> 	    genl_rcv_msg+0x1b4/0x258
> 	    netlink_rcv_skb+0x4c/0x108
> 	    genl_rcv+0x38/0x60
> 	    netlink_unicast+0x190/0x278
> 	    netlink_sendmsg+0x15c/0x370
> 	    ____sys_sendmsg+0x120/0x290
> 	    ___sys_sendmsg+0x70/0xa0
> 
> Tested-on: QCN9074 PCI WLAN.HK.2.9.0.1-01977-QCAHKSWPL_SILICONZ-1
> 
> Fixes: 9d5f28c1366f ("wifi: ath11k: fix connection failure due to unexpected peer delete")

I think the right commit introducing this issue should be d5c65159f289 ("ath11k: driver
for Qualcomm IEEE 802.11ax devices")

> Signed-off-by: Nicolas Escande <nico.escande@gmail.com>

with the Fixes: tag fixed:

Reviewed-by: Baochen Qiang <baochen.qiang@oss.qualcomm.com>

