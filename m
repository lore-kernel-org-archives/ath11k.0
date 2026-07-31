Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6FE16C54F54
	for <ath11k@archiver.kernel.org>; Fri, 31 Jul 2026 16:43:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=qfuxMqhwzMkVhbfUi3o9OQG8MFvHtQpWhutULoqcRSY=; b=FRfacq0USTs/erx+XchEitJkRX
	URoYL2Eqq/tTegY5jShfpYiUCB3mAmw1wSP5/Kfo5T5Tpfe5J5/LWvbflyWPSxfAUdnfnbfwnT0dT
	GSpEpq8BQbMgnXvYKyVdQdGh20Aw3RhPun/XhKIsU01hInjtrmtNigUbS9tpYvg3phAJBjm/xQ6RY
	HpLNw5CGWjFeKpNEfQfblWdkFGiNbCy9A/T65YQ76wAype8YlPf3cL7NiLQ7iE27iG5ayzrU3bkvi
	WflrFOfdGlrBncmrBJZlW/8wznTwrp7mTVOH8L+q7Kn78JGbjJ6ChW1/2yEUNivUcuYDNSszNsH6M
	qjdq+80A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wpqKA-0000000DATh-1fGw;
	Fri, 31 Jul 2026 16:43:06 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wpqK8-0000000DAT9-1F1G
	for ath11k@lists.infradead.org;
	Fri, 31 Jul 2026 16:43:05 +0000
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66VFONqf205424
	for <ath11k@lists.infradead.org>; Fri, 31 Jul 2026 16:43:03 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	qfuxMqhwzMkVhbfUi3o9OQG8MFvHtQpWhutULoqcRSY=; b=B5T5KwFhf101rGfD
	2hQBiSDeCjerONLSuZwu5gPJMp+5g91AYQwQyAkGoUkmX6ZxDi1cf1aaksgUwPQ3
	WAfe/ZsbRB9e+gxNZEaBclShSDsfc3606rngw+NIKLHwBRWAd60thfpYnkdKaFJW
	s2AzS2LTNFIrtDOXhstz+Rd0/BAj6+XXASh96qtHQe35JfK7MS8ohEC001t2ReFf
	lMf3lT7P0NZlrd4wfToyIJE4mQloy3roKIncEyoEbuexioKMISdFJkBpkSjmOpLN
	Asp1NUvUEH2uPd3gNXDOzEzpug9JdC8Gn73r+6OOa/Ss8A1PxceokFbgNHQzRvaO
	t1V+5g==
Received: from mail-pj1-f70.google.com (mail-pj1-f70.google.com [209.85.216.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fru5dhbg6-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <ath11k@lists.infradead.org>; Fri, 31 Jul 2026 16:43:02 +0000 (GMT)
Received: by mail-pj1-f70.google.com with SMTP id 98e67ed59e1d1-38e8fee6af3so1116502a91.1
        for <ath11k@lists.infradead.org>; Fri, 31 Jul 2026 09:43:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1785516182; x=1786120982; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=qfuxMqhwzMkVhbfUi3o9OQG8MFvHtQpWhutULoqcRSY=;
        b=NyQsN/hiPteGxRdJGUIkfbUr/ZzQUXs5ujSuzm81hlKxM0DkyIJXXvUW97kTe6ZL4s
         RjtG1XsyqSrM7dTZ+8afYrzXaSyxYOqAqqhrlulJ6Rk6ofCNw1MqeH3Emr9k3zwWU9us
         OlNpXizTsv+2+f6FZ36veGUyS+Rza7z3jEtilXb8LW1RHwukJZ/H0HTS7+OSkvPzEfmj
         yOo+pAf31CpG4ak+6pzlpN343o1pKn1+6x1JMA2eDAcpLa0F4nFNn43azKJUplQXy3mx
         60aluaVvQHXvphCl6hWulN4rN5FUROjTfdaHD2tiWF1vVHzuaIKzQAto81ynwxwe9HFI
         4RiA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785516182; x=1786120982;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=qfuxMqhwzMkVhbfUi3o9OQG8MFvHtQpWhutULoqcRSY=;
        b=HPilcSE+Bu4nILkAMswSIWmrEcfqo+RiYjklo2/TrgLTtNe+j7svinKGPwQ+m9tKTS
         T6fCkhhR5m93fa/FpDx3RamDefnrI+X9QpnYoaqQ13Ly2ydXHctDI0wyEnPV95bM04Zu
         vXU8unQeGb8OiHUtXf/xEH/sGYmO9Z6/yEIPkiaJZ5269H9Xvq1EbpIlgBk4qZisshnq
         SF7BeTEzqPh9ewmUVEvNbEi0KbElcxKrRrcCIrKBsOMpyjhl4zsucvMEosimlsipAKCv
         7zCG0vAfJkp2bbyOquuTYZ36hDevX+rF7+igs14Ep4a1dex3FV/nuIA6N0CSm7R7bOxD
         x+iw==
X-Forwarded-Encrypted: i=1; AHgh+Rp+Ph2A2o1sH3uPLCj0Juv2wQtdP5HYz0dgryXcorexPE1OKBvo6fkJKJvpMIvcmSAI8HDR+t8=@lists.infradead.org
X-Gm-Message-State: AOJu0YyHPQsEYychu6RSgH78HNdgpABk5CMSvQvB2bAyToF2UMx4QtD6
	o2XN6mTILXLPCMp/Px+2P23eOXM8+E74aHFngAhbaeQrCvUtOAleEF+jOjapgQ1/uEPHalBJzip
	omhg2vGDflj/4yXbKXxfn494g79beToXrpStS4ZqeGYzPxxXXa52SsEil+4sZ4os+
X-Gm-Gg: AR+sD13zCF5DKFNl+oJZuEPHItrLflJIEquA+XSGKZOmD8qZLukk62yrACdQR3aXata
	FBkq0/cD6LUETMX5zbIgmGfS/knB8TKRr2Ff4U8CRUGf5l1dDQALTSpeLQzuFWIbp4yjPwzT1lJ
	cOxFohz/t6r8Atnbb0zE1yYEObATH/IKndU9ww9KBHEodE67BejG0eDJa8UCWYG5USZsQBP3D3l
	oIni3hK+jfLroCe48GVdFncUDVmOkOxB8UHA/tkhHJtJzAldtKC/740QdXNgYdVlOrlM4BPFFmk
	OGQlO9SqxuDc/fC8njXrAdDLlYBnG0OJu6mc1g79lv8wjgY1ZReN60e2wfAT4k+0LZoUnrxsM2W
	AJsr1//yes4NJkHgys7FngSF4EpNMLTu72y6hZ0nx8Go2AOK5Z4k2e8nW3hTZ
X-Received: by 2002:a17:90b:3c4c:b0:38f:159:f6b2 with SMTP id 98e67ed59e1d1-38fbc574232mr475507a91.40.1785516181832;
        Fri, 31 Jul 2026 09:43:01 -0700 (PDT)
X-Received: by 2002:a17:90b:3c4c:b0:38f:159:f6b2 with SMTP id 98e67ed59e1d1-38fbc574232mr475465a91.40.1785516180654;
        Fri, 31 Jul 2026 09:43:00 -0700 (PDT)
Received: from [10.227.110.203] (i-global254.qualcomm.com. [199.106.103.254])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-13fab4cb51asm7148284c88.9.2026.07.31.09.42.59
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 31 Jul 2026 09:42:59 -0700 (PDT)
Message-ID: <53c36618-10e9-4e62-83f0-c872ed51847f@oss.qualcomm.com>
Date: Fri, 31 Jul 2026 09:42:59 -0700
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH ath-current v3] wifi: ath11k: cleanup arsta in
 ath11k_mac_peer_cleanup_all()
To: Nicolas Escande <nico.escande@gmail.com>, ath11k@lists.infradead.org
Cc: linux-wireless@vger.kernel.org
References: <20260731145830.769811-1-nico.escande@gmail.com>
From: Jeff Johnson <jeff.johnson@oss.qualcomm.com>
Content-Language: en-US
In-Reply-To: <20260731145830.769811-1-nico.escande@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: OXfJFmR-crMRI7RwY9dyDKWDKmGjPzIJ
X-Proofpoint-GUID: OXfJFmR-crMRI7RwY9dyDKWDKmGjPzIJ
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzMxMDEyNyBTYWx0ZWRfX0bZLamkFTzbK
 gc4RV7iVUsQHIFmCgWvl4kLdkJHUSzX78B+LnXQwueehL+fSmZMjcmaOEn1DH7TsEiB02wKi5bU
 vuqVF9aQg2gf5qlfKpsbxWJpAh471FSPuPZhK3vCLRLY2Y3txaWOS1YlU3eVxvLafLdzXYPA1WO
 +25yVC7nMwdT7w/AUNVl8+q7XFbOI1/G/r9yUWUS+N0Q/vsq8WDG5rJZtrFm/SIeHERj8/aiLXu
 e0jQnmCl6TaDqDzJxqnBm7ZW0RXrfJhZV+dcRwoVbQlxM4iuhmzVIzFh51xVqoxHYHEirEO4ynb
 /4LN32U7t9zMQzyZF2MmYMALnQtx/0LKvQ5TfgBVNTgB4SVn4K5s5lLZJti8XDvsYWm4JBqwnak
 JuwXiQuqTGRu0fSilS/Ion1DS4gP5hf2FBY1HVvBwEe6sabsiM6fLMqujKWPLtMb+lIxQetxWpJ
 YIyY9bMc0T8YrW4RwCQ==
X-Authority-Analysis: v=2.4 cv=SKZykuvH c=1 sm=1 tr=0 ts=6a6cd096 cx=c_pps
 a=0uOsjrqzRL749jD1oC5vDA==:117 a=JYp8KDb2vCoCEuGobkYCKw==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22
 a=pGLkceISAAAA:8 a=EUspDBNiAAAA:8 a=fPzbls-HzLpkS3J7q7oA:9 a=QEXdDO2ut3YA:10
 a=mQ_c8vxmzFEMiUWkPHU9:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzMxMDEyNyBTYWx0ZWRfX1vAGLJNeegcz
 VN8ea0FQoVkL3VKV6hbwgZSNqzFETgqwxUTqlkB6me6FvFBzdLX8aAPkVd2mtPDQq1i+2trv2Ck
 19Lcqe7y+X+FcmvOl29EvMHg2dc/RZ0=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-31_05,2026-07-30_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 lowpriorityscore=0 priorityscore=1501 bulkscore=0 malwarescore=0
 adultscore=0 impostorscore=0 spamscore=0 suspectscore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607310127
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260731_094304_482103_A231AA78 
X-CRM114-Status: GOOD (  13.86  )
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

On 7/31/2026 7:58 AM, Nicolas Escande wrote:
> When mac80211 removes a sta, it calls .sta_state() which in turn calls
> ath11k_mac_station_remove(). In that function we clean up both peers &
> arsta related resources.
> 
> But when the firmware crashes, ath11k calls ieee80211_restart_hw(), which
> assumes that all driver related resources are cleaned up beforehand. This
> cleanup is supposedly done by ath11k_mac_peer_cleanup_all() but does not
> in fact free arsta->rx_stats / tx_stats.
> 
> This extract the arsta cleanup from ath11k_mac_station_remove() into a
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
> Tested-on: QCN9074 hw1.0 PCI WLAN.HK.2.9.0.1-01977-QCAHKSWPL_SILICONZ-1
> 
> Fixes: d5c65159f289 ("ath11k: driver for Qualcomm IEEE 802.11ax devices")
> Signed-off-by: Nicolas Escande <nico.escande@gmail.com>

Since the new version just incorporated the review comments, you should have
propagated Baochen's RB.

The following will accomplish that for patchwork and for b4 that I use for
maintainer work:

Reviewed-by: Baochen Qiang <baochen.qiang@oss.qualcomm.com>


