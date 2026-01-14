Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0DE88D3CC82
	for <ath11k@archiver.kernel.org>; Wed, 14 Jan 2026 21:59:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=OpvEH4+21FwdP09LJL6iR3hKr4clZnGQYSImAni7YoQ=; b=lSTBKDJdIDXYRhAzmoI2JIzSLi
	sxdPxldxRjCOVhVnytQBNyfBtuy1/u8dXawSdEv16SOEqUHkMXzGeVTozx2e/Geu0qgjmUCnhr/IU
	zjni3ge17B7xUCWAlfUW2P7enGTTzWNpZbbYNzRIjuaXSUOHJurPaZNbeRx5Qat9dNpa8nI14Crow
	t3IBKJRboGro/FQ3vQFi4Knqd7udI0kuW1rSwicEDF9v8QWDZ7TK+L99Kj9bhw/of+pYLOLy9RM3C
	LOgvGpvkORhPN87d8iADHjsAV0c/6B+VFoZ+wMRXDcgD6jowkNdXN6DhzEn/q/h5FNHarGvtlP9cr
	T3dZB9oA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vg8tZ-0000000Aqqr-42Gy;
	Wed, 14 Jan 2026 21:59:17 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vg8tW-0000000AqqV-1gMp
	for ath11k@lists.infradead.org;
	Wed, 14 Jan 2026 21:59:15 +0000
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 60EHa0pA3296280
	for <ath11k@lists.infradead.org>; Wed, 14 Jan 2026 21:59:13 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	OpvEH4+21FwdP09LJL6iR3hKr4clZnGQYSImAni7YoQ=; b=BV9uvlqZgkHRVeEL
	1LBpMOnJMGEzujNzwizNp/D3litzDgCUwdmD0WSGlrKcuSjaOvVjVJhTizReRffh
	YY4qXBUYWBq4WhHBqxSgm0BLvYP39+qvcVYMIhHxpm56+CD9FqPwSVZkh0PzJyWv
	wmaAaZuFoWlQcYTVUnH8iqgT4EOtkYExvhHGRpKUBQ0mcJAb7webWIff7RfWzGxp
	6qLZow7mux2KgXyBjhIDtvGIStp5LM1jKIzrCQmFD8YENnD4ZUohKmDU/DTd4y41
	WG/4zXcpxWowZQ3vAeG5trLNaokToDG099Yun5yF93H5AzfLUf+pvlTVkXgEChQS
	eMzVrQ==
Received: from mail-dy1-f199.google.com (mail-dy1-f199.google.com [74.125.82.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4bp8t2tdcp-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <ath11k@lists.infradead.org>; Wed, 14 Jan 2026 21:59:12 +0000 (GMT)
Received: by mail-dy1-f199.google.com with SMTP id 5a478bee46e88-2b47ce772e4so1306227eec.1
        for <ath11k@lists.infradead.org>; Wed, 14 Jan 2026 13:59:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1768427952; x=1769032752; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=OpvEH4+21FwdP09LJL6iR3hKr4clZnGQYSImAni7YoQ=;
        b=ApHvCx2StmQKSTRGzl7gLPOIhbAK7aPMcRg5c4uOsCX+Y9ZlcS8s7dzNyc6BTK88lT
         tSUp4CZl9hyTMUkD8ZLf0Sgj9PfX912O1w0Jx4CL0/1Xon+VAF4J0O9oTYZ/qFo6LUXS
         Td+bUkloxcnsrWH+CEhxRnO9xBpl432b0Minz8STb0thbVQfoWSvBAzerE6ZKz+yKhX2
         WIuhdqIAgHDJ5Fy90Fe/ysRfOIp7vZ+Nq3yJWYpSHPGqnM0f02gJuwpZu0CQmCIrcIEY
         YSR5yvKtmFl+gzPCcOsPROwi5xZUiQo93N9eXCqrCUKNr+K9INRyIfHrpnOGAzkb/Lnv
         xhxA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768427952; x=1769032752;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=OpvEH4+21FwdP09LJL6iR3hKr4clZnGQYSImAni7YoQ=;
        b=FLWIbrsAC88I2x8d+TESVifj3FMuLpnQAvZcETOh3pGBwL1wuR/sbYHXVrm25Uytl/
         SiKwxzJiQLp3QAXDpHYx4aMDclYZNpwnAi5k89pRoXA68/pQ/e8d1zpfP5U90iSQHID8
         G3lqo4p4Mgp4mTIS9VG8uJZDd02TlSC5GP1gm7Ukqn1BEePRoRbiqaaRoQor8uDfiTgT
         HxUbGU5TCJiDXjHvVPuv1ZrmyIy57PW5Q2vMwm5GSLEXxnsbqPpToFZRGouTZWkhdN5w
         PBXVhT1+ygUNf+7ocfvX/EDgEb7tDSYu3ShZjmNyjWaqWy9qt9aZCnkLvrJZPrLpIjZw
         Xw8Q==
X-Forwarded-Encrypted: i=1; AJvYcCU9xwjtSjCqahhxGJ5n/fP8iKgbqwDcpA1QSo13dXaldJ4pdWE/aIZymb6eMQBWYElWpxUBeSM=@lists.infradead.org
X-Gm-Message-State: AOJu0Yw492te5rszugW7j8nLgvXeKAW6AHnVheemYQZ69N71Y9v0m/RV
	cXICyLgOTob0iZGpYbzqU/x9zgRryaYSvo8W+iPatJ0yd9OnkEZDRT6xZ2ELzV3bKpl1m3wxTBw
	EvD8FIdVLseiDstpF0DcapNhDxAeL533zFsGjM0Db674tQGsSQ6mGZibzFD0EVZFF
X-Gm-Gg: AY/fxX6MCpnaG5pos/QqkLRvx0TZy7Dcleq7D0C+o0mRGnhjgZdeg/VLlh+oyfEvdk5
	hRwaMz69B1js52jF67PiQSvKbs5XP27RPHGGUxXGqN3QAq1wo/8MxVo/B3L5lyVd6wKgjeG1LbA
	oNssnOwB3PRQEuI2sGsEbhf+hwX3YqxLFznmyZvba4Wy3qlC36rq0zdJUyZ3NqH9HG9ukxLJhW4
	7llZ0oq3fxqQKu3vbEsV1k80XuxFMM0HkcYgw9OFsakAwgoBVtZCaX5K2KAeezUUewyylDfE3V2
	7DEuL3XADhdjlhtUr0UM6uw23ZDe90QDstFiQqxb+Y9IgfCsudG9yCbJljhHOoJz8f1r0FFqp1g
	7FSYaXDTw0239cqsPA3s1PvpTSzoj5S8iG9pdIN3TRWm6JnaKfVTX6/aXMdK8E1GMXZZ/xoQ+7d
	XO
X-Received: by 2002:a05:693c:2c13:b0:2b0:59da:f798 with SMTP id 5a478bee46e88-2b487068cccmr5445100eec.21.1768427951807;
        Wed, 14 Jan 2026 13:59:11 -0800 (PST)
X-Received: by 2002:a05:693c:2c13:b0:2b0:59da:f798 with SMTP id 5a478bee46e88-2b487068cccmr5445073eec.21.1768427951297;
        Wed, 14 Jan 2026 13:59:11 -0800 (PST)
Received: from [192.168.1.3] (c-24-130-122-79.hsd1.ca.comcast.net. [24.130.122.79])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-2b17078dd78sm20133476eec.19.2026.01.14.13.59.10
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 14 Jan 2026 13:59:10 -0800 (PST)
Message-ID: <89a61ef1-3e83-4303-ba04-cf5c5a4aae56@oss.qualcomm.com>
Date: Wed, 14 Jan 2026 13:59:09 -0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3] wifi: ath11k: move .max_tx_ring to struct
 ath11k_hw_hal_params
To: "Alex G." <mr.nuke.me@gmail.com>,
        Vasanthakumar Thiagarajan <vasanthakumar.thiagarajan@oss.qualcomm.com>,
        jjohnson@kernel.org, ath11k@lists.infradead.org
Cc: baochen.qiang@oss.qualcomm.com, linux-wireless@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20251228151408.2116108-1-mr.nuke.me@gmail.com>
 <56c6471b-c878-4afd-8e8e-d56266ca9c64@oss.qualcomm.com>
 <c8456b52-f14c-4bcf-9385-580e9607219d@oss.qualcomm.com>
 <5896283.e9J7NaK4W3@nukework.gtech>
From: Jeff Johnson <jeff.johnson@oss.qualcomm.com>
Content-Language: en-US
In-Reply-To: <5896283.e9J7NaK4W3@nukework.gtech>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=YPaSCBGx c=1 sm=1 tr=0 ts=696811b0 cx=c_pps
 a=cFYjgdjTJScbgFmBucgdfQ==:117 a=Tg7Z00WN3eLgNEO9NLUKUQ==:17
 a=IkcTkHD0fZMA:10 a=vUbySO9Y5rIA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=VwQbUJbxAAAA:8 a=azILXIGDsH6i2WhDGicA:9
 a=QEXdDO2ut3YA:10 a=scEy_gLbYbu1JhEsrz4S:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTE0MDE4MCBTYWx0ZWRfX3wR9S+dbZSof
 HsR9UeNsAWF0GYwqQ0w2N0fPZrWuhPBP4QeCrIRm8ZlvrwP//2JvbyV5qFUAJjnamWYDwrEHl+9
 IWx9K5Ep2l/BsS/z/pK4Vn/2xcDNLbX/Hf3Ov8x/ETdKVkxAEtbK9gJklsj+oB/GY7SgfL+VHiW
 NkyVVnM9TYR8op8OFpX3ScGxOUFg1705KvCPpSwVjXdfKi/4p0GSd5pWpC3pQAG0ZY8gzPhMf3u
 QPyToioBRN9gshgar5c8bDULE9ZuhKU4cuwTPNzYRu9qh7hIxfQ6WoM11gq+R5NOrtFiHY4EvvL
 W5FM5gcFDNs3yR//eidQZf3F3o20VAwE5K3j1wdAxs2gvmlTp5rjqGmRtEqCzBZhZVI5ZKI12hT
 1/x9Znalintl0r44fochn9igkVtO7MikkfDN3FK/kT6WKaQ8H9j3twEHTjOp8Ib7rVShvfAEypZ
 x3eIxcN5VDDruzlcxzw==
X-Proofpoint-GUID: EM1yt54e-AWvoZ2LitcSCZre9Ngoe1Cv
X-Proofpoint-ORIG-GUID: EM1yt54e-AWvoZ2LitcSCZre9Ngoe1Cv
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2026-01-14_06,2026-01-14_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 bulkscore=0 impostorscore=0 suspectscore=0 malwarescore=0
 phishscore=0 lowpriorityscore=0 priorityscore=1501 spamscore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2512120000 definitions=main-2601140180
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260114_135914_582932_1C8E4F8B 
X-CRM114-Status: GOOD (  16.35  )
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

On 1/14/2026 1:29 PM, Alex G. wrote:
> On Wednesday, January 14, 2026 11:24:19 AM CST Jeff Johnson wrote:
>> On 1/12/2026 11:00 PM, Vasanthakumar Thiagarajan wrote:
>>> On 12/28/2025 8:44 PM, Alexandru Gagniuc wrote:
>>>> ".max_tx_ring" is an upper bounds to indexing ".tcl2wbm_rbm_map". It
>>>> is initialized in, core.c, a different file than the array. This
>>>> spaghetti-like relation is fragile and not obvious. Accidentally
>>>> setting ".max_tx_ring" too high leads to a hard to track out-of-
>>>> bounds access and memory corruption.
>>>>
>>>> There is a small ambiguity on the meaning of "max_tx_ring":
>>>>   - The highest ring, max=3 implies there are 4 rings (0, 1, 2, 3)
>>>>   - The highest number to use for array indexing (there are 3 rings)
>>>>
>>>> Clarify this dependency by moving ".max_tx_ring" adjacent to the array
>>>> ".tcl2wbm_rbm_map", and name it "num_tx_rings". Use ARRAY_SIZE()
>>>> instead of #defines to initialize the length field.
>>>>
>>>> The ath11k_hw_hal_params_qca6390 uses fewer num_tx_rings than its map,
>>>> so use a constant to express the correct value. Add a static_assert()
>>>> to fail compilation if the constant is accidentally set too high.
>>>
>>> Text related to static_assert to be removed accordingly.
>>
> Hi Jeff,
> 
>> I removed the last sentence in 'pending', please check:
>>
>> https://git.kernel.org/pub/scm/linux/kernel/git/ath/ath.git/commit/?h=pendin
>> g&id=26bb149b5e011b0f73f7b74421589cbd38e3304b
> 
> Re-reading the commit message, I think it makes sense to also remove the 
> sentence "The ath11k_hw_hal_params_qca6390 uses fewer num_tx_rings than its 
> map, so use a constant to express the correct value.". Do you think it's worth 
> submitting a v4 with this minor change?
> 
> Alex

No need to submit a v4. I can make that change in 'pending'

/jeff

