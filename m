Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6B346C55822
	for <ath11k@archiver.kernel.org>; Wed,  5 Aug 2026 09:27:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=VcUBPbLFrH43P3Om1CNUHd8LvyM1EvziGffpmXDyf2A=; b=Uj2WFm27XxR44CYKGYsjhwVmQU
	hf9Gf4YD8IV4kcgl4c02myhS3gvCHpFfqbYOWKJVzAVRiOH62xVw5e5O64RV79zuuUfBhKv0+0Z4T
	236VpSc3yDC+18M3y1sU7c5qs4m0wPsXBKI6j0DbtAn8Y7tU07eM4HST36SXZlPI3oVKrQoW6f4nH
	4I2X5kxvuuNyq52gO5SdsmlZPj5++G7l3rsDcqX9VZsTNp/Vuu57iSZmCvd6NItB6WSP6QPrVSHOv
	xZgjvsEF34ucS+e8q6pKGXZ+2G4W9C02/Ms8m0JLTGEHzlDrnbT4IDIQz+9ARZnnvrnS4FagI7ngZ
	AmKqzEyg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wrXuI-00000003cWk-3xYb;
	Wed, 05 Aug 2026 09:27:26 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wrXuG-00000003cVd-1OJ1
	for ath11k@lists.infradead.org;
	Wed, 05 Aug 2026 09:27:25 +0000
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6758dEU72912033
	for <ath11k@lists.infradead.org>; Wed, 5 Aug 2026 09:27:24 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	VcUBPbLFrH43P3Om1CNUHd8LvyM1EvziGffpmXDyf2A=; b=lY0S42E7+zWb3oas
	qaE2XHFoIVT6TFAHQ445Mep3mxh7Hk+QoBM6f/N71/7mkSfDmCkARiEBbeSUIWvJ
	sWKGF9Ho0Ye6uNMeQLTlFviW+r4rgrP+O2WilZ3p0H6e9oTb6lvseaB0huZlf6Wq
	tiItayEn8snm6j1PXCTCDYWh913lTiIjpoCYmwoZ2iqVRPKAbm6DcgbkE6LHl0QI
	GUDsiiOArUMAKMervzEZS2Z9w9ICpasuGjVx965po+iUBLOTOBskse5cnMzS17Ns
	pt2LSylLANmgP4QU5UuaLT8YLpzBYH8fhidYeDSiTQArAERF0tLPSNeiuEzyPjBQ
	axov8w==
Received: from mail-pg1-f198.google.com (mail-pg1-f198.google.com [209.85.215.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fuku33xtt-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <ath11k@lists.infradead.org>; Wed, 05 Aug 2026 09:27:23 +0000 (GMT)
Received: by mail-pg1-f198.google.com with SMTP id 41be03b00d2f7-c85798977dcso1228779a12.0
        for <ath11k@lists.infradead.org>; Wed, 05 Aug 2026 02:27:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1785922043; x=1786526843; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=VcUBPbLFrH43P3Om1CNUHd8LvyM1EvziGffpmXDyf2A=;
        b=RkSyNLhBNqY2+1ixFF4Vctl6/ASOComsYhQF55fgl50KlJljIdl8ev1FayB6IzWlq4
         +uDIE8es5rmhKG3liGFPqPLgOf3+dKcAHGukOQwIhKakPfYU4YdN+qE80a+fUztCbyLU
         awwu+91XiKA4hdVeYxguf9Y8ZeVRwhMU8QKK4y0iCRBnqL8XRLj+LrvJ8mBXn/O4F3E4
         8G9nhdx/l7yKRB7LEoOEOcHb2yrQ7c3QhgtZqOmNOrxZFk9T4HP81N/8mPTIrGAAY2Ut
         GXl5PNgn6xp/zITXmLlX3JnKRvFBqLER8tk60gJsclQNmD0dJjW9utocWdCZryb8BDtR
         ih7A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785922043; x=1786526843;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=VcUBPbLFrH43P3Om1CNUHd8LvyM1EvziGffpmXDyf2A=;
        b=lCLmuDpAA01kqG9MOMbjK4ivJL9EjfouhWicL9raZU8LaiMDvrFV8s+gzMxm1yQYOO
         ZsLaSTogcMrdlno81wOuThdNaJf85N2S0430LwuM9hy3akuqdDO++D5dzoJMdIZQCo1w
         mOK4Hl6qMGY/2xZv4JsPsGJR7Rti56c8W2cx03UEQxSyTUHHOZxQs5FIYKmy/dgJcwmO
         xbRQ5ze4Q+mypnkpxs7Leg15XqAvgigA8BAy3iC43y/Q9/zz3frCeWVoYzeWJyDoW4t8
         cqS0VwC3NzKdhLV5/aNfZOrnxJ8yLyV1+q2IyOs/zLFbJ6dx9Zva6xzuRWKr+KCmhygJ
         6ysg==
X-Forwarded-Encrypted: i=1; AHgh+Rpk8IomdgAOMxW+/0aXKOhbXHyfqJZGENeHxyWnrCN8exuG/bt6YohLCm92gDcKBWuYc2QUG2I=@lists.infradead.org
X-Gm-Message-State: AOJu0YyTuegMrDWoQmKib0+fgayO31w0fI7ST7sg21HZgDk9dUA3DPfz
	XqkFs2xkYmvow8tOkj9OOeEE5qatm1fPNsO1hZdAvF2eE0Fckhk4fuTYq2pEBBfZyHZW9HYzAZo
	rtTD8Im1Ew+HvzMlF8NGxVixd4omCyLj+fU6Ikrxs1pvM3J4h8AzigHJfeot/JzOX
X-Gm-Gg: AR+sD130ZiTAUIgYWc0tBuY8C4HIkeheKJUh5LQl+noB/dUsiVd3VeoOgAZnqcJLqld
	PxQ6CF1g0C5JgWQAkeiNdTJ36ysXDzp6/5pdLHQQip2wx31z8AIqY5CSpcYJQQi2g0iEQC5ngRH
	wTHuTxA1vp896Be8cnCvkitScNS+FnHK3R8U588aQ9tefh8dz+qlg62iNV2zwo+gWFG48q8Uh84
	JaUiP/QHlL93fmoz2YKrPOdRVbJjoorKY8KKOpzeouMeNAn4y/G7XjmMjpPqhaCmQa58OtXSXPK
	52qe64YwS0xuBZdXR3qEzLCsgDPWrTrWA62XvWdooRme+qeZY+as0wsJMlICjPfGAMKvj9LHFQU
	ydT/x1U8oPVQp8R+ya8x3G/NNEaoJs6INj0wtsgwG
X-Received: by 2002:a05:6a21:3397:b0:3c4:46ca:3347 with SMTP id adf61e73a8af0-3cb85e2b693mr5968750637.2.1785922042592;
        Wed, 05 Aug 2026 02:27:22 -0700 (PDT)
X-Received: by 2002:a05:6a21:3397:b0:3c4:46ca:3347 with SMTP id adf61e73a8af0-3cb85e2b693mr5968710637.2.1785922042151;
        Wed, 05 Aug 2026 02:27:22 -0700 (PDT)
Received: from [10.152.199.23] ([202.46.23.19])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-315863b0c61sm15105674eec.6.2026.08.05.02.27.19
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 05 Aug 2026 02:27:21 -0700 (PDT)
Message-ID: <f835081b-991d-4622-881d-e75e723f1059@oss.qualcomm.com>
Date: Wed, 5 Aug 2026 14:57:17 +0530
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH ath-current v3] wifi: ath11k: cleanup arsta in
 ath11k_mac_peer_cleanup_all()
To: Nicolas Escande <nico.escande@gmail.com>, ath11k@lists.infradead.org
Cc: linux-wireless@vger.kernel.org
References: <20260731145830.769811-1-nico.escande@gmail.com>
From: Rameshkumar Sundaram <rameshkumar.sundaram@oss.qualcomm.com>
Content-Language: en-US
In-Reply-To: <20260731145830.769811-1-nico.escande@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: qO-UH7fDVw8woYTn_moOo66bScO18iNa
X-Proofpoint-Spam-Info: AW1haW4tMjYwODA1MDA3NCBTYWx0ZWRfX0+Tnfi92YyvQ
 M6T7c+MGYTLDZIZL4WaB14fFdJn7cw4LAQk+AJ4064m6ubyk6kOB7bmAXz2zmcPIQ8BG/ym5rCI
 8UyaIJbQl5pgBs9V39D/Or6Up5IMdTE=
X-Proofpoint-ORIG-GUID: qO-UH7fDVw8woYTn_moOo66bScO18iNa
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODA1MDA3NCBTYWx0ZWRfX/cQRKA5ErVWL
 SDGaZVRjP1Ef/W1kx6Y+dB6Y+Vcl6PExlqb7pKudP9CsNChjwo+mUeeNTyORjNxHe3f7NhHa/Bg
 Bqyo0Tp/4PaiVUZtuczUhN2n9skBE+0nd8ihXyVfh8/hlpFMRTLHX5cQ69y2vuZG+//j1yoAlwC
 pdjXQO6toWqRkHZBUd8jSFC97EBKuFXHCQ0ig1oiqlybKQtANjYunfUh6ZpN52OMCys907cIh+0
 057Xl4kAY4WZiCI9Z4AoVZyJQCTRwwvFtZgj8oSZTmk2Kdz6dNavMn5e9lkz/WTUbnWNgPMQm9y
 8zCf0zYHHKVsByps3fRHB7hQYzW+dCJBVV659jjo705OhvOk3qy2r4yQOM3TJxtVMfa80COtrDL
 i72NIonlvth2ogHOVmhvYr5ELROSVajl6OoWZTjDFsIMRiT6EPedzlJXnidIyLl1MAjFdUDC8UJ
 3rDU50b6glGCFC7kADQ==
X-Authority-Analysis: v=2.4 cv=X/hi7mTe c=1 sm=1 tr=0 ts=6a7301fb cx=c_pps
 a=Qgeoaf8Lrialg5Z894R3/Q==:117 a=j4ogTh8yFefVWWEFDRgCtg==:17
 a=IkcTkHD0fZMA:10 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22
 a=pGLkceISAAAA:8 a=EUspDBNiAAAA:8 a=ET-C_lD-THr5xxlFSyEA:9 a=QEXdDO2ut3YA:10
 a=x9snwWr2DeNwDh03kgHS:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-05_03,2026-08-04_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 bulkscore=0 impostorscore=0 phishscore=0 adultscore=0
 malwarescore=0 suspectscore=0 priorityscore=1501 lowpriorityscore=0
 spamscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2608050074
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260805_022724_376957_C2907C7B 
X-CRM114-Status: GOOD (  12.26  )
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

On 7/31/2026 8:28 PM, Nicolas Escande wrote:
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
Reviewed-by: Rameshkumar Sundaram <rameshkumar.sundaram@oss.qualcomm.com>

