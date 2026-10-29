Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1DAEF606A31A
	for <ath11k@archiver.kernel.org>; Thu, 29 Oct 2026 01:54:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=D5mx3riJ;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=hEUUBp9V;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=d6+KBldA
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Cc:Content-ID:Content-Description:Resent-Date:Resent-From
	:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=49SeZ333tsPITIB8snkOI59M7shf/qo0S4AZopCi6y4=; b=D5mx3riJyjmCJV
	KxRauQc1o3yC94ZlYxSijExjC11zkeootzF3+IDvTTTCLy9vZ8ZEccK1W2QmNVZPdXx1YCTUUSs4B
	P5fWagI2gMBdr4l/6QqlhJmmLtDBt7TSS4pNJwPKKepUkfnBLvdwwATUS0QKlgSump6AaQUs4633u
	IifBoIo8fmNW3fy3eiwsg2NiYYjIbRhuGcbF3PlzY7DwY2GBS57DMsC7bV3ntrXNjWh0RXI2+nOPm
	N2j2x0YMu2InaPZbJvsGg8xjQyWR0GfQgiOxf+5hksXrpF3Z4ZdwtMMZVQNaWd6cjVkzatle8+fpr
	sL5tWIodopcL8yGWri1g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xMFLF-00000008AGv-0Awv;
	Thu, 29 Oct 2026 01:54:09 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xMFLC-00000008AGF-38U6
	for ath11k@lists.infradead.org;
	Thu, 29 Oct 2026 01:54:08 +0000
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69T1jcdS2842181
	for <ath11k@lists.infradead.org>; Thu, 29 Oct 2026 01:54:05 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	49SeZ333tsPITIB8snkOI59M7shf/qo0S4AZopCi6y4=; b=hEUUBp9V+fVsVHlJ
	pJ3AL3HGzUS7sYV8sj0idLPd2RHUYay7AJSUEGL3VVdbF2piXm4GJndl8C7KkaJO
	5hJNs5NjH2RrkYi2UHhWYDoQZzyO+kR00gWFVhfm/PiPutgc6vYmEEBOYQU3qf8B
	pp552ade0Xn/cw9l3Om6fJBubtHyJlYhWeQChbOOt4pemsFw82gFTJNg8lUN6uD/
	QRPEW5Dd6Q1bJms+oDKnNniG5xNCXrryFnv6V9a29fp3Bph8O7nQh36r572f7QlG
	qrAlKdi8UHMKAZxq9k7YLst6em2/qa9T+H+dvRxtpDwKZPL+rnLnV62BEXUZBG74
	m5+b+A==
Received: from mail-dy1-f199.google.com (mail-dy1-f199.google.com [74.125.82.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hkfehkdcg-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <ath11k@lists.infradead.org>; Thu, 29 Oct 2026 01:54:04 +0000 (GMT)
Received: by mail-dy1-f199.google.com with SMTP id 5a478bee46e88-36998507c13so2392596eec.0
        for <ath11k@lists.infradead.org>; Wed, 28 Oct 2026 18:54:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793238844; x=1793843644; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :from:references:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=49SeZ333tsPITIB8snkOI59M7shf/qo0S4AZopCi6y4=;
        b=d6+KBldAe+kzD7Ydsdqnajqg6WsaerN3KY77ds1OzY2boitVUVwcxNO7PoLbaz87Qn
         e7n51XEy0Pnl6nseZlyBRC3d7HEmqjXGeMW2yt9OysO7HrLLmvfUEPYnvzCK+Bmo43ZW
         c6juG569mlwxWPj/QiGKyEYztR3YBMy6tRwHE8w41gRc7zUraZlsZc3R+b23oOWOqZFj
         mybn0JNvW9fjRKD0bvdj4BuAd/SsYJ+u33JJBzG3PiHa6Za+4YD6y+injlFBdQJhc1CN
         SpRqIB4SVkhHMRLaxES0hjMnezrRrF7sF17qmpxjzerszOjura3ONXh7ppfcqErlG9B9
         0S3g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793238844; x=1793843644;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :from:references:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=49SeZ333tsPITIB8snkOI59M7shf/qo0S4AZopCi6y4=;
        b=h6vmMUXSTrhYZCTQ1dMFoJhRwefeQqZL8+z9z1Vh7l7H48NiaJ4DPAo/I2I6/Oy3gO
         wInk+rdc2m7kUHaxQwIbmNsnb9K5lnyxZ4WvFOSvY9yKRtETyMgILjJi1lmKvYuTFnvv
         T8+UrAw1xzDmNWXFI8RBif42OmdngzoKIM+k98LwUwjhSNYeBXKHT6my5hPmKzDwWymn
         bLDIPnI4QWSbn49Oh+bbKtUpnAZlbvQ1XQBuY321if+oneKNS5lFtGDpk+6NakmVK76y
         mbHzDS1zrws8BiKuWDCAf3wIkjsHHvLLGbnW9N6a7y/BeE3hu0oGaBJDUTof33kuP24t
         wcGA==
X-Forwarded-Encrypted: i=1; AKwUvBw5tk6AoNAQhRAbomeQg/wsBzHP5xBMARJPV2pu90+9U1MUbilOOAslvcumnJlcIC6nJTfuPuo=@lists.infradead.org
X-Gm-Message-State: AFq9FYIZL1KEU9vEwIHKeDrPRuItHD23Xr+dTTCxoGDC2IhcOpjTSQlH
	fXgSh7GyB4YlfYZ094NZBkfwQR9wDEFMYj8lwMjE1M4aReMUjHfOgeR2920yTVVaCQVGojZzwth
	bUACEmumhgjC6fL+ZEFyVCvF6HGybHd0ZoT8eEby/tvT2WgyRVkuWnhN+yKG8RPKS
X-Gm-Gg: AYBFou0ljHY/qeyBRw/h2j3NHV+AoIu+U9jMt4vhN9XZ8X2WFPNpAxOrDc9kTw1AbpI
	3q+i7+V+P4T31GGKvXMM3R2CWy9PR9CWiiky0EzvtCnXSRlad4M8Xe+wLXKWZfTkM1f4/AnH9XS
	yy6b92gxsb27cVmQiTgA4XkHljbdtXPw/OIKQJKMKiBiD3MO3Zcx+Yt0g+IMFkisnssYArEcKr2
	q3OqzaRozEpa6Ctyga0qCOifFft3QKkGiswQRmGt6JWs+m/Q3TX7wwY7LymJrmFHiinThbMjy7U
	12xa89hOV6eUIX2AHKtw7re8sKI4ZiWnZgbSIBomYc6+DIQ8TTJl//oBFY9sSK/K+hd5T0b1gM1
	kMoFZjV98oJBvOFnLYTidLdTBYNTcjgMyZIiGylO8TOR+49MlpR1cgr8NBiA4Ijnx6o1an0ibGI
	nL93BYtG8USwmRzI6TScmfVlBRiIjY7go=
X-Received: by 2002:a05:7301:1441:b0:369:f419:e7bb with SMTP id 5a478bee46e88-36a2042919bmr4915328eec.39.1793238843657;
        Wed, 28 Oct 2026 18:54:03 -0700 (PDT)
X-Received: by 2002:a05:7301:1441:b0:369:f419:e7bb with SMTP id 5a478bee46e88-36a2042919bmr4915292eec.39.1793238842901;
        Wed, 28 Oct 2026 18:54:02 -0700 (PDT)
Received: from [192.168.1.20] (33.sub-75-218-193.myvzw.com. [75.218.193.33])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-36a237bc445sm10671612eec.1.2026.10.28.18.54.01
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 28 Oct 2026 18:54:01 -0700 (PDT)
Message-ID: <ee500109-531f-4eec-be51-8bfa7b85c936@oss.qualcomm.com>
Date: Wed, 28 Oct 2026 18:54:00 -0700
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] wifi: ath11k: Reject short management RX frames
To: Jiale Yao <yaojiale02@163.com>, Jeff Johnson <jjohnson@kernel.org>,
        Shashidhar Lakkavalli <slakkavalli@datto.com>,
        linux-wireless@vger.kernel.org, ath11k@lists.infradead.org
References: <20260926114037.3231795-1-yaojiale02@163.com>
From: Jeff Johnson <jeff.johnson@oss.qualcomm.com>
Content-Language: en-US
In-Reply-To: <20260926114037.3231795-1-yaojiale02@163.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDI5MDAwNyBTYWx0ZWRfXwTOAmQwkBEFV
 hgLtHsZu3HWsQqB9lyqp8RWmCowCfomiLVvb6kgQT2tCGQ74C4j4dX66c10AH0L+8eoR92FWvjs
 lr6Vx3DIkgWKzJRnsVxlWfw3BcqJF/qT89iPrLYpJ4aoo/HE6MGWu4myIFsGGFIqAK3rua9nxwF
 oYkVHw6nXqVzYL06NGjuxn24ZQV3F6W8zI72PjxHPKTJDR9rIw+VSW2SbduKH+rJ7bJjgFwD6ow
 rHy1lXtvmqb1VNfNIG4rXLli3CfX0VUpQ50SxB4MJON4wt05ckNW7RBpVMTvwlzxqmgxZX+x4ke
 NB0aLBMgCaMGK5HyW7nQezJxtXLbpWW+kSV3l+IFWVOWOCitaOgkQP/CUkqkT09aEKg9+TbfqHe
 6FK9xD/LMau4c6ppwI3wxpIFib7QDV5/LMhU/OSdAwW+TscFHOXcusIw5RGBfNe5OB9nUqeBrZN
 /Canm3cWqCRVxlL+nnQ==
X-Authority-Analysis: v=2.4 cv=A/T5rKWG c=1 sm=1 tr=0 ts=6ae2a73c cx=c_pps
 a=cFYjgdjTJScbgFmBucgdfQ==:117 a=AnolQpdaNwb4XK4FG+QP+g==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22
 a=Byx-y9mGAAAA:8 a=s4eqi859e5GuDqKmwUEA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=scEy_gLbYbu1JhEsrz4S:22
X-Proofpoint-ORIG-GUID: T6iWsT9wJlEmpJUYyT3eQ6v860OkvDjd
X-Proofpoint-GUID: T6iWsT9wJlEmpJUYyT3eQ6v860OkvDjd
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDI5MDAwNyBTYWx0ZWRfX1wWcSN8jNiot
 aTQ7lvrQ11mPG4Ayna0GuBzNefou4nATt2FUl+87DKNkCMWIzL2iD0ZWTMX1UZdLzeuXnDAchXM
 pACE3Dj85/VQxS8/l93FmSo/o9crtrY=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-29_01,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 bulkscore=0 impostorscore=0 suspectscore=0 lowpriorityscore=0
 priorityscore=1501 malwarescore=0 clxscore=1015 adultscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610190000 definitions=main-2610290007
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261028_185406_902478_50024574 
X-CRM114-Status: GOOD (  18.60  )
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

On 9/26/2026 4:40 AM, Jiale Yao wrote:
> ath11k_pull_mgmt_rx_params_tlv() verifies that the firmware-reported frame
> length fits in the WMI event, but does not ensure that it can hold an IEEE
> 802.11 management header. It then sets skb->len to that reported length.
> 
> ath11k_mgmt_rx_event() subsequently reads frame_control and other header
> fields without another length check. A firmware event with a short buf_len
> can therefore cause an out-of-bounds read.
> 
> Reject frames shorter than a three-address IEEE 802.11 header before
> adjusting the skb to expose the frame.
> 
> Fixes: d5c65159f289 ("ath11k: driver for Qualcomm IEEE 802.11ax devices")
> Signed-off-by: Jiale Yao <yaojiale02@163.com>
> ---
>  drivers/net/wireless/ath/ath11k/wmi.c | 3 ++-
>  1 file changed, 2 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/net/wireless/ath/ath11k/wmi.c b/drivers/net/wireless/ath/ath11k/wmi.c
> index bbca275a8289..02cd9764b6fc 100644
> --- a/drivers/net/wireless/ath/ath11k/wmi.c
> +++ b/drivers/net/wireless/ath/ath11k/wmi.c
> @@ -5995,7 +5995,8 @@ static int ath11k_pull_mgmt_rx_params_tlv(struct ath11k_base *ab,
>  	hdr->tsf_delta =  ev->tsf_delta;
>  	memcpy(hdr->rssi_ctl, ev->rssi_ctl, sizeof(hdr->rssi_ctl));
>  
> -	if (skb->len < (frame - skb->data) + hdr->buf_len) {
> +	if (hdr->buf_len < sizeof(struct ieee80211_hdr_3addr) ||
> +	    skb->len < (frame - skb->data) + hdr->buf_len) {
>  		ath11k_warn(ab, "invalid length in mgmt rx hdr ev");
>  		return -EPROTO;
>  	}

If you're interested, my LLM says:
## Observation (out of scope, worth a follow-up)

`ath12k` has the **identical unpatched pattern** at
`drivers/net/wireless/ath/ath12k/wmi.c:6489` — same `skb->len < (frame -
skb->data) + hdr->buf_len` check with no lower bound, feeding the same kind
of header dereference. The sister driver likely wants the equivalent fix. Not
a defect in *this* patch, but a good candidate for a companion patch.


