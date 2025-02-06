Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A3F95C0219B
	for <ath11k@archiver.kernel.org>; Thu,  6 Feb 2025 21:37:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Cc:Content-ID:Content-Description:Resent-Date:Resent-From
	:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=G7wjLP+yTM02I49I8Ek7TaQyeo1dCCYOyY+5OGI9Wsk=; b=TqyLUkt2aJth30V29pwU1zveUi
	8c6t9496FBl2paEc+2zcow8xEZq+JctriORXMj/XWzsfVrqLUliKy5rh/dHjC5ZrwlsQcNuz5/oV8
	yntoA7P7yJvbw9vRLVCZMv8sw5dNKjUS3KnmLpEqqdDAo4ZNAeyOHKQM8EYYkStlogPUF27ArkUHg
	rkR+rxOFzaJggC3tbsdMCoBG4dfahtjlOZ36WqZrRKxNk6D1w5nmBD4/YZhgioU/F9J9qWnHX6VOv
	nwsRGpQC2X+J2aGpzj9ng6YK2eoa60mK60h9HshoXlTOm1EMikkRO8zipGKBhFMiU3897akMR0yGZ
	V1AIWZEA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tg9Ys-00000007awR-1lcz;
	Thu, 06 Feb 2025 21:37:26 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tg9Yp-00000007avf-2xfe
	for ath11k@lists.infradead.org;
	Thu, 06 Feb 2025 21:37:25 +0000
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 516HrnA6016493
	for <ath11k@lists.infradead.org>; Thu, 6 Feb 2025 21:37:22 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	G7wjLP+yTM02I49I8Ek7TaQyeo1dCCYOyY+5OGI9Wsk=; b=ND2ISF3cvYwGfyQ0
	jt77DAeLb2bazcd+X6L+wBI+RRCi4s7jrVU9rL7nIk4CBSYmqfOveN65tWcF4sTa
	QQWUCUcYrO1jlW4PxGFDCZtevrULXy5cpj9jq336xRa6gww2Lnb7wbp9x0ybRb70
	fY98XPhZRzHijlb7h18Vt6J8l1yRULDNwRgFbwYXPImQHa4J7U8sjSU/hqArNDmK
	/AAwd03cohFN0fZugNky8XpQO2d2wBIhzW2lDus8SUJml0DsjHs0en7BBPaxupcQ
	NsxXjHlyQ3CWVh3mQGIcJclFgrrRdWp2p8W2goA3yTf1W2Vvw+N1CHrUh3/VnFyx
	9id1QQ==
Received: from mail-pl1-f199.google.com (mail-pl1-f199.google.com [209.85.214.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 44n1vs0fc1-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <ath11k@lists.infradead.org>; Thu, 06 Feb 2025 21:37:22 +0000 (GMT)
Received: by mail-pl1-f199.google.com with SMTP id d9443c01a7336-21f4666364bso10104535ad.2
        for <ath11k@lists.infradead.org>; Thu, 06 Feb 2025 13:37:22 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738877841; x=1739482641;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=G7wjLP+yTM02I49I8Ek7TaQyeo1dCCYOyY+5OGI9Wsk=;
        b=purqc94UoHNITncBHjwOnrevZDYjhVxpAxaNDSqiD8ErTe6uWBS7ByteIX0os9+72N
         exIYob62tVK19GhHeMnvxv1Rk2VStLU1dw+KaJaAPHI4LGtQjfEWhp7roJOQkLP5CaXO
         oU/Pl5LPbooospRW1nxEaxa/eiHf6w/DxV6T3NO/KAnnZJ72vkTYnYkCbrW3hv3gemZD
         poSv7Wjl3fjkwgmYq1Q9qVxOylqGDYhVOTvG3onCKhZtMGfhd3SdO5EcOemhCP57QoL5
         He3FOfKP71TdjU/8GzZbdr/hL7j6AmHVamzMQRwkQTaDlcLYGaQTGkm7hIOYsV9eWXB8
         jW4A==
X-Forwarded-Encrypted: i=1; AJvYcCV5d9tvIi3Ap+IWz+CTqoc6B9/ojQHBqq2HOg9O2MQermGJnqH5lEg4rJpCjYOwIeC3+DgSZEY=@lists.infradead.org
X-Gm-Message-State: AOJu0YzPXLipgE8Nd2VrWajNM8XHLkLuLegMy/VQfPC2HBGoydwv2EPl
	nmnXenQJ0SNHqV46FTnW25xEy00nwXyqr2YsmYupNRczJF81eAmW8DxQFDX81g6bY+zUaZNAb1U
	txCq22ViGRU/cSguCdOQGQCJO4kkXs2dhL1OO89DW7HGdqTab8fSrJBAn3zn+
X-Gm-Gg: ASbGncvy1edg08tUQBzXsuX9Q71sfMMYetuGmacc/4I1QQ8NHNZNqt+PkPCXqILxzAy
	TTuLrN1F5aTyoHOLwh6TDSayXWH4ZsTDUxEXD+XSWA44lO8J9n+SZckbrDuadsIxrmXhQL8he/M
	FbGK30RtVAi/fAyi8XnItN7frauQ50ROFHljoZQkvJs1pwIHtBwGwsh7gm9dcOwoZ3W8jPLrxUa
	/naoberut95EDDyUFE36RjO4IQGe+aAWYHnCSV7q26zNJdXD5UgNJrv/WkaN1hktZf4VVmhXF1Z
	gAD6iF/bRNitcr1vi9DYKe0MJqc5jol3V6GEzsSyjbAwM8pdo+ktgk5q89On5TBOhtfzdj01CQ=
	=
X-Received: by 2002:a17:902:e802:b0:21f:4aaf:60fa with SMTP id d9443c01a7336-21f4e7595c7mr12834315ad.38.1738877840968;
        Thu, 06 Feb 2025 13:37:20 -0800 (PST)
X-Google-Smtp-Source: AGHT+IG1x892Iv1IAr+zxejJwny+BJ000+ouOGHUAikBS3EHIAbcztyS84NEIkfqIGZ2mbl002x/Zg==
X-Received: by 2002:a17:902:e802:b0:21f:4aaf:60fa with SMTP id d9443c01a7336-21f4e7595c7mr12833965ad.38.1738877840575;
        Thu, 06 Feb 2025 13:37:20 -0800 (PST)
Received: from [192.168.1.111] (c-73-202-227-126.hsd1.ca.comcast.net. [73.202.227.126])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-21f3653ad8fsm17743325ad.61.2025.02.06.13.37.19
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 06 Feb 2025 13:37:20 -0800 (PST)
Message-ID: <9759db76-c805-48df-a17b-b913c430b2b5@oss.qualcomm.com>
Date: Thu, 6 Feb 2025 13:37:18 -0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 0/5] wifi:ath11k/ath12k: refactor tx_arvif retrieval
To: Aloka Dixit <aloka.dixit@oss.qualcomm.com>, ath11k@lists.infradead.org,
        ath12k@lists.infradead.org, linux-wireless@vger.kernel.org
References: <20250203214448.1978156-1-aloka.dixit@oss.qualcomm.com>
From: Jeff Johnson <jeff.johnson@oss.qualcomm.com>
Content-Language: en-US
In-Reply-To: <20250203214448.1978156-1-aloka.dixit@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: Psq3ymZyLlqm8xwhNoKHpNPVAzZZluw7
X-Proofpoint-GUID: Psq3ymZyLlqm8xwhNoKHpNPVAzZZluw7
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1057,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-02-06_06,2025-02-05_03,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 bulkscore=0 adultscore=0
 spamscore=0 mlxlogscore=999 priorityscore=1501 mlxscore=0 suspectscore=0
 malwarescore=0 impostorscore=0 phishscore=0 lowpriorityscore=0
 clxscore=1015 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2501170000 definitions=main-2502060169
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250206_133723_868919_AB47254E 
X-CRM114-Status: GOOD (  13.19  )
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

On 2/3/2025 1:44 PM, Aloka Dixit wrote:
> MLO MBSSID series for cfg80211/mac80211, which is in review here 
> https://patchwork.kernel.org/project/linux-wireless/list/?series=902914&state=%2A&archive=both,
> changes the way transmitted profile data is stored for each link.
> As drivers currently retrieve 'arvif' for transmitted profile at
> multiple places, MLO MBSSID changes will becomes unnecessarily
> bloated with RCU operations for every retrieval. Refactor 'tx_arvif'
> to avoid this.
> 
> Additionally, fix an issue in ath11k_mac_update_vif_chan() where
> tx_arvif is not reset to NULL inside 'for' loop during each
> iteration.
> 
> v3: address comment from v2 and removed NULL check for
> vif->mbssid_tx_vif from patch #1.
> 
> v2: fixed kernel test robot error in patch 1/5 for tx_vif.
> https://lore.kernel.org/oe-kbuild-all/202501160626.Jbb3GHnk-lkp@intel.com
> 
> Aloka Dixit (5):
>   wifi: ath11k: refactor transmitted arvif retrieval
>   wifi: ath11k: pass tx arvif for MBSSID and EMA beacon generation
>   wifi: ath12k: refactor transmitted arvif retrieval
>   wifi: ath12k: pass tx arvif for MBSSID and EMA beacon generation
>   wifi: ath12k: pass BSSID index as input for EMA
> 
>  drivers/net/wireless/ath/ath11k/mac.c | 75 ++++++++++++-------------
>  drivers/net/wireless/ath/ath12k/mac.c | 81 +++++++++++++--------------
>  2 files changed, 76 insertions(+), 80 deletions(-)
> 
> 
> base-commit: 1ed13fdf7d8284742c8ede36dd553387839e5163
can you rebase? this has a conflict with:
    wifi: ath12k: fix handling of CSA offsets in beacon template command


