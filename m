Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id ABAF1C02182
	for <ath11k@archiver.kernel.org>; Tue, 21 Jan 2025 08:06:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:CC:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=pxpKycdt7jDHWX7yNXRM9b6Ji6UXb6uxS2e0r6fhCuo=; b=OTr9Gs+uxXqtCxTYQsd4gJYrhh
	QUxFkimpq0KxMmWuixwj6c6Sk0gidT3XCXQYRYPKfF3ZL+d2IVBB8unFPJ4aO67fZPrJMAl41wC4U
	0bwJc9GmKNx7B+XN69Z77RXWElbHdWMsO0HVdFlm0T8hjV/bNoFaNwq1FDX3GaO1rZlBXk+tmC2zc
	95bapjI8BXPop8I9EG2vPqOlj/gpYl4xV/draYqaAde3bAFbvpWU3WDeIA4yxv+svG7C1dzxm7+z/
	SA1csbZ1DOAF6s/gZRWzTP2OqLNcFWP3tQemQez74032Pu/7Ux4lQSRwBvgXB+lMzzh/72mFtqzMw
	KZ4/ZvSg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1ta9HH-00000007CxB-0meU;
	Tue, 21 Jan 2025 08:06:27 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1ta9Bc-00000007CD4-2N8T
	for ath11k@lists.infradead.org;
	Tue, 21 Jan 2025 08:00:37 +0000
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 50L7GK7j027236;
	Tue, 21 Jan 2025 08:00:35 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	pxpKycdt7jDHWX7yNXRM9b6Ji6UXb6uxS2e0r6fhCuo=; b=J21IpahKjR9WgEtw
	QFvKVBZZ8TWL70XfWYOpIs1DRVY9sSPgJe42y4WAnqZIdvLMsEBLvvaBdXVrch8p
	BfjVfOx0NSctzuFjgoFY8X82nNZqfnFJ1Yxiv3MCDyn7g0x3u12CxQn7Ga25cjl1
	ol2hwHlLkPrnLtkeMSULTOb6vRqDANU+MijvzUlI5ll05mXw/PcfGf4Zpy+c/E9c
	bJ+SOYcWNZogPycb+C3swwUtTAV+x4XS3xvnJIH8PxXSwrhh2dTW3kTJjTCS7prH
	tef5KxRL9OV7g6Nf2s1sZPxCtvc+d4T/zCPiOKPsaUSia5Jqdz8an3Xh9VjURSOw
	fz/zvw==
Received: from nalasppmta02.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 44a71nr3bh-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 21 Jan 2025 08:00:35 +0000 (GMT)
Received: from nalasex01b.na.qualcomm.com (nalasex01b.na.qualcomm.com [10.47.209.197])
	by NALASPPMTA02.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 50L80YD5016586
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 21 Jan 2025 08:00:34 GMT
Received: from [10.253.36.159] (10.80.80.8) by nalasex01b.na.qualcomm.com
 (10.47.209.197) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Tue, 21 Jan
 2025 00:00:32 -0800
Message-ID: <12fad7bd-86cd-4c93-8fa2-35ec7b10f5e7@quicinc.com>
Date: Tue, 21 Jan 2025 16:00:29 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 0/2] wifi: ath11k: fix data out of sync for channel
 list for reg update
To: <ath11k@lists.infradead.org>, Jeff Johnson <quic_jjohnson@quicinc.com>,
        Aditya Kumar Singh <quic_adisi@quicinc.com>,
        Vasanthakumar Thiagarajan
	<quic_vthiagar@quicinc.com>
CC: <linux-wireless@vger.kernel.org>
References: <20250117061737.1921-1-quic_kangyang@quicinc.com>
Content-Language: en-US
From: Kang Yang <quic_kangyang@quicinc.com>
In-Reply-To: <20250117061737.1921-1-quic_kangyang@quicinc.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01b.na.qualcomm.com (10.47.209.197)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: EzpMOBbqkz_UmGZec5mUAb-wWhqGXE0a
X-Proofpoint-ORIG-GUID: EzpMOBbqkz_UmGZec5mUAb-wWhqGXE0a
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1057,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-01-21_04,2025-01-21_01,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 bulkscore=0 suspectscore=0
 mlxscore=0 clxscore=1015 phishscore=0 mlxlogscore=999 malwarescore=0
 impostorscore=0 lowpriorityscore=0 spamscore=0 priorityscore=1501
 adultscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2411120000 definitions=main-2501210065
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250121_000036_615076_53B6C974 
X-CRM114-Status: GOOD (  15.33  )
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



On 1/17/2025 2:17 PM, Kang Yang wrote:
> Currently there are two threads to updating/fetch data of channel
> list, and there are no synchronization for the data, it leads data out
> of sync for channel list when doing reg update.
> 
> So change the call flow to make sure the fetch data running after the
> update data finished, then data of channel list become synchronization.
> 
> Note: This patch-set is an old patch-set in public review written by
> Wen Gong. Just continue sending it for him.
> Link: https://lore.kernel.org/linux-wireless/20230329091235.19500-1-quic_wgong@quicinc.com/
> 
> v5:
>      1. rewrite commit message in patch#1.
>      2. update copyright in patch#1, #2.
> v4:
>      1. rewrite commit message in patch#1, #2.
>      2. use list_splice_tail_init() to move list entry.
>      3. use data_lock instead of adding a new lock.
> v3:
>      1. rebase on tag ath-202411251703.
>      2. add KASAN BUG report in patch #1.
> v2:
>      1. rewrite commit message for patch #1 and #2.
>      2. use a local list without the spinlock held for patch #2.
> 

Hi, jeff, aditya, vasanth, any comments on this patch-set?




