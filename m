Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B07F1D38FFE
	for <ath11k@archiver.kernel.org>; Wed, 14 Jan 2026 17:24:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=9+mDVu2OGbCT81X3aqnLFlTpu1u9SyfEN+WtZVk3UzM=; b=G1R2nMPa41m9cEgvr/7g81kT3+
	bm3qogAr62q+xaIV8/Air3cFVp7TE0Ui2H8ZTeKO3WcJHeEoQPV76kzMiaBpISkVepVyWacYvYErN
	x6aFdrjpOOnLUONQ3DrkQPr7NBw0Xirkrk+Molus4DciyaUly8NYj7J7FkXEFn9QIpGOi/TqEgOMd
	BgHxa1GILe5LS1tBQuPY3Zao/C+nSJSUVXN1mikL0KDfcIbIW0eDM8ckKywTZnzKa7M2cEbqvHhHz
	g28+4fyxt0PY75jLUI1kftqaNFmRdVvzsd89VNMWU55f0EB0O6eZ6+iAPPZQew9ApVl87guSFs8Qw
	dSkuSD/A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vg4ba-0000000A7ne-2mHn;
	Wed, 14 Jan 2026 17:24:26 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vg4bY-0000000A7nA-121i
	for ath11k@lists.infradead.org;
	Wed, 14 Jan 2026 17:24:25 +0000
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 60EHAFq92552705
	for <ath11k@lists.infradead.org>; Wed, 14 Jan 2026 17:24:23 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	9+mDVu2OGbCT81X3aqnLFlTpu1u9SyfEN+WtZVk3UzM=; b=BMYn0omkV3KnPVwr
	aYc7QEPJX7FQ1zDsOUQwM7ueppV982NjHgRbTbww2X1wElcH+dK+devi1eBD4o7R
	31I/Au5ABO8cyTs1ta53A+UbUK4xHZLek6lNkI6T5dCijSRIIpBprL1DxQefB4xL
	PFgq+WLXG1vRbkb5Iwvc4D/U5n+YiT8b69bg2G+ader+BadeegqhOHILJcrBLoVT
	X8uhIX29Oo26kV4oPjNvJnhq9kq7ttG6R8vnBnBPtAG2978gS4QSQXhG15twuFiq
	KOswoKe2n0pUNBJuN/8hyoWz5ZB7SPIOr2xKvFLWf5MGPlQWjlGyDB2UvGasU725
	+sS+rA==
Received: from mail-dl1-f69.google.com (mail-dl1-f69.google.com [74.125.82.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4bp8d31nv6-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <ath11k@lists.infradead.org>; Wed, 14 Jan 2026 17:24:22 +0000 (GMT)
Received: by mail-dl1-f69.google.com with SMTP id a92af1059eb24-12338749ea9so6234c88.0
        for <ath11k@lists.infradead.org>; Wed, 14 Jan 2026 09:24:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1768411462; x=1769016262; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=9+mDVu2OGbCT81X3aqnLFlTpu1u9SyfEN+WtZVk3UzM=;
        b=fm2MeXbotSLYNFq/rEIqy/Q5Cxruz4MIpWj2xh7HAPUrCLOOh7j0gV84Jq9AVDVM8S
         HseNjTq4pcOCTdNpbo+fHAdsjcQLf3RSCS0JRADdizKBALh3r1shUUXOf0l5/skQu5PX
         rj2IiC7z/8ClA+Yd1SPY7rH6daxILPK0CzWhCTSYTgFLQO5TRiBpu4/eOp6Ff0AF9dZo
         r9DhT7MhX6IG0dA3oQMuOklXHNh8J1OZHPIuj/IP1GRFRS6mghWgUDwua7Q4vQFXx8Bh
         5GuWcPk5qnoooRwdsXJM5lDB2KNUTxCYp3K0iqfzJin/ZPz+FdOjAf8SqVuJmEiqB6uW
         30iA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768411462; x=1769016262;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=9+mDVu2OGbCT81X3aqnLFlTpu1u9SyfEN+WtZVk3UzM=;
        b=Xx2onTR8qhheu4zNs6YLCgTnC0Y4OSsNj5kXYGNDXnCvs//QHYZosdwPN2mFL5lM2e
         HVA2QfV5/9dkKK1TshX7c+nfgy51tJcakYhyVrq2ryQdISU4UfeS1Sws3XN7SdqsCAUq
         IYIIBX5MfGuPmI4wcBTbdOHF3XDe5Yu6Vln/IopdSzYX6pzypyNZG98ZUCjsheDIwZpR
         D4Nrdh2CNBPCXyQCXA9wT7bGVZG9tlzFb1IIZ8JySGAjDfiTrLwdZKAkmAJKCKBHlc9T
         Bi3j/PgTZQAnZZwSx7XciQTBqpNgYZfR+vzl3Pl6ZpyCquAfG81mx7H86MsBbFnR1K+k
         F53A==
X-Forwarded-Encrypted: i=1; AJvYcCWuUuQhnsXY+SzqlghRMj0GAXpUofuKoiIN/GTrbL9+70yTN8je/Gv4vah5Kco0ntpq9evDbBY=@lists.infradead.org
X-Gm-Message-State: AOJu0YyqkHudPS1GMoQWpwdxUhv6lG2h6ViEYvPdXgloSMSsUjFfmZrR
	NpDsBXhjU+cD20xzmtECWADPKWJS1OVV99qUfhnIyP4IqjhSONzO1NaFLASVbfOf7TJ7T/5rotT
	kwuaL7HX9TlnDs1bmZbthoTynfjfz19U5yyTUEGoEj859tCkgLzZCP3R/621FdDZT
X-Gm-Gg: AY/fxX5vHI77sf7EFFZUigIPSDUhQYtRGjk3VWdl2Zymfw+48in8qzh01dzyEOmyTa/
	cBvf+PHLvspp7IdnytJNlQ+MrUquEJe+bfZ2MZU5tmK5yT5StEeLooHBqqa7PsOJxRy09YApunb
	0VHql4/jpypWx/UUAopgW1UHQzKf67kOoqlfGrHN3yY9VVQZ7mPQLCkUAzsbf1wpQnR7bV6vgRn
	epcZWR4y5Zxk4dWB/XcKPAtz8DOhXlg5u3L8bLX4S68z04gdUzdgBcSRDLsuMcZk+uYNIK0NBCx
	zsIeLROPbdo+ZdvvaJdIguIclL1ursqD7XyjoO75zYyhx6LplJhJMAHw764oTPQlNWl6bECMax6
	RqZmABHNY9gxpqAcbRxsJqzGzNDUoHi62hjl6rJPIRH+DJ7GjtaGj5uCHDdER2IzZYoi0Kg==
X-Received: by 2002:a05:7022:fc0b:b0:11b:9b9f:4283 with SMTP id a92af1059eb24-12336a6d9c6mr2588090c88.24.1768411461919;
        Wed, 14 Jan 2026 09:24:21 -0800 (PST)
X-Received: by 2002:a05:7022:fc0b:b0:11b:9b9f:4283 with SMTP id a92af1059eb24-12336a6d9c6mr2588056c88.24.1768411461381;
        Wed, 14 Jan 2026 09:24:21 -0800 (PST)
Received: from [10.227.110.203] (i-global254.qualcomm.com. [199.106.103.254])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-121f24985d1sm31170055c88.16.2026.01.14.09.24.20
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 14 Jan 2026 09:24:21 -0800 (PST)
Message-ID: <c8456b52-f14c-4bcf-9385-580e9607219d@oss.qualcomm.com>
Date: Wed, 14 Jan 2026 09:24:19 -0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3] wifi: ath11k: move .max_tx_ring to struct
 ath11k_hw_hal_params
To: Vasanthakumar Thiagarajan <vasanthakumar.thiagarajan@oss.qualcomm.com>,
        Alexandru Gagniuc <mr.nuke.me@gmail.com>, jjohnson@kernel.org,
        ath11k@lists.infradead.org
Cc: baochen.qiang@oss.qualcomm.com, linux-wireless@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20251228151408.2116108-1-mr.nuke.me@gmail.com>
 <56c6471b-c878-4afd-8e8e-d56266ca9c64@oss.qualcomm.com>
From: Jeff Johnson <jeff.johnson@oss.qualcomm.com>
Content-Language: en-US
In-Reply-To: <56c6471b-c878-4afd-8e8e-d56266ca9c64@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: zt9x2gZW2pAPCLmE7OFeYrNVPOU8mE3t
X-Authority-Analysis: v=2.4 cv=fbWgCkQF c=1 sm=1 tr=0 ts=6967d146 cx=c_pps
 a=kVLUcbK0zfr7ocalXnG1qA==:117 a=JYp8KDb2vCoCEuGobkYCKw==:17
 a=IkcTkHD0fZMA:10 a=vUbySO9Y5rIA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=VwQbUJbxAAAA:8 a=pGLkceISAAAA:8 a=EUspDBNiAAAA:8
 a=4N76r0Ozp7Clb_Fv4mYA:9 a=QEXdDO2ut3YA:10 a=vr4QvYf-bLy2KjpDp97w:22
X-Proofpoint-ORIG-GUID: zt9x2gZW2pAPCLmE7OFeYrNVPOU8mE3t
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTE0MDE0NiBTYWx0ZWRfX5XZSG0sthCvI
 KiQ8mruQeQRBFg/Fxj9JACpQh4oOjhvl5erzAwrQam39hYmJAwe6X9Ot8uydFnZBgjbZ4aZzxV3
 sf7jGT+vdu+zP44RtU1US7Qajz1PmnRFc3efLMJkoF9AMaX1h3QOvPIZZ2Ohci18xFLTZagnZUe
 DvWCOFhsW9280c9E8S83bgesm2/NrM1UCKKzrKt73gAhGHLMWV2fwH19dBayMXrZ/FnM8x0H0Cz
 BdVS9iHfKJM6SEGh0AXs2JDWBQ39r7TWt3rP/9+5jipwzMcaICiE2J2cE3dKlI1qRVPn5KgY5vE
 fk2PNhmSik1Pk+M5SlWNr7U0wTCd/CcSSnu4V4BVXljE1xtvHeAYq1HggNTwrmUxWPTLzC7RmXQ
 6Z1Bp0KANOZplblpumlktpuUKVSnbAlEqIb9ypibJFzGIPZ/yFrbvNij9ZoBuc7rIBeMWP2gVQA
 jNocV0argsyhcKT4w0g==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2026-01-14_05,2026-01-14_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 suspectscore=0 impostorscore=0 phishscore=0 priorityscore=1501
 adultscore=0 clxscore=1015 malwarescore=0 bulkscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2512120000 definitions=main-2601140146
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260114_092424_438218_FEB2FF5D 
X-CRM114-Status: GOOD (  14.52  )
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

On 1/12/2026 11:00 PM, Vasanthakumar Thiagarajan wrote:
> 
> 
> On 12/28/2025 8:44 PM, Alexandru Gagniuc wrote:
>> ".max_tx_ring" is an upper bounds to indexing ".tcl2wbm_rbm_map". It
>> is initialized in, core.c, a different file than the array. This
>> spaghetti-like relation is fragile and not obvious. Accidentally
>> setting ".max_tx_ring" too high leads to a hard to track out-of-
>> bounds access and memory corruption.
>>
>> There is a small ambiguity on the meaning of "max_tx_ring":
>>   - The highest ring, max=3 implies there are 4 rings (0, 1, 2, 3)
>>   - The highest number to use for array indexing (there are 3 rings)
>>
>> Clarify this dependency by moving ".max_tx_ring" adjacent to the array
>> ".tcl2wbm_rbm_map", and name it "num_tx_rings". Use ARRAY_SIZE()
>> instead of #defines to initialize the length field.
>>
>> The ath11k_hw_hal_params_qca6390 uses fewer num_tx_rings than its map,
>> so use a constant to express the correct value. Add a static_assert()
>> to fail compilation if the constant is accidentally set too high.
> 
> Text related to static_assert to be removed accordingly.

I removed the last sentence in 'pending', please check:

https://git.kernel.org/pub/scm/linux/kernel/git/ath/ath.git/commit/?h=pending&id=26bb149b5e011b0f73f7b74421589cbd38e3304b

> 
>>
>> The intent is to make the code easier to understand rather than fix
>> an existing bug.
>>
>> Signed-off-by: Alexandru Gagniuc <mr.nuke.me@gmail.com>
> 
> With the above minor comment addressed.
> 
> Reviewed-by: Vasanthakumar Thiagarajan <vasanthakumar.thiagarajan@oss.qualcomm.com>


