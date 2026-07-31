Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B6D49C54F54
	for <ath11k@archiver.kernel.org>; Fri, 31 Jul 2026 04:26:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=E+wZi56qOnAfskyheJnkKhsJlDOlmlkpKY+fv/6C3tE=; b=GDKohsR6qIXC9cu6ZS7FLiL//J
	rGlivX1KGHatruO0YVrSr5zeDJGOc0lXdIdwjztgwRXn2mtEbRLuf03/ZVT8Va3k2iulGqq4ytKLY
	v1GLH6O7oqUwILbVLzYLZJkuq8wd4Ccy4hjDj5Cr6tiR0cpHnmddYWB/aHdHDMdx7tDQhMxqTbqcL
	QXnpEcMKwf/BDCWyfQ9Z91a3wvOGIcSrB5tRKB9kfjGXoMzFZSUI7f9kJ7f6WZroj9DK7TCWWgH84
	9Hoe8o6byeG62Lep0CFGyjeLO+P+YwDqqJGCOEpI0W+xAO+cF6oZp/oi8i4ZN0wpTziU0HYK1Vevn
	zrlzW+NQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wpepZ-0000000Bjuc-0I6U;
	Fri, 31 Jul 2026 04:26:45 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wpepU-0000000BjtR-1cvo
	for ath11k@lists.infradead.org;
	Fri, 31 Jul 2026 04:26:43 +0000
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66V3wnt12721511
	for <ath11k@lists.infradead.org>; Fri, 31 Jul 2026 04:26:39 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	E+wZi56qOnAfskyheJnkKhsJlDOlmlkpKY+fv/6C3tE=; b=PWcPTQFVT+cMQZXm
	ClkNQq6Smm4xyhJABDJGo5om717N/125+cIdc73KICkvttD0OkoDMZRidP7vv5Za
	lzKAzEn0RXMKA4hNzKv6NCT828zJJkxa1uq77AvXC/9nQ/yTHGqVantqvVAQQ30S
	KuINv2KYkAIiHB1avLc2brLXojHX6HDvIS8dWBZ5Tsyc82F+9zrhDOrZGddLv9tw
	r74hSV+nQrc4wEQefRug3MKAEPce/DZIs36PK4TJp7tBVjawICkMBZ3I3/lpbNQQ
	Jx9prWVk2PNUiCACIx+3f7pbz1COS2znBxBt/ywgwErE6Wl4qF+W7WGubKAbJtGQ
	61SscA==
Received: from mail-pj1-f70.google.com (mail-pj1-f70.google.com [209.85.216.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4frm9ar310-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <ath11k@lists.infradead.org>; Fri, 31 Jul 2026 04:26:38 +0000 (GMT)
Received: by mail-pj1-f70.google.com with SMTP id 98e67ed59e1d1-38e7621655eso1091498a91.0
        for <ath11k@lists.infradead.org>; Thu, 30 Jul 2026 21:26:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1785471998; x=1786076798; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=E+wZi56qOnAfskyheJnkKhsJlDOlmlkpKY+fv/6C3tE=;
        b=RXhdVgaLAdMlpgbcg210W69d74OEBh9laXrXDKXkkKPhzHNDN2VIbE4cZ03PvzrTJ6
         s5Oni/NPw+pzbroC3nbO7N7sJh3XfCP4YxQHhboJ3BGeic1LBhUhp/kQ0jeBcu5zuBwT
         nNqsDETdHkxd2wDaeUPi7oNosDTbMf7E/MtiTSHXF2I17biYIucGqyUB9g8UsRKjUNwf
         uSH+5x0rsEwyt7KrOvSNPNC4FKtUZeuzFxnOGBx8Bxe+5EXqD3b9AeTldHIy2XLjUrPH
         zFnO0I7QI4idLMpPmUMpkqkwT1t4/mbjmqHhvKLFcl3PgiveBVUlBg31s29+cN4RICwY
         +62A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785471998; x=1786076798;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=E+wZi56qOnAfskyheJnkKhsJlDOlmlkpKY+fv/6C3tE=;
        b=f/9Iu4/VJh35apVklJfHXxFpQ7bmLhBIt36TerPjx0QrIobMmkz/93n53N12vgU3fB
         QUkKx2e+p18JMGCovsgtjFbmBHBYRYOWyWXsCttYAejAj85+fPCV9hxSqxrevxB46/ly
         70tR2AW/v9o+M2t2/JIAkUcb23KxDw8dJ7UTCJLkkxhZ9/gPAhVm22YzRG5TbxmM1mqw
         kHUHhHCLXQjDa5FploZ89HSLHZ523q4b6SZoph47iWb2fGfsN6tjQC+XnxioNMKfo8nJ
         n9VMbNd1/EU5zd2WjfQgyuwqYkngcyEXlEIbTd/3HqiB8KZQiDFXzCj0vtqpm9EqoX+u
         efbw==
X-Forwarded-Encrypted: i=1; AHgh+RpqWsUPvxR+HRiLCgq8UL0lyVR8EaDSupNPb7y7kS3KT5SVL5R7KpNmLqVC0J9VmlRdUlXKRwQ=@lists.infradead.org
X-Gm-Message-State: AOJu0YyQOwLCSvX7YCvO6o3JIitIIJCq4KTaSto+OQsnQtF5eqwoEhMd
	s6X3xE1coHPQtRgXT6Hjydw7BJ8xMPXcZe74JCxFpWI4WMzmOi/VClHYRDHyDdsCmvwcD0n1dcY
	r6u0zIlpEkVR5TOZzYq8P831+amx5R2IagjO9SwtFCu93pp/VL+Ehrk03mh97ikHN
X-Gm-Gg: AR+sD11iHEC2dF/CvyZQ/DJPC35AFlvrto62ch5pzE1zxGJr0X51SvF568d+9di/DCR
	VhohSzj8ddQZFYiinA5guaWavLjrJZLvH3nJrApmvoFyYlRz4tqIfpk8TEzIIqYFDQlFMm29vbi
	V/hGqSQv//m0Mhkff8ahPSjPzTu0vdMpZVa9eRMQQzfbWR25GgAzzw54pEBfhnsTDT7/2piHAdm
	JqNlKMW1900Q4FHqUrnuuyfxxaYMIFGoYPfqRzRQji6CK5B764LpkP5TMHISjg5WZx92TvTpFIC
	vmhIS/WgmCxiD2eaAl3hyO+0F4Ly+6o021+46v0HfVeJJmgHyHrg94VGVtwrl57BlVSECY5jkuT
	d+yto3OXRERr9kFxTmouDLvoieXLCNDZVXXFCDQZy
X-Received: by 2002:a17:90a:d445:b0:381:11eb:d78e with SMTP id 98e67ed59e1d1-38fb11b7d37mr562391a91.14.1785471997790;
        Thu, 30 Jul 2026 21:26:37 -0700 (PDT)
X-Received: by 2002:a17:90a:d445:b0:381:11eb:d78e with SMTP id 98e67ed59e1d1-38fb11b7d37mr562361a91.14.1785471997224;
        Thu, 30 Jul 2026 21:26:37 -0700 (PDT)
Received: from [10.152.199.23] ([202.46.23.19])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-13fa7470c5csm1094830c88.5.2026.07.30.21.26.35
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 30 Jul 2026 21:26:36 -0700 (PDT)
Message-ID: <e4c7cc17-5ed1-40be-9f38-731611a05d5a@oss.qualcomm.com>
Date: Fri, 31 Jul 2026 09:56:31 +0530
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH ath-current v2] wifi: ath11k: cleanup arsta in
 ath11k_mac_peer_cleanup_all()
To: Nicolas Escande <nico.escande@gmail.com>, ath11k@lists.infradead.org
Cc: linux-wireless@vger.kernel.org
References: <20260730140232.133500-1-nico.escande@gmail.com>
From: Rameshkumar Sundaram <rameshkumar.sundaram@oss.qualcomm.com>
Content-Language: en-US
In-Reply-To: <20260730140232.133500-1-nico.escande@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=Wtcb99fv c=1 sm=1 tr=0 ts=6a6c23ff cx=c_pps
 a=0uOsjrqzRL749jD1oC5vDA==:117 a=j4ogTh8yFefVWWEFDRgCtg==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22
 a=pGLkceISAAAA:8 a=-8N9TBOcdXP-3-f-2DYA:9 a=QEXdDO2ut3YA:10
 a=mQ_c8vxmzFEMiUWkPHU9:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzMxMDAyNSBTYWx0ZWRfX7oZZW+3wJVoY
 E762F1pTafUO44mNcixut3sCmWG5kqCtCKncw0YNtxH+C6XH5JiJGdPIuj9ut1G5ZOmUaR2fi7y
 w7gbLpFcK7XkgkwjCH/qYm2T365vr28=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzMxMDAyNSBTYWx0ZWRfX7YbrTVem1ExH
 c+zvfWCpYjU/AIthaBftEqAGm08P67G/2h5hICAIBwwWANeL0vpju3+hP+wgVoIWSFhhMd6TT2F
 JZ4W34v/bGsdqZroLvb95fG97Cjf9brH/lK6wbHG40kOvWIyMagZtFWI0bZXg94EFD05NFilsSF
 Y2QwZLk9yt6SJwLCFbgCyAqAHZiSwXlKzm0x528bJq70gro/YQeXDEfATFdSCdebN5aD24rE85U
 CIyW9zvEBHnQFO6KDr9MmBPz3R/u0qMBiITA6ZqsAQ8X4iA/TwZwtrzyBhRmhJZiJkkCIYTTG33
 C7bnp3/2cjyS7z9lcAS06wNaPwNH+CQFzKnRqsZ6/FnTEcURXMNY86T/UVURjoS8YcayU/XSL3Z
 KF58ygwtWvQSbQuqAwytIzd2eUZ+5aTwrcqbhlwOoagNLKiynWJN2sZOXpHhmuUUssuK9+bpYyd
 2hLoWG4L6ElonR5XNlQ==
X-Proofpoint-ORIG-GUID: 6LqD7xSnKk6sPNb5uK7D2FUIvyy4Tq00
X-Proofpoint-GUID: 6LqD7xSnKk6sPNb5uK7D2FUIvyy4Tq00
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-31_01,2026-07-30_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 suspectscore=0 clxscore=1015 spamscore=0 lowpriorityscore=0
 adultscore=0 priorityscore=1501 impostorscore=0 phishscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607310025
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260730_212641_331055_81E516A6 
X-CRM114-Status: GOOD (  28.28  )
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

On 7/30/2026 7:32 PM, Nicolas Escande wrote:
> When mac80211 removes a sta, it calls .sta_state() which in turn calls
> ath11k_mac_station_remove(). In that function we clean up both  peers &
> arsta related resources.
> 
> But when the firmware crashes, ath11k calls ieee80211_restart_hw(), which
> assumes that all driver related resources are cleanup up beforehand. This

nit: s/cleanup up/cleaned up

> cleanup is supposedly done by ath11k_mac_peer_cleanup_all() but does not
> in fact free arsta->rx_stats / tx_stats.
> 
> So lets extract the arsta cleanup from ath11k_mac_station_remove() into a

nit: So lets, ... or just Extract the arsta ... to be more imperative

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

As Baochen mentioned this should point to d5c65159f289 ath11k: driver 
for Qualcomm IEEE 802.11ax devices

older stable trees before 9d5f28c1366f would need a small contextual
backport: add the helper and replace the direct frees in 
ath11k_mac_op_sta_state() rather than in ath11k_mac_station_remove().

> Signed-off-by: Nicolas Escande <nico.escande@gmail.com>
> ---
>   Note: this problem is in fact older that the referenced commit, but as
>   it would need another patch to backport to older kernel and the leak is
>   quite minimal & seldom happens, I was hopping to not have to do it.
> 
> v2:
> 	- rebased on ath/master
> 	- no code change
> ---
>   drivers/net/wireless/ath/ath11k/mac.c | 25 ++++++++++++++++++-------
>   1 file changed, 18 insertions(+), 7 deletions(-)
> 
> diff --git a/drivers/net/wireless/ath/ath11k/mac.c b/drivers/net/wireless/ath/ath11k/mac.c
> index 2d55cdc4d165..ae91b57c8422 100644
> --- a/drivers/net/wireless/ath/ath11k/mac.c
> +++ b/drivers/net/wireless/ath/ath11k/mac.c
> @@ -873,6 +873,22 @@ static int ath11k_mac_set_kickout(struct ath11k_vif *arvif)
>   	return 0;
>   }
>   
> +static void ath11k_mac_station_cleanup(struct ieee80211_sta *sta)
> +{
> +	struct ath11k_sta *arsta;
> +
> +	if (!sta)
> +		return;
> +
> +	arsta = ath11k_sta_to_arsta(sta);
> +
> +	kfree(arsta->tx_stats);
> +	arsta->tx_stats = NULL;
> +
> +	kfree(arsta->rx_stats);
> +	arsta->rx_stats = NULL;
> +}
> +
>   void ath11k_mac_peer_cleanup_all(struct ath11k *ar)
>   {
>   	struct ath11k_peer *peer, *tmp;
> @@ -885,6 +901,7 @@ void ath11k_mac_peer_cleanup_all(struct ath11k *ar)
>   	list_for_each_entry_safe(peer, tmp, &ab->peers, list) {
>   		ath11k_peer_rx_tid_cleanup(ar, peer);
>   		ath11k_peer_rhash_delete(ab, peer);
> +		ath11k_mac_station_cleanup(peer->sta);
>   		list_del(&peer->list);
>   		kfree(peer);
>   	}
> @@ -9892,7 +9909,6 @@ static int ath11k_mac_station_remove(struct ath11k *ar,
>   {
>   	struct ath11k_base *ab = ar->ab;
>   	struct ath11k_vif *arvif = ath11k_vif_to_arvif(vif);
> -	struct ath11k_sta *arsta = ath11k_sta_to_arsta(sta);
>   	int ret;
>   
>   	if (ab->hw_params.vdev_start_delay &&
> @@ -9916,12 +9932,7 @@ static int ath11k_mac_station_remove(struct ath11k *ar,
>   			   sta->addr, arvif->vdev_id);
>   
>   	ath11k_mac_dec_num_stations(arvif, sta);
> -
> -	kfree(arsta->tx_stats);
> -	arsta->tx_stats = NULL;
> -
> -	kfree(arsta->rx_stats);
> -	arsta->rx_stats = NULL;
> +	ath11k_mac_station_cleanup(sta);
>   
>   	return ret;
>   }

Actual change looks fine to me

