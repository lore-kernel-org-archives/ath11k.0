Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2CADAC7EE31
	for <ath11k@archiver.kernel.org>; Tue, 24 Jun 2025 19:54:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Qyfhlor21ICWZh+rc4+fdzgPyjA2dUWzPSk1D9SVOxw=; b=K6esdVdy5f2+ZwaiZe4H+IBzxL
	OoI51aSbeWitDv7g74W5Wh40ef2MIF+dh1OTvhCEOJ+0Pf5awe7veLpPeQP9AXDHFjmFgyqzrjlfN
	YQl6SPoStXa3YycbB81ndoR8zamuIYQ0zOA7tSH84PLuCeEUIrHms7iDAGii7ClU4c6olMto0da5h
	n4wTq3TRPCaq3fCdgudvz1grkxKa8w4vR/jp2Tuqdq0fgCMG9PBYCbq3hDRTdIhFJlPysyKBsIgD4
	3f0+DTwhl/I1aUtgqDPaSz1HZn11ZMuD6poimwIXdkpPfu4r92UEf0xN6QqsU/CCgmJF72pdNVUgC
	OQ3pNn3g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uU9jI-00000006fZU-2hsF;
	Tue, 24 Jun 2025 19:54:52 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uU6JP-00000006Ffp-1wjS
	for ath11k@lists.infradead.org;
	Tue, 24 Jun 2025 16:15:56 +0000
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 55OFlpAp008161
	for <ath11k@lists.infradead.org>; Tue, 24 Jun 2025 16:15:54 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	Qyfhlor21ICWZh+rc4+fdzgPyjA2dUWzPSk1D9SVOxw=; b=VJP8ug+t6fivQjJ9
	2HdIITE3R/FvdMiFv/sFzLfYQdjlR6LZfI0tk+12LkzUfCaWvffmwc90exzRsxKK
	UnvVLM0QdfIFKK+CvwZyvict5EgEX4l+GIzBh+GhR8MSXn2oiaR4/+EXpwiN/sQa
	e4l8j0Y9W72UPEnouis0Zg28oux4KNQ2zXElHUE+oSMvlgF9qw74nBZ46+2+rqnb
	TOdKOpXc0klR2Ak36eoxs8eTTBQvXx/CjBDtfPduiIA4CSIorzhA+cINUYInl5ee
	Y+H4INM1M28qQRnvek+Qna+bQ6Mc0dwgilAqPxMJroBoYT5qmIF94fsCByFje5pz
	EdjfSA==
Received: from mail-pl1-f198.google.com (mail-pl1-f198.google.com [209.85.214.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 47f7ttv0dk-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <ath11k@lists.infradead.org>; Tue, 24 Jun 2025 16:15:54 +0000 (GMT)
Received: by mail-pl1-f198.google.com with SMTP id d9443c01a7336-2369261224bso65554655ad.0
        for <ath11k@lists.infradead.org>; Tue, 24 Jun 2025 09:15:54 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750781753; x=1751386553;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Qyfhlor21ICWZh+rc4+fdzgPyjA2dUWzPSk1D9SVOxw=;
        b=lQ0McGBDTvEJx5KqkqYAMXWt7kf5rpCH2WT5Q2SqGdfiMpKqi4fB/siLArIghPNzRm
         bQdfDpMuznMRcgYQGlbeg+7yeZ/zuCeRIqREUp6yJLUgRhSJcbvn1tZTE2MiP3B0eHRw
         rtNV/hv3Ta5OJX/sl/XJ7BNHaVPLhyiWUaQgzgxqOdTiJ+KzbkZS79ZvSg7DAZpKBbE2
         jrW/0fy3/qW0bh8v124AxBEvCQ9wh3zYGMKuKVOgRmDz5whcvAmS0Dq9tfoZ/GUWa4Ol
         hpTK7lxR9Ji7yEjVEuwO3UUddbPJKJNzopL27k67FRoOUednS1VXD4RPkYx1dgmlkpnH
         CWoA==
X-Forwarded-Encrypted: i=1; AJvYcCXu3rfP3zPdxW7NbFFqVcoC4Lx0cX5sk5Mf/+g9ACOdvS1ki6ejNRCE7vKvR4oc0BuZZslOjQM=@lists.infradead.org
X-Gm-Message-State: AOJu0YyPWRcoP22Mg5yx3tj5zUhwrkt0tUihNyLYoM3Fjrnp5j3KMlRq
	ysTF64J1AL+2bJG0Qt4MpgRqioC3ZXK+3zlQxQEhn88Whfjt3iBi6Hd/f9J8yKkxU7VuFGGtDfS
	1jlL72dCj7EndXjEFGsgJ7x+WZ4CH0kol8Q7LUflFO9Tsn5hh2jOP6FVdbXQeGIti
X-Gm-Gg: ASbGnctCFGg1BTcxDXS/SpShGQL3lsqfy32lWhFWs5vnsp+/z+XVKDx91pJMjrIKa6H
	dqGKJYaae3NcBhaSU8hW5R5zSXrAXOZGeq04yVjXQSjeBP53LEL39nX1JHFH2oSoDPUzsegqP7k
	PlN+GBqFioOk3leQhQix+qmgr16/3uNLlsbTXoXE9RLA9GxbZbkuwIzUsDzRWSkMcVjnaj0w4rA
	pWPCIfE3r67K8/QjH4WNUfjPc1PP3PO4/ESZmzTtgylSCaf65GNgQ7z4oZatlVTF0kb9oz4xTk5
	yGhTGELo0JI+ZvX+1J7UzXIcCNLx7XizlJZGJKQZvaHhtHSEML4ENWMmwol55qTLBlT4TpermqI
	wcLVaKL142L4Ake8=
X-Received: by 2002:a17:902:fc44:b0:234:e655:a632 with SMTP id d9443c01a7336-237d9b19e2cmr287442585ad.51.1750781752993;
        Tue, 24 Jun 2025 09:15:52 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IH3GDtY6uAafIPWUwLJ9fdR1mlv1odipIGVPfHXlQOfWlJDASFtqBzLLuEVdFTlA964kKvR6g==
X-Received: by 2002:a17:902:fc44:b0:234:e655:a632 with SMTP id d9443c01a7336-237d9b19e2cmr287442015ad.51.1750781752475;
        Tue, 24 Jun 2025 09:15:52 -0700 (PDT)
Received: from [192.168.1.111] (c-73-202-227-126.hsd1.ca.comcast.net. [73.202.227.126])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-237d8695440sm113338745ad.185.2025.06.24.09.15.51
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 24 Jun 2025 09:15:52 -0700 (PDT)
Message-ID: <377affe8-fa88-4ade-9cf8-aaeaaabee679@oss.qualcomm.com>
Date: Tue, 24 Jun 2025 09:15:51 -0700
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] wifi: ath11k: fix suspend use-after-free after probe
 failure
To: Johan Hovold <johan@kernel.org>, Johan Hovold <johan+linaro@kernel.org>
Cc: Jeff Johnson <jjohnson@kernel.org>, linux-wireless@vger.kernel.org,
        ath11k@lists.infradead.org, linux-kernel@vger.kernel.org,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Baochen Qiang <quic_bqiang@quicinc.com>
References: <20250624082022.15469-1-johan+linaro@kernel.org>
 <aFpingRwP3foaKJ9@hovoldconsulting.com>
 <43b978a5-c1c3-450d-8340-dc1a6dddc884@oss.qualcomm.com>
From: Jeff Johnson <jeff.johnson@oss.qualcomm.com>
Content-Language: en-US
In-Reply-To: <43b978a5-c1c3-450d-8340-dc1a6dddc884@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=QINoRhLL c=1 sm=1 tr=0 ts=685acf3a cx=c_pps
 a=MTSHoo12Qbhz2p7MsH1ifg==:117 a=e70TP3dOR9hTogukJ0528Q==:17
 a=IkcTkHD0fZMA:10 a=6IFa9wvqVegA:10 a=VwQbUJbxAAAA:8 a=qSSGdmx9Lv0nWuJ4rdQA:9
 a=QEXdDO2ut3YA:10 a=zZCYzV9kfG8A:10 a=GvdueXVYPmCkWapjIL-Q:22
X-Proofpoint-ORIG-GUID: 3jiO1wtAHq23u5iXFvRiXzsh2-67VkRW
X-Proofpoint-GUID: 3jiO1wtAHq23u5iXFvRiXzsh2-67VkRW
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNjI0MDEzNiBTYWx0ZWRfXxXifuSmRFhVJ
 NxvlzNMiq+0ujuVL0AHVqvFXhvDjYwV3lYZkCTnlLdRIp+i/zLq43/QKoY2WFs9C3lY6dS6qmz3
 +dEvMVPqEgTtRE5iXVJKwN9wiOWIowwZ64c3U5BLSe//6fJ4rAq5qY0wzAFJl069xazmy9WFxf+
 YHriZJ4CSQmsiqSN2bKU9Mk3HMbIZFnfJ7v7vhev9UlVrKkFW64PSulWQHC36FJ58VcKvpGk4Op
 VgXEbAXOMUD7tTPOKTns3xNBRfIFak7NMeX7bd7sl/6ODz0KbKm4usC/P7Q3VRY7EnsBTa913hv
 QzT+Z22s+qjtv6vKsCYHYfksuTqoFLWNDfhTqN+O1NBdqdJ9zRob+F2svGTQ9Tx964WbfL5u3zi
 29sGRZi6+l9zUvOWW0D5R9l35B/gKVUBEqXgMq05/jzG+GIVWd3tSvy3wZ5NtnoNWoSCTKfV
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.7,FMLib:17.12.80.40
 definitions=2025-06-24_06,2025-06-23_07,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 priorityscore=1501 malwarescore=0 adultscore=0 mlxscore=0
 clxscore=1015 mlxlogscore=999 bulkscore=0 suspectscore=0 phishscore=0
 impostorscore=0 lowpriorityscore=0 classifier=spam authscore=0 authtc=n/a
 authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2505280000 definitions=main-2506240136
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250624_091555_633606_1E0E3BE5 
X-CRM114-Status: GOOD (  12.46  )
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

On 6/24/2025 8:11 AM, Jeff Johnson wrote:
> On 6/24/2025 1:32 AM, Johan Hovold wrote:
>> On Tue, Jun 24, 2025 at 10:20:22AM +0200, Johan Hovold wrote:
>>> Make sure to deregister the PM notifier to avoid a use-after-free on
>>> suspend in case core initialisation fails (e.g. due to missing
>>> firmware).
>>
>> Not sure it matters in this case, but forgot to include:
>>
>> Tested-on: WCN6855 hw2.0 WLAN.HSP.1.1-03125-QCAHSPSWPL_V1_V2_SILICONZ_LITE-3.6510.41
> 
> I'll add that.
> I'll also change the Link: to Closes: per checkpatch:
> 
> WARNING:BAD_REPORTED_BY_LINK: Reported-by: should be immediately followed by Closes: with a URL to the report

Please check pending patch:
https://git.kernel.org/pub/scm/linux/kernel/git/ath/ath.git/commit/?h=pending&id=2418079880408c5ae0b2a93f72af044eaff18cb6

