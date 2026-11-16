Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 79525606A339
	for <ath11k@archiver.kernel.org>; Mon, 16 Nov 2026 03:04:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=TxMdQ2Zh;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=CZ0mtxA2;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=PvfmgjHS
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=T+s/YqkfPu6xF4OVnuCJWP5RfIw0rp2fVL5Y005kWSU=; b=TxMdQ2Zhbh1Vxe
	IR9SM+6KKmqzqs4i6czSxvahGnbmemFvEzN/LGDXWSUY17l3usXg2nONfiNeslFx/djFl07+qKRwq
	i+UneskXX9TEf31Ir98WsBRu9gYjvQO4IjFesn9fn836bFAHWJOHzAcQx0H7ayf6qUbct2ffJGAVG
	0rvdrm7+WtDTcqGKA2YYcQURz7ySgRx6N5ZkfLlodDGol99ToAL2QwU/BkBs70t/Mgx937V4XiYhS
	5vBZJHoh0oJ4Pf7OxhJWuV0bsEAf2rJgU5TCQcIh2Jj3CJoZOQGLcaptUj6yIJOq4Sm0ZOJqbMQoj
	lJ7rXPqeiqtAsnF0Sg9A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xSn1D-000000010BK-1ECn;
	Mon, 16 Nov 2026 03:04:31 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xSn1A-000000010Au-2XKM
	for ath11k@lists.infradead.org;
	Mon, 16 Nov 2026 03:04:29 +0000
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AG1LCZR800857
	for <ath11k@lists.infradead.org>; Mon, 16 Nov 2026 03:04:26 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	T+s/YqkfPu6xF4OVnuCJWP5RfIw0rp2fVL5Y005kWSU=; b=CZ0mtxA2DzDQ8HYl
	btsGnnbN5VpMegPO5gUYmTzsj1r9EEiVKe86NMJMsCYYsJhw0YNb4GsXJ5R6A4SY
	1Hu3xDFmP6SeTGSt7IqUQXjocQ0GvPDgN+sab0flbKYSifp1TsHEjz1B5JEJYT91
	Qw4PCh48QDeTEo+lbMcTUUbRlnMPEZyQm1z94DRvSFG22Lf/mlGuZ5nk7FHoE7nV
	vLtwYw581V0yY1eSmjMu8OhYX3p4mpZGriZwWeExHm1kNIPhynx9facweGSlEd2W
	uu2/Tv/erq9mStoUM1S7JwE2FCqdhRd4FbYfcSuIwboCtTghQKY24GhaDIFl/nc8
	f18aTQ==
Received: from mail-pj1-f72.google.com (mail-pj1-f72.google.com [209.85.216.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hxhmame67-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <ath11k@lists.infradead.org>; Mon, 16 Nov 2026 03:04:26 +0000 (GMT)
Received: by mail-pj1-f72.google.com with SMTP id 98e67ed59e1d1-3aed37745bcso2909250a91.1
        for <ath11k@lists.infradead.org>; Sun, 15 Nov 2026 19:04:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1794798266; x=1795403066; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=T+s/YqkfPu6xF4OVnuCJWP5RfIw0rp2fVL5Y005kWSU=;
        b=PvfmgjHSBhAVQ97EbZd/uL3E3WEIkYihKpgkCKeDkMqhJlWSYYiN/YiMAg9qdNpfj0
         TdheMdZLohkN3Z4EFjombxVhF5ka87mXxLV6w0YWv++mNdEmhuxgW/x8YLhHim6sGz9c
         xuR4FEvKlTJ87AvMbFIdpPeMVgJhjY8AFC9PVRM8d0zcrwsIZGQ9KYH5NRjF2+PG9bMb
         yIrM+JPmUH2Gc1f4Pnxcx4qcc9dulNuorppiW933puqEJhiifjow8QACenCN4dL1U0aA
         U/PcqDWFBJSB8iWNGl0iZ1hRvvquuUm6o0nv1IcWAlK3IawsppKhkIRz1OdqVCuH51nD
         IaUg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794798266; x=1795403066;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=T+s/YqkfPu6xF4OVnuCJWP5RfIw0rp2fVL5Y005kWSU=;
        b=oUcEAqCpfqxWKChhIM298RK4i5iVrnLS/e1z3FUiqHfNziPlyoOii40N4Ed65zora9
         AMJiTK5MXh0G5vbbBz7Aa0I+k58j/tXCSFIIKvf+T+oJpCW6AAlTqUNSD6h+rTbbOdg0
         iMp7qRANSTbiMMiRBPp02VGL16sxKy0DSWwo1ts0pXP/BICCIC/9UT4Rf6V7QU6sSQpJ
         dE1n0Jq+hMqloBwWnRTltc9jRiSk9qqM0MtfJDFDQ+npkHdxIt+wKIJcWsd4QXDI8R5g
         VMololw2WxIIAmUIk0AORIKNy1kjAJ7WYQqx8LZBlJHNknwRLG/1STHtDq2PG2sYLabQ
         OEzQ==
X-Forwarded-Encrypted: i=1; AL+hErG3fRbw/npQDk0fMuUs/hJdQybyuzWWuH6eUw5N6RbXZBipqpF61z2bjD+uruAL6fcn06cSH10=@lists.infradead.org
X-Gm-Message-State: APuU4Z/rM0ARGAjA2rR0JBpz/A5trRqr4rKZ+CSv/kNpK7QQCH7lwYyx
	Xz2Qg4Jugq+sYoEIYjo0vih1naXQbWhN8rJAqCRJ1u4opubNik7XIPveIKkEB0S2ZyTZ5/aVNFA
	98FLUlA6ckiGR2YdcQ/Kuq5X5ksUqC0o1qwMgwbf/zfApZAKiKhXEfSEOp44VwpTN1uUTsV90zJ
	A=
X-Gm-Gg: AYBFou0Hf3z6w5t47ka3E/+N7bwkDYAEIrmpxoVEekNnm0qnoBGPYaxEv8UwUIRlgp2
	S1W4JwykOG05txYXnlqQkIn20JOdFB5kFbrtna8rJwtEisw2Yn27u6rV9limgOJBj1KmhYhx6kd
	GKCD1T7gwjg7rvN0aJVMwjigpyKh5eTTA+BagAKBdOy46TfoDbI0JPUUFa4imjN7pl4WKz9cIci
	hdgep0AqhvcsYja5pHi8zGn3akxdrmrTaon4+3oSfva9Jucdr7OviKEObNXFEbWgiqQqRxRN05s
	Uq8sR2B+6tQd79OORiCT1R3KeU1GLGdF7NlTam5sVGYum4zbdfoOss+xHaCWfg99Ca6qOn1/Wxn
	qCYWZD8zJBNwGS+bK2rPM7r0Qc+tJqm+gh7yd9etfmLSJe2fpDgC1ztyN/AhNqG4Z94UDsFtooY
	awI00N6Nr69u36S4s5nA9YQvYAZLTbx1+LARRpALTum5B2
X-Received: by 2002:a17:90b:5112:b0:3ac:9ad9:6afe with SMTP id 98e67ed59e1d1-3b1b0d481c5mr6099335a91.39.1794798265653;
        Sun, 15 Nov 2026 19:04:25 -0800 (PST)
X-Received: by 2002:a17:90b:5112:b0:3ac:9ad9:6afe with SMTP id 98e67ed59e1d1-3b1b0d481c5mr6099319a91.39.1794798265100;
        Sun, 15 Nov 2026 19:04:25 -0800 (PST)
Received: from [10.133.33.65] (tpe-colo-wan-fw-bordernet.qualcomm.com. [103.229.16.4])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b197c6dd2dsm18994350a91.2.2026.11.15.19.04.22
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 15 Nov 2026 19:04:24 -0800 (PST)
Message-ID: <a346e622-8fe9-4912-9ded-b531b1bdc82e@oss.qualcomm.com>
Date: Mon, 16 Nov 2026 11:03:59 +0800
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] wifi: ath11k: read a station's TX rate under base_lock
To: christophergriffin05@gmail.com, Jeff Johnson <jjohnson@kernel.org>
Cc: linux-wireless@vger.kernel.org, ath11k@lists.infradead.org,
        linux-kernel@vger.kernel.org,
        Jeff Johnson <jeff.johnson@oss.qualcomm.com>
References: <20261114-ath11k-sta-txrate-lock-v1-1-8331a03b1000@gmail.com>
From: Baochen Qiang <baochen.qiang@oss.qualcomm.com>
Content-Language: en-US
In-Reply-To: <20261114-ath11k-sta-txrate-lock-v1-1-8331a03b1000@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: ls8ftmccj3lmHs-FgnRQONnx-Dxn5H74
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTE2MDAxMSBTYWx0ZWRfX7wDOn+tFD2LL
 TVklI+n9z53YfTbNk5APESp/7FX6DTGI4jQzOXcu3wzYRk51wpmGJJGyOlp8Auy9Ocizn+8R5dl
 e9YctUlTu+feCKFiw/g0s34ixN9eVmib1TEn7eJ52J2g7uWrASKylQ1zlrK3p9sujkg3vG0paOP
 8fDXxpssk08A8Wc7qi+qnzjQbB1ujfA/MNRIcl4a9w2xx6ivPGWdzKoCUCzMIbZYnQhv+NLyK1s
 cLPhw4S5SHKCBvHjFo2TBkWUX2doCygl0QROhccp3UXvlPk1TwKpCkJFgwkq241KBN+CFKeGfg4
 DESaPbRqAMSc+r5vv37Zq6Irdj9aRIN2wPGztZHbAlbw+1hDKvhp0tN53W4ZCuB68WdKvmJATJo
 KY1ZY0Pk2dvCIquUW35qIBk330b9P2SPtK119D8dzaxa2lg/zlHKK/Up4puAEgwBBCxT9wa9UYq
 SwWalG3MooG106XRctg==
X-Authority-Analysis: v=2.4 cv=NdhzRGD4 c=1 sm=1 tr=0 ts=6afa72ba cx=c_pps
 a=RP+M6JBNLl+fLTcSJhASfg==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22
 a=pGLkceISAAAA:8 a=EUspDBNiAAAA:8 a=nA-HWIxgkZHMIsNwmeYA:9 a=QEXdDO2ut3YA:10
 a=iS9zxrgQBfv6-_F4QbHw:22
X-Proofpoint-GUID: ls8ftmccj3lmHs-FgnRQONnx-Dxn5H74
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTE2MDAxMSBTYWx0ZWRfX0H/5g45NfUNk
 fSTdJR9nFwSOpJSY7XMiUb2BDSoIJr2g6bUL0obQYhBduGWrdQ+2fOisuciM+45RO2bQ+LVbAWm
 XFbbZIoAgB5IE7AYMbBpGVlg5zF1nlU=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-16_01,2026-11-11_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 suspectscore=0 clxscore=1015 adultscore=0 lowpriorityscore=0
 spamscore=0 impostorscore=0 priorityscore=1501 bulkscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611160011
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261115_190428_801520_AA9D9F68 
X-CRM114-Status: GOOD (  24.29  )
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



On 11/14/2026 10:34 PM, Christopher Griffin via B4 Relay wrote:
> From: Christopher Griffin <christophergriffin05@gmail.com>
> 
> ath11k_update_per_peer_tx_stats() and ath11k_dp_tx_update_txcompl()
> rewrite arsta->txrate under ab->base_lock: they clear it, then fill in
> its fields one by one. ath11k_mac_op_sta_statistics() copies it into the
> station info without that lock, so a station dump that runs while a TX
> status updates the rate can copy the HE flag with an nss of 0, and
> cfg80211 warns:
> 
>   WARNING: CPU: 3 PID: 30429 at net/wireless/util.c:1581 ieee80211_get_vht_max_nss+0x474/0x868 [cfg80211]
>   Call trace:
>    ieee80211_get_vht_max_nss+0x474/0x868 [cfg80211] (P)
>    cfg80211_calculate_bitrate+0x1e0/0x4f4 [cfg80211]
>    nl80211_put_sta_rate+0x50/0x1230 [cfg80211]
>    nl80211_put_sta_rate+0xa30/0x1230 [cfg80211]
>    nl80211_dump_station+0x4b8/0x7e0 [cfg80211]
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
>  drivers/net/wireless/ath/ath11k/mac.c | 26 ++++++++++++++++----------
>  1 file changed, 16 insertions(+), 10 deletions(-)
> 
> diff --git a/drivers/net/wireless/ath/ath11k/mac.c b/drivers/net/wireless/ath/ath11k/mac.c
> index 1a237adaa37d1..d76eeb1ca0019 100644
> --- a/drivers/net/wireless/ath/ath11k/mac.c
> +++ b/drivers/net/wireless/ath/ath11k/mac.c
> @@ -9425,6 +9425,7 @@ static void ath11k_mac_op_sta_statistics(struct ieee80211_hw *hw,
>  {
>  	struct ath11k_sta *arsta = ath11k_sta_to_arsta(sta);
>  	struct ath11k *ar = arsta->arvif->ar;
> +	struct rate_info txrate;
>  	s8 signal;
>  	bool db2dbm = test_bit(WMI_TLV_SERVICE_HW_DB2DBM_CONVERSION_SUPPORT,
>  			       ar->ab->wmi_ab.svc_map);
> @@ -9435,18 +9436,23 @@ static void ath11k_mac_op_sta_statistics(struct ieee80211_hw *hw,
>  	sinfo->tx_duration = arsta->tx_duration;

arsta->rx_duration and arsta->tx_duration are u64 and are also only updated under
ab->base_lock, so on 32-bit they can tear the same way. Since the lock is taken here
anyway, moving those two reads into the same critical section would cost nothing, and is what
ath12k_mac_op_link_sta_statistics() does under dp_lock.

Not a blocker, fine to leave it for a separate patch.

>  	sinfo->filled |= BIT_ULL(NL80211_STA_INFO_TX_DURATION);
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
>  		} else {
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
>  		}
> -		sinfo->txrate.flags = arsta->txrate.flags;
> +		sinfo->txrate.flags = txrate.flags;
>  		sinfo->filled |= BIT_ULL(NL80211_STA_INFO_TX_BITRATE);
>  	}
>  
> 
> ---
> base-commit: ff4c7359e310744a7abe53cf66d921fa2969eb19
> change-id: 20261111-ath11k-sta-txrate-lock-50b530be39c2
> 
> Best regards,
> --  
> Christopher Griffin <christophergriffin05@gmail.com>
> 
> 

Reviewed-by: Baochen Qiang <baochen.qiang@oss.qualcomm.com>


