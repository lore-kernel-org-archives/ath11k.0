Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A6770C7115D
	for <ath11k@archiver.kernel.org>; Mon, 23 Jun 2025 05:21:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=7l0WaXKSK8b4eq+N2P1B1qUpB3QaJt1KGeeB9Kc3sMA=; b=oFr3PuPMpOY3g2cv96cIG7JFG+
	zK75gVsfWYwHSM+2fzubT8QRExzIrueDyV/cqJVT3uT5d7OAhi5Vels269Xrj5Arljm/YN92hc71N
	xsI2FMuYn3kU+XJUKagzsnJGXrWOMxPwlpa64OzVG4+Yq2Jbn7vxgP8lHdD8uT1uP7Bd9IVYvkQbh
	3nEi7jebQGJiyIzPE3PUDD9xq9BoJa5RXhuGYFz2DOYfuEwXP0q1KyBHo6SUsxdPH5b1izCteTCtz
	lUB5tG6hv5CjgVk0/hpC0c+BqN7LAk0MqQlMMEzI8poDj/8k74QTInH3W+mxxX/rD+i0w3jwFHdN2
	CMlGrPSg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uTZcg-00000001bpW-2srM;
	Mon, 23 Jun 2025 05:21:38 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uTZce-00000001bnz-3D95
	for ath11k@lists.infradead.org;
	Mon, 23 Jun 2025 05:21:37 +0000
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 55N3eX7Y029901
	for <ath11k@lists.infradead.org>; Mon, 23 Jun 2025 05:21:36 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	7l0WaXKSK8b4eq+N2P1B1qUpB3QaJt1KGeeB9Kc3sMA=; b=k7r51ujpJXOuQlZ6
	COM0hvm2AuUmIXlK0QHRh1ZLaLNfpi1TQJb6m8Te4hiiotx5iDE0KgURTooRIDxr
	4uC2AkRRUT4gUana6dqki1XFAuLL1yRE2OnM+4+0GoACJpyjv+f9rw0yy57QrIOb
	JfGlalVp5hwb5t3oBk0zOKjjc/k0+ihYXw5swYhaqDj3qQPzQtgOCwxNExi2nzEa
	VQIuvgjW6FjROHXL3y9dGILPKMsRNklbpG+yHKQHgkuX6QQ+6OWqMJ5/hfyF+uQ+
	QaEiAX95hN3gUgmZ/mcGsEvJUkmfA1v/+T3qFOrU7leHUfAHm5XQlp1qaSMyiFFd
	dpDTVQ==
Received: from mail-pj1-f72.google.com (mail-pj1-f72.google.com [209.85.216.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 47ey7k05yw-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <ath11k@lists.infradead.org>; Mon, 23 Jun 2025 05:21:35 +0000 (GMT)
Received: by mail-pj1-f72.google.com with SMTP id 98e67ed59e1d1-313d6d671ffso3576772a91.2
        for <ath11k@lists.infradead.org>; Sun, 22 Jun 2025 22:21:35 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750656095; x=1751260895;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=7l0WaXKSK8b4eq+N2P1B1qUpB3QaJt1KGeeB9Kc3sMA=;
        b=dJrxS2wOY4qOX04+BiL7dIWtD8ih+08LDWxfuwNUCsaN2H/VTnhNEdmQ/sabd/6mjS
         30FWRsMcfryMlHKlPEMor/X4DwjaKk2Wy87kpGhBUbTDV3QtTLMfKxUgM6ijKHxhuj85
         YZyZ9MclVYzi6rme4D47XcV0jqFkDO/6OGnarm22LVdwT8Z+fP36d9iAadLRhzZO3fN9
         8KsG+yN091H9tNPl8MWxfYpCq3erD8r4WQARH503HyEFi7XYZrBjDewM6uFp1w+ENzlS
         drwi9Nn0L42bdC6guDqUC+gXPy3s08ZFjZdex8d3WOwmfsFyIVg2c78rC9wMv8AuGKYH
         9+JA==
X-Forwarded-Encrypted: i=1; AJvYcCVI7WLsUZD+XqipfE9Ynxh6IB23GLHLpGHY/nScQN+90e+xTnDRUsLRkVb1Zvbb57KDC16Howw=@lists.infradead.org
X-Gm-Message-State: AOJu0Yyf5OttZkPk50fT2BEaGiKUnknMTkQ+xPboZVt9yxIb+1VZ07H+
	kVWdx9TFsBKotIqUC357kTegsLrdASK307ZLjCO6uWCi8et414Bf8T1QDmqHTBCPg+Rt2cikceR
	Dy6qVqOxjR3N4jyBa7KsHdZZEPf92whDnUaGxadu6pgRnG9Oh2d9nIaDgv4JKquRP
X-Gm-Gg: ASbGncsloxTRjk5MfHL1lS2Qg5AfAUmahCBor1HhTn8AY2yU7Y0WTw2rfis3gs6Z3S5
	gIqTq+JVuHqQLAvBijUOjveVCv8JWQRswrs8ateB4Z6Fj8YjHXypM6CZn9vbHC+pOhGsucpY+TE
	XqFSxTiLt8/ov38RnyM257n4Z20KAPUITUBPAU2C4XhW/mzNdvxYjRcrCXq5XYTnt/scKUeQMie
	vIaGoOKsLlnw7jo9YktfEzG6yfDBYQ5dMwUHvJehcPBNbJ7jVs15o4gzRrW0QaL0bWUXslLc/R6
	KkkeXHph+jbnCbjOEKr2ojZnppz3EsV3GJpV48aRBK+IRialTb13RVS7x86vX8jj
X-Received: by 2002:a17:90b:268a:b0:312:e90b:419e with SMTP id 98e67ed59e1d1-3159d646d0fmr19146366a91.12.1750656094575;
        Sun, 22 Jun 2025 22:21:34 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IH4lgU7KFjffMXbhjmtkB6X4i4vuMqMFcgqOcVorProC4mPzsKamEdzkFloaoYhhYFKhVV7Hg==
X-Received: by 2002:a17:90b:268a:b0:312:e90b:419e with SMTP id 98e67ed59e1d1-3159d646d0fmr19146339a91.12.1750656094214;
        Sun, 22 Jun 2025 22:21:34 -0700 (PDT)
Received: from [10.152.204.0] ([202.46.23.19])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3158a2f35e9sm9629365a91.24.2025.06.22.22.21.31
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 22 Jun 2025 22:21:33 -0700 (PDT)
Message-ID: <f30000bb-cec7-bd07-3328-1f11578cd1c3@oss.qualcomm.com>
Date: Mon, 23 Jun 2025 10:51:30 +0530
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
Subject: Re: [PATCH ath-next 4/5] wifi: ath11k: Add missing include of
 export.h
Content-Language: en-US
To: Jeff Johnson <jeff.johnson@oss.qualcomm.com>,
        Jeff Johnson <jjohnson@kernel.org>,
        =?UTF-8?B?VG9rZSBIw7hpbGFuZC1Kw7hyZ2Vu?=
 =?UTF-8?Q?sen?= <toke@toke.dk>
Cc: linux-wireless@vger.kernel.org, ath10k@lists.infradead.org,
        linux-kernel@vger.kernel.org, ath11k@lists.infradead.org,
        ath12k@lists.infradead.org
References: <20250611-ath-unused-export-v1-0-c36819df7e7b@oss.qualcomm.com>
 <20250611-ath-unused-export-v1-4-c36819df7e7b@oss.qualcomm.com>
From: Vasanthakumar Thiagarajan <vasanthakumar.thiagarajan@oss.qualcomm.com>
In-Reply-To: <20250611-ath-unused-export-v1-4-c36819df7e7b@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=YoEPR5YX c=1 sm=1 tr=0 ts=6858e45f cx=c_pps
 a=RP+M6JBNLl+fLTcSJhASfg==:117 a=j4ogTh8yFefVWWEFDRgCtg==:17
 a=IkcTkHD0fZMA:10 a=6IFa9wvqVegA:10 a=EUspDBNiAAAA:8 a=U89tM0JWt6iRefauG40A:9
 a=QEXdDO2ut3YA:10 a=iS9zxrgQBfv6-_F4QbHw:22
X-Proofpoint-ORIG-GUID: 7bhNzDbnP2FbGNVf3NO10MwJu86DD-Ls
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNjIzMDAyOSBTYWx0ZWRfX6S9TU83ltQvj
 U2umD2S16g3awE0IMjJE6nrAZGyLWNermlW1wqJdk652ddI2Hw4CM9MvnKgaeY0iM4k1eamwPob
 +uTOOQuy+WEUNTLqe6HwgiyNsu4NQNYGsnRTdiV6FjUfdfWnTzrB0jpibMYx1sIFIUIy5N8E9hl
 07cx5gBxvPCI+wvbz3riCCT5Ao6FWexHilsThWKEGfYZUU6rNBluH57lmG2LbnPGa5RjhjXBtOG
 RIcmhkE808tsR6EMMZf9n0fVJmCcGVDrZxwdViz2ocXkKVkkBkRAI4kS+bSnrxKfTE4BRMVn3X0
 LbjzBhFSTeOeQLQ4EGOlRknzWkAYGIE8CCUjDKBBYFGHzDloVTZwLzUD/Cg8iPtj1duMOnF5Bti
 XH5V8ZCWtcocNS27sX5U3XbricpkoknucD4plTXrkt2GPFE+q9pXMq6qgrH3UlVn9nwK5Os4
X-Proofpoint-GUID: 7bhNzDbnP2FbGNVf3NO10MwJu86DD-Ls
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-06-23_01,2025-06-20_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 priorityscore=1501 mlxscore=0 adultscore=0 suspectscore=0
 malwarescore=0 mlxlogscore=999 spamscore=0 bulkscore=0 lowpriorityscore=0
 impostorscore=0 clxscore=1015 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505280000
 definitions=main-2506230029
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250622_222136_920403_8D2ECE91 
X-CRM114-Status: UNSURE (   9.04  )
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



On 6/11/2025 9:43 PM, Jeff Johnson wrote:
> Commit a934a57a42f6 ("scripts/misc-check: check missing #include
> <linux/export.h> when W=1") introduced a new check that is producing
> the following warnings:
> 
> drivers/net/wireless/ath/ath11k/ce.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
> drivers/net/wireless/ath/ath11k/core.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
> drivers/net/wireless/ath/ath11k/coredump.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
> drivers/net/wireless/ath/ath11k/debug.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
> drivers/net/wireless/ath/ath11k/debugfs.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
> drivers/net/wireless/ath/ath11k/dp.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
> drivers/net/wireless/ath/ath11k/fw.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
> drivers/net/wireless/ath/ath11k/hal.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
> drivers/net/wireless/ath/ath11k/pcic.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
> drivers/net/wireless/ath/ath11k/qmi.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
> drivers/net/wireless/ath/ath11k/trace.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
> 
> Add the missing #include to satisfy the check.
> 
> Signed-off-by: Jeff Johnson <jeff.johnson@oss.qualcomm.com>

Reviewed-by: Vasanthakumar Thiagarajan <vasanthakumar.thiagarajan@oss.qualcomm.com>

