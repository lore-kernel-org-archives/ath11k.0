Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 39A1BF433D9
	for <ath11k@archiver.kernel.org>; Thu, 16 Apr 2026 03:04:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=PhyfmB/I1JxtZ6CxSCKa3GHo7DPMkzT00WCUD2ZWGTQ=; b=GEYP8h9r4erEC8ETlVyn+09c34
	SasVgfFjsarbwHx8uvI6mjBhZgxjRffAfs5xgEmxfBnkVKQXOAbM4PTMUPULlJfg3ykZvMYNtBFvy
	tkciDBSsfPLy9D+GrTid0ZNaGcjUn6C4WlRZ0gZpoR8WpJXdC5WEsVYIYq8CR1ncFshwNu96ae9gu
	t3hDRFTos2vaKDqgnlUt9CwkLrciajg/5BgTd0VfGQs9Gjmn0oGAwgSz3KtJ8KU46CaM5lJgeLLQ8
	trnb16XZ/9RQRTJvtzPfqF4hhKXn+YPsCYpoxV910T5O6xl70/QWL8OD2Diy0OJQG0HO38N+P915W
	xkGveVPA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wDD23-00000001tvH-0DgN;
	Thu, 16 Apr 2026 03:04:43 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wDD20-00000001tut-1yNL
	for ath11k@lists.infradead.org;
	Thu, 16 Apr 2026 03:04:41 +0000
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 63G0nOTZ3734339
	for <ath11k@lists.infradead.org>; Thu, 16 Apr 2026 03:04:39 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	PhyfmB/I1JxtZ6CxSCKa3GHo7DPMkzT00WCUD2ZWGTQ=; b=bWZCpz+2lsjo2imB
	qOaQh/AOL5McMV4waeJbUHZ7Tt08a6s38pJ1QnBTmxru3jvcJOMz7N6xyAnBPuRq
	LQTc89IJcNvcBFjph/dgsv3UCtdbBJDzwOo6wMgwq3KVkCv0llMjRmg+yy+4TuCW
	tkzBF+R64uwxTd8u58Tf6w8yux3otIoD4ukYrYSV54dawvuMpU3b2QX3lsOe7Txa
	VS7kM7TWdBdBUiD2QCfF4N8UUvx6g1jQcQcuqjlnL1Wi2h5pTD3A2X6MoM6ZFGUt
	ph9TePzdMx06MtZl69uJaizIxWoiP7a4eqvVPacfryDtGrwrpY2cZlC9KcOLlJVk
	jGpeRA==
Received: from mail-pf1-f197.google.com (mail-pf1-f197.google.com [209.85.210.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4djcqwj4hv-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <ath11k@lists.infradead.org>; Thu, 16 Apr 2026 03:04:39 +0000 (GMT)
Received: by mail-pf1-f197.google.com with SMTP id d2e1a72fcca58-82a77f807e4so7815259b3a.3
        for <ath11k@lists.infradead.org>; Wed, 15 Apr 2026 20:04:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1776308679; x=1776913479; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=PhyfmB/I1JxtZ6CxSCKa3GHo7DPMkzT00WCUD2ZWGTQ=;
        b=ZicrXvpdXlRelVeU0bkjsXbNDFaSx6PHN5pSa+E8iAKvRKnRrAfBDOSXFhdqvg8mTO
         CStyKm+fnAgBqMJbw11GuLLNX8+lgHTicl3T3SlwToHmxzkrjF7HPTxOfA2tptS5Odwe
         KPMDC7PkxHdPu65LMJ5nN+Wji/zI/oLxsRglyLKdvFDfZGP7/sTAp7EKfonG7f2sPNGk
         eejgDFNyM7NuwDTuj0CIJhB/2knKvriCFI8jRnepD1NB19l6GNlDW0V+tl11ma8P+vkP
         DilcTMj4c6uhf3l7QIuzhlm5yPmZHVBnlPbjhcfu3noljNBAmQPUYu+TqqmDyo2tFBUH
         pGMg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776308679; x=1776913479;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=PhyfmB/I1JxtZ6CxSCKa3GHo7DPMkzT00WCUD2ZWGTQ=;
        b=HtJL9M/5a1/icZoY9xuJ3wi6HTgeWa2z3o4v/6UXsyYxcff6nt3AFYGNBCYBrK/w8j
         H5sRR4N4tFXeB3785BqCEG5aWsp8/xhSkd7mkWEZhejj4Btn6MTJC/u0Ro3bDxOmHx9G
         AHLzBa61szZPrubTumAAs11Jcjbdj+yWlIueTzm9bJT/INDSBwd7SUzi5J7m1JTiqt93
         KG3zg9HCPn5wGJCpjDzu1z0tnWeTaxx5rErH9MWi+5l5BTepnlnREQunQN8e9SPjiRzg
         uatLLZ5m7p7hAi5qGxZ0iO49iCEb0NwzK6UKc8jrtPT27yqi6rN4368S/dCATO54Y0F3
         5aKQ==
X-Forwarded-Encrypted: i=1; AFNElJ98+T60H+o3LkirhCddJFtPM9iccMLBkqcIrLxm9hF3jeVfcIQzr1wfDOEkhJNfttJVjO7EEIg=@lists.infradead.org
X-Gm-Message-State: AOJu0Yyu/TaSmHPjgnF+tCkt4hmQTeSejF01Cshz7lJbF1B+pJtQf8jG
	H3xBgU2eom1X2XTPJszVjnf5vQKBEiYzWhhoG8ACQYh6//BL1I3FtEEkS1OWs8zua8oQdV6/49y
	WtjlTCt85ocpWwxBEKERiP3Ga7xcSOTHAgIBvi3ks8IMmtUFHyvPhFDdDC3mXENre
X-Gm-Gg: AeBDiesk6ZZV7VgsYeAZdQe1vLqMJoWrRUT1UNLCkbokTQ0BytObWE4gxPOrKwicriO
	allIYulm68jwWcFfcMGyXfAtQdqbymD+lo0cWFJM4s+XVXPvgDP3dw+LlZWEvTz/vEMl75Xpxr4
	oRmpe576Ijc3rVLKW5+8jN9lklh+ay7eUtWr82GKMx/G1StxI9VHWInJ45o2JBDRyovftfHHCqW
	HTpCkUTa4CXoQdmlw1t/JKBTIE4gHTC1uovDpQ9g7jIy0kwS9UMxDysGHpELudIWEJbACy9oLEx
	80KdHu7KOT38kpY9H0ygE8UEkiJIwCWVBeF/L+nIFF0yX5lfNg20UGxRhd5m1rMXdaPHuAPfNBv
	2lWVI4aUmgwP2Y26gEcvJq/b7p1naNPYKLIggW98OypX/7Hny18PlIunVEkHTdf+llGzukQLbbj
	R7/V7j8MXC9NNsr+mLCq+hMyCi6D86nQ==
X-Received: by 2002:a05:6a00:4197:b0:82a:17b6:53ca with SMTP id d2e1a72fcca58-82f0c2c2413mr24531229b3a.38.1776308678859;
        Wed, 15 Apr 2026 20:04:38 -0700 (PDT)
X-Received: by 2002:a05:6a00:4197:b0:82a:17b6:53ca with SMTP id d2e1a72fcca58-82f0c2c2413mr24531206b3a.38.1776308678349;
        Wed, 15 Apr 2026 20:04:38 -0700 (PDT)
Received: from [10.133.33.118] (tpe-colo-wan-fw-bordernet.qualcomm.com. [103.229.16.4])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-82f67416319sm3459347b3a.46.2026.04.15.20.04.36
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 15 Apr 2026 20:04:37 -0700 (PDT)
Message-ID: <85c4d942-39f3-4cb3-93f1-29f932387e70@oss.qualcomm.com>
Date: Thu, 16 Apr 2026 11:04:34 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] ath11k: fix peer resolution on rx path when peer_id=0
To: Matthew Leach <matthew.leach@collabora.com>,
        Jeff Johnson <jjohnson@kernel.org>
Cc: linux-wireless@vger.kernel.org, ath11k@lists.infradead.org,
        linux-kernel@vger.kernel.org, kernel@collabora.com
References: <20260415-ath11k-null-peerid-workaround-v2-1-2abae3bbac16@collabora.com>
From: Baochen Qiang <baochen.qiang@oss.qualcomm.com>
Content-Language: en-US
In-Reply-To: <20260415-ath11k-null-peerid-workaround-v2-1-2abae3bbac16@collabora.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: As8kPlVeERlKV286bXn5YrKE8bu5_G2q
X-Proofpoint-GUID: As8kPlVeERlKV286bXn5YrKE8bu5_G2q
X-Authority-Analysis: v=2.4 cv=XOIAjwhE c=1 sm=1 tr=0 ts=69e051c7 cx=c_pps
 a=rEQLjTOiSrHUhVqRoksmgQ==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=IkcTkHD0fZMA:10 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22
 a=bC-a23v3AAAA:8 a=QX4gbG5DAAAA:8 a=VwQbUJbxAAAA:8 a=JfrnYn6hAAAA:8
 a=99YSq4wlOxbdC3gg6PwA:9 a=QEXdDO2ut3YA:10 a=2VI0MkxyNR6bbpdq8BZq:22
 a=FO4_E8m0qiDe52t0p3_H:22 a=AbAUZ8qAyYyZVLSsDulk:22 a=1CNFftbPRP8L7MoqJWF3:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDE2MDAyNiBTYWx0ZWRfX9GI/eVoKVnhZ
 Gxjf/EVQCAMZ/WfHVGlH4byCGuLLOTbHuj2HNEI+PreSFNlj7ihypNVN3djTvy0cPMOEdNGrqXZ
 7RicXSEC5VS7p9WWLHh5wL1WJxzA+tyz/kaYCM5F2ZPMkti0OgWJQGCUuMDYcDKBajPhpK0rYZw
 9ZL0qT55la9+oAMLDSEXqhipRlyrk4rCpNRI2yqiCuJFL7siRAfa5ImGsEeq2deU6970GFhdV2A
 y7TGF2iVNzoflelzaYMexFsICjwQWJqWIOzBIaJiyXVfngY8d8x32ZHsOd2l0SPlGA6FOOg6olR
 LlYSAdgO4QYQ2k4JBhfHPGv+FDfKG9jVsS0euhZ/MXnuPwcYudhOqqQ3z5e3RTtRCbjR37lIg/4
 2ULXCz4njWciGgv+/RXNY13HSsYFasRVBSLtCyM+eJjMEgvmbxjrE9EpLAwACI8UZSKo4eJHr54
 g3LRfvixhSdi9buR9Zw==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-16_01,2026-04-13_04,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 adultscore=0 suspectscore=0 spamscore=0 malwarescore=0
 bulkscore=0 impostorscore=0 phishscore=0 clxscore=1015 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2604070000 definitions=main-2604160026
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260415_200440_519348_06D77E0B 
X-CRM114-Status: GOOD (  25.18  )
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



On 4/15/2026 7:39 PM, Matthew Leach wrote:
> It has been observed that on certain chipsets a peer can be assigned
> peer_id=0. For reception of standard MPDUs this is fine as
> ath11k_dp_rx_h_find_peer() has a fallback case where it locates the peer
> based upon the source mac address.
> 
> However, on an aggregated link, reception of AMSDUs results in the peer
> not being resolved for the second (any any subsequent) sub-MSDUs due to
> the peer_id guard in ath11k_dp_rx_h_find_peer(). This causes the

it is necessary to point out that the mac address based fallback does not work for those
sub-MSDUs as well, since the mpdu_start descriptor from where mac address is obtained is
not populated by hardware.

> encryption type of the frame to be set to an incorrect value, resulting
> in the sub-MSDUs being dropped by ieee80211.
> 
> ath11k_pci 0000:03:00.0: data rx skb 000000002f4b704d len 1534 peer xx:xx:xx:xx:xx:xx 0 ucast sn 3063 he160 rate_idx 9 vht_nss 2 freq 5240 band 1 flag 0x40d1a fcs-err 0 mic-err 0 amsdu-more 0 peer_id 0 first_msdu 1 last_msdu 0
> ath11k_pci 0000:03:00.0: data rx skb 0000000038acd580 len 1534 peer (null) 0 ucast sn 3063 he160 rate_idx 9 vht_nss 2 freq 5240 band 1 flag 0x40d00 fcs-err 0 mic-err 0 amsdu-more 0 peer_id 0 first_msdu 0 last_msdu 1
> 
> This patch removes the null peer_id check in ath11k_dp_rx_h_find_peer(),
> allowing peer's with an assigned ID of 0 to be resolved.
> 
> Signed-off-by: Matthew Leach <matthew.leach@collabora.com>
> ---
> Changes in v2:
> 
> - Since peer_id=0 is a valid condition on some chips, remove the guard
>   that prevented the peer lookup.
> - Link to v1: https://patch.msgid.link/20260326-ath11k-null-peerid-workaround-v1-1-0c2fd53202f8@collabora.com
> 
> To: Jeff Johnson <jjohnson@kernel.org>
> Cc: linux-wireless@vger.kernel.org
> Cc: ath11k@lists.infradead.org
> Cc: linux-kernel@vger.kernel.org
> ---
>  drivers/net/wireless/ath/ath11k/dp_rx.c | 3 +--
>  1 file changed, 1 insertion(+), 2 deletions(-)
> 
> diff --git a/drivers/net/wireless/ath/ath11k/dp_rx.c b/drivers/net/wireless/ath/ath11k/dp_rx.c
> index 49d959b2e148..ff2c78a4e5f3 100644
> --- a/drivers/net/wireless/ath/ath11k/dp_rx.c
> +++ b/drivers/net/wireless/ath/ath11k/dp_rx.c
> @@ -2215,8 +2215,7 @@ ath11k_dp_rx_h_find_peer(struct ath11k_base *ab, struct sk_buff *msdu)
>  
>  	lockdep_assert_held(&ab->base_lock);
>  
> -	if (rxcb->peer_id)
> -		peer = ath11k_peer_find_by_id(ab, rxcb->peer_id);
> +	peer = ath11k_peer_find_by_id(ab, rxcb->peer_id);
>  
>  	if (peer)
>  		return peer;

the other instance in ath11k_hal_rx_parse_mon_status_tlv() is missed.

> 
> ---
> base-commit: f338e77383789c0cae23ca3d48adcc5e9e137e3c
> change-id: 20260326-ath11k-null-peerid-workaround-625a129781b1
> 
> Best regards,
> --  
> Matt
> 


