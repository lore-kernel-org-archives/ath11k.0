Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1EA7F606A32F
	for <ath11k@archiver.kernel.org>; Mon, 16 Nov 2026 09:10:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=N14eXE4N;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=RtUGcIrM;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=Jpr9NbxJ
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=YHNmOrV3/wje2NqVn03EqzZH6Y/T/Hl1kXkBQsrwoDg=; b=N14eXE4ND9/KW6
	8G5HCTpZoXEKrve1VTnaMCBZN+OwQfACqc7ftcVWbBSEN4m7ouWGfhqwIRwowZYycrxvrla8BEeGq
	c+mVagkGH47ntj+lnPw5QTRSDQ2SPQeJiQTrXN2LBE7rHpEyJmtrKqPMnBSQ8Lej6sVapP0PUezPu
	kxpkPs6ZiqeSVm5FAChOiM1Ko0HTg1UbXuAqbOdrTanuF/ILiI65yhvFdWc9k2k4+nf1btRR3I+HG
	4HIXW0BvEEX0ET1SDEW6OqFPm/eYmYmprtWeA4rXaTuiByhe6Azqa+XEyFnCK0taMe6tk9YKCPgtS
	1BcXsi9Mo2nqq7cPbT1Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xSsjB-00000001igG-1lzX;
	Mon, 16 Nov 2026 09:10:17 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xSsj8-00000001ifk-3DVC
	for ath11k@lists.infradead.org;
	Mon, 16 Nov 2026 09:10:15 +0000
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AG7ergq903084
	for <ath11k@lists.infradead.org>; Mon, 16 Nov 2026 09:10:13 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	YHNmOrV3/wje2NqVn03EqzZH6Y/T/Hl1kXkBQsrwoDg=; b=RtUGcIrMOLhPSsmV
	HJcV7OKpdZS/fg2APPLOwjveAnPwLPCnyhFydoM060UYiCnKGrmKFzgNvAjlganS
	4MdzQuea4533HH3m+7O54E4EAJE88Vcl3XX9NReINHR4vCRhzD+O7YbIcpMJelEe
	nkz74XMR3QhWxFeOuTmHmXHOj5TVUJtaZ1PqSxDy01sMgriNgcDLjm+tbu4QtKjX
	ev2cDnStjBDmQTILoC569/tDaFT2+h0HxFgps1QEQ95nAeJsNY6m4DV/XSONoENZ
	PoGFPztFxMgs8Gk8QhJRCkkF6tsIMTE+RKNnCHlaZbXH6Ch0cz01OifSWCN/6mhS
	1S5xkw==
Received: from mail-dy1-f199.google.com (mail-dy1-f199.google.com [74.125.82.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hxhhjwrqr-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <ath11k@lists.infradead.org>; Mon, 16 Nov 2026 09:10:13 +0000 (GMT)
Received: by mail-dy1-f199.google.com with SMTP id 5a478bee46e88-37549877380so4471632eec.0
        for <ath11k@lists.infradead.org>; Mon, 16 Nov 2026 01:10:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1794820213; x=1795425013; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=YHNmOrV3/wje2NqVn03EqzZH6Y/T/Hl1kXkBQsrwoDg=;
        b=Jpr9NbxJCnt+VyucgOiQa6qXnaEi/LdW/p8gy+gjwP5Kcc6lyBsBXYr1Uv4PIXxy1o
         uncoJ3/yMZmhoC567A7vITOTgjb/TdCRN0xJXyZGRKKcSarutH6Ktp52g0dg4FEEGqZC
         ObQ0cdHSk2iTfDMjKq8BBAiApsrbkRP10uDtYqn/8nN2QcKgx7tSnwT2vkEJFeSH6N7N
         cTIBxU8GyaSBT7SFD4Nxyqw2m74ZmXCByR+3+cSzjZJUXgvIqX0/RJzxlEKSQ9RwuMf9
         41Pu+TapImI/3754WLO5XBR/nHoBGuBg8q49y0F+0no8MhdIQ/9JtpWiLbHUDq1fjKj/
         jLWA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794820213; x=1795425013;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=YHNmOrV3/wje2NqVn03EqzZH6Y/T/Hl1kXkBQsrwoDg=;
        b=c5vVEeqxPGMm81ORBydBHyjKhSOhGoKdVsbAcXio4WWgIDRUXLjI+Y3gE5J2RlyUma
         iH5nCnJndMkSgVrfRh4Htl/Nt3NpvWFkaGOB4KHavBK8Ip9LAdo8GK0RCzotLGB64o0s
         JnTcVJSLPwfp6wpk9O9JoY2dVuZ35udzcLH1ggqEOMsgc/uS8ec21//6DASK3nBVVbsX
         +l9gyNjfXmzSsGl0qhlbEWqXtIvHld1B/tCyF+hnBn+FxRm4VYMXKTJCeTTn4p4RvMyh
         c999nvXjZLa+wxecVSGh6gJmQdzseVT5BzA6QRVM2a4xrVcRwrlBKmM2XwDOSJEbbFua
         qypw==
X-Forwarded-Encrypted: i=1; AL+hErFiM14BjrktzBjH2DiuYUjeagds+73sAC0q/9CN5SdNROsMFahX4rRjQLJml7ZCYM7SK4+OGB4=@lists.infradead.org
X-Gm-Message-State: APuU4Z/ZApAQAue+2UZAjN4kGmElv511gJZy5XxHXvYd9V4VgqF2uT7t
	2fzZpkThXz+2UhPFZ2Gwf+jFZ6lFtZwc4jQtdgDBiTOyH6JQFyF+nSvDprUxT7xW+Xf/OfHTAK6
	WhYsjKBk2MMsm/n6FlB6nagTRjEt3FzZdxHkx9uqY0ueM/i1Fgvx+prs69Vh4EGHX
X-Gm-Gg: AZFdTZdX+8H2GC1CpnlfqA3V68tTQ8TyR/VZ2i0EIZjkFCz48/QZbJVY+irTHaRB5e3
	ox23NIZZoHSNRF1kyHfdCoBqSBRApDnaTHgGAF2eCmimJrBZ2f/Jtpxkmsg1SabPZYkxfD4u26N
	HLjOP2dXYojkIQjssMbtvxlQcGBcNAgZH3SWl2Z52IjgOaAGcWvd/kf/SuI8bWRSBcjyBxBJanq
	oC6NHErDMA9ofj8TxmYbfh8h14CW3j2zpadVra1heLY5Wf8HkUPshFJTXvK+5zt0Kt8wO99gvy2
	lSRDbIicZIGxgLcXUR6dZebPHtfNlAoB8VXs6A0mQnSfUl/EWP4GMC+0AYKygfL0Wlyer6MAsNl
	JGWe/6uK+IQ6FDePGWD4FdFGsw8/NllRNVkEt9I8q4Ntoo0oXnjXNIGNFuNrmTYd+PjoE8dBHUS
	AvOR5KY8ORzXO4X9lq
X-Received: by 2002:a05:7300:72cc:b0:372:598d:c0bb with SMTP id 5a478bee46e88-37966e3ad18mr15704798eec.13.1794820212799;
        Mon, 16 Nov 2026 01:10:12 -0800 (PST)
X-Received: by 2002:a05:7300:72cc:b0:372:598d:c0bb with SMTP id 5a478bee46e88-37966e3ad18mr15704764eec.13.1794820212247;
        Mon, 16 Nov 2026 01:10:12 -0800 (PST)
Received: from [192.168.11.102] ([124.123.81.254])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-37955332ae7sm49500055eec.8.2026.11.16.01.10.09
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 16 Nov 2026 01:10:11 -0800 (PST)
Message-ID: <a2313350-7374-404c-8a8d-998acb934bcf@oss.qualcomm.com>
Date: Mon, 16 Nov 2026 14:40:07 +0530
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] wifi: ath11k: read a station's TX rate under base_lock
To: christophergriffin05@gmail.com, Jeff Johnson <jjohnson@kernel.org>
Cc: Baochen Qiang <baochen.qiang@oss.qualcomm.com>,
        linux-wireless@vger.kernel.org, ath11k@lists.infradead.org,
        linux-kernel@vger.kernel.org,
        Jeff Johnson <jeff.johnson@oss.qualcomm.com>
References: <20261114-ath11k-sta-txrate-lock-v1-1-8331a03b1000@gmail.com>
From: Rameshkumar Sundaram <rameshkumar.sundaram@oss.qualcomm.com>
Content-Language: en-US
In-Reply-To: <20261114-ath11k-sta-txrate-lock-v1-1-8331a03b1000@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTE2MDAzNiBTYWx0ZWRfX6Xie/j/rHdiE
 CJeehDZHipkxpOjNfS/A+7gaOfFP4DvFbtYVHv+6vBI+x3uBllQghfrnHc6ai8x7enFCN16fRVY
 D/Rr42+l2IV7pBiO111MTSDUSCJnNsZXu7ZW6Inq+CPAVDqJV/tZj7O66VU0+TBVzfHhuO2sVx5
 rOFoUSSgcUA4kFWoAijGSP/BGF1N21tHo5KdaeITc6Nbldlf+1pn2STdX4Nw5IsvyfNPnAa6UUQ
 zXNRCH5048OjRT4pnrzhN/xiNsPOWGDxebm31L6GhlXRqv86+SxryvE+exqLzSAYk6iGM5LOOLz
 4fuhSD19vW+2XBoKAH2gp8dgT4Y3Uv9RkxTC29eSFU1HZxQ7VIlWyy3X/YxyRLYzd3DJ5dnRmjD
 O5hjjWMveVj2VYd9fjbK+6EHFhd6pTUexZGbLzln1x5Alcnt5LwL9jPfyn3NvWr9qX/R62zC5wv
 e+YHTeaaXPq+P2m/fJQ==
X-Proofpoint-ORIG-GUID: 8aygievr1_INT4FfsYCLEBhLexAmLigu
X-Proofpoint-GUID: 8aygievr1_INT4FfsYCLEBhLexAmLigu
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTE2MDAzNiBTYWx0ZWRfX4XKBQt+ZbJaE
 xjX0Zfj0q59aNN8E2IFb+7ujKctkTCFuu7Mc6TJbHByThfy7JdbimsSKyJd9p0i116inLBjta6O
 rg3mGR6PBQk6Ja2SiZFgLac9HEI/IoA=
X-Authority-Analysis: v=2.4 cv=X9rHu2Te c=1 sm=1 tr=0 ts=6afac875 cx=c_pps
 a=cFYjgdjTJScbgFmBucgdfQ==:117 a=WcLwt0pvHDAIUQ3iVSLIEw==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22
 a=pGLkceISAAAA:8 a=EUspDBNiAAAA:8 a=nA-HWIxgkZHMIsNwmeYA:9 a=QEXdDO2ut3YA:10
 a=scEy_gLbYbu1JhEsrz4S:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-16_03,2026-11-11_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 impostorscore=0 bulkscore=0 clxscore=1015 priorityscore=1501
 adultscore=0 malwarescore=0 lowpriorityscore=0 suspectscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611160036
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261116_011014_838737_B48E69B9 
X-CRM114-Status: GOOD (  21.62  )
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
X-Spam-Status: No, score=-17.4 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1
	autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On 11/14/2026 8:04 PM, Christopher Griffin via B4 Relay wrote:
> From: Christopher Griffin <christophergriffin05@gmail.com>
> 
> ath11k_update_per_peer_tx_stats() and ath11k_dp_tx_update_txcompl()
> rewrite arsta->txrate under ab->base_lock: they clear it, then fill in
> its fields one by one. ath11k_mac_op_sta_statistics() copies it into the
> station info without that lock, so a station dump that runs while a TX
> status updates the rate can copy the HE flag with an nss of 0, and
> cfg80211 warns:
> 
>    WARNING: CPU: 3 PID: 30429 at net/wireless/util.c:1581 ieee80211_get_vht_max_nss+0x474/0x868 [cfg80211]
>    Call trace:
>     ieee80211_get_vht_max_nss+0x474/0x868 [cfg80211] (P)
>     cfg80211_calculate_bitrate+0x1e0/0x4f4 [cfg80211]
>     nl80211_put_sta_rate+0x50/0x1230 [cfg80211]
>     nl80211_put_sta_rate+0xa30/0x1230 [cfg80211]
>     nl80211_dump_station+0x4b8/0x7e0 [cfg80211]
> 
> (the line is the nss check in the inlined
> cfg80211_calculate_bitrate_he()). It was seen once in about a day on an
> IPQ8074 AP whose stations are dumped periodically by a monitoring agent.
> 
> Copy the rate under base_lock and report from the copy, as ath12k reads
> its peer rate info under its DP lock.
> 
> The change and this message were written with Claude, an AI coding
> assistant.
> 
> Tested-on: IPQ8074 hw2.0 AHB WLAN.HK.2.9.0.1-02146-QCAHKSWPL_SILICONZ-1
> Tested-on: QCN9074 hw1.0 PCI WLAN.HK.2.5.r4-00683-QCAHKSWPL_SILICONZ-1
> Tested-on: IPQ6018 hw1.0 AHB WLAN.HK.2.5.0.1-03982-QCAHKSWPL_SILICONZ-3
> 
> Fixes: d5c65159f289 ("ath11k: driver for Qualcomm IEEE 802.11ax devices")
> Signed-off-by: Christopher Griffin <christophergriffin05@gmail.com>
> ---
> Found on an Arista C-360 (IPQ8074 + QCN9074) running OpenWrt, from a
> warning in its kernel log; the cause was found by reading the code.
> ath12k already reads its peer rate info under its DP lock.
> ---
>   drivers/net/wireless/ath/ath11k/mac.c | 26 ++++++++++++++++----------
>   1 file changed, 16 insertions(+), 10 deletions(-)
> 
> diff --git a/drivers/net/wireless/ath/ath11k/mac.c b/drivers/net/wireless/ath/ath11k/mac.c
> index 1a237adaa37d1..d76eeb1ca0019 100644
> --- a/drivers/net/wireless/ath/ath11k/mac.c
> +++ b/drivers/net/wireless/ath/ath11k/mac.c
> @@ -9425,6 +9425,7 @@ static void ath11k_mac_op_sta_statistics(struct ieee80211_hw *hw,
>   {
>   	struct ath11k_sta *arsta = ath11k_sta_to_arsta(sta);
>   	struct ath11k *ar = arsta->arvif->ar;
> +	struct rate_info txrate;
>   	s8 signal;
>   	bool db2dbm = test_bit(WMI_TLV_SERVICE_HW_DB2DBM_CONVERSION_SUPPORT,
>   			       ar->ab->wmi_ab.svc_map);
> @@ -9435,18 +9436,23 @@ static void ath11k_mac_op_sta_statistics(struct ieee80211_hw *hw,
>   	sinfo->tx_duration = arsta->tx_duration;
>   	sinfo->filled |= BIT_ULL(NL80211_STA_INFO_TX_DURATION);
>   
> -	if (arsta->txrate.legacy || arsta->txrate.nss) {
> -		if (arsta->txrate.legacy) {
> -			sinfo->txrate.legacy = arsta->txrate.legacy;
> +	/* The TX status paths clear and refill txrate under base_lock */
> +	spin_lock_bh(&ar->ab->base_lock);
> +	txrate = arsta->txrate;
> +	spin_unlock_bh(&ar->ab->base_lock);
> +
> +	if (txrate.legacy || txrate.nss) {
> +		if (txrate.legacy) {
> +			sinfo->txrate.legacy = txrate.legacy;
>   		} else {
> -			sinfo->txrate.mcs = arsta->txrate.mcs;
> -			sinfo->txrate.nss = arsta->txrate.nss;
> -			sinfo->txrate.bw = arsta->txrate.bw;
> -			sinfo->txrate.he_gi = arsta->txrate.he_gi;
> -			sinfo->txrate.he_dcm = arsta->txrate.he_dcm;
> -			sinfo->txrate.he_ru_alloc = arsta->txrate.he_ru_alloc;
> +			sinfo->txrate.mcs = txrate.mcs;
> +			sinfo->txrate.nss = txrate.nss;
> +			sinfo->txrate.bw = txrate.bw;
> +			sinfo->txrate.he_gi = txrate.he_gi;
> +			sinfo->txrate.he_dcm = txrate.he_dcm;
> +			sinfo->txrate.he_ru_alloc = txrate.he_ru_alloc;
>   		}
> -		sinfo->txrate.flags = arsta->txrate.flags;
> +		sinfo->txrate.flags = txrate.flags;
>   		sinfo->filled |= BIT_ULL(NL80211_STA_INFO_TX_BITRATE);
>   	}
>   
> 
> ---
> base-commit: ff4c7359e310744a7abe53cf66d921fa2969eb19
> change-id: 20261111-ath11k-sta-txrate-lock-50b530be39c2
> 

Reviewed-by: Rameshkumar Sundaram <rameshkumar.sundaram@oss.qualcomm.com>

