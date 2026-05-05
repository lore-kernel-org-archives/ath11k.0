Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EF364CD3427
	for <ath11k@archiver.kernel.org>; Tue,  5 May 2026 15:09:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=UUDqieE/IWdoODK+rFR0jqaUdzYrej+t909RYtpowfM=; b=cyp/wBIFmJ4E2FPuftAgkkhbYV
	SAs5lMzq5YEEI/itV1v/RuhCBVNsg94JLlUErzliAjAXnUc0imWES/ayr3dapJyHywtSJbG59mi6U
	vYiTMznySzCQxbt/8q2r8ZdiGl5snpIM0burBvuHihe9Yn89XzSAzM6tOvWe/vHtgJFDpCyEn4Ln9
	jEuGKSEz/o4M3xKa8avm6Elf8Et4tluWfoMGlEBE66D2CTS5We7d6/0l7f9PTxmmyx6qMQThUZEye
	Ofo3MNbcXvXjf0KzdBSdKAQqR+iKzqRRDb0xExlSIy97yVOI+8+sVt324CovxdvOM7AGln++DR3Y/
	mndxHO5w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wKHOJ-0000000GcA5-3W1q;
	Tue, 05 May 2026 15:08:55 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wKHOH-0000000Gc8j-2TgA
	for ath11k@lists.infradead.org;
	Tue, 05 May 2026 15:08:54 +0000
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 645EKtge152031
	for <ath11k@lists.infradead.org>; Tue, 5 May 2026 15:08:53 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	UUDqieE/IWdoODK+rFR0jqaUdzYrej+t909RYtpowfM=; b=j8lbWzm00pGoSj+K
	CQa5wI8Ml3iKlftxUDJxFpSRmDLKctv0RzBaRYydW+QM5UQ47E8PqAB8KDk2t9xk
	P9NBvp4jNvsAh8jfskdZTeAMz1w0KTl8dkHILP9oOusY/jlXgVDS50NDO3WEZwfU
	CNEig4oHWNwVD7wpLXJ9j5fM5GULQ+NzVDZvguQlf3XuuMyX7dVW3cpPyZuTRWOu
	wEbuWXM4Z17XjZJ4AbShkKChcy02Z4Fkd2wDg/boQPPo62vApNLmANQ+6a2IqrLB
	4GMs5vRkmvNRa7g2IDY7SNhMxl3wEZl/8BMw17iWPfJo2Kd3++J6kZN4h0tp5kHi
	alYsRg==
Received: from mail-dl1-f70.google.com (mail-dl1-f70.google.com [74.125.82.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4dyj80870v-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <ath11k@lists.infradead.org>; Tue, 05 May 2026 15:08:52 +0000 (GMT)
Received: by mail-dl1-f70.google.com with SMTP id a92af1059eb24-12dc3d81736so3296524c88.1
        for <ath11k@lists.infradead.org>; Tue, 05 May 2026 08:08:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1777993732; x=1778598532; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=UUDqieE/IWdoODK+rFR0jqaUdzYrej+t909RYtpowfM=;
        b=Lj3FQqSdiwIrOHAf/aTR2N3kMnvKoM3KF5kh2koR7ULLWFX9H0Sn1HP0a7fVRNHIfz
         SpEncxeVHY36DVzzornoX2cWiuBL1DYMhoDbxCu7HWg7CBGZRpM+CJaWan6M3bIyXihU
         tOqeE+nArXS4uWG9RBNSOG5BEYMbnDzq9YN9QgmUoMPONtFK0SQjnzdmjsIvgmg7wjQ4
         MmVdC/iCeHjlvpZKcNcukB7uyg9tnG0MG65znDU4kJM//Zvc+yk32QSRNtLkkD5hVD7o
         Kzg9VbdZ2PNN/PyO75Rv3LdAuhwrotWLSIEb/hj5mR87E5bU4RY2WbUTAzLEwEIS6CkH
         bmFg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777993732; x=1778598532;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=UUDqieE/IWdoODK+rFR0jqaUdzYrej+t909RYtpowfM=;
        b=R7pyQvOkO48SoCwiwMDtpbk/Nbh6W8YKEPCI59xJbG1q4OKxZkAZ7Uc0ZWB9G62Ytl
         mrJnlzQQQO7+OUx5p61xRKUvavl04VpwuQ/fp+dsPRdY07d+FYc5ZyaZ1atj2d/XWK0n
         EjQNm4pgZV83ordJ5rTgVetF+eSHIRDomACD9p6/d2nHjqsPBKOiKnHnY8YMPewb+vo3
         EFcEw95GktyC69+TUFRyNKP0DB6fZeuTtRNzg3i3YnL7yivRY3572FTyr9fhF8nwOeFh
         bnrXs6CAhEAqlskUo1jMbY0+Qubm+YQfKkCTh8ovkIfKOiMqQG6PmkkjLw2QRQ1nrTvo
         1P5w==
X-Forwarded-Encrypted: i=1; AFNElJ/LvVhpC65gyAjLAiDA3jkmUNs1Sfvy6Ka7KtkSqT38lWu2YNfJePNzOEU+w2Tj8TbR5JHwP60=@lists.infradead.org
X-Gm-Message-State: AOJu0YztNRWxzj+u08sBroPqvmv/HgHIN3BsCoGPaxBVlJ6au5RnIyZk
	u7KtceVVPUU2ftdpdDlW4RrIOTokCp8O78fAUhf+OSb7REw9MtT4cLfPiK46Q+s2rTVAgjOIk8n
	JiQ8wOy0DmHHlPVDNsiZWdY7p2lO4aMn1wm995tlHRgWy7oKshyn8QN8motovjcrLB3TmMA0GC5
	w=
X-Gm-Gg: AeBDievbo3DxQR+EdN6qt4KjJxua0eMVg2uHkzqjncHG+jp1HhNVQINrO6FhItWncON
	0ftqTMKx3klVfUw7T6rx9U8ywq0Kn0BBGfWF2zF2JrydEbSOXYsMXxy79+1iwBMNjFpKDhnR6/R
	mZOsuDJWvpuFgFjucqRGCxJrxhxCOO6PDNsyTNw+2cdSvGRM6GIQraQEbkw9Yd+g6QsBMP0z4ui
	TQ0nGowUjO2mlEkWmwZnqVrvxLMgk31x01dd1CX/bUiYA4n/sh34pGwDk+ooIaTM2Rs6yQTMo3h
	pAfqqI2lRLxOblCPsRkPF+KW/lENAXROuh6fe+YDTduFlh2NZJJFV8IDY8IkOPf/SbH/LZs/41j
	opF1akTQdV5JAFgStSdP7ooIm83LYRKL1tzFUzynJhL8j9+8HC/TIxsjPE/Xf9SVgu5H/60VMe2
	AqNcwXnHATf0J5FGLC
X-Received: by 2002:a05:7022:1a85:b0:129:fe5:117e with SMTP id a92af1059eb24-12dfd81a7f9mr6952382c88.26.1777993731732;
        Tue, 05 May 2026 08:08:51 -0700 (PDT)
X-Received: by 2002:a05:7022:1a85:b0:129:fe5:117e with SMTP id a92af1059eb24-12dfd81a7f9mr6952357c88.26.1777993730933;
        Tue, 05 May 2026 08:08:50 -0700 (PDT)
Received: from [10.227.110.203] (i-global254.qualcomm.com. [199.106.103.254])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-12df828849dsm18042517c88.5.2026.05.05.08.08.49
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 05 May 2026 08:08:49 -0700 (PDT)
Message-ID: <7d3c5eae-233a-4c31-b64e-70f0afe74da6@oss.qualcomm.com>
Date: Tue, 5 May 2026 08:08:48 -0700
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] wifi: ath11k: fix use after free in
 ath11k_dp_rx_msdu_coalesce.
To: Willmar Knikker <willmar@met-dubbel-l.nl>, jjohnson@kernel.org
Cc: linux-wireless@vger.kernel.org, ath11k@lists.infradead.org
References: <20260505143025.234292-1-willmar@met-dubbel-l.nl>
From: Jeff Johnson <jeff.johnson@oss.qualcomm.com>
Content-Language: en-US
In-Reply-To: <20260505143025.234292-1-willmar@met-dubbel-l.nl>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=XvnK/1F9 c=1 sm=1 tr=0 ts=69fa0805 cx=c_pps
 a=SvEPeNj+VMjHSW//kvnxuw==:117 a=JYp8KDb2vCoCEuGobkYCKw==:17
 a=IkcTkHD0fZMA:10 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22
 a=9B1uR9gGAAAA:8 a=D8R_4z2wC1Y-3Iv41OYA:9 a=QEXdDO2ut3YA:10
 a=Kq8ClHjjuc5pcCNDwlU0:22 a=8R3p93Tjo66ouot214C2:22
X-Proofpoint-ORIG-GUID: pRKJC630KbHAAzw0350iicJGmvNBl3oe
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTA1MDE0NSBTYWx0ZWRfXx8M98Rj4PwcI
 LhhgaOnpS510MWwrCMczogUFWOJV3FNe4zdQGD4AMp1yp623PHeLLIF3wd7j//WoxI5ZFF6L3D1
 iaboBGtvURmmI5Ib/YtDxBPLzRF55Yk97OZw1XYwsbrwCdGSlVEfPGc63yCNEC4mWj6cY0KTlUq
 vDMOOhrk3WWDzYkU8PdF3j/z3gfemfa45vxZL+opBteV3ZGwmlZ1f4x0CtFct36PchxzduSndqd
 geNR+yYvX2BjJJUY5vwKHy3sIlNc+i8uChx9f+lqJvn2mrmbvU7NSzpu3fXT1CTkz3V31cjHsGt
 /LMMZepLbqeWOONLXjbek2pqJ9sopBPl+ZL7vNFtQqc03XMSmusv5aX/cWvLPDVHVy8wZ8oYJWO
 pl3qZko41lCzwxSavQnx3S7zHgJjTa47DuhiKdTWkaZtnKVYqYa2iPoFdO0n+pPUluF0ntkuOrx
 GMtc8dfSv9+TTtsBtOw==
X-Proofpoint-GUID: pRKJC630KbHAAzw0350iicJGmvNBl3oe
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-05_02,2026-04-30_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 bulkscore=0 suspectscore=0 priorityscore=1501
 lowpriorityscore=0 adultscore=0 clxscore=1015 spamscore=0 phishscore=0
 impostorscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2604200000
 definitions=main-2605050145
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260505_080853_638634_4EDF2902 
X-CRM114-Status: GOOD (  18.84  )
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

On 5/5/2026 7:30 AM, Willmar Knikker wrote:
> In ath11k_dp_rx_msdu_coalesce the loop uses ->is_continuation after
> the dev_kfree_skb_any. This can cause a use after free kfence.
> 
> Move the use after the dev_kfree_skb_any after use of ->is_continuation
> inline with the while in the while loop above this one.
> 
> Signed-off-by: Willmar Knikker <willmar@met-dubbel-l.nl>
> ---
>  drivers/net/wireless/ath/ath11k/dp_rx.c | 7 ++++---
>  1 file changed, 4 insertions(+), 3 deletions(-)
> 
> diff --git a/drivers/net/wireless/ath/ath11k/dp_rx.c b/drivers/net/wireless/ath/ath11k/dp_rx.c
> index fe79109adc70..02bd9787d6b4 100644
> --- a/drivers/net/wireless/ath/ath11k/dp_rx.c
> +++ b/drivers/net/wireless/ath/ath11k/dp_rx.c
> @@ -1825,11 +1825,12 @@ static int ath11k_dp_rx_msdu_coalesce(struct ath11k *ar,
>  		skb_pull(skb, hal_rx_desc_sz);
>  		skb_copy_from_linear_data(skb, skb_put(first, buf_len),
>  					  buf_len);
> -		dev_kfree_skb_any(skb);
> -
>  		rem_len -= buf_len;
> -		if (!rxcb->is_continuation)
> +		if (!rxcb->is_continuation) {
> +			dev_kfree_skb_any(skb);
>  			break;
> +		}
> +		dev_kfree_skb_any(skb);

rather than repeating code imo it would be "better" to cache the flag before
freeing and then test the cached flag.

however as you note this proposed logic matches the logic already present in
the "Free up all buffers of the MSDU" portion of the function, so from that
perspective the proposal is consistent with that logic.

let's see if anyone else has an opinion...

/jeff

