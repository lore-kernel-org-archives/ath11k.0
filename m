Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 714BACAC5B8
	for <ath11k@archiver.kernel.org>; Sun,  5 Oct 2025 15:49:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=l9PIQZI3LCSH8U6hYQlVNYYlZC7mA7OsdnmHKJGMOUk=; b=qg7oKcrzNouol2CvlWWXmtpNgC
	VxehDPVkkMs7TfnUvwDIUtmzmACkVz19gQIobr24s3KwIkp+ppKMXDbQP+VWrm3SQIzrSyCNY6sqP
	G9vKOfz81/6hlzZkV4UF/88QkrmZOspuukatF1+ehtYUbQZ7CCDdQmUaNmUwe8vGb0mwgMKJHT6mE
	U79+c72Mjuczg8PscLt6D86tsFIILzo2XVElQscrbMHytnRXaf8EzmycI4ME8iu9aSgrA7Wm1CHLn
	lkqGiByiGMZBKaeoozDUQh6eYW0yJNNig74uURRwCiAmAlBqiF2wOh2KRM6s3sx5SFvV3LTwApwxG
	o6igTcjQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v5QzF-0000000FiHX-2x8W;
	Sun, 05 Oct 2025 15:49:25 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v5QzC-0000000FiG1-040m
	for ath11k@lists.infradead.org;
	Sun, 05 Oct 2025 15:49:23 +0000
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 595FUdXc021602
	for <ath11k@lists.infradead.org>; Sun, 5 Oct 2025 15:49:21 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	l9PIQZI3LCSH8U6hYQlVNYYlZC7mA7OsdnmHKJGMOUk=; b=K4RE1nKxiA8TUAxN
	ac52y6FwYqQWRzOxoaXaxQZUxVWFgN2j6RxthYUNL3txL7kD41z5xCnBWU3NN7po
	cXwDG2SUWMvizmUF3A1ScLMWA3n9wFbDILa+ZYbXmQx11Re3MpWHbKAZMTlpB/vw
	oQfqxhQenZdAfIKfCsSrwIj/qqXUynqgjS9GY0IWP2qjT7PDAF5ZsZzXEHuX7bsb
	xp6umtHZbNfKK+8FxUk8bIr09rbmoTuQXqds3hUMWV5CDBQAF8Q9KeXDvfgcrrsz
	ReBWylsF++gJPIon6h7e5gwGNEmWo609inBsXYG1F4qXJ/KeAnm1x/+XTxzIaQCC
	7LRArw==
Received: from mail-pl1-f198.google.com (mail-pl1-f198.google.com [209.85.214.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 49k6bfhauq-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <ath11k@lists.infradead.org>; Sun, 05 Oct 2025 15:49:20 +0000 (GMT)
Received: by mail-pl1-f198.google.com with SMTP id d9443c01a7336-286a252bfc2so44558575ad.1
        for <ath11k@lists.infradead.org>; Sun, 05 Oct 2025 08:49:20 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1759679360; x=1760284160;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=l9PIQZI3LCSH8U6hYQlVNYYlZC7mA7OsdnmHKJGMOUk=;
        b=UI5nDeQjbhVy+1sQOCepknlS34ZZxLIb6RcOgWEts8LKAiOzG8SN4z/vanSD/dlRGA
         TbZOYsJ/+9z9Z24+pw0FBU1WjkYa37lMEs1pgZkwfOfrqxD/0Z+qui+x3xrNpBeTnRAC
         Q0bVFirxRrh6icObfNEjGRznjVhr/kSQwaWyzAYi2tuniJgRsq+J6I9ezg56Y8ucWL8X
         DZUcDfy+Pwgg24JE0fYAmaQwfNxXo8c2F1jsJdRy9FuWvHbT1SBvLE/SoTnxhhlLn7my
         INuD1cbSRN/HZbiFpvEee8D5taVfRmnDcH86jPbpmpGbbRowz7LPWdOxjR4npfCaZEJS
         eA4w==
X-Forwarded-Encrypted: i=1; AJvYcCV6SEhmIOSlgiXMNLtTbnSEVga3mZbVBd7Xqhta5NbEpCBYH75ZrKgc0b2nkx8AzzpLbwRstZA=@lists.infradead.org
X-Gm-Message-State: AOJu0Yw8zqc9f3FWP9a6XIVMtnZKg69KY+yHYzKCXpcnezZybvLbljcy
	qW1ANN+BZDOpsz7KcDOHXm2KBs/R4Q0slcVIei/EwDahbNnj60b5NvPv0X9pRzJ0m0lWg9xb6LT
	ct8WDSCEZgnbYlrf4LlV/M1N8ZA7LJDWqJyIcGwy/hr+upHaU2tfiUYvN070dej+L
X-Gm-Gg: ASbGncvo64N7SRKcLQULESN3PM65a3Ik7ifTyHfFIOtSV1k403zyuAaaVShJs6c5pdH
	q8xnGln6X0rAMa9PMpHNrwZXuC0ihRslbwMQGRBUih6nWQFJiqkzqJvy0IGYGbQqSOFoh5YmP9V
	cueDFO3ZMnR8fBmOEj4CS9qFu0VIChLt3w6rwZpyXbDTvsC29L/9Jt5iBv/kIE4DACHI5KU9Uyp
	lxjskL/qqf1eCUeiuOExJE4zZlEl9Ld1YJSfbiuBjlb89Uepz9lYeK5qW+3rf2Uw5ukRJhfkfA6
	xiBOCfiGeBp0mfSG5TvuQhtM+opFssYquga1y9sHVkEm7URrBiErnyHYLpZy8Bg6p8T0GIpkAbh
	dmSZDyn4+M1Mo8bp2zex6
X-Received: by 2002:a17:902:d60d:b0:272:d27d:48de with SMTP id d9443c01a7336-28e99d87ab4mr113813785ad.18.1759679359877;
        Sun, 05 Oct 2025 08:49:19 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IF1mJ8x2elGCEAsphoc9C8FUDodvjlK5885jCCmAIT0/U50dB5n4jUt0cw9J7YAYlYwkKA6aQ==
X-Received: by 2002:a17:902:d60d:b0:272:d27d:48de with SMTP id d9443c01a7336-28e99d87ab4mr113813635ad.18.1759679359380;
        Sun, 05 Oct 2025 08:49:19 -0700 (PDT)
Received: from [192.168.225.142] ([157.49.209.24])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-28e8d1b88e6sm106267615ad.91.2025.10.05.08.49.17
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 05 Oct 2025 08:49:19 -0700 (PDT)
Message-ID: <6b6c8f3a-63bc-b3eb-9f26-c7db6e8bcd7e@oss.qualcomm.com>
Date: Sun, 5 Oct 2025 21:19:13 +0530
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
Subject: Re: [PATCH ath-current] wifi: ath11k: avoid bit operation on key
 flags
To: Rameshkumar Sundaram <rameshkumar.sundaram@oss.qualcomm.com>,
        ath11k@lists.infradead.org
Cc: linux-wireless@vger.kernel.org, Dan Carpenter <dan.carpenter@linaro.org>
References: <20251003092158.1080637-1-rameshkumar.sundaram@oss.qualcomm.com>
Content-Language: en-US
From: Vasanthakumar Thiagarajan <vasanthakumar.thiagarajan@oss.qualcomm.com>
In-Reply-To: <20251003092158.1080637-1-rameshkumar.sundaram@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: HRe5iivg5Lxom8nW1k1IlcwZ5wVmA20z
X-Proofpoint-ORIG-GUID: HRe5iivg5Lxom8nW1k1IlcwZ5wVmA20z
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMDA0MDEzNSBTYWx0ZWRfXw2++m7QKMX0n
 c16mCk/cCnfDUJF9HlE2HbnUts0t9z+z9Wwnus0xCioJhB+6KSq+F+HBaWbVxDx2bfzlWhdnJR8
 Zlvu4TOsIkyTtZ+Q8otMCYkJ/cHPyw23PBCVDhNNqEj3r0gKUZfrCCC7RDM1c1QMe96w7hMdhne
 WXnk8ZqCt9n4badrNMWYFSza37T8wnlHSrj8u2yrN3pzsuipo3dxK8SXvP8d9LVjhayhn7bzSB1
 kDALJShq81s0bwFuk94BmcStopvOA0fOq16HaIS1bpAJY9LRVTzzUHpU46GE1ZdSKTctVtoC7/P
 euitj3NeMKlkvZMG9xCDOub0+cMhDwDXwv4KYFGy7uGCboe6swDgv0OTUonawK4VIEPJnKqvxkJ
 XRvpqpGGYUgWvPjtny6F8+2rEKBEDQ==
X-Authority-Analysis: v=2.4 cv=Hr572kTS c=1 sm=1 tr=0 ts=68e29380 cx=c_pps
 a=MTSHoo12Qbhz2p7MsH1ifg==:117 a=FXeiAMptI+yIFPIDlLAp5A==:17
 a=IkcTkHD0fZMA:10 a=x6icFKpwvdMA:10 a=VwQbUJbxAAAA:8 a=KKAkSRfTAAAA:8
 a=EUspDBNiAAAA:8 a=ls5EOjYx-Cy7lCJonlYA:9 a=QEXdDO2ut3YA:10
 a=GvdueXVYPmCkWapjIL-Q:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-10-05_05,2025-10-02_03,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 suspectscore=0 lowpriorityscore=0 priorityscore=1501
 spamscore=0 bulkscore=0 impostorscore=0 phishscore=0 clxscore=1015
 adultscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2509150000
 definitions=main-2510040135
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251005_084922_060824_6E1B5980 
X-CRM114-Status: UNSURE (   9.15  )
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



On 10/3/2025 2:51 PM, Rameshkumar Sundaram wrote:
> Bitwise operations with WMI_KEY_PAIRWISE (defined as 0) are ineffective
> and misleading. This results in pairwise key validations added in
> commit 97acb0259cc9 ("wifi: ath11k: fix group data packet drops
> during rekey") to always evaluate false and clear key commands for
> pairwise keys are not honored.
> 
> Since firmware supports overwriting the new key without explicitly
> clearing the previous one, there is no visible impact currently.
> However, to restore consistency with the previous behavior and improve
> clarity, replace bitwise operations with direct assignments and
> comparisons for key flags.
> 
> Tested-on: QCN9074 hw1.0 PCI WLAN.HK.2.9.0.1-02146-QCAHKSWPL_SILICONZ-1
> Tested-on: WCN6855 hw2.1 PCI WLAN.HSP.1.1-03125-QCAHSPSWPL_V1_V2_SILICONZ_LITE-3.6510.41
> 
> Reported-by: Dan Carpenter <dan.carpenter@linaro.org>
> Closes: https://lore.kernel.org/linux-wireless/aLlaetkalDvWcB7b@stanley.mountain
> Fixes: 97acb0259cc9 ("wifi: ath11k: fix group data packet drops during rekey")
> Signed-off-by: Rameshkumar Sundaram <rameshkumar.sundaram@oss.qualcomm.com>

Reviewed-by: Vasanthakumar Thiagarajan <vasanthakumar.thiagarajan@oss.qualcomm.com>

