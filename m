Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 01B54C02194
	for <ath11k@archiver.kernel.org>; Thu,  6 Feb 2025 20:20:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=s/YWPeioWos28sbTecZUcxdXc63PtoRhPc/xKOoRZm4=; b=ewZka/T6hpU1c6bzlGMMwZii31
	CmllAM5E4EIo7KQZRaLYiTxQtvHOmQ/rQcEBl1i2WEsE4NMN3wzRep+QCZr/yic87ZDt1ku/nPR4I
	/3lWPZTWZh7NnrtD5vEQ76Bb2x8hjWmVL+FeY5FcNfNsxN3QCbuzEFbvvkoFdJvjZg6zksY8U7tw2
	Ll24H+aOsDJDgkpjuxsiR8yaq+HInuTl8kLj2mn9+hIykD/onPdXHaof8XkFTQzak0C0NfTB4pIsM
	CMGHoLqQjuxXpL7PvvEMe2Y61R7y5ysMQyT63SIzIRxtpVm0FHmrrtL1YC74azONeMFSjnMyilO2o
	0p+8jqPA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tg8MC-00000007TGt-28sW;
	Thu, 06 Feb 2025 20:20:16 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tg8M9-00000007TG8-2hUe
	for ath11k@lists.infradead.org;
	Thu, 06 Feb 2025 20:20:15 +0000
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 516HtmMZ024060
	for <ath11k@lists.infradead.org>; Thu, 6 Feb 2025 20:20:12 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	s/YWPeioWos28sbTecZUcxdXc63PtoRhPc/xKOoRZm4=; b=cqj6QO1H4I8l6PE+
	gFRlfgwzFwkbTuKnpfeB3U8qQGFBCP3Yg3Ixr1uzo7esQDbNbHcdvmnjKZy1HMzm
	KVdPpbWc2Le43673Qd5QqbB08buiE+qQ/SmbrvDLYUytLe6c0oUrcmBdSDBrz58F
	FF5G3fAPT/6eH3Qsup4bIBhsxzlN1CHH2hkhKZIfEilQpoKHMPoBNZ+QtW3BQxlQ
	fsIbUnOpdQpf5VDMvtxI0kZ8r1Qr5jq22IvoYIJaUQ5Qx3TWWgRX4xTW2ZP8Kpli
	7umqVf3ZzIJBMe3TgrN+1wTabohAS/hOoxF2CqwYXe6omPhLbt8vU9dgN2Xjcci0
	mgUbmA==
Received: from mail-pj1-f69.google.com (mail-pj1-f69.google.com [209.85.216.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 44n1vngbe1-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <ath11k@lists.infradead.org>; Thu, 06 Feb 2025 20:20:12 +0000 (GMT)
Received: by mail-pj1-f69.google.com with SMTP id 98e67ed59e1d1-2f2a9f056a8so2573119a91.2
        for <ath11k@lists.infradead.org>; Thu, 06 Feb 2025 12:20:12 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738873211; x=1739478011;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=s/YWPeioWos28sbTecZUcxdXc63PtoRhPc/xKOoRZm4=;
        b=I9s5G/psJLcC3u6bYgmDTj/jrkvDiOuX9RmATHSvzj8NH+cNt/hzeC0SJOySxoDWbS
         5dp/4Fz70mGgAtiwdfeI4mxGZgoH1JvyQ1fpMLkPahrKzuPHAkgzhj8UMSXAdrT5hLjF
         MtraxXTXORHs+AsW3kfxsHXD4qt87ZYV9fJe+nC+MuajgoUIubDQYk4AdRw8mkRTznfX
         MADpKmhS1a+HQP15+iivA8wpAI5dZKgDECi4BkXiMkY9EvOc9ZJR28T2z2Yjg6PECv1x
         zK0njzQYjzWrbTpnoTLP7dIZbCJl9KGGO7iW90HElqvMOsCYod5zz/Al3jG1qxeupZJ9
         3mEw==
X-Gm-Message-State: AOJu0YwZkqBPeMmdUEiZYjFuZ6XiWgY5Ur7hsuvJKojakUG61eA0CfRj
	BLwl8Af/oAlDt1R68SUog9x8catqvnxEX8IdxHHV5WddyJJXPY30BMRIsae08kUiAFoYaDwyibA
	BWgkL89Ckyv9s5RaPPVCwjard+o3T5EOPg60cnAgyyWZa1GoHrUz6UCyevlox
X-Gm-Gg: ASbGncuJshHnEMVXAAYnCKE4JdnkkEd8W/WD8p1Gnl43SttoCmqmrNpAnz1v0yS6BL3
	G3J4306NYnh3InI/LIRkGykM7kL3PniEaDJokbH0fZgsuwdN7/BIBDjC6TavciPAeWZrLhbtl05
	3fP0tJdlv0OLEzS+78utqHVCW760ghPGdIorpO8LjaWqCkEBfLXCY+X+JKufzpuGTTIY3srA73v
	CNE02ylBIqPOBXenJq2v53KOYhktntRdfrUUovTUx0UKE36rMFBBkRRvrHlopMicN+YO653WvBY
	AaMpj4VbV4+QoAPLq5XrYEeHoO3ufND8tNepyN/Oav4yyR2VQtmseNEhphoVpLdl8V7MeoQF6g=
	=
X-Received: by 2002:a17:90b:4b8c:b0:2fa:f8d:65e7 with SMTP id 98e67ed59e1d1-2fa23f43a0emr611804a91.2.1738873211206;
        Thu, 06 Feb 2025 12:20:11 -0800 (PST)
X-Google-Smtp-Source: AGHT+IElSAHcGf626LkkVoIHzh4kNyUtTtCOoY7OWplVqiZDIBb5g4fjnG6p3Sp4zx4Gg9+YhyO26Q==
X-Received: by 2002:a17:90b:4b8c:b0:2fa:f8d:65e7 with SMTP id 98e67ed59e1d1-2fa23f43a0emr611761a91.2.1738873210809;
        Thu, 06 Feb 2025 12:20:10 -0800 (PST)
Received: from [192.168.1.111] (c-73-202-227-126.hsd1.ca.comcast.net. [73.202.227.126])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-2fa09b5ad4esm1828174a91.41.2025.02.06.12.20.09
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 06 Feb 2025 12:20:10 -0800 (PST)
Message-ID: <2b52714a-0fe2-4c85-95bc-4a6c0a8a0b60@oss.qualcomm.com>
Date: Thu, 6 Feb 2025 12:20:09 -0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] wifi: ath11k: allow APs combination when dual stations
 are supported
To: "Yu Zhang (Yuriy)" <quic_yuzha@quicinc.com>
Cc: ath11k@lists.infradead.org, jjohnson@kernel.org, kvalo@kernel.org,
        linux-kernel@vger.kernel.org, linux-wireless@vger.kernel.org
References: <d410576f-2fc7-4de1-af51-29fbe8b14948@quicinc.com>
 <20250115130359.138890-1-jtornosm@redhat.com>
 <748a5a75-1385-4691-85c1-e9cc5eb4ffc2@oss.qualcomm.com>
 <e1c9b030-8a6c-4aba-8bdd-853113bef396@quicinc.com>
From: Jeff Johnson <jeff.johnson@oss.qualcomm.com>
Content-Language: en-US
In-Reply-To: <e1c9b030-8a6c-4aba-8bdd-853113bef396@quicinc.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: vBFq1FoUuxVeqqClmU5CoE0JuIKL1eFi
X-Proofpoint-GUID: vBFq1FoUuxVeqqClmU5CoE0JuIKL1eFi
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1057,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-02-06_06,2025-02-05_03,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 clxscore=1015 adultscore=0
 spamscore=0 mlxlogscore=668 malwarescore=0 bulkscore=0 impostorscore=0
 mlxscore=0 priorityscore=1501 suspectscore=0 lowpriorityscore=0
 phishscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2501170000 definitions=main-2502060161
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250206_122013_814531_FC5F172C 
X-CRM114-Status: GOOD (  10.96  )
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

On 2/5/2025 11:46 PM, Yu Zhang (Yuriy) wrote:
> 
> 
> On 1/16/2025 8:31 AM, Jeff Johnson wrote:
> 
>> Kalle, can you review? You currently have this deferred in patchwork:
>> https://patchwork.kernel.org/project/linux-wireless/patch/20240829064420.3074140-1-quic_yuzha@quicinc.com/
>>
>> /jeff
>>
> Jeff, can you help with this because Kallo has stepped down?
> 
> 
> /Yuriy

We should avoid having new module parameters
Is there a solution that doesn't require that?


