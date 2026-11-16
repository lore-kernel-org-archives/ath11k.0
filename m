Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 81F88606A31C
	for <ath11k@archiver.kernel.org>; Mon, 16 Nov 2026 15:51:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=LI+I3WYg;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=cFYKMGWv;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=UWHlc100
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=T15AuhE31UhCQiNlKm1KpqpzGHM4L5aNNLLLTI73GWU=; b=LI+I3WYg3W0AWi
	f0h36bGofM2apn+kgKxRTRs7QLDwiJJN3zr/hz0L1JlyqXlZ3qooX0TK6pRtHetwCG8Hh8MiqoC6B
	m8jbRp4rRSsj/qwhS4p5pJ24CQJxEcMyT482IGOZnYEJFDr/7uMkYdTr6ci+gWuiUegp1Pp7W6dMe
	hCbB67K8gfR1XuRPlZTk5BEo8wTpZCcQJEufT9FHGY67lWk782xcUy/sGoUK7hk//9ieHdjLu7KEp
	H2t2aYJS5pOUJaaL1/1F/bsNDdBGh8xUWfdzFry0oiL0xgKrErOQorGL81MKO8fNjYxQp2Uhnu4UF
	wjN/Fqrr9+2+Up4d78AQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xSyz5-000000037qo-3XF2;
	Mon, 16 Nov 2026 15:51:09 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xSyz3-000000037qO-0GJw
	for ath11k@lists.infradead.org;
	Mon, 16 Nov 2026 15:51:06 +0000
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AGE31892736954
	for <ath11k@lists.infradead.org>; Mon, 16 Nov 2026 15:51:04 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	T15AuhE31UhCQiNlKm1KpqpzGHM4L5aNNLLLTI73GWU=; b=cFYKMGWvCco0P4Ia
	YGvXIeRz4tpXY7SUeCPNPFk0fOzK34gX/BEUjiEi61jd5nlor/SwMmtSMa49KbIw
	QvAFMXW7g1RwItsuFqNdgLHJJ0xLG6QbgT6ttORYEt0lhG727wHXL5U0SKj8PeDK
	ZxR+FWnkxS8Pg5bM+QcFytSdG7akSpp/Q4rU6huCR8IuP/4p0roE1CVsdu1D94jn
	qIQHYcUZa1hfW+/8FX8MZp/7sI94ei+LVKRjJD49hnTwcbBu38CKM3b0lhx8RWTn
	ppZmkNpSk/B/DPj67Ofgzvb4XsAhGRLqj/r1U0KVUyC2KkWbZsZxcYre6HQeGNxm
	GjQJfg==
Received: from mail-oo1-f70.google.com (mail-oo1-f70.google.com [209.85.161.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j038m8edm-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <ath11k@lists.infradead.org>; Mon, 16 Nov 2026 15:51:04 +0000 (GMT)
Received: by mail-oo1-f70.google.com with SMTP id 006d021491bc7-71adbbb6b26so1498720eaf.3
        for <ath11k@lists.infradead.org>; Mon, 16 Nov 2026 07:51:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1794844264; x=1795449064; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=T15AuhE31UhCQiNlKm1KpqpzGHM4L5aNNLLLTI73GWU=;
        b=UWHlc100pHahNZ/fS8jUUVnbJlG2FeqOOWrjvru4ptC9w6bOaIpt/cxuVdEHfh004x
         p2Rd6P4CU+zPYUlp1eOTe7G7NvpDGvwhi35tSw0V4JXLWzeGXZcY8Con29zhNUL4842Z
         dykJFULIVJFnwj1uz5HvJJXgrhCWtVj77YQUy7kYZOEaDUNvyVnb2hGAmqqQ5gOUTQoz
         PwYjIMFEHQyaXOG0wwcRq/BjzvJyKMT66AIIyRwsXA7bu7eOdzwkiB7dAoDJkV43UJLM
         FtKnsrggC4QwH/BsrgsRbi326D/kVxxRSU5ZOnni6gyYSVkXSNJv0qEMiZk9SIBdi2yM
         TrKA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794844264; x=1795449064;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=T15AuhE31UhCQiNlKm1KpqpzGHM4L5aNNLLLTI73GWU=;
        b=TKk7GUV9i2xG+qR7TtRSs9rA7A23Go13vAB1mXMgooCs11kf24JRw3EoH78NV1Vcvs
         Dp5Cp5GVC16OohlrdjkCnQzW7KeoXsNAiTEVjmu6n30O84RQmSFXKB47mNFqVSdiT92h
         Zp2ep7yFwtzTu537j0pApfe3QzIF8gIdYrgI9pd6FM7viPFCWXzRkUv9bJBLhLAqjymD
         ux7l1OKwBoSM5Z8rz3lslHkrYortJhsk8S/raL6L3bVoLqcAkeTUuOG9J0oRyPhjfxAK
         NEYksNTbOqpb8Q2TK3EFjvy2Rq1Te/ScWHDz3RgSjtVuHUbEg2cV1Hfcu+8PjThMmQ6J
         NVcQ==
X-Forwarded-Encrypted: i=1; AL+hErFNuho0kmN9BdqTwRGlHyFkdiUkfF5f356w7EGIJxfPtT+7d5AYLm0WU7fzP3u1Szqc84TScKc=@lists.infradead.org
X-Gm-Message-State: APuU4Z/LJL/2mfCFt8B2uKbGAZr06TEg3KYMm9SBQo8ZhIFdCrEulU+R
	m0ubqRvXZF+F3ZOwfEqwhe6v+/YiptxoSL6EHM/DgL2Eokfwpq1y0NANq/mnyfZrnxP4nBSpU2p
	iib0Uav4pbdgs3Gd8pPKQrhwtanPWUaqTl84MHE2ZlWD82zqmgQlQ9DaGU2GdGcUQ
X-Gm-Gg: AYBFou0Pg2P+05BHwm7+Xa5csRxSzMWeFTYzrF1e2BvV9J/atzh99a4cL53UoaEkbGW
	wk7VLvBVqsj94hxiMEOzqW26r3Vk2Ko3VQQp6pbOiiPgvi6eyIEZpzc8wkDd9ceissz7cuJEEmL
	0GcxWNUMXXeUJ+qdS02ViN3aNtp/LO9qEXXIN2Joq16FEebSV/LXaKUGj+LkDdGEnnUGKFrjLcC
	ig0tU9jwyP9aR2eE9X9jP52Qjr5MYIhsXNORyfA3/RfNsX7aH8Oy1W+Uu/p2zsHovdbcNf8fgYh
	czLyWHy/Ayn7pKT9rvpZc3NH48HQyQqWuSm1LAqyTjIGspcz7kYy8Q5RfkXWJnqemdiUPF0Wldr
	oAgqpZVOFLHqgx9VVSZEJXLKbqKVloL0sNgIvnGIc2nho4UZeTYO/wJhPDDbJZzOo2FjmxZcVwp
	S9cDn5ni/ROgBzY8TNS5xAHv0Y2t5r
X-Received: by 2002:a05:6820:1504:b0:71a:df61:2e3 with SMTP id 006d021491bc7-71adf61140cmr3798210eaf.30.1794844263439;
        Mon, 16 Nov 2026 07:51:03 -0800 (PST)
X-Received: by 2002:a05:6820:1504:b0:71a:df61:2e3 with SMTP id 006d021491bc7-71adf61140cmr3798193eaf.30.1794844262849;
        Mon, 16 Nov 2026 07:51:02 -0800 (PST)
Received: from [192.168.1.20] (39.sub-97-215-59.myvzw.com. [97.215.59.39])
        by smtp.gmail.com with ESMTPSA id 006d021491bc7-71ab42cc12dsm8844447eaf.7.2026.11.16.07.51.01
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 16 Nov 2026 07:51:02 -0800 (PST)
Message-ID: <243aa8d2-ca32-4827-8675-70be02b653d9@oss.qualcomm.com>
Date: Mon, 16 Nov 2026 07:51:00 -0800
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] wifi: ath11k: read a station's TX rate under base_lock
To: Baochen Qiang <baochen.qiang@oss.qualcomm.com>,
        christophergriffin05@gmail.com, Jeff Johnson <jjohnson@kernel.org>
Cc: linux-wireless@vger.kernel.org, ath11k@lists.infradead.org,
        Baochen Qiang <baochen.qiang@oss.qualcomm.com>,
        Rameshkumar Sundaram <rameshkumar.sundaram@oss.qualcomm.com>
References: <20261114-ath11k-sta-txrate-lock-v1-1-8331a03b1000@gmail.com>
 <a346e622-8fe9-4912-9ded-b531b1bdc82e@oss.qualcomm.com>
 <f7ecb009-4c95-4ef2-b569-3b2069298c41@oss.qualcomm.com>
From: Jeff Johnson <jeff.johnson@oss.qualcomm.com>
Content-Language: en-US
In-Reply-To: <f7ecb009-4c95-4ef2-b569-3b2069298c41@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTE2MDA2MyBTYWx0ZWRfXybXagcq6ZMh3
 TQuLtj2QbxWO+0GtFHbfrsS/z82mb4/68pyf/6rbNjyy3A8juxt3w1d+LPKx+jT5aaztvGgqjSn
 ir+d9Ms9/UtOA23l/f53dcRjPUuctRE+zTIFpFq1cR1WlFy08QJAihQq7tjbi6pDyJJsnXoIeTD
 bL1Zg6oBv+ZwxoeulcXYldCLeHB18w5K/Iz9w1UCqhtRad1c+ItcxkotT6hTQSVerNBJtGBJNLR
 qYFWqDFqqfPasOtIE6oerYhhQrPniAlOtiy2guOTKLGBwroB9vPWarZ0faPASQ1Q3uEjoAhRPvt
 iOPe19zYm5S5ZtWBPYACZeD1fAdFyNrb8yH0nQOf4jTvgneC/oLeABMvOwbgX032Alm6PZ5sWpF
 ljDs9D3n3n/LDKSuxUmfURs1alfoEmNwKC6nsNsLNE+qBPhSsUyC8yWj9jSsiCj7AlIvb/y9S47
 Lmk6IZS+BH8+a8y48wA==
X-Authority-Analysis: v=2.4 cv=TckDJhQh c=1 sm=1 tr=0 ts=6afb2668 cx=c_pps
 a=lkkFf9KBb43tY3aOjL++dA==:117 a=7UwXyAtrHAWG9Tdc5CO1EQ==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22
 a=VwQbUJbxAAAA:8 a=pGLkceISAAAA:8 a=VJsjqyxQDCAMHoR8YxEA:9 a=QEXdDO2ut3YA:10
 a=k4UEASGLJojhI9HsvVT1:22
X-Proofpoint-ORIG-GUID: Bg0rmInf710bFMV0nd_ZP-13_GT-V7we
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTE2MDA2MyBTYWx0ZWRfXwX3DtEYHQUhe
 BPqvQk4FBWklWlu6V1AKVzmvuts0P7AkbABxXYgWjr4f0Qz6Q0Vv2d8CyHlOse0BfPruZcBC2PJ
 w3xGg78rHRegZdE+cLwGNmZoYNz2clk=
X-Proofpoint-GUID: Bg0rmInf710bFMV0nd_ZP-13_GT-V7we
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-16_04,2026-11-16_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 impostorscore=0 lowpriorityscore=0 phishscore=0
 suspectscore=0 clxscore=1015 spamscore=0 malwarescore=0 adultscore=0
 bulkscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2611040001
 definitions=main-2611160063
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261116_075105_141504_CC6B5767 
X-CRM114-Status: GOOD (  15.52  )
X-Spam-Score: -2.8 (--)
X-BeenThere: ath11k@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <ath11k.lists.infradead.org>
List-Archive: <http://lists.infradead.org/pipermail/ath11k/>
List-Post: <mailto:ath11k@lists.infradead.org>
List-Help: <mailto:ath11k-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/ath11k>,
 <mailto:ath11k-request@lists.infradead.org?subject=subscribe>
Sender: "ath11k" <ath11k-bounces@lists.infradead.org>
X-Spam-Status: No, score=-22.4 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS,
	USER_AGENT_SANE_1 autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On 11/16/2026 7:00 AM, Jeff Johnson wrote:
> On 11/15/2026 7:03 PM, Baochen Qiang wrote:
>>
>>
>> On 11/14/2026 10:34 PM, Christopher Griffin via B4 Relay wrote:
>>> From: Christopher Griffin <christophergriffin05@gmail.com>
>>>
>>> ath11k_update_per_peer_tx_stats() and ath11k_dp_tx_update_txcompl()
>>> rewrite arsta->txrate under ab->base_lock: they clear it, then fill in
>>> its fields one by one. ath11k_mac_op_sta_statistics() copies it into the
>>> station info without that lock, so a station dump that runs while a TX
>>> status updates the rate can copy the HE flag with an nss of 0, and
>>> cfg80211 warns:
>>>
>>>   WARNING: CPU: 3 PID: 30429 at net/wireless/util.c:1581 ieee80211_get_vht_max_nss+0x474/0x868 [cfg80211]
>>>   Call trace:
>>>    ieee80211_get_vht_max_nss+0x474/0x868 [cfg80211] (P)
>>>    cfg80211_calculate_bitrate+0x1e0/0x4f4 [cfg80211]
>>>    nl80211_put_sta_rate+0x50/0x1230 [cfg80211]
>>>    nl80211_put_sta_rate+0xa30/0x1230 [cfg80211]
>>>    nl80211_dump_station+0x4b8/0x7e0 [cfg80211]
>>>
>>> (the line is the nss check in the inlined
>>> cfg80211_calculate_bitrate_he()). It was seen once in about a day on an
>>> IPQ8074 AP whose stations are dumped periodically by a monitoring agent.
>>>
>>> Copy the rate under base_lock and report from the copy, as ath12k reads
>>> its peer rate info under its DP lock.
>>>
>>> The change and this message were written with Claude, an AI coding
>>> assistant.
>>>
>>> Tested-on: IPQ8074 hw2.0 AHB WLAN.HK.2.9.0.1-02146-QCAHKSWPL_SILICONZ-1
>>> Tested-on: QCN9074 hw1.0 PCI WLAN.HK.2.5.r4-00683-QCAHKSWPL_SILICONZ-1
>>> Tested-on: IPQ6018 hw1.0 AHB WLAN.HK.2.5.0.1-03982-QCAHKSWPL_SILICONZ-3
>>>
>>> Fixes: d5c65159f289 ("ath11k: driver for Qualcomm IEEE 802.11ax devices")
>>> Signed-off-by: Christopher Griffin <christophergriffin05@gmail.com>
>>> ---
>>> Found on an Arista C-360 (IPQ8074 + QCN9074) running OpenWrt, from a
>>> warning in its kernel log; the cause was found by reading the code.
>>> ath12k already reads its peer rate info under its DP lock.
>>> ---
>>>  drivers/net/wireless/ath/ath11k/mac.c | 26 ++++++++++++++++----------
>>>  1 file changed, 16 insertions(+), 10 deletions(-)
>>>
>>> diff --git a/drivers/net/wireless/ath/ath11k/mac.c b/drivers/net/wireless/ath/ath11k/mac.c
>>> index 1a237adaa37d1..d76eeb1ca0019 100644
>>> --- a/drivers/net/wireless/ath/ath11k/mac.c
>>> +++ b/drivers/net/wireless/ath/ath11k/mac.c
>>> @@ -9425,6 +9425,7 @@ static void ath11k_mac_op_sta_statistics(struct ieee80211_hw *hw,
>>>  {
>>>  	struct ath11k_sta *arsta = ath11k_sta_to_arsta(sta);
>>>  	struct ath11k *ar = arsta->arvif->ar;
>>> +	struct rate_info txrate;
>>>  	s8 signal;
>>>  	bool db2dbm = test_bit(WMI_TLV_SERVICE_HW_DB2DBM_CONVERSION_SUPPORT,
>>>  			       ar->ab->wmi_ab.svc_map);
>>> @@ -9435,18 +9436,23 @@ static void ath11k_mac_op_sta_statistics(struct ieee80211_hw *hw,
>>>  	sinfo->tx_duration = arsta->tx_duration;
>>
>> arsta->rx_duration and arsta->tx_duration are u64 and are also only updated under
>> ab->base_lock, so on 32-bit they can tear the same way. Since the lock is taken here
>> anyway, moving those two reads into the same critical section would cost nothing, and is what
>> ath12k_mac_op_link_sta_statistics() does under dp_lock.
>>
>> Not a blocker, fine to leave it for a separate patch.
> 
> I'll incorporate this suggestion into the patch in my pending branch

Please check:

https://git.kernel.org/pub/scm/linux/kernel/git/ath/ath.git/commit/?h=pending&id=9d8c2294a34e5ec38b674a8a1a5223522cfe3842

