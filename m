Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DA4E9C61CE8
	for <ath11k@archiver.kernel.org>; Thu, 12 Jun 2025 13:19:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=7QIskp7CeaFU7u4UNInC1v8TRYXWF8xfW2XMu+8r6y8=; b=m9n2paqKlFDXagOYoduM5rnwfX
	aPDlq3PIpm1ua1iAbZbUdLgRBjQt4S9Bf9HHK1/w2PuMPClQe/6tp7fYr8iWQ5mUiSIS0uU20spjM
	1APTNL/l8UU0rPnzOQIInKbo6AXZBglI6DB2YuTmk/V9/UADLx48viWQnjt5v8x5j0a9HzjwJIi3Q
	qHHrp+/XsNrDBtOzjPPhznWsanyagEXFdJqTQitVWXqdjUUTjDzkMw9mI8zzFytaavU6igqmo/8fm
	9r2pQev44A7MRZvvjF/o1wqd9RXS+VPzHq8daSOZngcgLsq0UwarTa/k20qTGwksiPcYlYwnJTzQi
	kNFAYdKA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uPhq0-0000000DNJI-0h6O;
	Thu, 12 Jun 2025 13:19:24 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uPfyM-0000000D7rh-1Ruw
	for ath11k@lists.infradead.org;
	Thu, 12 Jun 2025 11:19:55 +0000
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 55C8fJ1O014570
	for <ath11k@lists.infradead.org>; Thu, 12 Jun 2025 11:19:52 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	7QIskp7CeaFU7u4UNInC1v8TRYXWF8xfW2XMu+8r6y8=; b=PGv+2B6filVfzlnw
	qFQC+g29GIxUfp6kN3eTp6J5fHn7JpE2t9AQOpqzwhmTe4fxaw5XQmtP0neba6Y0
	CQ9ZYkfEjH9uv/hc9IsWVgVAjCWCcfoyS3QrF3V4jCxYJDCI9TrTCfUpS0PXKh+f
	wRLLgBxL6kTUum7niuaBsRmFG3sJJk/Wv5VFZOpyhIo9evTAMXoPs0o0/QFF2rW6
	osOusL0EVJ/xfpFvFwUuE2SJSRcRXgEQ8dOl/RfLYka11gvudS5mP3a6si+HbDAE
	JwWQBNI2kzMFi/1mwakoYz3QB4iI+A6sDSfCwR1zQep/g/3deOSxL0EdVx1jAAAq
	rDUBWQ==
Received: from mail-pg1-f198.google.com (mail-pg1-f198.google.com [209.85.215.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 476fmnfx10-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <ath11k@lists.infradead.org>; Thu, 12 Jun 2025 11:19:52 +0000 (GMT)
Received: by mail-pg1-f198.google.com with SMTP id 41be03b00d2f7-b115383fcecso513217a12.1
        for <ath11k@lists.infradead.org>; Thu, 12 Jun 2025 04:19:52 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749727191; x=1750331991;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=7QIskp7CeaFU7u4UNInC1v8TRYXWF8xfW2XMu+8r6y8=;
        b=oma7Qe2ILuQnISdL7N5NXiTngVuKGsm7ovkec2aB7G0JHB692LfNVkWPeMGD8XkYXY
         uq9ACIAapOBGznXRMUXDUgt+szo3t2W7yiRcyLDqowDMjMtVCQoMO6jAHlf4bzGXFhch
         owPiuCvCjc5NAt+DOeNFE93MKsgQqGr3pcx8D/WpKoWRYNUzg1BmTKx2dMTQ75wAu3vG
         UtWVql3VAgfA4Ruat3aDGo3TKCABL2vXrh1hg6pNjegrFx6GdPZua5P98JcfmZDugxkO
         FdlmAhbWbToA4M9Wnz6cBhiwYvh9NlCp2nwze+G306CNFb4NpBVq6jzG7ujHsTWCRI0f
         ssaQ==
X-Gm-Message-State: AOJu0Yx3IViHbVwZFUNIVHAaSVAvUahdRxSFxcg75d9wEM+QtBm/Vaib
	Kb6CS6RLEu+Yg2zNz2nqteoJyTtYciRX7qCmTV3f1Z4SWJHS2tgi/qMDrTikFVR+a7cPZBh0kNK
	jmwcahGaIeEWGPFO6ji1oo+hP2Z1zhw7BWt6t65YXgoRa6++B/KGfVAKLGS6okxc1
X-Gm-Gg: ASbGncv8Gb70P/pzuA92vn2LdMoYu/zLnf/iRWajr8a2UZnVshmxI8Lb7ZuKt+1npL/
	wy90gQPNY2KU0UaMew+N9mh2PIzCXwLHXiiml/BChHOezyUNoUDEk81O59kONeXBef12kpjtQd6
	NwyS/5XbCcs3RBDBjiBP2ECcUHvG3/ibx6mmQfbyI0Ww7KHJ+8rWprCPD/eZrdF2EcxJRwdtum+
	ifkNSYhXIApfSA9WOciZD+MXzrPFc35ROooV1SL7FBrfH5yFJX9WBBvm7cYvuFQc8eNAwuDiZeB
	dZZ7Q+dQArhA6c81nstH5rMfbNHsk+S7fO0e/RIHexRKblPhnS/EybP+Eu8ZdfWi
X-Received: by 2002:a05:6a21:1519:b0:216:1fc7:5d51 with SMTP id adf61e73a8af0-21f86747eecmr11545651637.37.1749727191398;
        Thu, 12 Jun 2025 04:19:51 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEymZNRL34fw7cMWDROMev8RqOV8BO00M024ki/BJ4JwmO6XOC+uwIudz/uK7cTSGz1z7G5uw==
X-Received: by 2002:a05:6a21:1519:b0:216:1fc7:5d51 with SMTP id adf61e73a8af0-21f86747eecmr11545609637.37.1749727190903;
        Thu, 12 Jun 2025 04:19:50 -0700 (PDT)
Received: from [10.152.204.0] ([202.46.23.19])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-7488087aa4csm1198848b3a.8.2025.06.12.04.19.48
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 12 Jun 2025 04:19:50 -0700 (PDT)
Message-ID: <ec974dc0-962b-f611-7bbb-c07a3872f70f@oss.qualcomm.com>
Date: Thu, 12 Jun 2025 16:49:47 +0530
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
Subject: Re: [PATCH] wifi: ath11k: support fetching mac address from nvmem
Content-Language: en-US
To: george.moussalem@outlook.com, Jeff Johnson <jjohnson@kernel.org>
Cc: ath11k@lists.infradead.org, linux-wireless@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20250324-ath11k-nvmem-v1-1-d82bdf72820e@outlook.com>
From: Vasanthakumar Thiagarajan <vasanthakumar.thiagarajan@oss.qualcomm.com>
In-Reply-To: <20250324-ath11k-nvmem-v1-1-d82bdf72820e@outlook.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: eZdVStYf6qnPBL67EU16ViPve1zpfngq
X-Proofpoint-GUID: eZdVStYf6qnPBL67EU16ViPve1zpfngq
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNjEyMDA4NyBTYWx0ZWRfXynvFA4ods0qO
 aJ7/umbOiicyELIN8xrHYfNJiAgyY659ji6jozUOms6H11GklXj6w/oz6/eR+GE/UcrGQPLRzSx
 uh36VsLWM+jxiwIVCh9/WtxdqUXH7XeCIINrmsWJZaSBhAhMoigDdgJY4d5dxi5u92Ekhr8Y6Za
 gbxyNj0gvLEXi+PqJD+ZjczxXfFUUkSzHyHGgmineKO1WdqxugmW9W13kHwzzNay6mSePXPZWFt
 aRPUoBHMjcV1m9XFQ9T6P0SSU1mdXlMVOzbsJLJmoHMlFnQd3KFvjvB58lBLOt29hbXpP0jCbSx
 nIiFCosU0NVf7e3lWdin82X/Z9JldNPLF1YqJkRKl8eRhwJiB2nl4ZUtDEvjDghlxdeWF01rm8/
 0W/pbFhJbfW4rt86mu1M8onYBFH/tB/9EcXI98WPCy/8IgqjNzl1yXTrejAbTIq7j1FKJhqo
X-Authority-Analysis: v=2.4 cv=K8wiHzWI c=1 sm=1 tr=0 ts=684ab7d8 cx=c_pps
 a=Qgeoaf8Lrialg5Z894R3/Q==:117 a=j4ogTh8yFefVWWEFDRgCtg==:17
 a=IkcTkHD0fZMA:10 a=6IFa9wvqVegA:10 a=UqCG9HQmAAAA:8 a=wwL4Hbxs1AlHKMMt3U0A:9
 a=QEXdDO2ut3YA:10 a=x9snwWr2DeNwDh03kgHS:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-06-12_07,2025-06-10_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 mlxscore=0 mlxlogscore=971 phishscore=0 lowpriorityscore=0
 malwarescore=0 adultscore=0 bulkscore=0 spamscore=0 impostorscore=0
 priorityscore=1501 suspectscore=0 classifier=spam authscore=0 authtc=n/a
 authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2505280000 definitions=main-2506120087
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250612_041954_394261_5ACE3AD2 
X-CRM114-Status: GOOD (  20.12  )
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



On 3/24/2025 11:54 AM, George Moussalem via B4 Relay wrote:
> From: George Moussalem <george.moussalem@outlook.com>
> 
> Many embedded devices with ath11k wifi chips store their mac address in
> nvmem partitions. Currently, the ath11k driver supports getting the
> mac address from the 'mac-address', 'local-mac-address', and 'address'
> device tree properties only. As such, add support for obtaining the mac
> address from nvmem if defined in a 'mac-address' cell by replacing the
> call to device_get_mac_address by of_get_mac_address which does exactly
> the same as the former but tries to get it from nvmem if it is not set
> by above mentioned DT properties,

May be not exactly, this also moves from a generic API to DT specific API that
might impact systems which dont have device tree (x86)?

> 
> Tested-on: IPQ5018, QCN6122, and QCN9074

You may want to follow the existing Tested-on style.

> 
> Signed-off-by: George Moussalem <george.moussalem@outlook.com>
> ---
>   drivers/net/wireless/ath/ath11k/mac.c | 3 ++-
>   1 file changed, 2 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/net/wireless/ath/ath11k/mac.c b/drivers/net/wireless/ath/ath11k/mac.c
> index 97816916abac..49af6b9fc867 100644
> --- a/drivers/net/wireless/ath/ath11k/mac.c
> +++ b/drivers/net/wireless/ath/ath11k/mac.c
> @@ -9,6 +9,7 @@
>   #include <linux/etherdevice.h>
>   #include <linux/bitfield.h>
>   #include <linux/inetdevice.h>
> +#include <linux/of_net.h>
>   #include <net/if_inet6.h>
>   #include <net/ipv6.h>
>   
> @@ -10379,7 +10380,7 @@ int ath11k_mac_register(struct ath11k_base *ab)
>   	if (ret)
>   		return ret;
>   
> -	device_get_mac_address(ab->dev, mac_addr);
> +	of_get_mac_address(ab->dev->of_node, mac_addr);

May be call of_get_mac_address_nvmem() when device_get_mac_address() fails?

Vasanth

