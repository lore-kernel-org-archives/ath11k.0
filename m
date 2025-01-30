Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 10521C0218A
	for <ath11k@archiver.kernel.org>; Thu, 30 Jan 2025 23:33:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:References:Cc:To:From:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=MkvDxx0ZhOvR6Fr+Vc7J+UJ+xM9SaEghyf6kX+nNdLg=; b=hW02myAXmXrvSkAAdwqF9tgZ8n
	mzEhIvS/c1B3PVrlDjL5oqtMxPphK7NQQh5apoqGKNTC+bvM5Z5sFLTBihoJcJ7gVD81qTecJ9LHe
	oRhONuQNTma1Ee6Scr5WtTVwRP5MSQEzvBCj4TGp4daaJ4NZsYQ4KZdolp/U2uG2As9nZ5VduDvKQ
	WyWWskKP3VFKh6nZGxm8JkfdWi1IS5TC0cenCtFqBOhyltQHK/2CSdIxMtJ0ezhuPUEqZSkTfPQeC
	2UKcVx8MXH6mLkqwo7MyVzfnXbtsWpnnpDtThPJhkWHmiftvRiPoMMYNL2QTgV5Vi1kaPn5t13Qnf
	q3bXzNqQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tde2D-00000009n7n-2wbK;
	Thu, 30 Jan 2025 23:33:21 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tde1V-00000009n2S-2auc
	for ath11k@lists.infradead.org;
	Thu, 30 Jan 2025 23:32:38 +0000
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 50UJ1c69013610
	for <ath11k@lists.infradead.org>; Thu, 30 Jan 2025 23:32:37 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	MkvDxx0ZhOvR6Fr+Vc7J+UJ+xM9SaEghyf6kX+nNdLg=; b=SAP09BkHrcAcaxCU
	503dVo9mdrR/W2PamQhML0A8YQTPL2rnL11GutpuPsFIaRR4+dnURD6xu7Set9/e
	INRMUyxHIBeT85ZUWzEKdvviAQhh+S0rtrHt+jDgCbOPjPnzLmQpSK17A1OJQnoa
	WDJo6xhlbk+4SBrIK4Ne6VbigG5LOwI3FwYgsGBcGiB4fGQkw9AcbbyjBghv3XKj
	flhtqMHs7e9nlDi4RBu9ni8nrHLrFBGYOk54PdGaKJ0nwFqVcxFmqUAv6nUPTtXA
	5Znt0bcklNCfpRXR3zz5JKRevpBLogBtxa0Jed8z6hqqscjDcEmLHNzXFfRlxEqQ
	g8Lw4g==
Received: from mail-pl1-f197.google.com (mail-pl1-f197.google.com [209.85.214.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 44gf7m0fb9-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <ath11k@lists.infradead.org>; Thu, 30 Jan 2025 23:32:36 +0000 (GMT)
Received: by mail-pl1-f197.google.com with SMTP id d9443c01a7336-216405eea1fso28510635ad.0
        for <ath11k@lists.infradead.org>; Thu, 30 Jan 2025 15:32:36 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738279955; x=1738884755;
        h=content-transfer-encoding:in-reply-to:content-language:references
         :cc:to:from:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=MkvDxx0ZhOvR6Fr+Vc7J+UJ+xM9SaEghyf6kX+nNdLg=;
        b=bTeGDgtuwIq1Nn6BX4sgP8z2/XbocIlYRBWAHj+sChML5GxeUpmQsLH/zVrBjA7om9
         zqPQ1L7iHQy80EDt9aM8DVqMwAfe5B4i1FFCQQKpKVgcpQbhuNoGtS2v1vN69LVwSAXI
         jQtnLG/VU9MAhRPTbZelZwPEb6aGXOx58h0GFS7z3P06byJccmsCUaHAVMbJn3rTy2Ce
         dcuVoszb77YX9YpSMmWIPApPqOE2RcditIh0XYO9635XMzRRx73uUZd2bdPO6IIdNlTg
         RPg8+QTtkWeJiaSCwfzgPZ3TtL7fU9Vijv1Un4k97ong6LJf2Tg2ZZdCAsE+UXTySA86
         xVPg==
X-Forwarded-Encrypted: i=1; AJvYcCU5sj7NcBZvhu8LIUsp3fZt4ecPHLMLqqjar8IU6vQNbo1mI7Hqf9rxRnerXKXspnCLjMVG7gc=@lists.infradead.org
X-Gm-Message-State: AOJu0YxD6P8VqACqXAezCKQLpMGCAuoDf3XCBB51Ph686T584POK4yvY
	jGtokL7q8ppfxUNxmMb+gSEgP+LWQO7SBQBvlwO2nWwP7FY27xiOi/b+KvEihSxkspqKAcLt5RE
	XOL3lH9FTdMf5wquK+Fp3e6MfnTTGiX/tTV1u4gLGMBq8Whv1vWK6sMIXGqge
X-Gm-Gg: ASbGnct26wKCnhTuXR16STGVp5CfTFjLwj2e6NZE5L+DVnYzt0TBMGzvx3BFg/8DcdL
	6iC7Cvw4jl3IQveCgZhcZjdsmJNZxXY4RYZlJHNhgTx0iH/Lri/MUlpVbj4SbxAGRXqyHdZjnRZ
	UzyUdp9+iV9SwY1csNogfnR/AZqNdaI6djhxWmss0uW6Na6Cb+eDo/21YyT6m8fEvPXXbrvm4Sd
	8L7zs3pZyx5K6YCFC2UrnW4Q0ZIiKwSlIY0mzZhqjQZ1D9YfDbp9JWS2WaciDHbpivccIvmBh/l
	SifV6QRNnKHLUt9mP44W2ANF/Y2o4HmFUTSFae/clXpUstFs9eop1xuFTN6BQav/ssAqrecztg=
	=
X-Received: by 2002:a17:903:228e:b0:216:59ed:1ab0 with SMTP id d9443c01a7336-21dd7d736d9mr126800135ad.27.1738279954964;
        Thu, 30 Jan 2025 15:32:34 -0800 (PST)
X-Google-Smtp-Source: AGHT+IFugGEeK79mFsAp/BtFK2sSZqpExBLqHKqTjsHW//0aiJ4dvvfBkLobTa/kRqWRpyGnI6gXjQ==
X-Received: by 2002:a17:903:228e:b0:216:59ed:1ab0 with SMTP id d9443c01a7336-21dd7d736d9mr126799965ad.27.1738279954567;
        Thu, 30 Jan 2025 15:32:34 -0800 (PST)
Received: from [192.168.1.111] (c-73-202-227-126.hsd1.ca.comcast.net. [73.202.227.126])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-21de32ea5e6sm19357535ad.152.2025.01.30.15.32.33
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 30 Jan 2025 15:32:34 -0800 (PST)
Message-ID: <5c101c47-2568-4a53-a6d0-6fe9c4a38076@oss.qualcomm.com>
Date: Thu, 30 Jan 2025 15:32:33 -0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] wifi: ath11k: fix wrong overriding for VHT Beamformee STS
 Capability
From: Jeff Johnson <jeff.johnson@oss.qualcomm.com>
To: "Yu Zhang(Yuriy)" <quic_yuzha@quicinc.com>, ath11k@lists.infradead.org
Cc: linux-wireless@vger.kernel.org
References: <20250124075953.2282354-1-quic_yuzha@quicinc.com>
 <90c00af8-b6bf-40a2-8f6c-89b5666095bd@oss.qualcomm.com>
Content-Language: en-US
In-Reply-To: <90c00af8-b6bf-40a2-8f6c-89b5666095bd@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: 7DZ35ebkxwYzLuaJ_cM3WQjtXB1_cQ_G
X-Proofpoint-GUID: 7DZ35ebkxwYzLuaJ_cM3WQjtXB1_cQ_G
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1057,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-01-30_10,2025-01-30_01,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 impostorscore=0 phishscore=0
 suspectscore=0 adultscore=0 mlxlogscore=736 bulkscore=0 spamscore=0
 clxscore=1015 malwarescore=0 priorityscore=1501 mlxscore=0
 lowpriorityscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2501170000 definitions=main-2501300183
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250130_153237_674678_A54D9B8F 
X-CRM114-Status: UNSURE (   8.56  )
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

On 1/30/2025 3:29 PM, Jeff Johnson wrote:
> * drivers/net/wireless/ath/ath11k/mac.c copyright missing 2025
> 
> I'll fix this in the pending branch if there are no other issues

I see this is added in another patch, so you can ignore this


