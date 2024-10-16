Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E9EA9D20688
	for <ath11k@archiver.kernel.org>; Wed, 16 Oct 2024 01:45:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:CC:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=6eB3P0RUzugGcgI9oeHPWddAzZ0JTq97gXXPmH3Mkdk=; b=yk8Q64Q+EveDnE2y926RsVZii7
	iRymOCD+S3V+aZUuXX04HkWX1et1EjH7uSF/H+Tzc4xIuxKEysYbqncGuR4z6brFi+AFrnZuAHrq2
	OpDslBJNpEbvK2Bf1gCgDTi8z1F3D9jiWdLATl8ZFeCcB1yx5Q9BBLp7k8XLLAIFmL79hDjB3MSmR
	+48iUhjHdES/pSqOmKrK5Cals419YY/Va5AbV/pcmEdg1G2CLePfLl1hHjQvliONv21peZZD6CTdx
	9ABtzcxWT8keBY8T3IiQQhQbNyYoez/qkRS/tgw536Nysu2z8Ceb1/dGpSKyXcoDNEzVh0Cyr453M
	/3Lc8mUQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t0t6d-0000000A9vv-2KHw;
	Wed, 16 Oct 2024 01:45:43 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t0t6b-0000000A9vL-0KPo
	for ath11k@lists.infradead.org;
	Wed, 16 Oct 2024 01:45:42 +0000
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 49FHc2tJ007494;
	Wed, 16 Oct 2024 01:45:40 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	6eB3P0RUzugGcgI9oeHPWddAzZ0JTq97gXXPmH3Mkdk=; b=gLmHhN2ZB5YbNC2P
	wObpGGpS1H/RnHEkF8fwEy+NmfLrm5KvKnknemKH0frKevcb/Bz70ohLjkKqvk4t
	1C7UCdtOn9bW2ahjwOXHiwpFtMrNYELwjVXjgFJ3kwgpVpdTDxoumJG/C9FkW9cl
	K23tj1gMErArxv6tFqBtV2p+2g61art5gJYhRo4+K9Wn58XbOROb0CeoWPTav/mU
	Knr8HoTEpvuJer34Vy8MQuVIDO8UC8tcMEE6Vl/tXj2I3PN5xHwVNa7yipvSFBo8
	kkaJ7+xsUl+tQ/oYlGmL1LGBb63yXeog2heWqcO6a7J7ehuB7mLG10wqPWzzQDeL
	EXxmMA==
Received: from nalasppmta03.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 429mh52w9a-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 16 Oct 2024 01:45:39 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA03.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 49G1jcYg004993
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 16 Oct 2024 01:45:38 GMT
Received: from [10.48.241.64] (10.49.16.6) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Tue, 15 Oct
 2024 18:45:38 -0700
Message-ID: <7ca286cc-5ee5-4fa3-af86-05b381dacd58@quicinc.com>
Date: Tue, 15 Oct 2024 18:45:37 -0700
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 2/2] wifi: ath11k: add srng->lock for ath11k_hal_srng_*
 in monitor mode
To: Kang Yang <quic_kangyang@quicinc.com>, <ath11k@lists.infradead.org>
CC: <linux-wireless@vger.kernel.org>
References: <20241008053744.1070-1-quic_kangyang@quicinc.com>
 <20241008053744.1070-3-quic_kangyang@quicinc.com>
From: Jeff Johnson <quic_jjohnson@quicinc.com>
Content-Language: en-US
In-Reply-To: <20241008053744.1070-3-quic_kangyang@quicinc.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.49.16.6]
X-ClientProxiedBy: nalasex01a.na.qualcomm.com (10.47.209.196) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: AObHifDSZCx91g1iyQed4S_bCw_MV9kh
X-Proofpoint-ORIG-GUID: AObHifDSZCx91g1iyQed4S_bCw_MV9kh
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 impostorscore=0 clxscore=1015
 spamscore=0 priorityscore=1501 adultscore=0 mlxlogscore=589
 lowpriorityscore=0 mlxscore=0 phishscore=0 malwarescore=0 suspectscore=0
 bulkscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2409260000 definitions=main-2410160010
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241015_184541_274684_2D6038C1 
X-CRM114-Status: UNSURE (   8.65  )
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

On 10/7/2024 10:37 PM, Kang Yang wrote:
> ath11k_hal_srng_* should be used with srng->lock to protect srng data.
> 
> For ath11k_dp_rx_mon_dest_process() and ath11k_dp_full_mon_process_rx(),
> they use ath11k_hal_srng_* for many times but never call srng->lock.
> 
> So when running (full) monitor mode, warning will occur:
> RIP: 0010:ath11k_hal_srng_dst_peek+0x18/0x30 [ath11k]
> Call Trace:
>  ? ath11k_hal_srng_dst_peek+0x18/0x30 [ath11k]
>  ath11k_dp_rx_process_mon_status+0xc45/0x1190 [ath11k]
>  ? idr_alloc_u32+0x97/0xd0
>  ath11k_dp_rx_process_mon_rings+0x32a/0x550 [ath11k]
>  ath11k_dp_service_srng+0x289/0x5a0 [ath11k]
>  ath11k_pcic_ext_grp_napi_poll+0x30/0xd0 [ath11k]
>  __napi_poll+0x30/0x1f0
>  net_rx_action+0x198/0x320
>  __do_softirq+0xdd/0x319
> 
> So add srng->lock for them to avoid such warnings.
> 
> Tested-on: WCN6855 hw2.0 PCI WLAN.HSP.1.1-03125-QCAHSPSWPL_V1_V2_SILICONZ_LITE-3.6510.30
> Tested-on: QCN9074 hw1.0 PCI WLAN.HK.2.7.0.1-01744-QCAHKSWPL_SILICONZ-1
> 
> Fixes: d5c65159f289 ("ath11k: driver for Qualcomm IEEE 802.11ax devices")
> Signed-off-by: Kang Yang <quic_kangyang@quicinc.com>

Acked-by: Jeff Johnson <quic_jjohnson@quicinc.com>

(note that since this has a locking change Kalle wants to review/approve so
I've assigned this series back to him in patchwork)


