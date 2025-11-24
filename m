Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 90D6BCFD2F6
	for <ath11k@archiver.kernel.org>; Mon, 24 Nov 2025 01:09:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=McpwoqNXGS/RocSD4KfH9RgEXzDojkwJg9omrSOGFUY=; b=e3uNv8r1bxUuq9CrGTbHmvB9LL
	Jm22uoYQueySCZOL1UKR9vsiV1WmZfV0boGw/ofv/pycYNyt0Ys64hqjv3NjuzW0Is06fo3bJlMIE
	BIuj/JYqNyv+tdGBR0UGUljdeqI7s/YoFhowkVv/PE83sVQMcl9zcnXpy2J1L+UP2XoiJkn77YOD3
	XTLKaTu7O1LfxOmm4m7q8iD4Qedzh6nJvHH/oA6MJ1k07kQ+Qxgu12nsBkcHIkHGTPZ/jdx2os35K
	JQF3kHs/qnUIMt67B7DvvtPbm0Vmn/jrwEd/e5eIU6+LvUjpOGxG169JD57X+Ob9wz7lfOPpFEhNL
	jWM4fsdA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vNL55-0000000Atwd-18J3;
	Mon, 24 Nov 2025 01:09:27 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vNL52-0000000Atvk-0oqm
	for ath11k@lists.infradead.org;
	Mon, 24 Nov 2025 01:09:25 +0000
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5ANMHwC61808600
	for <ath11k@lists.infradead.org>; Mon, 24 Nov 2025 01:09:22 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	McpwoqNXGS/RocSD4KfH9RgEXzDojkwJg9omrSOGFUY=; b=XzYddLlH8IGpm5k/
	Hc1JfnCCBo3yv6RVVS3ok2SG/V/7vjHL0nq+eIxSzwwsat0TEMeI0IYrK6A7RTWH
	LBAW5CQ4emXThOu5TE7GNlHeDhZSn/r0r3n+2S0RD9k1sXVilXfTtmjj53VSwCe1
	I4Tc6y8z0nARkwCXRsFUVpRc3irkeAXDE7vAAL8Cj2fJTN0ELjBvyUELmOjUFCZ2
	GxSdCzTH2JeArJOqiF5z36fpe9K5V8lzOYQwQ5n2jvmTsdFYiDz424q0u1AMviv7
	1PlZ3Fwg0z38dzA9LDkd5vu466DMLfdDLsilYdG9RDbIkDczjb1miXlacUE0u9Fx
	b+pRZg==
Received: from mail-pj1-f71.google.com (mail-pj1-f71.google.com [209.85.216.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ama098810-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <ath11k@lists.infradead.org>; Mon, 24 Nov 2025 01:09:22 +0000 (GMT)
Received: by mail-pj1-f71.google.com with SMTP id 98e67ed59e1d1-341aec498fdso5390807a91.2
        for <ath11k@lists.infradead.org>; Sun, 23 Nov 2025 17:09:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1763946562; x=1764551362; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=McpwoqNXGS/RocSD4KfH9RgEXzDojkwJg9omrSOGFUY=;
        b=Zhd5UhOdX4SAzlD0i5m4+xJPc38n42X4bQzxWYk1QEMX8hvjLItCTaadVWZ87EW/0q
         Fs7abSOvdjtmko46LlCKfguYjMdP9HlYwv9nYSTsqLWw7mUHx1Ly9u+34K26EmonOQFC
         ilZ1Ld7AvHdROMbjWNLjOiqp8R3S/l4CGne13svtp1Hx0J8M+WRi3e0SaEdqp1C8Hdds
         GYlkRCWupHnOT80ZoDr0oUQ4YyMSPx6sYYKvovtnpQ+M/Emm5fyccjQUE+GLH2TlBYS0
         gFkFuBUdf9LoxUAqU7zRU+e24a/F1SrTBMow4mv9Q1DX4zKGeayBIyTWTVQK3RxJHKC/
         cWlQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763946562; x=1764551362;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=McpwoqNXGS/RocSD4KfH9RgEXzDojkwJg9omrSOGFUY=;
        b=uvEFs3gfvIsbY1nWWUJahW9EXy55SMOsXxXsUuj32pRtQ7P2FpBw59C5v5CE/AvaP+
         trVGsHBOIT9kwU6dWB/i0NLjzc9xLtTebf646vvvaTaofti3IniNDKEqhUahwfN2jrSn
         1mA5+4KrtZ3nXtjfsrmUSzR47ePHpk892DLQorudfjBWB8zLIzinuyTo5LRHQqwGZMfg
         U0mJ4/Qnkoi+ZOtn/b6LVPP9nx842QdIMFMFfPypC1EJ2EDl639yq/zhlxo8RgsWdCuq
         V0N3WIT32wU8qRdKxAKW/GDheVsu7Or1MYpmsXHj+zFlIdClFTe55Wkb7ofPbqsHpJG7
         /9iQ==
X-Gm-Message-State: AOJu0Yw4GuhEfZRpHjFuTWZq2nkEarTybWJPZ/6NsnBNy7ahoOk7esfy
	TsFVG7thuCCavgEfDuUK5saf5zA4uK7uMzn/zCfLaE+LLIqlWjbIxn1KHQxmHMiZw/y1F9/3J7u
	Cbg+Va0XH9QSCdvAgJlzCAggxF2HECpuPidPkI4biZOp9BnHcJY8oPEzZAew35Qln
X-Gm-Gg: ASbGncvOYjzuDA/NkxdUSBCY92YTJ9NPPAxelkUPpdehbGov885fBpTmvTKAO2T4dDM
	L4r8SuJajl5fQhvACm6/Di/WPUD2rTz40AdWXMF5UScKm5XyjBLXCOYubQgPNzM00T667vGqncO
	ahEprdPEy59kSRRgYSAZJcRo7qNb3NA4zNkbFhYuUq5EcItZo4EAUdmeYF4x0pQikq8/sR7/MWG
	CoE+Bl2+2MHDGRWW3VW4fYeRB2bADTq4gMLMaxLAK0DU+lvftzY7M1k/tsYxhuTXiANeqE+/iKS
	X3LOod5TvkhqwwmtIWmYXHiGtfT9zedTM8hOKx7J1ECyOTzI7IifoczN1azJ3FoKX+/Gfpg8A7B
	+RPU1Ss+jVOralyrk6VOhc+qVKK+6FHO6
X-Received: by 2002:a17:90a:d40e:b0:32e:3c57:8a9e with SMTP id 98e67ed59e1d1-34733f5b784mr10794114a91.35.1763946561910;
        Sun, 23 Nov 2025 17:09:21 -0800 (PST)
X-Google-Smtp-Source: AGHT+IH3hpThDRzrXX5W3YAZ58mr+1Y4niUPT9AW52f3JtZwyrZwbfFhhnTBId5teIW02fQcNgldnA==
X-Received: by 2002:a17:90a:d40e:b0:32e:3c57:8a9e with SMTP id 98e67ed59e1d1-34733f5b784mr10794096a91.35.1763946561424;
        Sun, 23 Nov 2025 17:09:21 -0800 (PST)
Received: from [10.231.195.11] ([114.94.8.21])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-7c3ed379558sm12410583b3a.25.2025.11.23.17.09.19
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 23 Nov 2025 17:09:20 -0800 (PST)
Message-ID: <4a91f85b-12cd-42b6-854f-6e9574392791@oss.qualcomm.com>
Date: Mon, 24 Nov 2025 09:09:17 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] wifi: ath11k: add support for MU EDCA
To: Sebastian Gottschall <s.gottschall@dd-wrt.com>,
        =?UTF-8?Q?Pawe=C5=82_Owoc?= <frut3k7@gmail.com>,
        Vasanthakumar Thiagarajan <vasanthakumar.thiagarajan@oss.qualcomm.com>,
        Jeff Johnson <jeff.johnson@oss.qualcomm.com>
Cc: ath11k@lists.infradead.org, linux-wireless@vger.kernel.org,
        quic_yuzha@quicinc.com
References: <3f355c8a-5bf2-4a74-9b35-daa8ae479736@oss.qualcomm.com>
 <CAKEyCaD4=qeQZYYOv4BTrqUJkZa+jnea1b3BL434X1iGMA-_xg@mail.gmail.com>
 <35c554a3-efdd-425c-ac34-858a927bbe15@oss.qualcomm.com>
 <e7e4058e-6f95-444f-b843-d942496dcf07@dd-wrt.com>
Content-Language: en-US
From: "Yu Zhang(Yuriy)" <yu.zhang@oss.qualcomm.com>
In-Reply-To: <e7e4058e-6f95-444f-b843-d942496dcf07@dd-wrt.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Proofpoint-ORIG-GUID: _IB_iVFqsArwqXanlXoEjDHi-tQ0yn1c
X-Authority-Analysis: v=2.4 cv=PdHyRyhd c=1 sm=1 tr=0 ts=6923b042 cx=c_pps
 a=UNFcQwm+pnOIJct1K4W+Mw==:117 a=Uz3yg00KUFJ2y2WijEJ4bw==:17
 a=IkcTkHD0fZMA:10 a=6UeiqGixMTsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=NEAV23lmAAAA:8 a=EUspDBNiAAAA:8
 a=T51TZME3aqD6E_23_x0A:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=uKXjsCUrEbL0IQVhDsJ9:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMTI0MDAwNyBTYWx0ZWRfXwvxfuMvd7Ws9
 OCNtHWbBpA9OmNjY7rPPl43x4KPUbE2gnR3gr5O/9bK14F10YMaAZeqDByWOMO8T/6xxrZAic/l
 Zvd4kuXsEFmjogoKeueMd5ud96UqFpVdsw1aOlrRoZ+GAD6JdgVvK+hHSDZzIDE3mL8Gb5DVRcu
 cdhxG8KxnJ1uj9abjs28+1kOOOY0YapzLB2y0Tne82QO5o2ITOy5OsEaOo9ESxcLNDKUF436SmF
 UNDyTI2HXnN6MB4V4Dw3v+Gh5YuUQA6j/wluu1D1wxFVzxNTnhOYr/9Z0POHv0vFQjnpn0HSXzt
 wCa7lxhKfE73o05kwnhXIBXFhuq5Pz1S3ULls9ogk9N0PNKyq9J6YyHEFUC5CvW2EW3pra+BGmW
 9atMfbbDEEA4PwtDJQAsmUlGL6y3HQ==
X-Proofpoint-GUID: _IB_iVFqsArwqXanlXoEjDHi-tQ0yn1c
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-11-23_09,2025-11-21_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 bulkscore=0 spamscore=0 suspectscore=0 malwarescore=0
 clxscore=1015 priorityscore=1501 phishscore=0 lowpriorityscore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2510240001 definitions=main-2511240007
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251123_170924_254817_BB39F4FA 
X-CRM114-Status: GOOD (  12.85  )
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



On 11/22/2025 6:17 PM, Sebastian Gottschall wrote:
> Am 22.11.2025 um 08:55 schrieb Yu Zhang(Yuriy):
> 
>>
>>
>> On 11/21/2025 4:41 PM, Paweł Owoc wrote:
>>> On Fri, Nov 21, 2025 at 6:00 AM Yu Zhang(Yuriy)
>>> <yu.zhang@oss.qualcomm.com> wrote:
>>>>
>>>> hi,
>>>>
>>>>   From your log/calltrace, I didn’t see any errors related to MU EDCA;
>>>> what I saw were related to SMPS. Did you also add changes related to 
>>>> SMPS?
>>>>
>>>> Yuriy
>>>
>>> Hi Yuriy,
>>>
>>> Thanks for your reply. The ath11k driver is version 6.14.12.
>>> Everything works if I remove the mu_edca setting without any other 
>>> changes.
>>>
>>> The problem doesn't occur with the newer IPQ8074 firmware, version 
>>> 2.12-01460,
>>> which hasn't been publicly released.
>>
>> So the newer IPQ8074 firmware fixed this issue, great.
>>
>>>
>>> More details: https://github.com/openwrt/openwrt/issues/20702
>>>
>>> Regards,
> the point is what he mentions that these newer firmwares arent available 
> public. i provided openwrt these images for testing
> so he is asking if or when qualcomm does release newer firmwares to the 
> public repositories
> 
> Sebastian
> 
>>
>>
>>

hi, Jeff and Vasanthakumar

When will release the newer IPQ8074 firmware 2.12-01460?

Yuriy

