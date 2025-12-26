Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8BB85E8FDA5
	for <ath11k@archiver.kernel.org>; Fri, 26 Dec 2025 09:06:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=44zC/0IU6tJiVfDndTbTKY6GsLDZTSddBLOvUA0fMCM=; b=yDy1396VEA2E7Qr8WuInjWtF5V
	38tUWq5qw0fLWedw9QuJ3nT1LZS5/w5lSjIgMvB48I4M6Y0t3fvulwM817gz8OP6BBLmlKW58r9vP
	uaK/7Ahokpv4AZd6YmYJ7EI/280OGYzU7a2NLeCX8bifQ7mR24x9/ZMAiCRxndYP2VngQVhhKP5r/
	CV/n1V6idOpzxvJoxwuzZ/nhnhxFF5rs/4mrG4mvI9R41BarUHYWcMRXaMeOXypoHCwaT5gHRLi+G
	RbK8gYwpUsRW3MixJmiau1h//Aca4YSwAm2GnZC5YO2+5fzNqRbvjjY/t/n0O8xb4DuAg+LVBzLOs
	juZpvbrQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vZ3lm-000000013pZ-3nEi;
	Fri, 26 Dec 2025 09:05:58 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vZ3lj-000000013pC-3hC7
	for ath11k@lists.infradead.org;
	Fri, 26 Dec 2025 09:05:57 +0000
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5BQ8bhFj1281031
	for <ath11k@lists.infradead.org>; Fri, 26 Dec 2025 09:05:54 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	44zC/0IU6tJiVfDndTbTKY6GsLDZTSddBLOvUA0fMCM=; b=cB80F/xhrrGwXauU
	3D+MJmV5gusSJHbgvhXdfo+Kcn14KLoN3Nz/U4oGOMXRifjws3zGbDYVRY05MUet
	ZkLrjqAzSjeqmV3jKwkW82nGtBunbO/WU0p+WW+MQK+KUR6Gsy5UeFeY+qudaZkc
	9mIbVodBunSUgiPzhewYN0iS2YyQYQfiVYPTCvgTHfgN4H449XWm40/tAczC6fbB
	/mynfFye9yfpND5yKLRibZBfyX5cad44L68EcF0WNAiZdpJwtAZsfLG8vo7u60q7
	XFLJFL1rnpKa1BDHi61lSAxBck5jt5Pjn7Z4h8nnP+7afPgMN6742QIYM/fpAIJN
	ky+0Tw==
Received: from mail-pj1-f72.google.com (mail-pj1-f72.google.com [209.85.216.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4b8p4937u5-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <ath11k@lists.infradead.org>; Fri, 26 Dec 2025 09:05:54 +0000 (GMT)
Received: by mail-pj1-f72.google.com with SMTP id 98e67ed59e1d1-34aa6655510so9329280a91.1
        for <ath11k@lists.infradead.org>; Fri, 26 Dec 2025 01:05:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1766739953; x=1767344753; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=44zC/0IU6tJiVfDndTbTKY6GsLDZTSddBLOvUA0fMCM=;
        b=Sf9kCfxrUnASvcoZ8Qi6KD+HGDF5EYko74BFiQJBHQt5lh9puxBZxT/uXHfiukyWsQ
         6TWPKt/joMZWbdedsTBfXc+KJKiiUxlRQ82AhxzGN2Ft5bwFj+SVBJBIifaRnTixRlFY
         LN4gEYIQeW3v04xytHi+VbhUMJZiugihzM1SQcITzodr4GO8N2fHn0P7CsC4NkiFUPLK
         egsPBYrjhFhLdVmgRcLXfWKytWaVza1W6UsIjdgec55J29hZ6oqeQc+VDpyMzPOesXdV
         IIQqgqqLJ1TKA8XW2zHCDDcq+SR7eURs7v+IS9ABMEcEOnrxmKGKgHOo5dFfg2slBf7X
         Ul4g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1766739953; x=1767344753;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=44zC/0IU6tJiVfDndTbTKY6GsLDZTSddBLOvUA0fMCM=;
        b=sGPKBajBLgVeaIeBIDKeQwSxpc4jS9h4qCk9aNdSkM1TzTBl7szFhvUHtwIAOofqXa
         L18jtQlNoOUJWfGIPzTIi49TjejmTwxzkE5IDrPxkO9V8cPdUOR0oyHrU4rWTeI9UlO2
         U9yAwyR0jbVXFba2/+Lnm9XdrfrT4aWYHPfXumCOsrKxULApryadLIMzg8SllqZrs9nb
         M1FL+kJbCP7hgIGk8dQq2pnrLKH28xiFY30nORL4tGWoj6bLrc8Too80IuzOsm3NYFQM
         3uyyKiiQGVR4fXUtc2K6+VNSBC+JIiyZTmcHmvwtdUDalGoxZ9pdiaCO8rAlWIsVAmGo
         DWPQ==
X-Forwarded-Encrypted: i=1; AJvYcCWQZA1u0Go7+7zVJjmUfpUvOPypvdtnlLcpqdDVOYimL8Wjx76FMi4p8d3KMH6g4iMZhSgCg4I=@lists.infradead.org
X-Gm-Message-State: AOJu0Yz4RQ9HTYZ11fHS9jYTbkVFPN7/5L8fzD0+61r9iqKfm7hULGhK
	/X0r2SbV2yfnJ31bYwrtGzFdDwNHbSAiGGfpW1A5scfa53iOGHtSZGElwuHXBWmH5hFb1OvS80n
	3iZF9S/Tzhu0Q/cPQKVzoeghpPJDjoczrJevL+6VccydFBjZT6AAfcyYkdkvP0ctXiud1q2qh
X-Gm-Gg: AY/fxX6xaH8yzF9kWry209qZ/rzDkxaxKIju/z+gJotgEXKzhjmR7HrNNW9Bo4lBwBy
	LDBgMc8cM+aUvVyMaaG1mo9iDvsEg5wm6N8Qejx6gRgYbKrHBSJ5M0Qw1FfnHswsTuhma7UdS7L
	BK3/oX6KHNzIh6sxXbP4W7Qn92cOjoGYZ7EpUCQC4T/gpB0hMmiP6vPu0+eharswusU86L/oq6B
	NRQ3mdFl/chm44V6B+AMKUVHyPFTS1PEKRgcAK59gu2bikUEBzfJa6J65W04XggDjlnMv6FoAbf
	WcTnKNUBzzQBDI9shkRwiyqDg/LIJJd09OxPdurGIYX9jeq7dMKzE3I29/Aj60TXE7uRRgVUPzp
	jixUOVJPIKOPUh3dEFSXWw9CZP0q/9czHy6JrQX8RdCQBI7d2ygV6m5TCmiZdCnFT7kBAIk61Qb
	gAM+hIiA==
X-Received: by 2002:a05:6a20:7284:b0:35e:6c3:c8d0 with SMTP id adf61e73a8af0-376a9ccba8emr21727988637.54.1766739952696;
        Fri, 26 Dec 2025 01:05:52 -0800 (PST)
X-Google-Smtp-Source: AGHT+IFYaMgX6xd5Gu3g0iB/rL6TWA6PLp1CSauZjVw7DX8caTOMAUvBqW9++G8pXWqTt+QFVS78aA==
X-Received: by 2002:a05:6a20:7284:b0:35e:6c3:c8d0 with SMTP id adf61e73a8af0-376a9ccba8emr21727962637.54.1766739952132;
        Fri, 26 Dec 2025 01:05:52 -0800 (PST)
Received: from [10.133.33.27] (tpe-colo-wan-fw-bordernet.qualcomm.com. [103.229.16.4])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-c1e79a13f95sm18386314a12.9.2025.12.26.01.05.50
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 26 Dec 2025 01:05:51 -0800 (PST)
Message-ID: <90fe1a15-9e22-468f-a1b8-3550212b78a7@oss.qualcomm.com>
Date: Fri, 26 Dec 2025 17:05:46 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH ath-next v4 0/6] wifi: ath11k: Add single shot/periodic
 CFR capture support
To: Qian Zhang <qian.zhang@oss.qualcomm.com>, ath11k@lists.infradead.org
Cc: linux-wireless@vger.kernel.org, Yu Zhang <yu.zhang@oss.qualcomm.com>
References: <20251223092728.1950017-1-qian.zhang@oss.qualcomm.com>
From: Baochen Qiang <baochen.qiang@oss.qualcomm.com>
Content-Language: en-US
In-Reply-To: <20251223092728.1950017-1-qian.zhang@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: TmkrkscLpiKAWFacP5qpW7sp_3u3icuN
X-Authority-Analysis: v=2.4 cv=esbSD4pX c=1 sm=1 tr=0 ts=694e4ff2 cx=c_pps
 a=RP+M6JBNLl+fLTcSJhASfg==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=IkcTkHD0fZMA:10 a=wP3pNCr1ah4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=VwQbUJbxAAAA:8 a=COk6AnOGAAAA:8 a=EUspDBNiAAAA:8
 a=W4cqpq0YkI6qXs7jkP8A:9 a=QEXdDO2ut3YA:10 a=iS9zxrgQBfv6-_F4QbHw:22
 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMjI2MDA4NCBTYWx0ZWRfX+hRZuKt9lsTz
 3B8FVdhDwp5IZQaHukjCmoimQ98EF0uXLfib8D1fIqyTyGUlNXy6Wl1ElmQUTEwldpWMHOE64CQ
 WBm2sIgt6g0VqVR88q87jKWnK7jFnrVpLZ5ZczWksCDX8Lx4Pn8GCzKsCiQ/EQ0PCcpYMt91js3
 H3kMjOWNyOa9CkDm/1ttl0DmMR0vQcJBTcx1tisWzhC0PKAAKKRgeGyTs9ffzVdl5HQe5KGS7HC
 O6a5jVLU8ZSMfBwGF8o8iXqZDJxZP9vFgJtNErrTUCsgQPrVXe8S3VXIBnh3rcnQIWm37Cd99PH
 meijpS6r0X5qmzfKcnqtpkWK8oBCCgXqhOPZMRa/G/k8WrTPOJ4VKTMVtF5A5UV2tTBeFGi6TZN
 BrS337DeenwmPaK/ZxznNic7p04NkthnD7PGdwJNpK/KupGZdYebJdMKXyqdIyYagkMqqQ7yKjL
 +hlTZ7xrJUvU0HMHvTQ==
X-Proofpoint-GUID: TmkrkscLpiKAWFacP5qpW7sp_3u3icuN
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-12-26_03,2025-12-26_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 spamscore=0 bulkscore=0 impostorscore=0 adultscore=0
 malwarescore=0 clxscore=1015 suspectscore=0 priorityscore=1501 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2512120000 definitions=main-2512260084
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251226_010556_137597_5EE085A6 
X-CRM114-Status: GOOD (  14.71  )
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



On 12/23/2025 5:27 PM, Qian Zhang wrote:
> To enable/disable cfr feature use command,
> 
> echo <val> > /sys/kernel/debug/ieee80211/phyX/ath11k/enable_cfr
> 
> where, val: 0 to disable CFR and 1 to enable CFR.
> 
> To enable CFR capture for associated peers,
> 
> echo "<val> <bw> <periodicity> <method>"
>  >
> /sys/kernel/debug/ieee80211/phyX/netdev\:wlanx/stations/<mac>/cfr_capture
> 
> val: 0 - stop CFR capture
>      1 - start CFR capture
> bw: CFR capture bandwidth
>      0 - 20MHZ
>      1 - 40MHZ
>      2 - 80MHZ
> Periodicity: Periodicity at which hardware is expceted to collect CFR
> dump.
>      0 - single shot capture.
>      non zero - for Periodic captures (value should be multiple of 10
> ms)
> method: Method used by hardware to collect the CFR dump.
>      0 - from the ACKs of QOS NULL packets.
> 
> To enable CFR capture for unassociated clients,
> 
> echo "<mac address> <val> <periodicity>"
>  > /sys/kernel/debug/ieee80211/phyX/ath11k/cfr_unassoc
> 
> Mac address: mac address of the client.
> Val: 0 - start CFR capture
>      1 - stop CFR capture
> Periodicity: Periodicity at which hardware is expceted to collect CFR
> dump.
>      0 - single shot capture.
>      non zero - for Periodic captures (value should be multiple of 10
> ms)
> 
> To collect the cfr dump,
> cat /sys/kernel/debug/ieee80211/phy0/ath11k/cfr_capture0 > /tmp/cfr.bin
> 
> Previous link:
> https://lore.kernel.org/all/1645005922-7252-1-git-send-email-quic_vnaralas@quicinc.com/
> 
> Signed-off-by: Yu Zhang(Yuriy) <yu.zhang@oss.qualcomm.com>
> Signed-off-by: Qian Zhang <qian.zhang@oss.qualcomm.com>
> 
> ---
> Changes in v4:
>  - Update patch 2/6

Details of changes is needed! General description like 'update' here does not help
understand the diff compared with your last revision.

> Changes in v3:
>  - Update related comments.
> Changes in v2:
>  - Update related comments.
> ---
> 
> Venkateswara Naralasetty (6):

The author in each individual patch is 'Qian Zhang <qian.zhang@oss.qualcomm.com>', please
check them.

>   wifi: ath11k: Add initialization and deinitialization sequence for CFR
>     module
>   wifi: ath11k: Register debugfs for CFR configuration
>   wifi: ath11k: Add support unassociated client CFR
>   wifi: ath11k: Register relayfs entries for CFR dump
>   wifi: ath11k: Register DBR event handler for CFR data
>   wifi: ath11k: Register handler for CFR capture event
> 
>  drivers/net/wireless/ath/ath11k/Kconfig       |   11 +
>  drivers/net/wireless/ath/ath11k/Makefile      |    1 +
>  drivers/net/wireless/ath/ath11k/cfr.c         | 1007 +++++++++++++++++
>  drivers/net/wireless/ath/ath11k/cfr.h         |  302 +++++
>  drivers/net/wireless/ath/ath11k/core.c        |   41 +-
>  drivers/net/wireless/ath/ath11k/core.h        |   19 +-
>  drivers/net/wireless/ath/ath11k/dbring.c      |   50 +-
>  drivers/net/wireless/ath/ath11k/dbring.h      |    8 +-
>  drivers/net/wireless/ath/ath11k/debug.h       |    8 +-
>  drivers/net/wireless/ath/ath11k/debugfs_sta.c |  142 ++-
>  drivers/net/wireless/ath/ath11k/hal.c         |    3 +-
>  drivers/net/wireless/ath/ath11k/hw.h          |    5 +-
>  drivers/net/wireless/ath/ath11k/mac.c         |   17 +-
>  drivers/net/wireless/ath/ath11k/wmi.c         |  147 ++-
>  drivers/net/wireless/ath/ath11k/wmi.h         |   97 +-
>  15 files changed, 1832 insertions(+), 26 deletions(-)
>  create mode 100644 drivers/net/wireless/ath/ath11k/cfr.c
>  create mode 100644 drivers/net/wireless/ath/ath11k/cfr.h
> 
> 
> base-commit: 25f833fff81de4fbb9b5382806860b63768567e8


