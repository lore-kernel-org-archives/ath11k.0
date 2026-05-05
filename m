Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C8986FF8855
	for <ath11k@archiver.kernel.org>; Tue,  5 May 2026 18:04:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=5lLU7l4kSZccBRLUQ+eRQMvrUbzRZ6NblzN59DJLrog=; b=Hc4zZuXOcgfg7P1ovU6xxaZYmt
	sBeuYEXeI3uTzwJwqtkalqLfS4tSXJGnsrGuayVU4XJkZ6tuCdS64E3n7jI4wdQu5qpGi97a3VaWK
	cJhh/pTWh21DgbBfZB36DbhvK5VHITz1dB2owdPs3WbXaT8co9WcXss91OO6RnzVvZJh4bnfiWuwS
	Eu/p2DW8v9yHuhxKyvm3pbg4o9DiCelKUFrLN53QB2KlHYqkoVBs5JEc0PhL/ng3sMooTd4JQbLeb
	4VyAZjMLrfFpF0WpUxU4krXUKzNGAy9gOrgg3CtifwPGFlK/lD0IiIz/WadQewzFkTDX0OAKpwY4T
	YvIW03gA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wKK7w-0000000H7T5-13j0;
	Tue, 05 May 2026 18:04:12 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wKK7t-0000000H7SZ-3qV2
	for ath11k@lists.infradead.org;
	Tue, 05 May 2026 18:04:11 +0000
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 645EK0xf912107
	for <ath11k@lists.infradead.org>; Tue, 5 May 2026 18:04:09 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	5lLU7l4kSZccBRLUQ+eRQMvrUbzRZ6NblzN59DJLrog=; b=WqFg7khnwMkaCy+b
	So/l/lhXbUU9APkAK8j+tILv36J2V/Qe7Z9A5K2SfDF5hss74maq2+Fxl+1DZIXx
	foaOxzmZQig+RJZvssMSeQOMudueJ6di9jUQExjQ8bDSXY4soN8tlw0C8dPq7F3k
	KXSekL6skyU0Ck9ISQQd2zdqAwo7j/p5RlDKUkEqIFz7m4KjigK76nt8J2J0IRVd
	mFg9TDxH+OfEpGTcdg4hTqeaUK0FBOU0QyZNI7iJL0xIV1hMjR0FFpljY97eCnTo
	rsBuWNr/ZWY/05FfVsEJM+N4Q+cTiAsT+iQ/zi1B8KWLH++gOjM4Mdaj35rBKi8S
	d9NcmA==
Received: from mail-dy1-f198.google.com (mail-dy1-f198.google.com [74.125.82.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4dyj7jgy9x-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <ath11k@lists.infradead.org>; Tue, 05 May 2026 18:04:09 +0000 (GMT)
Received: by mail-dy1-f198.google.com with SMTP id 5a478bee46e88-2f525565b33so400557eec.0
        for <ath11k@lists.infradead.org>; Tue, 05 May 2026 11:04:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1778004249; x=1778609049; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=5lLU7l4kSZccBRLUQ+eRQMvrUbzRZ6NblzN59DJLrog=;
        b=AnBEamSSF+FNLmtFURCleNHRDCTVryvxglA7maAYRDNgMexhQxqkU1177BAgGFFW6z
         dbTAieCZJZ0bIr8sgGH+HbIKNrZJUm6miPqdrI3syAyrBYbqkEE4pr+E8paGQZjmI/mp
         nOLF8praGbT7y+0/5QyCBS/kv+jGBypTg7DJCx6nS9ggIQ2DkGX3axYAODUNK3DcZS5u
         Q5TGz8hFqw+mgOn2ykjofRaqVLq2973lEirjnATbMx0x8Q7Z9jkqoM613kID5YR6X35+
         PpIhDxujU9EHTMb7/wMmjXsjhQRmRoaik2zHZSgWQlbeRnu5TawSekeku0P1tJZ4Nd6B
         UjMg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778004249; x=1778609049;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=5lLU7l4kSZccBRLUQ+eRQMvrUbzRZ6NblzN59DJLrog=;
        b=TlldwvnLvEiPoyvgsCDUp82xzExy8SnD1JnydMOpltVlPolE/aN1AqQvwvDgWMAY7v
         5nYHw+oqe15rhjzThdWrlKoM6TlK9yY43xdikxVkVPGaP9Su4QjIUJ6S9XtNHmjfOabG
         cd5eJ3Rt2PT9UkqKSTCMGoOWsPXJGaOOz+svpEGlgN4AecQtJ168r92fmhk/mlkcdBcC
         jPLgD91bTgqov0OX8KHkMhFNX/qrD8xmgTotWYGX6y/LHSGqFpXsVtCU9gAZdYwNkBGY
         kZV2kR6ARLBvr2H6/XksLamOkGcceuQvoYHpJNP9ekQm2ZVplk8Yghcm7jdfIcPmlT53
         J+JQ==
X-Forwarded-Encrypted: i=1; AFNElJ+ppIUV+jg2EzYX9rmcdT8F4NeHTT5LDJH2AHtFanT9PIrTWm3ZAH/BJIF/cToV0TRplpcjvOw=@lists.infradead.org
X-Gm-Message-State: AOJu0YztNfFdk3QmDC1fMT/VB1nsiDuNObPl8nELwxZCHWPRZQWwc1Wz
	ZKZGlANgdQqKBH+he/i8/kWn131oSrTOuwL11B4B2VOlpFSRszxPdUhMZBQGH0aQogZcZ+pXabo
	fA1Wj47cyorQA6CB1jIFnD7DIcla8R1wlKlLIhOfd3rKSZ7dyjdrADQGAgzu2bpC7
X-Gm-Gg: AeBDietdDrdGfIkvkFwFIR853OVaKZ3ZNx9gdpJNKH1sbU9DCwTRFTO5Mks2SmgNq0+
	YVIDXBRD38faLae15PVplpMHsRxUMucICL49WcyTsENW5O0jGEnqIKiczs8vymwOVtbjkbXHXLu
	nsnnZtmbqtsshP9x6Y8gKE7JwmBEsIsoxLS464hFHY50TSex5b44cH60fQx2yHWm2T9tytRnFim
	TGE09y0iB7pJCPeG/6CmQzJCFDotxZhSVbclBYrLhtNc8GrbDSdD52LGkn6hW+P/B/qZkM0e8lr
	qBUr0LlMYmuDUBk5+hpEZnUesGLdJ0vhme0fm1BV8uJ9Fd0wznf9dNywe0NhzVARsoo6Hrza/6g
	B3+T/O/rgOpnmP98xH+XQgUhFLV8dA8sfyB3fby0x7rGUILsp4SdvRqF+Fv+SCbw0thgBu89cO9
	WM3ddGQzLUNMoQuO4W
X-Received: by 2002:a05:7300:b507:b0:2e0:909a:b9c with SMTP id 5a478bee46e88-2f54e09e275mr154390eec.15.1778004248424;
        Tue, 05 May 2026 11:04:08 -0700 (PDT)
X-Received: by 2002:a05:7300:b507:b0:2e0:909a:b9c with SMTP id 5a478bee46e88-2f54e09e275mr154367eec.15.1778004247747;
        Tue, 05 May 2026 11:04:07 -0700 (PDT)
Received: from [10.227.110.203] (i-global254.qualcomm.com. [199.106.103.254])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-2ee3889d611sm28455624eec.1.2026.05.05.11.04.06
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 05 May 2026 11:04:07 -0700 (PDT)
Message-ID: <6a55e7b8-4392-407b-bf22-36585dc12d0c@oss.qualcomm.com>
Date: Tue, 5 May 2026 11:04:06 -0700
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] wifi: ath11k: fix use after free in
 ath11k_dp_rx_msdu_coalesce.
To: Willmar Knikker <willmar@met-dubbel-l.nl>, jjohnson@kernel.org
Cc: linux-wireless@vger.kernel.org, ath11k@lists.infradead.org
References: <20260505171709.547274-1-willmar@met-dubbel-l.nl>
From: Jeff Johnson <jeff.johnson@oss.qualcomm.com>
Content-Language: en-US
In-Reply-To: <20260505171709.547274-1-willmar@met-dubbel-l.nl>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTA1MDE3NSBTYWx0ZWRfX8VJgLs8+Ulyb
 UIhuUqpOoEeNxyS9Eut0vP2ynVsNSXzuVEmoSloJ5yYlpu8QcA30g8pSzGVtaY5G7JqVpqcK/B0
 0XZxUW3ofTvIRVh6gELbhB3TnwSxvdVZaMDnemtcsb2Eeiovq95jCY1uJ7fcxxN3QboSLrmve7W
 aJCNStwCSdO6WImEAPwO37MFM5i6JCBe8fl883nKcs3LI6/UdnvwYnWeLCdjUAcLr6oYIWKy+Vb
 eYOhWwq2zSd2Dtmq5UMXLtsibIHG1U7Cwocr54q1Bj/xTW+cu8794zugV9FX06svQuLI/bBQ683
 U7fMPgzhqyjdjVOOflZd9cseid6+WAe4BPqsPtQ6pq6s2Hx7gWq2Acs1PoIAH+WmYS6oQp87suk
 SliZzO2DdNMMXoRQ2nM37RtgdaAtTkio8ykhg9o3sABR0iI2hs+UTvfQmjcAB5CB9G/T8Z5o8RN
 0KPisEwZK0YiDeCKPMQ==
X-Proofpoint-GUID: YgT9lzp_17m7h_myum-IJ1CVne_JfGHj
X-Authority-Analysis: v=2.4 cv=FpA1OWrq c=1 sm=1 tr=0 ts=69fa3119 cx=c_pps
 a=wEP8DlPgTf/vqF+yE6f9lg==:117 a=JYp8KDb2vCoCEuGobkYCKw==:17
 a=IkcTkHD0fZMA:10 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22
 a=VwQbUJbxAAAA:8 a=9B1uR9gGAAAA:8 a=_Q5U1Uv4BMVt9x7mxWMA:9 a=QEXdDO2ut3YA:10
 a=bBxd6f-gb0O0v-kibOvt:22 a=8R3p93Tjo66ouot214C2:22
X-Proofpoint-ORIG-GUID: YgT9lzp_17m7h_myum-IJ1CVne_JfGHj
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-05_02,2026-04-30_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 phishscore=0 lowpriorityscore=0 clxscore=1015 adultscore=0
 impostorscore=0 malwarescore=0 priorityscore=1501 bulkscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2604200000 definitions=main-2605050175
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260505_110410_041762_3DFACF44 
X-CRM114-Status: GOOD (  20.28  )
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

On 5/5/2026 10:17 AM, Willmar Knikker wrote:
> In ath11k_dp_rx_msdu_coalesce the loop uses ->is_continuation after
> the dev_kfree_skb_any. This can cause a use after free kfence.
> 
> Use flag for caching is_continuation for use after the
> dev_kfree_skb_any.
> 
> Fixes: d5c65159f289 ("ath11k: driver for Qualcomm IEEE 802.11ax devices")
> Signed-off-by: Willmar Knikker <willmar@met-dubbel-l.nl>

for future reference the revision history should come after the "---"

https://www.kernel.org/doc/html/latest/process/submitting-patches.html#commentary

no need to re-submit for this; I can clean this up in my branch

> Changes in v2:
>  - add bool _is_continuation for use after the free.
>  - Add Fixes, label to commit.
> ---
>  drivers/net/wireless/ath/ath11k/dp_rx.c | 6 ++++--
>  1 file changed, 4 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/net/wireless/ath/ath11k/dp_rx.c b/drivers/net/wireless/ath/ath11k/dp_rx.c
> index fe79109adc70..16364f76fc3c 100644
> --- a/drivers/net/wireless/ath/ath11k/dp_rx.c
> +++ b/drivers/net/wireless/ath/ath11k/dp_rx.c
> @@ -1761,6 +1761,7 @@ static int ath11k_dp_rx_msdu_coalesce(struct ath11k *ar,
>  	int buf_first_hdr_len, buf_first_len;
>  	struct hal_rx_desc *ldesc;
>  	int space_extra, rem_len, buf_len;
> +	bool is_continuation;
>  	u32 hal_rx_desc_sz = ar->ab->hw_params.hal_desc_sz;
>  
>  	/* As the msdu is spread across multiple rx buffers,
> @@ -1810,7 +1811,8 @@ static int ath11k_dp_rx_msdu_coalesce(struct ath11k *ar,
>  	rem_len = msdu_len - buf_first_len;
>  	while ((skb = __skb_dequeue(msdu_list)) != NULL && rem_len > 0) {
>  		rxcb = ATH11K_SKB_RXCB(skb);
> -		if (rxcb->is_continuation)
> +		is_continuation = rxcb->is_continuation;
> +		if (is_continuation)
>  			buf_len = DP_RX_BUFFER_SIZE - hal_rx_desc_sz;
>  		else
>  			buf_len = rem_len;
> @@ -1828,7 +1830,7 @@ static int ath11k_dp_rx_msdu_coalesce(struct ath11k *ar,
>  		dev_kfree_skb_any(skb);
>  
>  		rem_len -= buf_len;
> -		if (!rxcb->is_continuation)
> +		if (!is_continuation)
>  			break;
>  	}
>  


