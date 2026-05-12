Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5C8E8CD4846
	for <ath11k@archiver.kernel.org>; Tue, 12 May 2026 02:56:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ZTFqP2R/jd7sflLvliEfjGsykKjN4d7tspuW7eeGmwI=; b=Ortxj2dL9Lb3x4iyS2BNfpIWPR
	/uEiBiapM4oNoxJZDicndTGTe8VLZJ+ivgURGGMZ/TwdWCwzLKoEgy2/2ez7VidhGpdLEAHs3rkZy
	kgQ6QCb7ymS/0crZsQ4pNVtXQcA9ulWd0QHCatz3G98xZ2KE/gLOUQwxH5Sj7ACEWnZ+pRLFCcsaA
	7wKy+zlnJ+HW0EVhZsgRThxLIkZY2ic8b7H859jYmePHKoa1u0E996fLwbCF+iC5xj65Ezq5POpMo
	Sm0bwt95y0x7xITxPHa7Lv7iNFNMtGL288TRb3fCQXr7+wtg2XNzCtCGL3/vTvUVZ637sUeC3Ie+y
	ODW/S8kw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wMdHx-0000000FJRH-1wVL;
	Tue, 12 May 2026 02:56:05 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wMdHu-0000000FJQe-2oS6
	for ath11k@lists.infradead.org;
	Tue, 12 May 2026 02:56:04 +0000
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64BK6cJq2187004
	for <ath11k@lists.infradead.org>; Tue, 12 May 2026 02:56:01 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	ZTFqP2R/jd7sflLvliEfjGsykKjN4d7tspuW7eeGmwI=; b=ovX6U9vDI1pi75jy
	HaJS66QoBgbsvFFrbny2Sj7nib8okMotDcaztaurxbfZ2zGvcUMK8cL348EpAn+A
	1XeyBkUAy3KVGSjT5GsFd66GqvTCUoVDvuqfKzpWpVxkLR6zIuX5V50Iyv5/0fC+
	64tGeqsfo3RTiKbkDwR/6BwbtBNZYSYEtNm77+7YZE+qndl4L6Zzl+u6AGEkzXo7
	EnpZ9k1+JDb+oiNWT1R9Nh9p0+dBcGGSH1OdYKUFF5/dimJTN8TLcMQci/OuRyBc
	k1EmW/wyrLvAGqjM4g3jJy+4ZR/czpyqngzQVeQXQ//aiDhDMR0jXyzMKodQIPkj
	viYxnQ==
Received: from mail-pl1-f198.google.com (mail-pl1-f198.google.com [209.85.214.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4e3nv0s4r8-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <ath11k@lists.infradead.org>; Tue, 12 May 2026 02:56:01 +0000 (GMT)
Received: by mail-pl1-f198.google.com with SMTP id d9443c01a7336-2b4678c6171so52441595ad.1
        for <ath11k@lists.infradead.org>; Mon, 11 May 2026 19:56:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1778554561; x=1779159361; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=ZTFqP2R/jd7sflLvliEfjGsykKjN4d7tspuW7eeGmwI=;
        b=JI/TVobwwc5lM85vjjKmngLplXbiOlGat7cebX6ZKnnCKT+SxnwYKcnk+tqptpll2I
         +5iw3VvRj5MA8D1P4DOIJe/uyBFBxxVLtUBnNOyRBVjrZWbZSFdqEqZM6CZuf67dE98X
         JuSJDMEXo1Cj55odLYbwVPlQ2jfbqvv7mKh/xh45r2h9a5mprFbYqJmNK9rHRv7yaH/4
         MWgRfiZsXa+iLhFhzGqZKuRRr3e3dAIaqhvlrlysi399Z6MqVUN7yZ0HeHriw9+mO/5k
         UngrAoOgkzBvUjvyanYoXS+XmlCbJ7pJy3yZzod5hfEe8aN+YlSoAo7oLJ3pLEaWN+vh
         zIVg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778554561; x=1779159361;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ZTFqP2R/jd7sflLvliEfjGsykKjN4d7tspuW7eeGmwI=;
        b=Jeo0sdY7MwD3qGRe1Q3guNlpGDGehQ9z3aWJ0mRixewKeL6RUPWLeQZvjsBGtp5y/q
         xdvs9uGVylXFp8JDjL6Kvj0RtWgNgOQzGBFGImB/voGBas+H2F5Zl2T2HGlU82G1jNP9
         wGhWv4slWy5LdHl/ExTdBfVhhZRoKFsTbkIdmeei7iZ5VIkJuMnsHVIhvqeW5DzLaugT
         9sSr0Y3jAaBYS8+Xz4w1CFw7BdkLf6/lyBEeiBWQObq+NJX5wNSJl6Nnf7zOT38KcYAc
         vs9L7XsPfCWRuz27Fn8BFRaz5O0KUxlHzLR6moRMgdHRfvEnsPuJ9SFnoUjFjzWvOfH7
         9UCA==
X-Forwarded-Encrypted: i=1; AFNElJ+NwL2tqD4K6b/Yx1j9tcgyKXtJh7GZfmOmtbuyaWdwDDp5hc8qe4ocxZTS369A5/3nK07+Cls=@lists.infradead.org
X-Gm-Message-State: AOJu0Yzt5cbs75XG5HB9fp811NnGc4RCGr1PM7lrPYDQHDMNrw7AFRG9
	uFk/nyl+/m/O0LWLdcjgKdviyhjq3vXb6Ats+DdwwqBXBYaLESQ2MLqLPB+/YM/vH4t27zqzRMT
	KtMfokhw9+xDxepH/kba+zTmxw1ccvEOIajM+zDfvMGlLhuGg1VO582qdhc2y7CC1
X-Gm-Gg: Acq92OEVVguaKPiotCHMHZHWeQfnbUUzF0aOGe8FgYVGdwFu2iacgN+QIkVlvaIVxzk
	fdPJg6XIkMPMIz8x3NrtC8qzSQ3aKNSMOAFcOY9hfg5jTwG8Yn1KGlMQr3BPjn3SRl7/fTeW335
	SPSHMqimuIi9MY5mRoB62e+E33hEX4z1nYW1IDZ9phLtkGyvS3vQVtTS+/Ji/RmMGrCpX3Ar18K
	XABxdBjm+ZCITknL+5QEI8eWcOwIRkjun2BPy+3KKc32qcDs4N3herqrWIB9Grj6Aw5fYWnctYm
	zv5O2JZSC0xTNcC/KLnj3xaeb3kzgzKMisvJGzTQ3T1EcSUPIpSkP1oc6oz0OAXF+X77KhdSrDI
	5wv1kq613vXC8LNihlfPFnh9HtHG3kI773NiN8vXDIidNTr6LprtVCgn/2l9ngNUNFRqMlYcdYX
	IUf9V/ai8BObc4GwqG0J8=
X-Received: by 2002:a17:903:1ac3:b0:2bd:7ca:e67d with SMTP id d9443c01a7336-2bd07caea66mr2608125ad.29.1778554560483;
        Mon, 11 May 2026 19:56:00 -0700 (PDT)
X-Received: by 2002:a17:903:1ac3:b0:2bd:7ca:e67d with SMTP id d9443c01a7336-2bd07caea66mr2607865ad.29.1778554559996;
        Mon, 11 May 2026 19:55:59 -0700 (PDT)
Received: from [10.133.33.178] (tpe-colo-wan-fw-bordernet.qualcomm.com. [103.229.16.4])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2baf1e35ba2sm124208155ad.50.2026.05.11.19.55.57
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 11 May 2026 19:55:59 -0700 (PDT)
Message-ID: <36fff112-4cde-4b4a-aff4-b88ad85d67a2@oss.qualcomm.com>
Date: Tue, 12 May 2026 10:55:56 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] wifi: ath11k: fix use after free in
 ath11k_dp_rx_msdu_coalesce.
To: Jeff Johnson <jeff.johnson@oss.qualcomm.com>,
        Willmar Knikker <willmar@met-dubbel-l.nl>, jjohnson@kernel.org
Cc: linux-wireless@vger.kernel.org, ath11k@lists.infradead.org
References: <20260505143025.234292-1-willmar@met-dubbel-l.nl>
 <7d3c5eae-233a-4c31-b64e-70f0afe74da6@oss.qualcomm.com>
From: Baochen Qiang <baochen.qiang@oss.qualcomm.com>
Content-Language: en-US
In-Reply-To: <7d3c5eae-233a-4c31-b64e-70f0afe74da6@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTEyMDAyNSBTYWx0ZWRfX1WUQg5ARfXz1
 9oT2S8XPRh4xOJ6MXBj26ppcBAUnzCfJ/ZuFuZFafqT6RsrsPgcSVVY7RbGF8TPFzb2gsltWFaH
 UghYgIKb+j+JfWS08pEZXZ0ZKJG7XD6sdSDwiIBcrx9Rg4sqLLnwKc8oVi4wDC7H1DIk/sCjKqr
 XuZupFg8RuuAZlIZ+tZ7liYattKidmN0gDSC9DFP2X/KQJoCphVplJdUMl1DBJAxWDyVRAmcjeb
 YWgYBSkHW172fa/xHS0yb6tMnm/8ATkSirx6Mb2/cS2bhxeRe4KhVRyr1xKnFqJFkwl9MeUuX4a
 BtlNXoZLAB3xdujvSk7nCpxKnp4g3RPHV6GSuv/rKUMZOISCO720yQovZqakXQk7mpdo0bbE2i8
 4fWfA36uMVGbGpxIpXQrNZF3yXioeN31hWpb0N9N/aBvGSXlUR1+tm3OIAP2nCo/XWai8En8XjR
 mGFxDJq8adfMD/8GRQQ==
X-Authority-Analysis: v=2.4 cv=bpB8wkai c=1 sm=1 tr=0 ts=6a0296c1 cx=c_pps
 a=MTSHoo12Qbhz2p7MsH1ifg==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=IkcTkHD0fZMA:10 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22
 a=9B1uR9gGAAAA:8 a=IpyFi0jJrv5YPyD8wV0A:9 a=QEXdDO2ut3YA:10
 a=GvdueXVYPmCkWapjIL-Q:22 a=8R3p93Tjo66ouot214C2:22
X-Proofpoint-GUID: Fky5NXmBM3i2i7NNV_AQHNrE_HzqC0EA
X-Proofpoint-ORIG-GUID: Fky5NXmBM3i2i7NNV_AQHNrE_HzqC0EA
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-11_05,2026-05-08_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 phishscore=0 lowpriorityscore=0 spamscore=0 malwarescore=0
 priorityscore=1501 adultscore=0 impostorscore=0 clxscore=1015 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605050000 definitions=main-2605120025
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260511_195602_725351_8EF05667 
X-CRM114-Status: GOOD (  18.99  )
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



On 5/5/2026 11:08 PM, Jeff Johnson wrote:
> On 5/5/2026 7:30 AM, Willmar Knikker wrote:
>> In ath11k_dp_rx_msdu_coalesce the loop uses ->is_continuation after
>> the dev_kfree_skb_any. This can cause a use after free kfence.
>>
>> Move the use after the dev_kfree_skb_any after use of ->is_continuation
>> inline with the while in the while loop above this one.
>>
>> Signed-off-by: Willmar Knikker <willmar@met-dubbel-l.nl>
>> ---
>>  drivers/net/wireless/ath/ath11k/dp_rx.c | 7 ++++---
>>  1 file changed, 4 insertions(+), 3 deletions(-)
>>
>> diff --git a/drivers/net/wireless/ath/ath11k/dp_rx.c b/drivers/net/wireless/ath/ath11k/dp_rx.c
>> index fe79109adc70..02bd9787d6b4 100644
>> --- a/drivers/net/wireless/ath/ath11k/dp_rx.c
>> +++ b/drivers/net/wireless/ath/ath11k/dp_rx.c
>> @@ -1825,11 +1825,12 @@ static int ath11k_dp_rx_msdu_coalesce(struct ath11k *ar,
>>  		skb_pull(skb, hal_rx_desc_sz);
>>  		skb_copy_from_linear_data(skb, skb_put(first, buf_len),
>>  					  buf_len);
>> -		dev_kfree_skb_any(skb);
>> -
>>  		rem_len -= buf_len;
>> -		if (!rxcb->is_continuation)
>> +		if (!rxcb->is_continuation) {
>> +			dev_kfree_skb_any(skb);
>>  			break;
>> +		}
>> +		dev_kfree_skb_any(skb);
> 
> rather than repeating code imo it would be "better" to cache the flag before
> freeing and then test the cached flag.
> 
> however as you note this proposed logic matches the logic already present in
> the "Free up all buffers of the MSDU" portion of the function, so from that
> perspective the proposal is consistent with that logic.
> 
> let's see if anyone else has an opinion...

I also prefer a cached flag as it is much cleaner.

> 
> /jeff
> 


