Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C9CD4CCD183
	for <ath11k@archiver.kernel.org>; Mon, 13 Oct 2025 15:39:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=gFxfNALQj0kVo1nFaR/pZdz97+/8Uqorpj5QRkTfdsg=; b=wNVT++bDZ/AjQMJ9BYA0CLPrww
	7wvjyAE5BhBCZYkn41vQOMe2+/K8s7GEomUiGSLU8rAawHzrPBDh7Ce6FAGhoQMVAtbPyqyAkPiwE
	24DZzGFPzS/zw+QKiEYd9f448K3qwLnZ99XozTzEBJjsr7ru2ySistloIG7j1sNa2Rle4G0mlIv4f
	uYHVdlcVMLk7iqS14BsOFtGS95cvm914NLKHIVNVUq/WKYTiNwF7uEZJumGD5COb4Y0PFnJBLgjJY
	WewzhSNAGYSx+vuoz4hvS+LvPvQjnwHoisOB+0GBSkXHGFoQVvX51/KC/4aZ5pJTN8E99kWaVsn0j
	oyFh6/aA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v8KeG-0000000DjIh-40qq;
	Mon, 13 Oct 2025 15:39:44 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v8KeD-0000000DjHx-2y2m
	for ath11k@lists.infradead.org;
	Mon, 13 Oct 2025 15:39:43 +0000
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 59DALap3018177
	for <ath11k@lists.infradead.org>; Mon, 13 Oct 2025 15:39:40 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	gFxfNALQj0kVo1nFaR/pZdz97+/8Uqorpj5QRkTfdsg=; b=F9j/NwLmz4Fbf0Lv
	A2kJotKX+VXn1eUmSlYnDhzKxqBC5XE48IsCjtZZ30/XWpM4dyMHBANlJqygJZxm
	gu99K5aLjf21rYg/CvZVnZMX4jvZ54cJgny4UL1GtuGXydsFOtPS8Bl2f17j08/R
	ruDr6Iw/B4PZhn9Zu/e0foTZFg6lahdYJnZXUjgkBJCpyjjv6Z+iFEUkAc0wwXHT
	CFuP6WPWHMrP3yjLWdjZIXOoi/8od7s1gKZ+ohioK7tbKwZrpN5sxlHlAUXqAvTA
	aWDSbeXWJab8h5N3iBRWivo0ajVM4zJ8IqMg8BCG3k7EPULC8bQVys1kWFs/aP0U
	MLo1fA==
Received: from mail-pf1-f198.google.com (mail-pf1-f198.google.com [209.85.210.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 49qfdk56sb-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <ath11k@lists.infradead.org>; Mon, 13 Oct 2025 15:39:40 +0000 (GMT)
Received: by mail-pf1-f198.google.com with SMTP id d2e1a72fcca58-76e2ea9366aso6657570b3a.2
        for <ath11k@lists.infradead.org>; Mon, 13 Oct 2025 08:39:40 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760369979; x=1760974779;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=gFxfNALQj0kVo1nFaR/pZdz97+/8Uqorpj5QRkTfdsg=;
        b=l/k6zeXGzyktVfmZRmkNJqImEvzWqNXYHlICCy5zOFmAGgCbB7j+6GweVlr9msu72C
         uG1l0nB0elZr1O3kVPDau1OdwmYblVRKbmTsGAKEGXxbk0ATY8FvkaGrphwyNJv5uBCq
         4o010G7VCxLfLajj/u51rDmgjuRm1G0CziVPe3zFzWaNq4DJaxN/GZQxvz7RqECH2vpx
         bJDlPa+/JuZcGxiLRVIe8XP1zPYXF6noVGbY4fHO0BT6sDsMaw3JSuZK/An1xGhIcFrv
         Xlx/1ZoKGVkD2RG7b7fkd0ywEgArhhRTp/9lTXBjriEDCKhRiEIkvxlE2M8Rzduf9nIX
         Lg5A==
X-Forwarded-Encrypted: i=1; AJvYcCXQvBWhYSljIBB8Ytind1UxsdzuV9izAvM9r/qxI1zDIf+7R53HgFxx+phKNQu5tNFvq+YtAzc=@lists.infradead.org
X-Gm-Message-State: AOJu0Yw98YUv4xXA//yTRFnX7cTWyDYtmK0lQ4Jym+35SheQ3I3qXfiR
	LwUiHoaOU3hM54AirG2r1C11m2t2gmXC2a2b6KABiqB0oYhFccH41xv0NSpFsTC3LkvwFnPrkvi
	LC+6Fmmd/jqkDD1uFboY7rsUFQg3b0RzNvCdEqRpeTddrkEaZygw9bDrAikFHdHun
X-Gm-Gg: ASbGncuUK27qih4mNXJThbdsya580EBICAE64j9bh9RzfVSajll/jHhAGuZ3naBmvq6
	CyK03phaDEJ2g+EtZzYbpsNUGnyPz9o6LQarUXe4ZJxAsYMtl2cScKFnGkwpfi0/eNCR+SKS4vI
	NvcJfBWJnoXbOQ7FdDSXxNzG6+nmODNKq1TV68diOgJCHCrpGpvTE1Z23/eRO6eordAuZVjHwWM
	l2LRzwt1MYmBrXMLFELnBaK2GgneNLYUaXezQKT+jCa60jSaabTR0zdwNkZ3rpDCJc1OsUPfuHm
	lXQWMoVea7uTESx8phUjSE0RMJiICd+Cbojf0R1lG+wzbOspjQusu+I0yImUJEJ9vCHtkm7xw8s
	LVcLlb2lgHWu8idfXzO0BfYSn
X-Received: by 2002:a05:6a00:2389:b0:77f:68a4:a88 with SMTP id d2e1a72fcca58-7938762f6cdmr23218489b3a.21.1760369979397;
        Mon, 13 Oct 2025 08:39:39 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IF4kxqkpVz9sQusAyfzIDLIVnk2b1584b0w/ts/XE/aPdVbk1/Yuuxpe1N910zi6UxYAFwSQQ==
X-Received: by 2002:a05:6a00:2389:b0:77f:68a4:a88 with SMTP id d2e1a72fcca58-7938762f6cdmr23218460b3a.21.1760369978948;
        Mon, 13 Oct 2025 08:39:38 -0700 (PDT)
Received: from [10.227.110.203] (i-global254.qualcomm.com. [199.106.103.254])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-7992d096527sm11927416b3a.44.2025.10.13.08.39.37
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 13 Oct 2025 08:39:38 -0700 (PDT)
Message-ID: <1f47148e-30cd-4698-8b1b-3a22a6c1fefe@oss.qualcomm.com>
Date: Mon, 13 Oct 2025 08:39:37 -0700
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: pull-request: ath-current-20251006
To: linux-wireless@vger.kernel.org, Johannes Berg <johannes@sipsolutions.net>
Cc: ath10k@lists.infradead.org, ath11k@lists.infradead.org,
        ath12k@lists.infradead.org, jjohnson@kernel.org
References: <45843a5f-011f-4751-b9bc-004768b1454e@oss.qualcomm.com>
From: Jeff Johnson <jeff.johnson@oss.qualcomm.com>
Content-Language: en-US
In-Reply-To: <45843a5f-011f-4751-b9bc-004768b1454e@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: 6GGsb-fg1_sY4cmFXeZ55pwBe72Mqls8
X-Authority-Analysis: v=2.4 cv=MrNfKmae c=1 sm=1 tr=0 ts=68ed1d3c cx=c_pps
 a=m5Vt/hrsBiPMCU0y4gIsQw==:117 a=JYp8KDb2vCoCEuGobkYCKw==:17
 a=IkcTkHD0fZMA:10 a=x6icFKpwvdMA:10 a=VwQbUJbxAAAA:8 a=WHy267Qvh4jMVSjEg6QA:9
 a=QEXdDO2ut3YA:10 a=IoOABgeZipijB_acs4fv:22
X-Proofpoint-GUID: 6GGsb-fg1_sY4cmFXeZ55pwBe72Mqls8
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMDExMDAxOCBTYWx0ZWRfX7nmfMh4Stp8h
 RJ9exIUiMNj7VIWolYIvkLl+MofErSYe70tPYeee7P2S9w+3F6oYswBaotuIgPcTaTtVFgXzog9
 FRyY7rkGG3T5fwu8WH9l6x7KW0vn11LNOze7dw3XezQ96XVY45KMgXuB5Js1jIL/bd02/vH1oiU
 gCB47O48VwOK+HFDXodoWravZd5/O+d8rqFcfXJAq3v7bb6KB4IKeJdIm8ZshTf5OBhjbu43RmG
 Z2+M6hJJTBOj+rs/ufHiJfj02ZReKJf+1zRFZIZt26DqmnH4mDipuuu0MMu+P0Ri9vPxJrMxHBx
 tBsP1E69KzMyYC34KCo2/tAdbLf377HKdtwjsoUfoLk7ZjUWLi1d/TiauOYPFt4SOKajcL/+XLM
 rWHA08Nnek9eJrR2YO1YiP5J8iXTrQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-10-13_05,2025-10-06_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 bulkscore=0 clxscore=1015 adultscore=0 phishscore=0
 impostorscore=0 priorityscore=1501 malwarescore=0 lowpriorityscore=0
 suspectscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2510020000
 definitions=main-2510110018
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251013_083941_855590_00A43D06 
X-CRM114-Status: GOOD (  13.68  )
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

On 10/6/2025 10:12 AM, Jeff Johnson wrote:
> The following changes since commit 4ff71af020ae59ae2d83b174646fc2ad9fcd4dc4:
> 
>   Merge tag 'net-6.17-rc8' of git://git.kernel.org/pub/scm/linux/kernel/git/netdev/net (2025-09-25 08:23:52 -0700)
> 
> are available in the Git repository at:
> 
>   git://git.kernel.org/pub/scm/linux/kernel/git/ath/ath.git tags/ath-current-20251006
> 
> for you to fetch changes up to 9c78e747dd4fee6c36fcc926212e20032055cf9d:
> 
>   wifi: ath11k: avoid bit operation on key flags (2025-10-06 09:48:55 -0700)
> 
> ----------------------------------------------------------------
> ath.git update for v6.18-rc1
> 
> Fix memory leaks in both ath10k and ath12k.
> Fix a sparse issue in ath11k.
> Allow ath11k suspend/resume to work on more Lenovo laptops.
> 
> ----------------------------------------------------------------
> Karthik M (1):
>       wifi: ath12k: free skb during idr cleanup callback
> 
> Loic Poulain (1):
>       wifi: ath10k: Fix memory leak on unsupported WMI command
> 
> Mark Pearson (1):
>       wifi: ath11k: Add missing platform IDs for quirk table
> 
> Rameshkumar Sundaram (1):
>       wifi: ath11k: avoid bit operation on key flags
> 
>  drivers/net/wireless/ath/ath10k/wmi.c  |  1 +
>  drivers/net/wireless/ath/ath11k/core.c | 54 ++++++++++++++++++++++++++++++----
>  drivers/net/wireless/ath/ath11k/mac.c  | 10 +++----
>  drivers/net/wireless/ath/ath12k/mac.c  | 34 +++++++++++----------
>  4 files changed, 72 insertions(+), 27 deletions(-)

Johannes,
Hopefully this can get picked up for -rc2?

/jeff

