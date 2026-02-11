Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5D272ECD6E6
	for <ath11k@archiver.kernel.org>; Wed, 11 Feb 2026 19:34:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=O0qUu0rQFYpIca8hjxo2OnzNf5MP5k8P5QUnQDN+f98=; b=hJ2cOYwOxOfYi6LF0tKsA6RIaa
	l8rQjBCpCP3jpBhSeX/zTlsyzRYOgqZvV1JDZnQquEjAQij8eQjj+RRRpGbb3VLhX/Az52pVWgUNx
	YcO/jiRTRZHYUneawHV4t0wIwXJDy8aymAqUVbOiDMoXltjcRr7BHxYhUnxBl7mzauiMCvWtXKSdq
	ODSyWOPKw6UWzaMxkwJy/jH21hqVo8FOFN7VwBxM/3MC29jSZQnMX8IKD254y9FDDK7e/3q1Z6nfP
	E7e7T2f+DwOdWc9GoqVyp+Yw4iwjwBz2+h3W3iiT6voR/LVq4N9/qMAN9Pr1e/QauCEoVs/IzLKk8
	3fc2voGg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vqFyU-00000000zCD-2k2p;
	Wed, 11 Feb 2026 19:34:10 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vqFyR-00000000z9v-02U4
	for ath11k@lists.infradead.org;
	Wed, 11 Feb 2026 19:34:08 +0000
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 61BH3fNn3320981
	for <ath11k@lists.infradead.org>; Wed, 11 Feb 2026 19:34:06 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=O0qUu0rQFYpIca8hjxo2OnzN
	f5MP5k8P5QUnQDN+f98=; b=pWHF2dwL9T3WXw+3gHc6izwteIRab2dE96jpxSn+
	5nnDz6UTf1C1/+stnIHzeDirOmqs6WlVIO2239f11Xhm8bsiU1nomvsLAxfI0ivB
	yo0oKRg/cYD51SF70chjkNU321PD/40VowTQ/ewNQ/a5ckJ5iyj1D3S3DssAYD51
	5GClnchka1qWkvvioEkQT0D2Nqb8po+5AKwG1VgYrowtXO/WMyAMmi19oQzSTJoB
	ttm9h3CwPHVUTJ3XV0wtfEWGwsga2G54SjXCmPANiYaXDkLiDMgrlt0J3KkiKU1A
	/nvySg/QqIhReEhY66/YctKicxy8QmbYo1S1WytuGdU7VQ==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4c8epskdtj-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <ath11k@lists.infradead.org>; Wed, 11 Feb 2026 19:34:05 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-8c70a62ca32so785954085a.2
        for <ath11k@lists.infradead.org>; Wed, 11 Feb 2026 11:34:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1770838445; x=1771443245; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=O0qUu0rQFYpIca8hjxo2OnzNf5MP5k8P5QUnQDN+f98=;
        b=VE3ght5j1gdVcTBb2+HGPaF/Q7hp3v5dH4mtLgzJA91/70DFHmYiGw+UuKVtI1RZMx
         lfTVfnWSk/Iv54YAdaKcQugGtC7hiz0R2hRLB8ltYiumDvwiEgQN5RkVMZDgTWckfsoB
         UasbTqKOaV/Xhw2oYRyMXS9P3shkE4ctWNMkCiEIMbpYtZbOg2paQKTRVkdhSdXLxVwA
         2hajNZrWeG1PZZ5CqH2p0WLk3XEZi8neJRqNcZI/lOJ9YHM8R6UQ5ROkudV7Kxf7hxt6
         9qmDfXG8yBnzZrzyAjAKUkxI9zi43EQxYmLsqAFKIaEgL4Gr/FhC9F/XPylQIo63Ksut
         D4Zw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770838445; x=1771443245;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=O0qUu0rQFYpIca8hjxo2OnzNf5MP5k8P5QUnQDN+f98=;
        b=OCSXT2M+kgbj/Mi23CG/S/z8xlFMvChloWG+Iru6UDLeBYn9ZSGz2kPvxkgGjXbPNP
         nO8N/MB/AXUUB8rzibHlteUvXFlMhd3zpO0gWoy1kYPtFIFpcPaOs7NO/5TBV/A4NizT
         xkcPKvE351KiiAp0QucgYs9qaoYjK7EwBXEK3MvGgfwEXU9kyS8eHGdsRC4Vt+wa3cYR
         Z8d0SSAvJO2bznX03XTZ4fcA7s00C18ItIMuLGfEilX0RTMoXvxvG5IvU2PFd5XwEhYZ
         szJLvPU3IKdXLEE89jC5DaEyHeLGUNP5IZ+92QY6jNowKCzro/raeEywnxLdzQL4kCfP
         xeQQ==
X-Forwarded-Encrypted: i=1; AJvYcCXjK61J3X5e16kXwXESxRF0xT/euQVmToUEToY9ZHLiFEXPwkryIsTbizRv+Vnr7QVkLFi674U=@lists.infradead.org
X-Gm-Message-State: AOJu0YxCrA0unXfbjF60pekhyztcsPOUlKbWmVKtju0eB9NoKx1Qm5Bk
	nnL4WtickWfizjnC72/QK2ABldTjTBiR/2Y9CGKUgkDHA2uYJA+uPHvNZWCOShhHrfuVOIsvTw8
	KCtDHtqS4jgaZRiN3qeNgnxXPJKVGbE/9LKt0cQOXzr0nRISuk9F7U6eVS7eM0i+v
X-Gm-Gg: AZuq6aKVlYYE+xV8X+uWVEfzaeIUpznF5wM6uryVHByVm5xSWxE45NdLpnAhirr9sOC
	eiqNjfjoiQPBRNhZzse8VYYopbRkTVk5/LfiZyt6LTvdsX/Ob4tvo9f8cYCq45oPuwy15zHFmGz
	PfRHFmzhjopwxOKJJD2nuJdiBnW2bq221poJYZE7J2afB0Oh//gki6tPTYPIuC+3wW4I/34RzVo
	mMZleHAQXoBRWtViovSZRth7R8bvbBHPFbIZBImtE1udBgRDfQh6lD4KJbhaNlyKY2RIVLFNg5v
	2hjv+1vOaJEF9k4PzenMQ+KtnySl0RR8g+2ZcFFiiMdIttN5Nt0yE7/uE5BhDybmC2CBaaxFB5C
	fdlaLj4fsPV2oJU+m5HrhNtEiNTkFQRw+RZ8ps/U1vZZrsvAdC+bvnWOd6zbn4pk/YrE9Egg7D+
	Oe8qzXg9WtQagwJiHQOcIL5kXyIVg7XTLgOU8=
X-Received: by 2002:a05:620a:462a:b0:8b2:f29e:3af8 with SMTP id af79cd13be357-8cb33143bd0mr47628285a.59.1770838445290;
        Wed, 11 Feb 2026 11:34:05 -0800 (PST)
X-Received: by 2002:a05:620a:462a:b0:8b2:f29e:3af8 with SMTP id af79cd13be357-8cb33143bd0mr47624885a.59.1770838444817;
        Wed, 11 Feb 2026 11:34:04 -0800 (PST)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-387068e5850sm4021381fa.26.2026.02.11.11.34.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 11 Feb 2026 11:34:02 -0800 (PST)
Date: Wed, 11 Feb 2026 21:34:01 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Jeff Johnson <jeff.johnson@oss.qualcomm.com>
Cc: linux-firmware@kernel.org, linux-wireless@vger.kernel.org,
        ath10k@lists.infradead.org, ath11k@lists.infradead.org,
        ath12k@lists.infradead.org, jjohnson@kernel.org
Subject: Re: [PULL linux-firmware] ath10k, ath11k and ath12k firmware
 ath-20260211
Message-ID: <2ujc447cdished2n24epmrkp7pxepo6kcpgctdqk4whgjkwne7@l6r24pzjewqr>
References: <61ec2d75-38ec-4ee4-b447-3fbb723f59bc@oss.qualcomm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <61ec2d75-38ec-4ee4-b447-3fbb723f59bc@oss.qualcomm.com>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMjExMDE1MSBTYWx0ZWRfX7wgr1jVrC6Eq
 +n/NZOkkI0GYDE4kJuAScPlTC46QUKGpZcN4ZnnGjt+5tiugFAdprF4/cWnpVzpnI10WxdVG/uV
 1y7g+HBVaXRq3cXxs8KbK6fozq6MAsrv1dgIoX/a/P5GSfkUx20QI6k+pGr+0Go2aBxkWSJGraV
 yRuUn+YwtkbCQEWzJIPsixS5DMUntbUEcAMZRBet/7J3fxmQc+rFFmGr+prvK+WyHNatnejWusq
 bIFupuaKme3Nn49V1sCU4nrgvHJuCIYivIlGzDCajX6D5ZnkD1ZhLosi9GrTk44pbm2ye07zcfZ
 OHijT7TQE+EzxtTiBvdldvig8QKPkE0FhYjBL+NDCnfH4ZkhjXZapjDMdgwW+xBl5gvOM/H2R+Y
 qV/f2+cRsz7kXJEbYqBGax1KF8qRsUppjjHy+yG16wakVDTkKkfFjAfZLkZCjfNEf6rF8L9sGHW
 2Tn5JyGiK4dpz5dXLmg==
X-Proofpoint-ORIG-GUID: 9V5ywO0j3DY3qb47tFqEVYweX3btv16p
X-Proofpoint-GUID: 9V5ywO0j3DY3qb47tFqEVYweX3btv16p
X-Authority-Analysis: v=2.4 cv=I/Vohdgg c=1 sm=1 tr=0 ts=698cd9ad cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=HzLeVaNsDn8A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=Mpw57Om8IfrbqaoTuvik:22 a=GgsMoib0sEa3-_RKJdDe:22 a=p0WdMEafAAAA:8
 a=VwQbUJbxAAAA:8 a=0afWX6N_0y5Ye8V-RdwA:9 a=CjuIK1q_8ugA:10
 a=NFOGd7dJGGMPyQGDc5-O:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-02-11_02,2026-02-11_04,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 impostorscore=0 suspectscore=0 priorityscore=1501 bulkscore=0
 malwarescore=0 spamscore=0 lowpriorityscore=0 phishscore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2601150000 definitions=main-2602110151
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260211_113407_165911_46A914C6 
X-CRM114-Status: GOOD (  19.67  )
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

On Wed, Feb 11, 2026 at 09:50:15AM -0800, Jeff Johnson wrote:
> The following changes since commit d87f4693ed96d0f3f6f16b0f09be42f3b8acb9e0:
> 
>   Merge branch 'robot/pr-0-1770665774' into 'main' (2026-02-09 20:06:30 +0000)
> 
> are available in the Git repository at:
> 
>   git://git.kernel.org/pub/scm/linux/kernel/git/ath/linux-firmware.git ath-20260211
> 
> for you to fetch changes up to cbd0f9753754fd9605df129ff04b0c4b4fc82568:
> 
>   ath11k: WCN6855 hw2.0: update board-2.bin (2026-02-11 09:33:04 -0800)

Thanks, merged and pushed out:

https://gitlab.com/kernel-firmware/linux-firmware/-/merge_requests/916

> 
> ----------------------------------------------------------------
> Hi,
> Here's a new pull request for ath10k, ath11k and ath12k.
> 
> No updates for ath10k or ath12k
> 
> For ath11k:
> 
> Update board file for QCA6390 hw2.0 to support:
> bus=pci,qmi-chip-id=0,qmi-board-id=255,variant=Xiaomi_Pad_5Pro_5G
> 
> Update board file for WCN6855 hw2.0/hw2.1 to support:
> bus=pci,vendor=17cb,device=1103,subsystem-vendor=17cb,subsystem-device=0108,qmi-chip-id=2,qmi-board-id=255,variant=HW_GK3
> bus=pci,vendor=17cb,device=1103,subsystem-vendor=17cb,subsystem-device=0108,qmi-chip-id=18,qmi-board-id=255,variant=NTM_TW220
> 
> Please let me know if there are any problems.
> 
> Thanks,
> /jeff
> 
> ----------------------------------------------------------------
> Jeff Johnson (2):
>       ath11k: QCA6390 hw2.0: update board-2.bin
>       ath11k: WCN6855 hw2.0: update board-2.bin
> 
>  ath11k/QCA6390/hw2.0/board-2.bin | Bin 173980 -> 231980 bytes
>  ath11k/WCN6855/hw2.0/board-2.bin | Bin 7117076 -> 7237392 bytes
>  2 files changed, 0 insertions(+), 0 deletions(-)

-- 
With best wishes
Dmitry

