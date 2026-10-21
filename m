Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9EC03606A319
	for <ath11k@archiver.kernel.org>; Wed, 21 Oct 2026 10:52:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=hXuLSjVQ;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=Iv7YLnqi;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=H+vMGr8o
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=U8sTz8ypwYRszYEXhOMC86ERxreYQ5qPpp33bSNuyec=; b=hXuLSjVQJIe+dprnCeeuumU1LL
	hh8fFHcbSbYXU4yZk0i2+poFDtYz49SAQpdZM19mXU3Yog19sZMc521DHp7nph53ZzCa5SqPAKef2
	pnbPRJI0KKwxQPsy/i78PLHN4o2bzqaI+l8ehKtmOuWyhlUW8ziul001GsldOeT+Ew3wMuPKMs1SX
	S+W8lbvwjsZAsYrEifktvwcPUdW4FO10dve7BIzOqlnz+LW9ssTQdWd+e2nPig2N5FxOZgb8SW67O
	0VO0q8Ea81AXvW7RoU7Gchpy3d0ljHEbSEj9zUvjeEtjUIQAEEZV9jfw/uI1QpH95V4syuzhsvdCT
	AeKkEwOQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xJTvL-0000000BemM-1JJ5;
	Wed, 21 Oct 2026 10:51:59 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xJTvI-0000000Beju-0toS
	for ath11k@lists.infradead.org;
	Wed, 21 Oct 2026 10:51:57 +0000
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69LA63pw768669
	for <ath11k@lists.infradead.org>; Wed, 21 Oct 2026 10:51:55 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	U8sTz8ypwYRszYEXhOMC86ERxreYQ5qPpp33bSNuyec=; b=Iv7YLnqiBwxEFUId
	Awqtb3JfxOY/lFXPR0NvJ3eOCnMGVkKAtewej7eI8WKyEKEt4C6Omq+FE0C9yp/h
	m+0QQrR+k+Hpyvngu6w4dR1ef+mvzKGh0jqLqafRFCpwYJnSKMLOlYr7LEo85SSe
	jU7nDaw/e+N6dpG1ntYtVeSvXSmV+xOr/aabyQvur55OgbEKMj8MxEQN9cNfzsGl
	kijzG32IVJADhOK3+oP7l+rxsn3Liv3OMflXjwXhWijmqxJMC66aNtNLktyCVDoI
	YY4ZJ+YneqCZ+Me+uqxubkV6Wczhj8oniUj4IfgwMxYkeYprHu5vM6IqFc5aahsr
	9hellg==
Received: from mail-dy1-f197.google.com (mail-dy1-f197.google.com [74.125.82.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hegs02s2a-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <ath11k@lists.infradead.org>; Wed, 21 Oct 2026 10:51:54 +0000 (GMT)
Received: by mail-dy1-f197.google.com with SMTP id 5a478bee46e88-36637676140so1036007eec.0
        for <ath11k@lists.infradead.org>; Wed, 21 Oct 2026 03:51:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1792579914; x=1793184714; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=U8sTz8ypwYRszYEXhOMC86ERxreYQ5qPpp33bSNuyec=;
        b=H+vMGr8o//hfurjduNQ42gNt99YDaChjLacfdK1Zc/tsi6PzGKJ0O9vzA/uaf7B3yz
         qEPZhzdau28SgamqkNYu++ngXHRUy/QT3o8tUz2XdU/bDb69bjDXqt47o37QzsRNWIt3
         T2jojb2Ni2+G1FJNAZ3dTGGo/NFWdns0trQNxIHp6h72H/y+V5cTOjVkgDwwWCvM7n90
         vsbM0NTZshul3Aj5gWp/AXRg/CqjGUGOdc6paqtjjbC+lxNRAn84oD3rhdgATLA/p8/5
         gtwbekMMCm/czbcSk3IAVgzt4j1Z9CAL347qnwVhQGP0+qSG+kk0UGo56eQ3Cfu/EzUj
         WUXg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792579914; x=1793184714;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=U8sTz8ypwYRszYEXhOMC86ERxreYQ5qPpp33bSNuyec=;
        b=Fxe4ynAPqRWJr+8upufHf39lad5gVpOC2pr0ZRKW1F4dguAb4/xzAxGssCNYIxzouJ
         6+NF5MC5u3VSW/66reGXNLB9Tjf7g9T0dKLshDw9W8Ffx5dUEjiSn2MlbAHBwQ4tEHU1
         +ZlF4p2TurQFBrhJjncNd6MdWEM13eIT8nHjupeqdTpJvwanUG0bIN2QqyPoblcp0/Us
         xG5WPZDt6JGzVMOeLVbXkS/f/GCaU/DjVWXJfuWB3OQVUT2GZnjlPpKYNAIRBYqThG9l
         qCKE5ldT11+vRgNGJs7dCl+hTpnrNPCI9YwEmd+Eu0tKGxNO31XUpdPRl4Hwzd1al4uN
         OoVg==
X-Gm-Message-State: AFq9FYLO0Bq5jrmOb5nUeETy8wxyD/fv1fRPKeuYTjqCUQYWeJK2ReKz
	acyLc6lcSZ2UYFML/Scpilzr/Gk/rZCAxSTTIsY12YveS4j+y0iiEO5Kc37v460EfLxmfnY80VI
	yT5PRm3aB5BRPZ++w+LuhwaUsur4Fc+eaLumHslGFS3PqfJ+BwK+xgL6y0IJARZ8V
X-Gm-Gg: AYBFou0xOQDDdOw9mc+SddzmyAMgyy7jgRga5M34FPlNkZotPY/tg7DmiVLEZNbtX+9
	Nl/J+y6S2f1Q1E/IZX9smGPtB3lsCunejg078Z/03+XZzfLODN5SYOFmjBtZ7Vt+Rpav1Ud94hj
	xn3VLluDEbsHv/qLvIroYA2shgA0pFl7AQ/+26tBy4M0chyrTVPlAYR0FtDvOlgE6US2rA6nszA
	MTqrUZmvRKXwnFXq4Odx94IzMABzhktCYmhHposVtzLxdrHrTkMkX01XFoV89noRcjz52ZccTQm
	8rlgyp0OTDpx4ehE494A4hF/CfdGqJFmLJInuUlrsAn7l3V8pynqkpU77hPtvOsD6+un0KNucpH
	cZxIdbsUqQzoVUnRPXy9AXa7kTKA+LLtv1Vf1W/Ii
X-Received: by 2002:a05:701b:4189:20b0:144:fa58:95d8 with SMTP id a92af1059eb24-190a599a3b9mr2307169c88.27.1792579913629;
        Wed, 21 Oct 2026 03:51:53 -0700 (PDT)
X-Received: by 2002:a05:701b:4189:20b0:144:fa58:95d8 with SMTP id a92af1059eb24-190a599a3b9mr2307151c88.27.1792579913031;
        Wed, 21 Oct 2026 03:51:53 -0700 (PDT)
Received: from [10.152.199.23] ([202.46.23.19])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1903a275026sm8216367c88.5.2026.10.21.03.51.50
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 21 Oct 2026 03:51:52 -0700 (PDT)
Message-ID: <b5fc72a1-71c9-418c-95b1-897a62f0c6c0@oss.qualcomm.com>
Date: Wed, 21 Oct 2026 16:21:48 +0530
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] wifi: ath11k: apply the 160 MHz NSS ratio to the radio
To: Julius Bairaktaris <julius@bairaktaris.de>, jjohnson@kernel.org
Cc: ath11k@lists.infradead.org, linux-wireless@vger.kernel.org
References: <20261011123631.1664734-1-julius@bairaktaris.de>
From: Rameshkumar Sundaram <rameshkumar.sundaram@oss.qualcomm.com>
Content-Language: en-US
In-Reply-To: <20261011123631.1664734-1-julius@bairaktaris.de>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=S/NMU4sP c=1 sm=1 tr=0 ts=6ad8994a cx=c_pps
 a=Uww141gWH0fZj/3QKPojxA==:117 a=j4ogTh8yFefVWWEFDRgCtg==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22
 a=VwQbUJbxAAAA:8 a=WNuFRqQ0kxZQpcAD2SsA:9 a=QEXdDO2ut3YA:10
 a=PxkB5W3o20Ba91AHUih5:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDIxMDA0MyBTYWx0ZWRfXywkgH6bSSlhp
 BN/CU7musyBeoN+wPYVn5xxHiMNfMNf/H4NyXehCXrSldx02ZB4xLiwspt9VZgQGMxUwaOZGT8r
 Ec+3lOzPZBFL8I1QjMjbQ5vBZLw4vNR9KxyPIdcEh6FFxEIlfjY+Y1wt2QES2t7ei6RXYZUBNlj
 vQKIaWS1UWaCjyfy3xXD2F3mOGso23obqo8uuHCBpS1BmESd3I559QMNCgLme77BigvqQg+IOUx
 YPczSUFHSh2dd9eMMHSyLwowwhjqMPBbBs9kMnszhD90ijm5qgYIk/HJp0/dQK1CK+jqoV3IL6W
 f0d9BWcsEOfLgaJZTyL4F5oSR5KVygpgUgQcgf8Dl0OQpDB8Hq2aJB8r7u92uxdj2hbpxElvqZr
 5v5kzV7MdiZwrBfyyms6L/DOx+hsSZILNPdFlNNvDY7D2nhLv418YE/YuKNsEMloYe/ooo2/38m
 nUTWBKNsqsGmU6YVRrg==
X-Proofpoint-ORIG-GUID: tX4hOulSeArbXihPSBj49PVRz_o3bxjW
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDIxMDA0MyBTYWx0ZWRfX/oQttzst6Ebt
 XAu2ZsiY/Sr0mQNZ3kJ9Y5t0LDsio8LxZtk8Bhhtj+f2H1ncaa3h5HUlOfHd3VZKeZ9QIUUgbZw
 jvpipI4aIaaUisElmA3wHL6U5yBMGvo=
X-Proofpoint-GUID: tX4hOulSeArbXihPSBj49PVRz_o3bxjW
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-21_03,2026-10-19_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 clxscore=1015 priorityscore=1501 spamscore=0 bulkscore=0
 lowpriorityscore=0 malwarescore=0 phishscore=0 impostorscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610190000 definitions=main-2610210043
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261021_035156_381199_D22824CC 
X-CRM114-Status: GOOD (  22.63  )
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
X-Spam-Status: No, score=-17.7 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1
	autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On 10/11/2026 6:06 PM, Julius Bairaktaris wrote:
> The firmware reports the NSS a radio supports at 160 MHz as a ratio of
> its 80 MHz NSS. Peer assoc applies that ratio to the peer's NSS instead,
> so on a radio with a 1:2 ratio a two-stream peer is sent one stream at
> 160 MHz. The HE 160 and 80+80 MCS maps copy the 80 MHz map, so a
> 4-chain radio with that ratio offers 4 streams at 160 MHz where it
> supports 2.
> 
> Take the 160 MHz NSS from the radio's TX chains, as ath12k does since
> commit a82ce08775bc ("wifi: ath12k: add extended NSS bandwidth support
> for 160 MHz"), and limit the 160 and 80+80 MCS maps to the ratio when
> the firmware reports one.
> 
> Tested-on: IPQ8074 hw2.0 AHB WLAN.HK.2.9.0.1-02146-QCAHKSWPL_SILICONZ-1
> 

Fixes: ??

> Assisted-by: Claude:claude-opus-5-5

The model-specific "Claude:claude-opus-5-5" attribution may no longer be 
required according to the newer guidance - 
https://www.kernel.org/doc/html/latest/process/coding-assistants.html#attribution

> Signed-off-by: Julius Bairaktaris <julius@bairaktaris.de>
> ---
> On a Xiaomi AX3600 (IPQ8071A, 4-chain 5 GHz radio, firmware reports
> WMI_NSS_RATIO_1BY2_NSS), `iw phy` lists 4 streams in the HE 160 MHz
> MCS sets without this patch and 2 with it.
> 
>   drivers/net/wireless/ath/ath11k/mac.c | 24 +++++++++++++++++-------
>   1 file changed, 17 insertions(+), 7 deletions(-)
> 
> diff --git a/drivers/net/wireless/ath/ath11k/mac.c b/drivers/net/wireless/ath/ath11k/mac.c
> index c1fa42edd3630..6cd163cab9bd7 100644
> --- a/drivers/net/wireless/ath/ath11k/mac.c
> +++ b/drivers/net/wireless/ath/ath11k/mac.c
> @@ -2278,7 +2278,7 @@ static void ath11k_peer_assoc_h_vht(struct ath11k *ar,
>   
>   	if (arg->peer_phymode == MODE_11AC_VHT160 ||
>   	    arg->peer_phymode == MODE_11AC_VHT80_80) {
> -		tx_nss = ath11k_get_nss_160mhz(ar, max_nss);
> +		tx_nss = ath11k_get_nss_160mhz(ar, ar->num_tx_chains);

seems ath12k has same issue for VHT care to fix it ?

>   		rx_nss = min(arg->peer_nss, tx_nss);
>   		arg->peer_bw_rxnss_override = ATH11K_BW_NSS_MAP_ENABLE;
>   
> @@ -2588,7 +2588,7 @@ static void ath11k_peer_assoc_h_he(struct ath11k *ar,
>   
>   	if (arg->peer_phymode == MODE_11AX_HE160 ||
>   	    arg->peer_phymode == MODE_11AX_HE80_80) {
> -		tx_nss = ath11k_get_nss_160mhz(ar, max_nss);
> +		tx_nss = ath11k_get_nss_160mhz(ar, ar->num_tx_chains);
>   		rx_nss = min(arg->peer_nss, tx_nss);
>   		arg->peer_bw_rxnss_override = ATH11K_BW_NSS_MAP_ENABLE;
>   
> @@ -5940,7 +5940,7 @@ static void ath11k_mac_set_hemcsmap(struct ath11k *ar,
>   				    struct ieee80211_sta_he_cap *he_cap,
>   				    int band)
>   {
> -	u16 txmcs_map, rxmcs_map;
> +	u16 txmcs_map, rxmcs_map, txmcs_map_160, rxmcs_map_160;
>   	u32 i;
>   
>   	rxmcs_map = 0;
> @@ -5958,18 +5958,28 @@ static void ath11k_mac_set_hemcsmap(struct ath11k *ar,
>   		else
>   			rxmcs_map |= IEEE80211_HE_MCS_NOT_SUPPORTED << (i * 2);
>   	}
> +
> +	txmcs_map_160 = txmcs_map;
> +	rxmcs_map_160 = rxmcs_map;
> +	if (cap->nss_ratio_enabled) {
> +		for (i = ath11k_get_nss_160mhz(ar, ar->num_tx_chains); i < 8; i++)
> +			txmcs_map_160 |= IEEE80211_HE_MCS_NOT_SUPPORTED << (i * 2);
> +		for (i = ath11k_get_nss_160mhz(ar, ar->num_rx_chains); i < 8; i++)
> +			rxmcs_map_160 |= IEEE80211_HE_MCS_NOT_SUPPORTED << (i * 2);
> +	}
> +
>   	he_cap->he_mcs_nss_supp.rx_mcs_80 =
>   		cpu_to_le16(rxmcs_map & 0xffff);
>   	he_cap->he_mcs_nss_supp.tx_mcs_80 =
>   		cpu_to_le16(txmcs_map & 0xffff);
>   	he_cap->he_mcs_nss_supp.rx_mcs_160 =
> -		cpu_to_le16(rxmcs_map & 0xffff);
> +		cpu_to_le16(rxmcs_map_160);
>   	he_cap->he_mcs_nss_supp.tx_mcs_160 =
> -		cpu_to_le16(txmcs_map & 0xffff);
> +		cpu_to_le16(txmcs_map_160);
>   	he_cap->he_mcs_nss_supp.rx_mcs_80p80 =
> -		cpu_to_le16(rxmcs_map & 0xffff);
> +		cpu_to_le16(rxmcs_map_160);
>   	he_cap->he_mcs_nss_supp.tx_mcs_80p80 =
> -		cpu_to_le16(txmcs_map & 0xffff);
> +		cpu_to_le16(txmcs_map_160);
>   }
>   
>   static int ath11k_mac_copy_he_cap(struct ath11k *ar,

Actual changes looks fine to me
-- 
Ramesh

