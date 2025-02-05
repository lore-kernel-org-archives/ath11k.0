Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 359FDC02198
	for <ath11k@archiver.kernel.org>; Wed,  5 Feb 2025 03:59:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Cc:Content-ID:Content-Description:Resent-Date:Resent-From
	:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=S62PUSeqG14RqXzxFfuDYkNfcydTd1TcwBUSQTxQ6JI=; b=WHfTVXSf57rjd0bX7b7sTJ1pLU
	n9Wfxs8Ga+E6dfLCfpbmnzSvJXwOoAeeYUMYUqeo19SlHmY+4BqTDc+WAhP87QGO5nPZM08yEBJD5
	G+rkuqw7bNahooPHa2cgziz8azC9FK0QQKd/CvhZcQDqeNvyaCcs78EE1UmBkqfWrav1fy1KaMYUR
	Xbw9IA42tEyDild42ITGV4hVTzybfprPjDXBehH+wVzP0UkUNLsccrFIGRdMgCC40yOpVbqxBVbXK
	Hk9m7ds7rDHTxrv7OcsGUUe0VfUlJhTEvSSDpuoC4q82d5DjjlPLYFUR4471q+U0qZNq1GcJK/DH7
	NKseTpDQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tfWYz-00000002GTp-2zci;
	Wed, 05 Feb 2025 03:58:57 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tfWYw-00000002GT6-3GDd
	for ath11k@lists.infradead.org;
	Wed, 05 Feb 2025 03:58:56 +0000
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 514JYcBb032416
	for <ath11k@lists.infradead.org>; Wed, 5 Feb 2025 03:58:52 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	S62PUSeqG14RqXzxFfuDYkNfcydTd1TcwBUSQTxQ6JI=; b=AQTFCsAxPDKVn1v+
	NpEH0eg/s4h23M2096KElbj790ACX3eB8meBb2OCN7s1O4PK0FFEK+Vj95FuKWKD
	yFGHcwvqjjEHFHxIiMWJJtCHDQ+JyZLzm6Z6Abl7fh8/DRKG+Lzs5DCthX2fCdoz
	Af6cGQ23s/LL4yIyJ6XiBll/SWZC7CB/IdK1nGbsLNqSo0xX5Dq7ntYJE0qRmCp6
	A3uTCKh5THpcLEnS2cGu9dwK6PpFG45l/o6JxGbimwG5cRHjlQ/wzvaTlS6aSyrS
	Xtc1dvYRr5jns6gs2BZqa/pyjrgxq0fs+nDVM/53YdG+SNkScdVKwEDZUzqYhQE0
	WVi90g==
Received: from mail-pl1-f199.google.com (mail-pl1-f199.google.com [209.85.214.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 44ks5kgvpe-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <ath11k@lists.infradead.org>; Wed, 05 Feb 2025 03:58:52 +0000 (GMT)
Received: by mail-pl1-f199.google.com with SMTP id d9443c01a7336-21f1e5c641aso875145ad.2
        for <ath11k@lists.infradead.org>; Tue, 04 Feb 2025 19:58:52 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738727931; x=1739332731;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=S62PUSeqG14RqXzxFfuDYkNfcydTd1TcwBUSQTxQ6JI=;
        b=aFjuD+koBi2Zl8b0GY02uCA2dCfruT+9WHEXa0E6sXgN+4Ig1b8bAeHtuf57jZgRvb
         ypcs8lTw760jPqBxZJsPMLamNlKFu3egLalOwFSxQJmWOOJeqkfdzTeC3jHCojMbVkxg
         y4ifLL7Li5YG+EKqvivwQg8Mr+vZX38UgKCRBUzTONtvqwZswZx5tB53QoEOqdG1gc2e
         rSRaGcUTvzUH+BQR2W12cyg/Yk+Lz/Yp6IVPyBLQ/xsenROvMK8idlRJS9kwOSDgbHmM
         Gahsa7c7gWRYGLZfKzNRKixifp4ZpyNf479p7xdyamsZEEoBEaxDzYImjuinmz4XSied
         +VLQ==
X-Forwarded-Encrypted: i=1; AJvYcCW2U4vM5VLcEyBqhXTJQYRWSR+q2XY8ObfKD3WsX4OMxMmI+5nGojXVn66tuyagpHiBbYo/Q+w=@lists.infradead.org
X-Gm-Message-State: AOJu0YyS3RhBXmdx6s9Y7NDhF7FBc1/shkXSNMwGKg7DVe0RXLAQ7Hk1
	L9/7ew4ytQ5aiEYODHnB3wGefM5m2N92Qh7ObU5n1TBhZW8uzvxnltU2czUF43ZHnLvSp1DMG1l
	fJZFu+Ns1+vGNsDvjRPywPPYQ5dDj7Bp2RZtTc3XPtsjNuv53QKAMp+QOmXa9
X-Gm-Gg: ASbGncu44x8tXOAHqM4FzL7NnvMolFtNGPWgOQwxQY9LdmbpzVl2OBTsCEshLqHs+ZD
	EAYEazA8Auu5GjjCGrFqguejymWzTnSolVUGqlYEl4YxcJEObrOUMDOI2cxSnsItW+Y/gs3kJMh
	OnCKnay6GCBqJcgPmgcl6mkqYZEV1sJlQW6pjXm91Il0W6AB6arukuNjNNQsXm8ibYixLnzf8dX
	WWfmE70oc9KCiOKPYPadSeTwDnLSUCJo6i5Reikv9YrGCgPTI0G8/WQjfRs+02ybAmsngU+uDIG
	+Z8+msjVUt5G+zzjdxX2mXn3wowIDVBpfOp4cCc=
X-Received: by 2002:a17:902:d481:b0:216:3e86:1cb9 with SMTP id d9443c01a7336-21f17f22af9mr21638155ad.50.1738727930967;
        Tue, 04 Feb 2025 19:58:50 -0800 (PST)
X-Google-Smtp-Source: AGHT+IFkNezxHQtquirLQM9BhytG3M3yW8pCBTj9PZq6uof5YtSc0sFPJl2awYudDFoNXr7qRfdbmA==
X-Received: by 2002:a17:902:d481:b0:216:3e86:1cb9 with SMTP id d9443c01a7336-21f17f22af9mr21637845ad.50.1738727930607;
        Tue, 04 Feb 2025 19:58:50 -0800 (PST)
Received: from [10.152.202.18] ([202.46.23.19])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-ad4fa6b3948sm2448796a12.26.2025.02.04.19.58.48
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 04 Feb 2025 19:58:50 -0800 (PST)
Message-ID: <15632e7a-fd47-4940-91d7-1b75d51ae43e@oss.qualcomm.com>
Date: Wed, 5 Feb 2025 09:28:47 +0530
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 2/5] wifi: ath11k: pass tx arvif for MBSSID and EMA
 beacon generation
To: Aloka Dixit <aloka.dixit@oss.qualcomm.com>, ath11k@lists.infradead.org,
        ath12k@lists.infradead.org, linux-wireless@vger.kernel.org
References: <20250203214448.1978156-1-aloka.dixit@oss.qualcomm.com>
 <20250203214448.1978156-3-aloka.dixit@oss.qualcomm.com>
 <db16febb-a58e-4a60-ab1a-212c30fb5313@oss.qualcomm.com>
 <a4809256-5806-4e1c-a12c-d5d2a6c0be44@oss.qualcomm.com>
Content-Language: en-US
From: Aditya Kumar Singh <aditya.kumar.singh@oss.qualcomm.com>
In-Reply-To: <a4809256-5806-4e1c-a12c-d5d2a6c0be44@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: 0_wMvUQBp9y2jvkSEPMSXmujcAABqldg
X-Proofpoint-GUID: 0_wMvUQBp9y2jvkSEPMSXmujcAABqldg
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1057,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-02-05_01,2025-02-05_01,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 lowpriorityscore=0
 spamscore=0 adultscore=0 impostorscore=0 bulkscore=0 phishscore=0
 mlxlogscore=712 malwarescore=0 mlxscore=0 priorityscore=1501 clxscore=1015
 suspectscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2501170000 definitions=main-2502050027
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250204_195854_972746_CAA9627F 
X-CRM114-Status: GOOD (  14.11  )
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

On 2/4/25 23:58, Aloka Dixit wrote:
> On 2/3/2025 8:41 PM, Aditya Kumar Singh wrote:
>> On 2/4/25 03:14, Aloka Dixit wrote:
>>> Function ath11k_mac_setup_bcn_tmpl() retrieves tx_arvif only for
>>> a sanity check and then calls ath11k_mac_setup_bcn_tmpl_mbssid()
>>> or ath11k_mac_setup_bcn_tmpl_ema() both of which again retrieve
>>> the same pointer. Instead store the pointer and pass it to the
>>> latter two functions.
>>>
>>
>> Same, Is this tested? Perhaps you forgot to add "Tested-on:" tag?
>>
>>> Signed-off-by: Aloka Dixit <aloka.dixit@oss.qualcomm.com>
>>> ---
>>
>>
> 
> No, only ath12k patches are tested hence no tag here for ath11k.
> This patch doesn't change handling functionally and I confirmed that all 
> places using 'tx_arvif' first do NULL check because the refactored 
> function can return NULL. Functions ath11k_mac_setup_bcn_tmpl_mbssid() 
> and ath11k_mac_setup_bcn_tmpl_ema() always receive a non-NULL value now 
> because the caller ath11k_mac_setup_bcn_tmpl() sets 'tx_arvif = arvif' 
> whenever applicable.

Okay so in that case "No functionality change. Compile tested only." 
line should be there in commit text?

-- 
Aditya

