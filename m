Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 370D1CA0EC1
	for <ath11k@archiver.kernel.org>; Mon,  4 Aug 2025 09:26:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Cc:Content-ID:Content-Description:Resent-Date:Resent-From
	:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=5Nx10j3tsKb++TfgGyAVP7r1PI4JZodLNJvkgpwyXDQ=; b=IZpHHpZku8qJNEmZm4LQSeyS0w
	gtbDfXxIGRO1XgepQTgt6s7x0tB6dIRdHpS1Lnmt4pnLLs4H2F6T4uAql+0mgFvuV3vfwysDow9mB
	MSolWno9PEFFvtv2ushh77gwRilF0U2HV7p6fnMCqmR+oV5jOKpOEVMTtxJQ4tjd2vxVaAiytiBSr
	QvGhAkGP66YclfSBxvPMomUJCHJBcfvCxzYEC3gOj8B27ui88QkTCA8yjbMgJDWVwo/AbnvqCnuTD
	sOnxDG8HE5fpIf2RLUX5zTKclrBSg+nTv/SCiXs9RbsO9VFfwI7HIfTjzGHM2aQlRt/k1LbAMCKyj
	fPHuJ8Zw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uirSi-0000000A4iX-3csC;
	Mon, 04 Aug 2025 09:26:32 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uiquS-0000000A0iq-15eP
	for ath11k@lists.infradead.org;
	Mon, 04 Aug 2025 08:51:12 +0000
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 573LrOQk002587
	for <ath11k@lists.infradead.org>; Mon, 4 Aug 2025 08:51:07 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	5Nx10j3tsKb++TfgGyAVP7r1PI4JZodLNJvkgpwyXDQ=; b=dQYHwd3kW0WATr1R
	eDYD65IGmhr//DfRHmoIASSb/Q2U5dz9odleGcvwkLxxW+WRa39ohftzL8LEBSmD
	Gu60TTyVRDAeZZ7hlo01ASKEVsUmAnVy9YvU2gy+D7NDr9eCkRfboA27bL2CDr+n
	qRZus0lWpYE3MmLCfKVSQ0JOae1+OZ08tj9WeP1Rwkge2iagE6Xs5tVA9+pmMvTX
	ITcNsjhab++uWqSWDyrHlCqkqHp+N0x/xWYQcFV8cx+SEKdc44vqZI0xj1HtJ2Hg
	NO6oQuvO+L6Jl7/MYGut/Ue89Q+FG7w0YFSNmHOxd9PB/KmlR5TlALx/Am4vZVqu
	dKrFZQ==
Received: from mail-pg1-f199.google.com (mail-pg1-f199.google.com [209.85.215.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 489b2a46a4-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <ath11k@lists.infradead.org>; Mon, 04 Aug 2025 08:51:06 +0000 (GMT)
Received: by mail-pg1-f199.google.com with SMTP id 41be03b00d2f7-b00e4358a34so1992442a12.0
        for <ath11k@lists.infradead.org>; Mon, 04 Aug 2025 01:51:06 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1754297465; x=1754902265;
        h=content-transfer-encoding:in-reply-to:from:references:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=5Nx10j3tsKb++TfgGyAVP7r1PI4JZodLNJvkgpwyXDQ=;
        b=JJhH4Ic19rJtZx4pU2KAjC97tp/ZIp2E+IWiG3ZHcCaZyxhMNls9TVZfFsnPlB/F4l
         iPwBYealB+0n6QMceZnXb1Uifmcgcy/s8d5X20C1Xl9mG9cMhpnnFikDMmdzi91tCXd7
         aqPBRdL0QGFkJX/JVWjPuoG+Giom1i+0c7t5c8T0ZRWBFe+SdakOP+1Obmy8OMi/YPXe
         QiavsiSTzUZkWFmARbzCDjPgl0wnRm42YnVKFD3hwiDpdEXqLgHMqpJMfXCRB8bSYQxh
         vPwZv4ZPKcq4qf/m6hX81rZagyJohykbd53uTIlxe0Wd1CiSvOYIro3axQTwBH8hMF2B
         RHLQ==
X-Forwarded-Encrypted: i=1; AJvYcCVU0Fxhx4fnFa1lzDdS+TjYyM9GOp8zV9I7wPxHjIB0ywhH+DdXhep1dEMrsA6VzGm3RGbsz5E=@lists.infradead.org
X-Gm-Message-State: AOJu0YyQQOKJ76IucaHArs099ik4Kt3tRGgY9XSFboSnNbVdabO4h580
	F65Gqw1cQaC1nKPAuLp9OVxcCt8PVA0CVLiNk+rC5Bfu2Q4mNdLS6WmmUP+RnqWNk6TKO/5VhK6
	nXVbx9yL6KysKvqimuKN5DqpGsb9DwnAXVYMgZnF2NhLM8px12zNT03GBd1xd2fFS
X-Gm-Gg: ASbGncvUtPaAxy6yHq9JcwNWHQrPQK2xJEBD0/R+O8MCZFjTzhI5qAAR5cwCO8H689+
	bCry7ivmc8ohnxmwScuAfEDuWdgGv1eBHXcQ6PPksuNQR3rUNld9sBWbVTA6h7Hw5ZFe9uYMNWr
	kv8ILs6zpe06BoAc4le1DD1DKEQ8zC9hanUmZoLj23t9vXDlic+MQeB6D34CqyHKy+5JBddiIf6
	qHeS4GCr7sJ7ZBEmr8ernLJQxfxcjIsVepykn2fNeavvqcztbBbHBSZTBNglsVBxdIswr5CtoTf
	a7GhXuOhWuk7eM0AUiuhTgfn1ICsBVoCrB5adRLxTi6pjxOKLsK0pP7CyI9klTazyAHe03t5n8p
	jfYfuQA==
X-Received: by 2002:a17:902:e54b:b0:235:779:edf0 with SMTP id d9443c01a7336-2424706d99dmr108554055ad.50.1754297465284;
        Mon, 04 Aug 2025 01:51:05 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGvIUiRq5ELN0etQkAos29Gk1oloA0XzP7Scrf2xqfaacpwi+BCO3xAt2f6hrdLs0Hq9nFYMw==
X-Received: by 2002:a17:902:e54b:b0:235:779:edf0 with SMTP id d9443c01a7336-2424706d99dmr108553655ad.50.1754297464795;
        Mon, 04 Aug 2025 01:51:04 -0700 (PDT)
Received: from [10.152.204.0] ([202.46.23.19])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-241e8ac8ed4sm102901965ad.189.2025.08.04.01.51.03
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 04 Aug 2025 01:51:04 -0700 (PDT)
Message-ID: <b632b98f-cfa7-24b2-70ab-85b40017b33a@oss.qualcomm.com>
Date: Mon, 4 Aug 2025 14:21:02 +0530
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
Subject: Re: [PATCH ath-next v3] wifi: ath11k: fix group data packet drops
 during rekey
Content-Language: en-US
To: Rameshkumar Sundaram <rameshkumar.sundaram@oss.qualcomm.com>,
        ath11k@lists.infradead.org
References: <20250804075344.3494691-1-rameshkumar.sundaram@oss.qualcomm.com>
From: Vasanthakumar Thiagarajan <vasanthakumar.thiagarajan@oss.qualcomm.com>
In-Reply-To: <20250804075344.3494691-1-rameshkumar.sundaram@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=OKwn3TaB c=1 sm=1 tr=0 ts=6890747a cx=c_pps
 a=Oh5Dbbf/trHjhBongsHeRQ==:117 a=j4ogTh8yFefVWWEFDRgCtg==:17
 a=IkcTkHD0fZMA:10 a=2OwXVqhp2XgA:10 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8
 a=SD3UHHueFxj418xRIOEA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=_Vgx9l1VpLgwpw_dHYaR:22
X-Proofpoint-ORIG-GUID: sDmy9jBDQOv3in22ZmPRYK5s4EwFt3BX
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwODA0MDA0NiBTYWx0ZWRfX2PSkQTHuUtyh
 i0GcZEyRlLCJmy1yDVan7gxs2T2m3vAGf52SEspqcso83a64TVOapAJN91HTkPFitfZ+bpjho7z
 1kPuJg7pJIqlUe/dOIMpfr0gBD7g+PjTAsgg80VDZPrmUV/Ho9hFWfwVVCgZweECCspcSsJQzDX
 fvIs6yck1tMjZSwnA2jeYUYsOEbgnkfF2z1KIDg9MNWhuI69HIhLosfvcJoQe9g4EGtFp+fuUxU
 IVJf08B9HIrCWUpw4OboJiEzm9hC4TI2OMtG1hD2qrsQW1BBDvE2piDBz1oc/YT+24DMS+h2cfV
 54Y/koyi8T6yUmOY7XYiKpnlSeVLCrL73Hhf9oJMLcaz7bTFvWmz/C3vheKZ00C3O/pa/Vp5Lmm
 tE4FuP9/Tn0FGzZNnKUbjgaBchntsgmUef0MZF7SENjbhcR3hi5Q9TRiv6rLoZIXhapbFGrT
X-Proofpoint-GUID: sDmy9jBDQOv3in22ZmPRYK5s4EwFt3BX
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-08-04_03,2025-08-04_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 spamscore=0 suspectscore=0 mlxlogscore=999 clxscore=1015
 phishscore=0 impostorscore=0 priorityscore=1501 adultscore=0 mlxscore=0
 malwarescore=0 lowpriorityscore=0 classifier=spam authscore=0 authtc=n/a
 authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2505280000 definitions=main-2508040046
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250804_015108_449521_D3CC2D79 
X-CRM114-Status: GOOD (  46.78  )
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



On 8/4/2025 1:23 PM, Rameshkumar Sundaram wrote:
> During GTK rekey, mac80211 issues a clear key (if the old key exists)
> followed by an install key operation in the same context. This causes
> ath11k to send two WMI commands in quick succession: one to clear the
> old key and another to install the new key in the same slot.
> 
> Under certain conditions—especially under high load or time sensitive
> scenarios, firmware may process these commands asynchronously in a way
> that firmware assumes the key is cleared whereas hardware has a valid key.
> This inconsistency between hardware and firmware leads to group addressed
> packet drops. Only setting the same key again can restore a valid key in
> firmware and allow packets to be transmitted.
> 
> This issue remained latent because the host's clear key commands were
> not effective in firmware until commit 436a4e886598 ("ath11k: clear the
> keys properly via DISABLE_KEY"). That commit enabled the host to
> explicitly clear group keys, which inadvertently exposed the race.
> 
> To mitigate this, restrict group key clearing across all modes (AP, STA,
> MESH). During rekey, the new key can simply be set on top of the previous
> one, avoiding the need for a clear followed by a set.
> 
> However, in AP mode specifically, permit group key clearing when no
> stations are associated. This exception supports transitions from secure
> modes (e.g., WPA2/WPA3) to open mode, during which all associated peers
> are removed and the group key is cleared as part of the transition.
> 
> Add a per-BSS station counter to track the presence of stations during
> set key operations. Also add a reset_group_keys flag to track the key
> re-installation state and avoid repeated installation of the same key
> when the number of connected stations transitions to non-zero within a
> rekey period.
> 
> Additionally, for AP and Mesh modes, when the first station associates,
> reinstall the same group key that was last set. This ensures that the
> firmware recovers from any race that may have occurred during a previous
> key clear when no stations were associated.
> 
> This change ensures that key clearing is permitted only when no clients
> are connected, avoiding packet loss while enabling dynamic security mode
> transitions.
> 
> Tested-on: QCN9074 hw1.0 PCI WLAN.HK.2.9.0.1-02146-QCAHKSWPL_SILICONZ-1
> Tested-on: WCN6855 hw2.1 PCI WLAN.HSP.1.1-03125-QCAHSPSWPL_V1_V2_SILICONZ_LITE-3.6510.41
> 
> Reported-by: Steffen Moser <lists@steffen-moser.de>
> Closes: https://lore.kernel.org/linux-wireless/c6366409-9928-4dd7-bf7b-ba7fcf20eabf@steffen-moser.de
> Fixes: 436a4e886598 ("ath11k: clear the keys properly via DISABLE_KEY")
> Signed-off-by: Rameshkumar Sundaram <rameshkumar.sundaram@oss.qualcomm.com>
> ---
> v3:
>    - Allowed clear key strictly only for AP mode
>    - Rephrased the commit text and comment in ath11k_mac_op_set_key()
>      to explain that the race occures rarely under heavy load and
>      discrepancy of states between firmware and hardware
>    - Added newline (\n) at the end of warn log in ath11k_set_group_keys()
>    - Made addr varaible as const * in ath11k_set_group_keys()
> v2:
>    - Followed r-xmas style
>    - Removed vdev_type check before calling ath11k_set_group_keys()
>    - Removed lockdep assert in ath11k_set_group_keys()
>    - Removed flags variable and passed WMI_KEY_GROUP in ath11k_set_group_keys()
>    - Changed the if condition to have positive cases in ath11k_mac_op_set_key()
>    - Added code comments in ath11k_mac_op_set_key() to explain how clear key and
>      set key are issue back to back by mac80211 and added high level information
>      about the firmware race.
>    - Added comments in ath11k_mac_op_set_key() and ath11k_mac_station_add() to
>      explain why a reinstall of same key is needed.
> ---
>   drivers/net/wireless/ath/ath11k/core.h |   2 +
>   drivers/net/wireless/ath/ath11k/mac.c  | 111 +++++++++++++++++++++++--
>   2 files changed, 104 insertions(+), 9 deletions(-)
> 
> diff --git a/drivers/net/wireless/ath/ath11k/core.h b/drivers/net/wireless/ath/ath11k/core.h
> index 220d69a7a429..e8780b05ce11 100644
> --- a/drivers/net/wireless/ath/ath11k/core.h
> +++ b/drivers/net/wireless/ath/ath11k/core.h
> @@ -411,6 +411,8 @@ struct ath11k_vif {
>   	bool do_not_send_tmpl;
>   	struct ath11k_arp_ns_offload arp_ns_offload;
>   	struct ath11k_rekey_data rekey_data;
> +	u32 num_stations;
> +	bool reinstall_group_keys;
>   
>   	struct ath11k_reg_tpc_power_info reg_tpc_info;
>   
> diff --git a/drivers/net/wireless/ath/ath11k/mac.c b/drivers/net/wireless/ath/ath11k/mac.c
> index 1fadf5faafb8..106e2530b64e 100644
> --- a/drivers/net/wireless/ath/ath11k/mac.c
> +++ b/drivers/net/wireless/ath/ath11k/mac.c
> @@ -4317,6 +4317,40 @@ static int ath11k_clear_peer_keys(struct ath11k_vif *arvif,
>   	return first_errno;
>   }
>   
> +static int ath11k_set_group_keys(struct ath11k_vif *arvif)
> +{
> +	struct ath11k *ar = arvif->ar;
> +	struct ath11k_base *ab = ar->ab;
> +	const u8 *addr = arvif->bssid;
> +	int i, ret, first_errno = 0;
> +	struct ath11k_peer *peer;
> +
> +	spin_lock_bh(&ab->base_lock);
> +	peer = ath11k_peer_find(ab, arvif->vdev_id, addr);
> +	spin_unlock_bh(&ab->base_lock);
> +
> +	if (!peer)
> +		return -ENOENT;
> +
> +	for (i = 0; i < ARRAY_SIZE(peer->keys); i++) {
> +		struct ieee80211_key_conf *key = peer->keys[i];
> +
> +		if (!key || (key->flags & IEEE80211_KEY_FLAG_PAIRWISE))
> +			continue;
> +
> +		ret = ath11k_install_key(arvif, key, SET_KEY, addr,
> +					 WMI_KEY_GROUP);
> +		if (ret < 0 && first_errno == 0)
> +			first_errno = ret;
> +
> +		if (ret < 0)
> +			ath11k_warn(ab, "failed to set group key of idx %d for vdev %d: %d\n",
> +				    i, arvif->vdev_id, ret);
> +	}
> +
> +	return first_errno;
> +}
> +
>   static int ath11k_mac_op_set_key(struct ieee80211_hw *hw, enum set_key_cmd cmd,
>   				 struct ieee80211_vif *vif, struct ieee80211_sta *sta,
>   				 struct ieee80211_key_conf *key)
> @@ -4326,6 +4360,7 @@ static int ath11k_mac_op_set_key(struct ieee80211_hw *hw, enum set_key_cmd cmd,
>   	struct ath11k_vif *arvif = ath11k_vif_to_arvif(vif);
>   	struct ath11k_peer *peer;
>   	struct ath11k_sta *arsta;
> +	bool is_ap_with_no_sta;
>   	const u8 *peer_addr;
>   	int ret = 0;
>   	u32 flags = 0;
> @@ -4386,16 +4421,57 @@ static int ath11k_mac_op_set_key(struct ieee80211_hw *hw, enum set_key_cmd cmd,
>   	else
>   		flags |= WMI_KEY_GROUP;
>   
> -	ret = ath11k_install_key(arvif, key, cmd, peer_addr, flags);
> -	if (ret) {
> -		ath11k_warn(ab, "ath11k_install_key failed (%d)\n", ret);
> -		goto exit;
> -	}
> +	ath11k_dbg(ar->ab, ATH11K_DBG_MAC,
> +		   "%s for peer %pM on vdev %d flags 0x%X, type = %d, num_sta %d\n",
> +		   cmd == SET_KEY ? "SET_KEY" : "DEL_KEY", peer_addr, arvif->vdev_id,
> +		   flags, arvif->vdev_type, arvif->num_stations);
> +
> +	/* Allow group key clearing only in AP mode when no stations are
> +	 * associated. There is a known race condition in firmware where
> +	 * group addressed packets may be dropped if the key is cleared
> +	 * and immediately set again during rekey.
> +	 *
> +	 * During GTK rekey, mac80211 issues a clear key (if the old key
> +	 * exists) followed by an install key operation for same key
> +	 * index. This causes ath11k to send two WMI commands in quick
> +	 * succession: one to clear the old key and another to install the
> +	 * new key in the same slot.
> +	 *
> +	 * Under certain conditions—especially under high load or time
> +	 * sensitive scenarios, firmware may process these commands
> +	 * asynchronously in a way that firmware assumes the key is
> +	 * cleared whereas hardware has a valid key. This inconsistency
> +	 * between hardware and firmware leads to group addressed packet
> +	 * drops after rekey.
> +	 * Only setting the same key again can restore a valid key in
> +	 * firmware and allow packets to be transmitted.
> +	 *
> +	 * There is a use case where an AP can transition from Secure mode
> +	 * to open mode without a vdev restart by just deleting all
> +	 * associated peers and clearing key, Hence allow clear key for
> +	 * that case alone. Mark arvif->reinstall_group_keys in such cases
> +	 * and reinstall the same key when the first peer is added,
> +	 * allowing firmware to recover from the race if it had occurred.
> +	 */
>   
> -	ret = ath11k_dp_peer_rx_pn_replay_config(arvif, peer_addr, cmd, key);
> -	if (ret) {
> -		ath11k_warn(ab, "failed to offload PN replay detection %d\n", ret);
> -		goto exit;
> +	is_ap_with_no_sta = (vif->type == NL80211_IFTYPE_AP &&
> +			     !arvif->num_stations);
> +	if ((flags & WMI_KEY_PAIRWISE) || cmd == SET_KEY || is_ap_with_no_sta) {
> +		ret = ath11k_install_key(arvif, key, cmd, peer_addr, flags);
> +		if (ret) {
> +			ath11k_warn(ab, "ath11k_install_key failed (%d)\n", ret);
> +			goto exit;
> +		}
> +
> +		ret = ath11k_dp_peer_rx_pn_replay_config(arvif, peer_addr, cmd, key);
> +		if (ret) {
> +			ath11k_warn(ab, "failed to offload PN replay detection %d\n",
> +				    ret);
> +			goto exit;
> +		}
> +
> +		if ((flags & WMI_KEY_GROUP) && cmd == SET_KEY && is_ap_with_no_sta)
> +			arvif->reinstall_group_keys = true;
>   	}
>   
>   	spin_lock_bh(&ab->base_lock);
> @@ -4994,6 +5070,7 @@ static int ath11k_mac_inc_num_stations(struct ath11k_vif *arvif,
>   		return -ENOBUFS;
>   
>   	ar->num_stations++;
> +	arvif->num_stations++;
>   
>   	return 0;
>   }
> @@ -5009,6 +5086,7 @@ static void ath11k_mac_dec_num_stations(struct ath11k_vif *arvif,
>   		return;
>   
>   	ar->num_stations--;
> +	arvif->num_stations--;
>   }
>   
>   static u32 ath11k_mac_ieee80211_sta_bw_to_wmi(struct ath11k *ar,
> @@ -9540,6 +9618,21 @@ static int ath11k_mac_station_add(struct ath11k *ar,
>   		goto exit;
>   	}
>   
> +	/* Driver allows the DEL KEY followed by SET KEY sequence for
> +	 * group keys for only when there is no clients associated, if at
> +	 * all firmware has entered the race during that window,
> +	 * reinstalling the same key when the first sta connects will allow
> +	 * firmware to recover from the race.
> +	 */
> +	if (arvif->num_stations == 1 && arvif->reinstall_group_keys) {
> +		ath11k_dbg(ab, ATH11K_DBG_MAC, "set group keys on 1st station add for vdev %d\n",
> +			   arvif->vdev_id);
> +		ret = ath11k_set_group_keys(arvif);
> +		if (ret)
> +			goto dec_num_station;
> +		arvif->reinstall_group_keys = false;
> +	}
> +
>   	arsta->rx_stats = kzalloc(sizeof(*arsta->rx_stats), GFP_KERNEL);
>   	if (!arsta->rx_stats) {
>   		ret = -ENOMEM;
> 

LGTM

