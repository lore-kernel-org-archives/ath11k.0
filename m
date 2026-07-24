Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4B0B4C531F9
	for <ath11k@archiver.kernel.org>; Fri, 24 Jul 2026 01:02:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Cc:Content-ID:Content-Description:Resent-Date:Resent-From
	:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=WblrNcLsi/Jl44g9G73gbyP9Kj6CCa18WawMWQHVOgg=; b=D4PWsOCjEKk8lJ2LBRoRjhd9Nf
	ewGZtrgQUoH/LtXEW92v/2a/KWTqcFs6v7DJ42/Axo2+ksfx7V9ukmma+9a4E53Qo0165KwFfToWZ
	DUggRLOVDQxgqiCdKFakMcANlE6ot3E6IgizSCI3u0rbW9jBIhK4nYF/eKTWVhLKyqcBLvBfcvz0y
	oHPvcs+RHXmmg9ziXWm88BggjI6i4sLzgb03pXRrXSH2Brw44tBFsZLlo54BpPEH3Fqh9k/dV4Zh9
	3OT27Jgf1BhEkWXlnHAgArNNlqS/BA3BJqbgRbCnjq8uPNsHypWg1CovgshmF/H+kOUYaVGmmX6Uf
	BAo+FB5A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wn4Ip-0000000FJyd-45tf;
	Fri, 24 Jul 2026 01:02:15 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wn4Io-0000000FJy1-1sYO
	for ath11k@lists.infradead.org;
	Fri, 24 Jul 2026 01:02:15 +0000
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66NMTArP697402
	for <ath11k@lists.infradead.org>; Fri, 24 Jul 2026 01:02:14 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	WblrNcLsi/Jl44g9G73gbyP9Kj6CCa18WawMWQHVOgg=; b=G4kfaSh0GY3IABY8
	Fs16utljFixWv1jqvV5aqkUM05FpUg6ZMMH6ZKLFnnyyf2iKHHa1cSY3I6C1tt0A
	CV0rgXYVG8ILdPPadGoJaC2b79WumJT60NjZ9R41e1HDcDHylq2+ihtAfPLyGuKZ
	U3ci0cIys5cTT1lLm7vl7vcLJ5h6aCyvL1U4W5atOSEktnuDiYFquoCTkDO+bMw+
	mOOQpmQAN8ZPjPYV3HpcwUyy/or4VeCbWlyvTMUa5UHdzYzJpOMDu8iV/RdMnovc
	kIHF3gq0G6LgZMaIbGVMP/Gq8NRBidkOBdrjP2oSVU7KLH8TxoWIR1XXzY+7WGZB
	IA+cww==
Received: from mail-pg1-f200.google.com (mail-pg1-f200.google.com [209.85.215.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fkusrrc19-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <ath11k@lists.infradead.org>; Fri, 24 Jul 2026 01:02:13 +0000 (GMT)
Received: by mail-pg1-f200.google.com with SMTP id 41be03b00d2f7-c9fe4c5eb39so1008900a12.1
        for <ath11k@lists.infradead.org>; Thu, 23 Jul 2026 18:02:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1784854933; x=1785459733; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :from:references:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=WblrNcLsi/Jl44g9G73gbyP9Kj6CCa18WawMWQHVOgg=;
        b=QPeK8RCRJN2SmJWniscbQkxtF6j6FCIgqV+DkzLQwb7rE7M1qijuSP1rNWN9iRtIxn
         QNkhSFtHB47y/7h1LR5H6lDY9BbXd4gBTFGScyLUj8xoU2Pjv5bmmuZJc5MKr8hHMOyN
         tvftkba2Kufu0B8b8LfZSf+uqFkcmoUUVAcaf2b/eMWk+f25TTe5KfD6u0BkUDeIHXpE
         EWLdYzid1IeT+NnlkjGQ3y2GyvFxWMOsU4rRGOgRmddJ+h5jxaQgE48LjhTJZqwDPOrF
         OFY37mIAZOoXEPvJVdPo0l4uq7X2vE1T7iUNWBdS91SK1uuY2adjrhDcr95K2owc7zlk
         WN1g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784854933; x=1785459733;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :from:references:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=WblrNcLsi/Jl44g9G73gbyP9Kj6CCa18WawMWQHVOgg=;
        b=kppX+eaXvcLkz88W8am3UKgBr/rqFLvfITLl0LVTyq1ei8O0avhMYDJ9TnTDrdpxaG
         Cf8N9Eygu+mQdYNy5Ag+VldArnRJuIyZlD/1TAHVhKlm7cMpuvPu5vmxIupEONn1F8ys
         WbUIfXVRt09oZvuPfvBEH+2pwwwuFR73OUVsZjFNm1pN9LPw8+2hCRp9DkfoBAB401CD
         mahnf5oWQ3N7wfSoe4ZtZC+u4cIo4QiPw6tbBKL9r6vR6oFHSH5BJOdaxNsv3mQlxZD9
         5fPUAWgbMD0Iw04OYaO0mhmxxCCBZQOgX8Sst+VTgl7nnBcxcJ7Ej56Glp+JnUMfdqbQ
         O96Q==
X-Forwarded-Encrypted: i=1; AHgh+Rp+ITCXjh/rIHfClcN+vIDST8dWTfFY8X9dQL4HVJFNuD47/iygaJaPiEpbGuA2RMKsntpazqg=@lists.infradead.org
X-Gm-Message-State: AOJu0Yzr+jLYBL04T7oTFW5HAX71NNGpCAezPiiI9ckNDHBg3AnC6oGT
	p2E1B0X0Pbo+1lVcMKoCExESVPVMHXDaOYSgVohxpS2SGUpfhlyGq2WzROUooFZnp0K0OhfkxBe
	HGIZSw37mvnMah8g2QhWP8e4W2k83vDCpVb++s5o6LtGsyZMEMIBEgGMFluP3qHq3
X-Gm-Gg: AR+sD12P7vLd9Hjgsm3UmuMT49NOL7qYG93BnhKumyXzO6z9P50232/ceNWn4u62H4F
	Zs9g15wzoGVPQFlIw7/T/CxuvSMAzhM42A/Wa8icEX9on4+sZ0t/Ft7RFj0mWxEjqLDC+Z7LFv/
	HST8wK2T8+m7gsXNS71GVWDsuh/61ffX0edmy8Y6i4amkd1wdtzHTeKxecSGgoJiORY1I8TotIn
	Kz1J8sca8oR1Z0evK4YOhz++vQqEr06vZy1xfqRWH/T3Q3jCknQXx1V0tKIZB1ywHnVD31TsNYW
	SUWIZV5OKA06zOPVOy4MFy2QJryX/E0P5qEomyLC+/zklEJ2SCMn/fdpoDggVXxkBQtLMJf6Wef
	JY51SIC4ZXv9EZ7IoJPzjDpVmJqct6HorhwzkIUfAFV2Q3C61jFVX/4kx6g==
X-Received: by 2002:a05:6a21:6494:b0:3b3:1c7b:ff7 with SMTP id adf61e73a8af0-3c44b1a3cfdmr6067891637.46.1784854933177;
        Thu, 23 Jul 2026 18:02:13 -0700 (PDT)
X-Received: by 2002:a05:6a21:6494:b0:3b3:1c7b:ff7 with SMTP id adf61e73a8af0-3c44b1a3cfdmr6067856637.46.1784854932699;
        Thu, 23 Jul 2026 18:02:12 -0700 (PDT)
Received: from [192.168.1.11] (15.sub-75-218-246.myvzw.com. [75.218.246.15])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3147e1b6a45sm24180258eec.28.2026.07.23.18.02.11
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 23 Jul 2026 18:02:12 -0700 (PDT)
Message-ID: <1c554956-4b33-4b29-bc65-ae6dcbaa124d@oss.qualcomm.com>
Date: Thu, 23 Jul 2026 18:02:10 -0700
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 1/2] wifi: ath11k: release QMI handle on late init
 failures
To: Guangshuo Li <lgs201920130244@gmail.com>,
        Jeff Johnson <jjohnson@kernel.org>,
        Baochen Qiang <baochen.qiang@oss.qualcomm.com>,
        linux-wireless@vger.kernel.org, ath11k@lists.infradead.org,
        linux-kernel@vger.kernel.org, ath12k@lists.infradead.org
References: <20260718074026.3085688-1-lgs201920130244@gmail.com>
 <20260718074026.3085688-2-lgs201920130244@gmail.com>
From: Jeff Johnson <jeff.johnson@oss.qualcomm.com>
Content-Language: en-US
In-Reply-To: <20260718074026.3085688-2-lgs201920130244@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzI0MDAwNyBTYWx0ZWRfX6q6ct9V8Vk/b
 lcz2I3hwdpP9+K10/Y8zZ3B2xQf3muGNoCxmvapE6Z4x5YmuWY6WgPOoprQIufFiXarFrx3oNuQ
 TQIJ7TFeyPDsgp0kOlM3Q8x3LGUjAIU=
X-Proofpoint-ORIG-GUID: WwxECFtSRgVg_WfsFWakcg7Yd9ihyi4E
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzI0MDAwNyBTYWx0ZWRfX7cHlG5drJhW3
 IgAyBVLZFRHg2VUTAMbyPBm+p2vg0FZpXVx3is0VvUHzwzSi1+SEbkA+x3OO2ihRXtqmbv5VEaL
 bIcN77nsjPx2JKSC8YLe13937PojLQ7QjhHk8POsyGWGC2UkK0m/h2AkmYBisQMXnSHkMDxMPAZ
 6Gp+LdoauDJbek4BiTW6tjQs6n46f1qeOwr3Hb9r5cy+J0FA1cY6p6N+77DPhdGqJF/5rqJbycU
 SdrVSX+ZzQ/DJ9WmBZ7ZuUrs3Lf5qQ4XOfdhPPG/UQvegmZGNTDM1jVM0w/jwF8bnxo7ORWJ/IQ
 ojZ2jDFegnzzcJrqAlQmkeQlYl8NxHAqX1tuC4IY4ccmcMjL0snt3v7Nz7JjZPf5LkDlguBMZ29
 /kjFWswer+Ia6hy0zrld5c8tvxD1sh0vH9hvdGfjm16VhV8P2/3o6rn9967qkErqXQPU8siGp2o
 b/CkIqrmyqW9ZJH6E0w==
X-Authority-Analysis: v=2.4 cv=PtejqQM3 c=1 sm=1 tr=0 ts=6a62b995 cx=c_pps
 a=oF/VQ+ItUULfLr/lQ2/icg==:117 a=6VQYfvmiyQ8t40WkS/mQdw==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22
 a=COk6AnOGAAAA:8 a=LpQP-O61AAAA:8 a=pGLkceISAAAA:8 a=iCY2eI6ydM37Y8nmTysA:9
 a=QEXdDO2ut3YA:10 a=3WC7DwWrALyhR5TkjVHa:22 a=TjNXssC_j7lpFel5tvFf:22
 a=pioyyrs4ZptJ924tMmac:22
X-Proofpoint-GUID: WwxECFtSRgVg_WfsFWakcg7Yd9ihyi4E
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-23_07,2026-07-22_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 clxscore=1015 suspectscore=0 malwarescore=0 phishscore=0
 lowpriorityscore=0 adultscore=0 priorityscore=1501 spamscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607240007
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260723_180214_529000_9AD80B44 
X-CRM114-Status: GOOD (  18.94  )
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

On 7/18/2026 12:40 AM, Guangshuo Li wrote:

(dropping obsolete @quicinc.com and @codeaurora.org e-mail addresses)

> ath11k_qmi_init_service() initializes the QMI handle before allocating
> the QMI event workqueue and registering the service lookup.
> 
> If either of these later initialization steps fails, the function
> returns without releasing the initialized QMI handle, leaking its
> resources.
> 
> Release the QMI handle on the late failure paths.
> 
> Fixes: d5c65159f289 ("ath11k: driver for Qualcomm IEEE 802.11ax devices")
> Signed-off-by: Guangshuo Li <lgs201920130244@gmail.com>
> ---
>  drivers/net/wireless/ath/ath11k/qmi.c | 10 ++++++++--
>  1 file changed, 8 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/net/wireless/ath/ath11k/qmi.c b/drivers/net/wireless/ath/ath11k/qmi.c
> index 410a7ee076a0..6e3f82169d24 100644
> --- a/drivers/net/wireless/ath/ath11k/qmi.c
> +++ b/drivers/net/wireless/ath/ath11k/qmi.c
> @@ -3329,7 +3329,8 @@ int ath11k_qmi_init_service(struct ath11k_base *ab)
>  	ab->qmi.event_wq = alloc_ordered_workqueue("ath11k_qmi_driver_event", 0);
>  	if (!ab->qmi.event_wq) {
>  		ath11k_err(ab, "failed to allocate workqueue\n");
> -		return -EFAULT;
> +		ret = -EFAULT;
> +		goto err_release_qmi_handle;
>  	}
>  
>  	INIT_LIST_HEAD(&ab->qmi.event_list);
> @@ -3342,9 +3343,14 @@ int ath11k_qmi_init_service(struct ath11k_base *ab)
>  	if (ret < 0) {
>  		ath11k_warn(ab, "failed to add qmi lookup: %d\n", ret);
>  		destroy_workqueue(ab->qmi.event_wq);

Since you are adding cleanup labels, it would be more idiomatic to have a
separate err_destroy_workqueue: label to perform this cleanup

> -		return ret;
> +		goto err_release_qmi_handle;
>  	}
>  
> +	return ret;
> +

so here have
err_destroy_workqueue:
	destroy_workqueue(ab->qmi.event_wq);

> +err_release_qmi_handle:
> +	qmi_handle_release(&ab->qmi.handle);
> +
>  	return ret;
>  }
>  

same comment applies to ath12k

