Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 38ADCCCF9F8
	for <ath11k@archiver.kernel.org>; Wed,  5 Nov 2025 16:40:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=LjtlWHiWbnGMu11mOm3DmagPhKzWAbM1CNPMgeHvHzI=; b=0Q2jY5caXPf0E2bWCyYE/6YrjX
	TLFqgQk3mNi9aOvw2BsIi6LpLtE7actjv+hAxu0VyimdWRnT2KUByz1gR4vnEdegosPrwZKBQjr4D
	4I/9gnBe46HoumSJFo5cIh4e6zZwY9l5ZKy6QVHASIgmeNklR7fHqlmlSSWQvycUaJOG7fW8/6KR+
	Mb/SvU9HSfSp1HkCW81asvGJMMSH+KPXvv8tAsoGhgTnKo4tMEyC/IehsTE9coe1nwJ4AGWh/wK56
	aE5HMYms6o5541uAPiEjS8ZZBn+bKgpiIj6M08i0ypRA0LSu0YzVVZ2Y3ImaGSWzRldSW1Q/3HqC1
	UWBaeXTQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vGgYr-0000000E5JH-3gxs;
	Wed, 05 Nov 2025 16:40:41 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vGgYp-0000000E5IJ-3FNq
	for ath11k@lists.infradead.org;
	Wed, 05 Nov 2025 16:40:40 +0000
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5A5GSKw0159430
	for <ath11k@lists.infradead.org>; Wed, 5 Nov 2025 16:40:39 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	LjtlWHiWbnGMu11mOm3DmagPhKzWAbM1CNPMgeHvHzI=; b=R+at9QTk+ZZd7Ltz
	LUmqO9ouKQydIIefxVD2d+KI8XSUep2nNv9mUxRy1bocCaDhcH79aqZNE6wVljpP
	wG8CJMC4J6SXb+92Ff9/6Czxne9WOEW45IXb0om3lYXLUFKlUrB+x7QfRb/SlFEO
	cPdefAAQfiPiegjCh0CIcLnUL+v3LY4DvFOyzqemb2kL2T18BsfKYUGYft3iy7IQ
	/EpBrNl7ZrGq+T0xymAqZmxdakLVCdjF5TP+5ZPjjmTH+/0x8dZmh0UEQgSyHWSZ
	96PJddmBlX9JBG74LLroYrVbigybN55gMaw6lanNBC1Aa415Aj6Aq02FfVNDSeJw
	DMCs5g==
Received: from mail-pl1-f197.google.com (mail-pl1-f197.google.com [209.85.214.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4a82mt1gq0-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <ath11k@lists.infradead.org>; Wed, 05 Nov 2025 16:40:39 +0000 (GMT)
Received: by mail-pl1-f197.google.com with SMTP id d9443c01a7336-286a252bfbfso632485ad.3
        for <ath11k@lists.infradead.org>; Wed, 05 Nov 2025 08:40:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1762360838; x=1762965638; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=LjtlWHiWbnGMu11mOm3DmagPhKzWAbM1CNPMgeHvHzI=;
        b=IDqUzgDvhuuOuqgGZju1W+DILR21opVkgBdDsLtbHMhfVICvnQ4ikZQYBPgg9uBCpf
         cnKE4jUXl1kPiq/htLPGR4WEKO83YRgple8l8lBVLVqF9WHUy5u+r7P6w6TOgST9StVe
         I/H0MfJd+7FTfYFokbCe7YGzlaQBGQkXq2q4zk/XuwwmWNCOWhm09LKRoDCX3FiaG7Mv
         g5GbzEJGnb9xYKrlH+aseupnESpL2HTih5TFI1qqZr3XHisa++G71rk4jY3/msyznXbr
         b+yZXzaGLuB/Be/Lv9Z89ssbQL7Gv6lImotft23tS+kLS39WxKHBrsl+0HX5glp17ND9
         /zHQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1762360838; x=1762965638;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=LjtlWHiWbnGMu11mOm3DmagPhKzWAbM1CNPMgeHvHzI=;
        b=DNWIID2qyWJ8juv0xLD8kZW1wejshzOOSSDTfF1FV206yWuO73b+r2xB1281rEsQvN
         7VdihILxDPCXFRNlCFR6r5sxJMmxB0WbYC4u/Dja8G8a1nLovXtlECy0X2rDT9K4VR05
         mn7gy/J1L8uO6JcbtEJGilGo4yil606JZX21P+4U33BPK9XVrEWs74KK9c4+7eHzFDLF
         0gcltEZl3km9y35IbGkw8HDvlk22q4Rbl08Xt8gkXNFvr1QC2/zGwHNJkXARZiXuRHDe
         dt2bFysxZqUsK0lBTul/As3Tug/l9Mxw3hOlQH8cjWwdPHTscG4586bGKB7q48lhNMG2
         HYhw==
X-Forwarded-Encrypted: i=1; AJvYcCVQPuFSYrQ9vjk+fDhoQzJ/vCP/1kk3NhltRmvkRV2BGXkMPpxmyD9FBVNHIMSKyYvbavY4CsM=@lists.infradead.org
X-Gm-Message-State: AOJu0YxRUEMMVyklJ7/rcGSFAuVwrmSaxbrQ0bFt8/4zeW230SvsX6GZ
	OIXJYvhmz2eCdlUTubGIBSQG3y9BU9tctOF5PPnfTfyM3wu8ffdH5+SlOIXY+DZiphwgD4ZOxio
	QTUQPiHky/Pn0Avfx5o2c9/aYP5hBZsdNUai3UnCC1Ra4TS+fKFxqvO3vqVoyEP5jT+cVj005
X-Gm-Gg: ASbGncvYsi8RPUu9CNItzukbYigb4RhmYxiyEExEn50Aa1WbpsQby+GbBDpr3NkIrCH
	z0HKNRi5psBdgyRutxGfmVlSAKTnKbvidMdQHw+BSNn0djwvlxGeiLur1MQTSoysFqQjJGU4ZAP
	mRbIVLoL1ki/2VLOHUG/fXgTGkRY9K2W7ii9A4VmJQrdZEle+BQjc1RJaztGjwwkKson65A9VYf
	OPkQ1iW2OPlCMw1wWz3kVSlKwnIctXqwzXInNDxxEZtqeKFNtbarkao2l3d5ktPRxeBUda3TZR2
	YscmxEJMDmLIqFHLeU5M2xpEO6kU/7I0scJ996I9YnW+59RfjNfyjbaIf9GkPDbedN4KQFdx681
	fIGXtNKghEx0V9S12I8CfnFIEWoSNCtpA4PoalK/r+aFWRcpYj8+y63/U0E8=
X-Received: by 2002:a17:903:4b4b:b0:27e:ed58:25e5 with SMTP id d9443c01a7336-2962adb71ebmr56662785ad.24.1762360838123;
        Wed, 05 Nov 2025 08:40:38 -0800 (PST)
X-Google-Smtp-Source: AGHT+IGU1wG7SrVOBifVyXvrQxlQrZHZnlL6f9/iHFaManIM7EnVoItZT5bj+dLM5Z8QOBMAYBb3XQ==
X-Received: by 2002:a17:903:4b4b:b0:27e:ed58:25e5 with SMTP id d9443c01a7336-2962adb71ebmr56662495ad.24.1762360837619;
        Wed, 05 Nov 2025 08:40:37 -0800 (PST)
Received: from [10.227.110.203] (i-global254.qualcomm.com. [199.106.103.254])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2965096dbe4sm220375ad.11.2025.11.05.08.40.36
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 05 Nov 2025 08:40:37 -0800 (PST)
Message-ID: <86231f5d-2774-43ee-bc67-ccabdfe5af69@oss.qualcomm.com>
Date: Wed, 5 Nov 2025 08:40:36 -0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH ath-next] wifi: ath11k: zero init info->status in
 wmi_process_mgmt_tx_comp()
To: Vasanthakumar Thiagarajan <vasanthakumar.thiagarajan@oss.qualcomm.com>,
        Nicolas Escande <nico.escande@gmail.com>, ath11k@lists.infradead.org
Cc: linux-wireless@vger.kernel.org
References: <20251104083957.717825-1-nico.escande@gmail.com>
 <3393053a-7f6f-c7f8-51c2-60b9a4577808@oss.qualcomm.com>
From: Jeff Johnson <jeff.johnson@oss.qualcomm.com>
Content-Language: en-US
In-Reply-To: <3393053a-7f6f-c7f8-51c2-60b9a4577808@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMTA1MDEyOSBTYWx0ZWRfXwvV+9z5EmNNq
 u3a/qHkBnSwn4uO/oqCYo14D4RaCahOpgwsaxMuezf2OO/nccEHaYMkFHyQr+EhEz8HpuQPbHnV
 zpdLNMWtaWDY77J/A8+kpuXhgGN3l8/F7eCJaSVEMWFdXANbo1pq+I1DNybG3ACSQfoUwZgcWcb
 xaj56triDI1m320Q4Hu7YqMo63ZZJhhOWTzzkSQ5UqFaxBZeB3+FpHPdp73+i1zoYad5JvGO/66
 ELGIE49eORV9fTa6DKv8YiL7s1E151gjGviqOtp/JqflhXAHubHmPhioy5gFRhuKFF+I5gxC0Vi
 wV8+VJPCxdoZea6qqDffwYzaBBsSSuP676N7RfyVjtuwK2Ze9pUny0lPH37YuBfTpLkjKZnH+6S
 +ew7IFTDNWmesAnTBHz7Q14TVTOHvA==
X-Proofpoint-GUID: JJKqPvV0kCOoSL1TquW9JxRxugNBHbA0
X-Authority-Analysis: v=2.4 cv=LLtrgZW9 c=1 sm=1 tr=0 ts=690b7e07 cx=c_pps
 a=cmESyDAEBpBGqyK7t0alAg==:117 a=JYp8KDb2vCoCEuGobkYCKw==:17
 a=IkcTkHD0fZMA:10 a=6UeiqGixMTsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=fv_0YGrm1KOP24S4G1cA:9 a=QEXdDO2ut3YA:10
 a=1OuFwYUASf3TG4hYMiVC:22
X-Proofpoint-ORIG-GUID: JJKqPvV0kCOoSL1TquW9JxRxugNBHbA0
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-11-05_06,2025-11-03_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 phishscore=0 adultscore=0 malwarescore=0 bulkscore=0
 lowpriorityscore=0 suspectscore=0 clxscore=1015 priorityscore=1501
 impostorscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2510240001
 definitions=main-2511050129
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251105_084039_831876_59C03EED 
X-CRM114-Status: UNSURE (   7.55  )
X-CRM114-Notice: Please train this message.
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

On 11/5/2025 7:53 AM, Vasanthakumar Thiagarajan wrote:
> 
> 
> On 11/4/2025 2:09 PM, Nicolas Escande wrote:
>> When reporting tx completion using ieee80211_tx_status_xxx() familly of
> 
> nit: s/familly/family

I'll fix this in 'pending'


