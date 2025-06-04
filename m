Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 681E4C5B543
	for <ath11k@archiver.kernel.org>; Wed,  4 Jun 2025 16:24:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=UmqjCOK/2PV+3jpeh7XZghC3MKfY9pGurM7qJBU/Zyc=; b=BrOlTAvPC1q51ESI2P4qfmQaF5
	cn+Q8/rV7Ml6B8uVFsltKRulnlnjJzEM9WsOpewkApGZuVX8D25PhbJ65n12E6SITPzka8Pq2xFJ5
	WIl9fJ7xx+c93bxhIahwow0YfpF/CDoqkcvAXP5Csj//UV++WIyWRqSEw1ln/Fvj2HpN7cJsy4mcI
	Ve2nso2pNxYmfvfzNYHvQgBeU6ksyVWj/a6ZjfANKz3s5aC5bY9c6dj79OFVgiOE6qR9bbVuoIx3w
	gqAIlVsSAB+KJQC7kRASof535L3VOVz9gihP8uazCwgJDsiDHoyR5UBp9ohISrHsfhB5C1rflYav1
	PFOy9ZZw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uMquu-0000000DmpW-1Snk;
	Wed, 04 Jun 2025 16:24:40 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uMqur-0000000DmpA-10FS
	for ath11k@lists.infradead.org;
	Wed, 04 Jun 2025 16:24:38 +0000
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 5548K9mo027289
	for <ath11k@lists.infradead.org>; Wed, 4 Jun 2025 16:24:36 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	UmqjCOK/2PV+3jpeh7XZghC3MKfY9pGurM7qJBU/Zyc=; b=KJfXl3ERFqlZhjj3
	21STEtvBdDAbkpQsizC8Gvb74Fv8Nse5ic109dL5yKJ8iNC3iOoIFq+CP3iOrC1o
	wEQEq1qUJdXVV/jDWF3WlfpysKmCxf04km6UJRU6/RxRKsoj11Aigttyp7jwcR/R
	Cdbm6AnzT0EVPlC6uHfswTs2rAWCRks3cxKpmFy7AWedXgbHqLU+6lABjF7lp1Xj
	pxmDEG8Nq/Ze0tSnAeWoggdg2D+0v9BR5A4iowj6cRLjsMLCkaQuXRb+BPn6Xg3a
	1orNNQx+eRrZ7iREFvp/41TkodY9XfWP+IJkSGDYjWAUyRudElRWQ/FBEDVWGvms
	GKO+Kg==
Received: from mail-pj1-f71.google.com (mail-pj1-f71.google.com [209.85.216.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 471g8sxnut-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <ath11k@lists.infradead.org>; Wed, 04 Jun 2025 16:24:36 +0000 (GMT)
Received: by mail-pj1-f71.google.com with SMTP id 98e67ed59e1d1-31327b2f8e4so24590a91.1
        for <ath11k@lists.infradead.org>; Wed, 04 Jun 2025 09:24:36 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749054275; x=1749659075;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=UmqjCOK/2PV+3jpeh7XZghC3MKfY9pGurM7qJBU/Zyc=;
        b=WzR/7eRJx2Ur60oI6fdsaNUvP3sQSkmpwCPmZYy5OaJN6d9JnRwMV08gm63+AmdnFy
         HKHaKz9hWbMfEAfNcprs1crEeTPm+XxgqgvoMSoQ11d5WsPdqMy6epPnNvaLE09tforM
         vyQ/EDVlx7bZZcsMuvwQjGpPFLCAObH61VuGWrb3rQ0vuckVBDNPCXQf8gDOWxb1q/0L
         bGWWZVo6/uHNY1z0I09iscLZB3EWfDRlO4tz3BBvtRlzdv1997jJp0LMj77Ccg6KaUnv
         BT/ZEFkNoA+sqfPvW7gDc9Wgq5Sbbc6ZP93hOW9f8EFmJbsblJtROi0mw9wbxo8jfJty
         Mw+Q==
X-Forwarded-Encrypted: i=1; AJvYcCWxmX7YH6Z9gUnsvb5IvXROvDbyvLbKapakYFIjUfvycqiuMjuZW6AGtLvOz8y57Cm3oezgzFM=@lists.infradead.org
X-Gm-Message-State: AOJu0YzRfPPamcNY8bP1CdlUXKuzey2iE4nFw31/qGl6t8aRY8g8PI5o
	/7UTkytNKrevZCrLe52amOei9Y2BZeiUnx6y7CYAaSNVmNVx0DZK7sgO5wf1mFVWZTCPtBu73OK
	yyimuY48sQxPBu7JzXwEqYX952lgHKUemdTtLW8y70MBNLJFQZU44IS8NDV8W7ZMy
X-Gm-Gg: ASbGncvHR51VzIhfmAOcCph7hvTNxzttRPAFEO9nabHkvk1bzMFmpBDk/JDFHGd2ja3
	MwD0AORQbhqhkxLiNPSQUnq2acTkFuOAcSwnunMFSDT4mu/nl+cf+291eLCi/LePwmgr7bFpmZO
	rVQtePEf8SiZN/7UJv3hjKPBl6oWTiZuymp5aMzfg5C0ejt+AtwfJdfOH5+ZuN59eJ/vq+GCdcT
	NIH+ycILkYijisNQjHV0zRohPPc+20SVTZj7MuH2OD+1melozKcvOG/wL+CVZOJdTtFxHFePSYy
	h786Uz/t5ln/dX/4P+KYy1v5KyOMgbTEwifR7Qg1lwbMKARpMyyweyt67IaUwPpKa+g=
X-Received: by 2002:a17:90b:48cc:b0:311:2f5:6b1 with SMTP id 98e67ed59e1d1-3130cd3c193mr4541060a91.22.1749054275285;
        Wed, 04 Jun 2025 09:24:35 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEyeX7AH3Z2qmV4RyPhkzwExHjRAMbx65+A1uhcePobw4T+CSD/5pREJy2bkxvhQy4rzQER5Q==
X-Received: by 2002:a17:90b:48cc:b0:311:2f5:6b1 with SMTP id 98e67ed59e1d1-3130cd3c193mr4541044a91.22.1749054274900;
        Wed, 04 Jun 2025 09:24:34 -0700 (PDT)
Received: from [10.227.110.203] (i-global254.qualcomm.com. [199.106.103.254])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3124e2d1689sm9089572a91.12.2025.06.04.09.24.33
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 04 Jun 2025 09:24:34 -0700 (PDT)
Message-ID: <50555c1a-c200-4ac0-8dfb-424ff121b41d@oss.qualcomm.com>
Date: Wed, 4 Jun 2025 09:24:32 -0700
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/3] wifi: ath11k: fix dest ring-buffer corruption
To: Miaoqing Pan <quic_miaoqing@quicinc.com>, Johan Hovold
 <johan@kernel.org>,
        Baochen Qiang <quic_bqiang@quicinc.com>
Cc: Johan Hovold <johan+linaro@kernel.org>,
        Jeff Johnson
 <jjohnson@kernel.org>, linux-wireless@vger.kernel.org,
        ath11k@lists.infradead.org, linux-kernel@vger.kernel.org,
        stable@vger.kernel.org
References: <20250526114803.2122-1-johan+linaro@kernel.org>
 <20250526114803.2122-2-johan+linaro@kernel.org>
 <026b710f-b50f-4302-ad4f-36932c2558ff@quicinc.com>
 <aD1axxSAJsbUfnHH@hovoldconsulting.com>
 <5268c9ba-16cf-4d3a-87df-bbe0ddd3d584@quicinc.com>
 <aD7h0OOoGjVm8pDK@hovoldconsulting.com>
 <01634993-80b1-496e-8453-e94b2efe658c@quicinc.com>
From: Jeff Johnson <jeff.johnson@oss.qualcomm.com>
Content-Language: en-US
In-Reply-To: <01634993-80b1-496e-8453-e94b2efe658c@quicinc.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=RMizH5i+ c=1 sm=1 tr=0 ts=68407344 cx=c_pps
 a=UNFcQwm+pnOIJct1K4W+Mw==:117 a=JYp8KDb2vCoCEuGobkYCKw==:17
 a=IkcTkHD0fZMA:10 a=6IFa9wvqVegA:10 a=VwQbUJbxAAAA:8 a=COk6AnOGAAAA:8
 a=OOj_HejH6eEqbjqsXVoA:9 a=QEXdDO2ut3YA:10 a=uKXjsCUrEbL0IQVhDsJ9:22
 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNjA0MDEyNSBTYWx0ZWRfX/pp+LaF4vPjj
 jD2EiDRK5FNXb3SqOdWJJMgv7Ds/qJvyz/KTXt5JYooYkJxQ9KDau7qBLbvBZ0eh0VVZL6KEPf2
 hf6RDRFOVLTkbb5o5wReC4xI/N18lnOSUxTyXY5oAWjZKBJZEoivgBZG+ymzFE911TipplKbuXy
 59Z6GGK+gB/ii0tgRPto0ERmQXnLNNMfHEMBqdop5D+bUV8HOciO6BI2bGoxvn2dymwtQFpPKsL
 jDXM8eLWhVpWGRL6AoYujBVxk9NHVQDVJbdOSkl7PKVHi9rr62qDz+DG+MSljrzYbvSMhY7+Xds
 PKVGfdIHi/S0v9uWv5z5/QOJANporCr9fXACR6I56m4ReYkIhIuA8BhG+MnJG0N39an5UF9+Yro
 u15fmjV278bSwRvO2pTzw0Z+6ueVprvY1b6X0d/sCKWO4oPxskJul53/MqxLj+cghF80Irpz
X-Proofpoint-GUID: xw9PAqjNMj21AbwwsNZ0YzlnOf1fQVw0
X-Proofpoint-ORIG-GUID: xw9PAqjNMj21AbwwsNZ0YzlnOf1fQVw0
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-06-04_03,2025-06-03_02,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 phishscore=0 spamscore=0 lowpriorityscore=0 malwarescore=0
 bulkscore=0 suspectscore=0 adultscore=0 mlxlogscore=999 mlxscore=0
 clxscore=1015 priorityscore=1501 classifier=spam authscore=0 authtc=n/a
 authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2505280000 definitions=main-2506040125
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250604_092437_286014_525B826E 
X-CRM114-Status: GOOD (  10.38  )
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

On 6/3/2025 7:34 PM, Miaoqing Pan wrote:
> We previously had extensive discussions on this topic in the 
> https://lore.kernel.org/linux-wireless/ecfe850c-b263-4bee-b888-c34178e690fc@quicinc.com/ 
> thread. On my platform, dma_rmb() did not work as expected. The issue 
> only disappeared after disabling PCIe endpoint relaxed ordering in 
> firmware side. So it seems that HP was updated (Memory write) before 
> descriptor (Memory write), which led to the problem.

Have all ath11k and ath12k firmware been updated to prevent this problem from
the firmware side?

Or do we need both the barriers and the logic to retry reading the descriptor?


