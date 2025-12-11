Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5ED50D3E783
	for <ath11k@archiver.kernel.org>; Thu, 11 Dec 2025 02:35:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=n673qLBkgOUY1GHNMNe14VRslEKsiUEor3PWKBqvmbc=; b=QRs9h5BblsSLn04j8s5Wm0lkbz
	OAtw/m9gPNPT1OZRluKzFHviQWWcpJ87XHg548995VK8C1EiQCEaRl2USqxMHE2Vlyjx9RtmORzGJ
	E8GJldQUoeExNweXD6I1BVr2rhWC5QL/43QJrrIrr5zGpZY1rdZteHAc+NHyKSpbd1QCEKkWuWPTy
	bGUfB8j7gg0c2ex8BbH1IuIvGiueOQ02mLBpNomMA0eZV9lRtXg1oxrNOJ99VJZIb3kL614K3+7rV
	2JUPp7nrKGmN4czkcvls304jS9rp4dVU8xCGvQ1Kv9a0pdUH93H7PjsWumZXk07CCuKRe8+NbQGDI
	grO7xMRQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vTWWK-0000000G7wC-37B0;
	Thu, 11 Dec 2025 02:35:08 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vTWWI-0000000G7vr-1Clu
	for ath11k@lists.infradead.org;
	Thu, 11 Dec 2025 02:35:07 +0000
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5BALSkjg3563616
	for <ath11k@lists.infradead.org>; Thu, 11 Dec 2025 02:35:03 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	n673qLBkgOUY1GHNMNe14VRslEKsiUEor3PWKBqvmbc=; b=pAIk9k4SbuaX1xTf
	QSNyAUhV7jOF3xTHmsPHpwr5d52MHgCfHal4UhkAaC8aPthsXJvzZ3Kfh8L25hD6
	pRnRG3YLRcRdUMdOJxWaGwpVXP9+uhP7yeRGhXdQP2vloE07BUhkjxBNFQuLo4cs
	fewQlAvkVJdZN12qFHwuCRg94anmOwN8bAORcLYjkaUFOR0AJo6aTS3Sn9xH4OX+
	UH+AINfHrCjQUPAtt3E3ABbCissg6r9qeCeYNvTEbhbfds5A9w4O87TMMSsdON+9
	cYY5JOfh0xwiNBt2wkNYqkPQn9Z6gtAos72fhjCig1zi9+2QQX+lPMBTTB2u+kLL
	QaGEVg==
Received: from mail-pf1-f197.google.com (mail-pf1-f197.google.com [209.85.210.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4aygtfgpyh-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <ath11k@lists.infradead.org>; Thu, 11 Dec 2025 02:35:03 +0000 (GMT)
Received: by mail-pf1-f197.google.com with SMTP id d2e1a72fcca58-7b89ee2c1a4so756738b3a.2
        for <ath11k@lists.infradead.org>; Wed, 10 Dec 2025 18:35:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1765420502; x=1766025302; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=n673qLBkgOUY1GHNMNe14VRslEKsiUEor3PWKBqvmbc=;
        b=MFwZ9JC4qFgEPKzVjvsawtdrGSTGO471sQvfZuwam76G8aAPGgOT0qX97DUzSF1wf9
         BWEPfcat+9x82mv3IxYnllwRpy9Ju6dvoAbZDxYbbjRfcAYOx4qLOWXY9SVyAP/GaKuc
         uwCrXoyKqTUz7KFoCFUL0xP8ZaGFcPuWgUfKeayrztiepAp3ebx5tZhQsgFmR8jZ1Lao
         PKUBvc7J3YbDTskJy37A0B9/aBD10GzUJvgkKgppPmF9KvYjDlzxgBIol1K9Rt2FFK28
         I6ONP4Nc5vw4P+KoW8LjnAwnfe8yJsrAtdDcqFuw1frtrHP2nye4D6+RnlFG44kYVe/q
         RUcQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1765420502; x=1766025302;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=n673qLBkgOUY1GHNMNe14VRslEKsiUEor3PWKBqvmbc=;
        b=wXfrALAL8qhjHO6nPj6GSjCcvFH6Xvh/Kzb0oMYRSkl7QC06Yq88p3hWbRk7KbPJfd
         /I3u7AZSRAAEqIvtPbG1rmqfXaP95SLto+LHzBmLUXK3W3+3wbIKNhIWHcKpcMmD6eWz
         PmhipGgb5QKladxZi3OlplTXfDgsgJpR5ZIgIs17ilID/+/YOIi6ZCMbZnnE3i8K1lmV
         0U9bTxK+7DsoM+4dDJOf5DoiaeyBEuCzbfW+vsBCawfd9WS7d6rD6ZBkS0X9UFW9yaLo
         hXxPNGnY9dxCCtWp/lBhPh+fvkPDMRCmDz+zM7dBOBGBY/A2cdymaXxrZ5XTIqPkWeJq
         017Q==
X-Forwarded-Encrypted: i=1; AJvYcCU6etnT140YKai4ymXDV1W2WDWmJNg+kNhK4o2uelYEDuAt6YmZz/KrV42RYDEnJGMfW/zzV3M=@lists.infradead.org
X-Gm-Message-State: AOJu0Yymi7ADoXLXyOjJEctZKjSapfB3pAsLc9Dd05UA8JAe28G2i9zw
	2+Nzcq/1QHg0u4JrUEJuQ2Bkg0MfYlRQEYVWsffNOQnB/41t6snArJNUmdJNXlr6aagH6VIA62h
	m8MwvZzp7rjNNEaXUdhVQec5vcjpEVtrAJCGxvh1VsRciq0smeXEHNAheAj4Cz8iXFqdKCogQ//
	A=
X-Gm-Gg: ASbGnctxpEVZ2Uyy0AYFt2N9KJfnSpKPnezHunpRKvDLaZ7smLzNV9o1kauQ+LnErU+
	3tn7eNSxSAGfD4uAIW7wKcYrbvd3KTArnu7oxCY+0pGMyd1jJjVJJLoxilOtpkEGx1XtVwMkSw8
	bkb425F1sRycussyLqy60KyJdASjKaCOq+dQ9WD2WOTno1AtAtHjoaPBSWMVi7janoaS5E7W1ek
	g/AePsYZpEUyHJkxWSr412UrMTTK825dO3tE0hrX2kQm647jqrEJcDqdPKTqDpLcvX05CJPgDUx
	RDo368UEKgBY+dKSs/L56VhFaFrHSd123WkSqqGYkoR5hIcU5I0jvp4a3cU8ICVXQ6xTKNVycbq
	PyEMcRKOf0leXpu6glw/Sruf1d4EgmGaK9I8/NBfH
X-Received: by 2002:a05:6300:210c:b0:361:63eb:d478 with SMTP id adf61e73a8af0-366e03bb718mr4153508637.20.1765420502282;
        Wed, 10 Dec 2025 18:35:02 -0800 (PST)
X-Google-Smtp-Source: AGHT+IE2z8roFhRBPLuU2YWWkgf8t/WjBVw8Y7MY45hRenK6F6I5TPyVzNHD4sB1SeRqaWsWius3hg==
X-Received: by 2002:a05:6300:210c:b0:361:63eb:d478 with SMTP id adf61e73a8af0-366e03bb718mr4153488637.20.1765420501799;
        Wed, 10 Dec 2025 18:35:01 -0800 (PST)
Received: from [10.231.195.103] ([114.94.8.21])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-c0c2c1925bfsm675226a12.31.2025.12.10.18.34.59
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 10 Dec 2025 18:35:01 -0800 (PST)
Message-ID: <1722daf9-064f-4d1e-a7b0-206f3acffd96@oss.qualcomm.com>
Date: Thu, 11 Dec 2025 10:34:57 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] wifi: ath11k: move .max_tx_ring to struct
 ath11k_hw_hal_params
To: mr.nuke.me@gmail.com, ath11k@lists.infradead.org,
        Jeff Johnson <jjohnson@kernel.org>
Cc: linux-wireless@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20251210024036.3965135-1-mr.nuke.me@gmail.com>
 <5a5b4961-904c-45e6-aca6-b58a122e2134@oss.qualcomm.com>
 <16e02bce-18c3-42e4-a51d-60c4bdf8a763@gmail.com>
From: Baochen Qiang <baochen.qiang@oss.qualcomm.com>
Content-Language: en-US
In-Reply-To: <16e02bce-18c3-42e4-a51d-60c4bdf8a763@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=At7jHe9P c=1 sm=1 tr=0 ts=693a2dd7 cx=c_pps
 a=rEQLjTOiSrHUhVqRoksmgQ==:117 a=Uz3yg00KUFJ2y2WijEJ4bw==:17
 a=IkcTkHD0fZMA:10 a=wP3pNCr1ah4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=pGLkceISAAAA:8 a=_WrCZ2CG3_jBuci-I8YA:9
 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10 a=2VI0MkxyNR6bbpdq8BZq:22
X-Proofpoint-ORIG-GUID: P7wMOulfclH7ZaHoLeHr4Le-nqaD-i8Q
X-Proofpoint-GUID: P7wMOulfclH7ZaHoLeHr4Le-nqaD-i8Q
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMjExMDAxMyBTYWx0ZWRfX48ZBAaFxqGn6
 xi6EUP5oo0fCvtOZb8WjkQAQeAlLEre2tDZL+OT6lx/vDkXz3RHmXiKGQqNjbHatQ27z1pXGwrg
 jxTWl7OEb5xsrMcri6p6OczGPzCOrq3lXT0GzQolfCu1KgDBjAH7b1wjHZBv90OPKN3XCYVJtRO
 uNDfg49F8jvZpeOU1AmPEDCLp/u3unw1VZbi1aAglJA+qETOjF/wQNb2sIzelnal3cGDFL+b8Uv
 yfZyeiWHJYFU3qLe6DaDt9YJKTKnHWmgWpTepjnV5fwA6y+/hKbhNJElxKx+5Ct22VQjHK1KZqb
 fw53P04jTa1CdwsMGdjFsYeDHiajWGEQtsxzdprty7ft0Uc5Sz4k+y7SDcw+mytshuiQSi3wSYd
 koavcyMrJlzFTr76PVRHyA2TyU8WRQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-12-10_03,2025-12-09_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 adultscore=0 clxscore=1015 bulkscore=0 priorityscore=1501
 phishscore=0 impostorscore=0 spamscore=0 lowpriorityscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2510240001 definitions=main-2512110013
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251210_183506_365045_586D40BE 
X-CRM114-Status: GOOD (  21.89  )
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



On 12/11/2025 12:28 AM, mr.nuke.me@gmail.com wrote:
> On 12/10/25 12:46 AM, Baochen Qiang wrote:
>>
>>
>> On 12/10/2025 10:40 AM, Alexandru Gagniuc wrote:
>>> ".max_tx_ring" is an upper bounds to indexing ".tcl2wbm_rbm_map". It
>>> is initialized in, core.c, a different file than the array init. This
>>> spaghetti-like relation is fragile and not obvious. Accidentally
>>> setting ".max_tx_ring" too high leads to a hard to track out-of-
>>> bounds access and memory corruption.
>>>
>>> Clarify this dependency by moving ".max_tx_ring" adjacent to the array
>>> ".tcl2wbm_rbm_map". Use ARRAY_SIZE() instead of #defines to initialize
>>> the length field. Remove DP_TCL_NUM_RING_MAX_QCA6390, as it is no
>>> longer required.
>>>
>>> The intent is to make the code easier to understand rather than fix
>>> an existing bug.
>>>
>>
>> Even the code chane works, I am not sure whether we should do this. Because, logically
>> max_tx_ring represents hardware capability which is static. However the change actually
>> implies max_tx_ring varies on tcl2wbm_rbm_map definition.
> 
> I see what you mean, although tcl2wbm_rbm_map is const. More details below.
> 
> 
>> If we are going to add something to avoid the potential out-of-bound access or to improve
>> code readability, how about something like
>>
>>     ASSERT(hw_params.max_tx_ring <= ARRAR_SIZE(tcl2wbm_rbm_map))
> A static assert might be a good solution. I don't know how to do that.
> By the time we have hw_params.max_tx_ring and tcl2wbm_rbm_map, the
> latter is a pointer, so we can't use ARRAY_SIZE(). We could try to do

Yeah, that is a problem ...

> it dynamically, but I feel that's spaghetti code:
> 
>     if (tcl2wbm_rbm_map == &ath11k_hw_hal_params_ipq8074)
>         ASSERT(hw_params.max_tx_ring <= ARRAY_SIZE(ath11k_hw_hal_params_ipq8074));
>     else if (...)
>         ...
> 

Hmm, this is ugly. I would rather have

	map_size = ARRAR_SIZE()

in each hal_params, and then

	ASSERT(hw_params.max_tx_ring <= hw_params.hal_params->map_size)

> Alternatively, I can take the suggestion from your other email, and
> keep the "max_tx_ring", or "num_tx_rings" name. Because it is part of
> the hw_params struct (via .hal_params), it still describes the
> hardware. While the value is derived from a constant array, instead
> of being hardcoded, it remains an immutable quantity, consistent with
> a static hardware descriptor, would you agree?

Also works for me. You can make the decision.

> 
> Alex
> 


