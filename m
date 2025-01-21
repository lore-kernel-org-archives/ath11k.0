Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E24C3C02182
	for <ath11k@archiver.kernel.org>; Tue, 21 Jan 2025 09:03:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:CC:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=nOmxGULGuRWlpFQmMFFTRM2ETutV+o82//ne1gQwiBg=; b=OVX8r4dQCdCdA+vVkSYSdk+5Yp
	XVtjU8mV6siCKjGECXHcVNnRDXDb/WGG8GxtODFyYh8g//2r5SRsP5Z29Ya74bZrbf7vL7w/mZ00e
	s7ndaQRXHPDLeCsP6Ygk7kJp5BqK6YikJc+Nt9xaA6llhUVsaLk0u0Rmo/LlZ26WhPW4ij6oI9MDt
	UNfQmceQf6hml2RRK1ZJQnl1TA58nnMlNh3j52iYxnpf7++TZQq2fh8tOL+qPShWLQXoRvA09vhg4
	ysPen+2E+bN8m3aXGdLyS6k9lJ1sd8/zOfRKwiFQvplXn22kD/qKOR/N+G3mNfpBpojGidH/CJz4Q
	H3O7ybyA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1taAAV-00000007M0A-1KXR;
	Tue, 21 Jan 2025 09:03:31 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1taAAS-00000007LxB-0Rvv
	for ath11k@lists.infradead.org;
	Tue, 21 Jan 2025 09:03:29 +0000
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 50L8Ykj7009150;
	Tue, 21 Jan 2025 09:03:27 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	nOmxGULGuRWlpFQmMFFTRM2ETutV+o82//ne1gQwiBg=; b=FHR251L/liWUe4Lj
	99ZdP4ZHzgatiPsRFZRT008Mh1TY19CZ0+8rJGR4AQw6gEZoghfqKMhvZbRX9fQj
	uzfDckt+JKkJZZZZlWGSlNmz3LjEdj2tBJsqIGo6Sf4K++8uA6TQkYAh8tWE56tF
	m0HUyEsu17SIhriEZJwpBGv6AgzAr+1MvZPGYx8OlCmQ7w+U7ylbI4fCJzR9ONOZ
	gIqZiu+ZSzEQNTTdTJKjUujc4eKIF7Sr3PR1bhfSPNzAdbvsuaTEYYq3dDvJ0sOr
	o3qCYgCKIysyuYn6SaixAXD8JN3zkCc7Z2ZizR+1hh+P7HTm8b2LzlPeAT170r1n
	m9th2g==
Received: from nalasppmta04.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 44a85sr2hj-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 21 Jan 2025 09:03:27 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA04.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 50L93QfU027784
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 21 Jan 2025 09:03:26 GMT
Received: from [10.152.202.18] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Tue, 21 Jan
 2025 01:03:24 -0800
Message-ID: <97ae78d5-7d87-41a2-a50f-72cf40c9ed56@quicinc.com>
Date: Tue, 21 Jan 2025 14:33:21 +0530
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 1/2] wifi: ath11k: update channel list in reg notifier
 instead reg worker
To: Kang Yang <quic_kangyang@quicinc.com>, <ath11k@lists.infradead.org>
CC: <linux-wireless@vger.kernel.org>
References: <20250117061737.1921-1-quic_kangyang@quicinc.com>
 <20250117061737.1921-2-quic_kangyang@quicinc.com>
From: Aditya Kumar Singh <quic_adisi@quicinc.com>
Content-Language: en-US
In-Reply-To: <20250117061737.1921-2-quic_kangyang@quicinc.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: LnKqIVJqCVnKT1oC1j4AdaesZWdDljvl
X-Proofpoint-ORIG-GUID: LnKqIVJqCVnKT1oC1j4AdaesZWdDljvl
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1057,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-01-21_04,2025-01-21_02,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 spamscore=0 mlxlogscore=999
 priorityscore=1501 adultscore=0 impostorscore=0 malwarescore=0 mlxscore=0
 clxscore=1011 phishscore=0 suspectscore=0 lowpriorityscore=0 bulkscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.19.0-2411120000
 definitions=main-2501210074
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250121_010328_190311_92056476 
X-CRM114-Status: GOOD (  12.10  )
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

On 1/17/25 11:47, Kang Yang wrote:
> From: Wen Gong <quic_wgong@quicinc.com>
> 
> Currently when ath11k gets a new channel list, it will be processed
> according to the following steps:
> 1. update new channel list to cfg80211 and queue reg_work.
> 2. cfg80211 handles new channel list during reg_work.
> 3. update cfg80211's handled channel list to firmware by
> ath11k_reg_update_chan_list().
> 
> But ath11k will immediately execute step 3 after reg_work is just
> queued. Since step 2 is asynchronous, cfg80211 may not have completed
> handling the new channel list, which may leading to an out-of-bounds
> write error:
> BUG: KASAN: slab-out-of-bounds in ath11k_reg_update_chan_list
> Call Trace:
>      ath11k_reg_update_chan_list+0xbfe/0xfe0 [ath11k]
>      kfree+0x109/0x3a0
>      ath11k_regd_update+0x1cf/0x350 [ath11k]
>      ath11k_regd_update_work+0x14/0x20 [ath11k]
>      process_one_work+0xe35/0x14c0
> 
> Should ensure step 2 is completely done before executing step 3. Thus
> Wen raised patch[1]. When flag NL80211_REGDOM_SET_BY_DRIVER is set,
> cfg80211 will notify ath11k after step 2 is done.
> 
> So enable the flag NL80211_REGDOM_SET_BY_DRIVER then cfg80211 will
> notify ath11k after step 2 is done. At this time, there will be no
> KASAN bug during the execution of the step 3.
> 
> [1] https://patchwork.kernel.org/project/linux-wireless/patch/20230201065313.27203-1-quic_wgong@quicinc.com/
> 
> Tested-on: WCN6855 hw2.0 PCI WLAN.HSP.1.1-03125-QCAHSPSWPL_V1_V2_SILICONZ_LITE-3
> 
> Fixes: f45cb6b29cd3 ("wifi: ath11k: avoid deadlock during regulatory update in ath11k_regd_update()")
> Signed-off-by: Wen Gong <quic_wgong@quicinc.com>
> Signed-off-by: Kang Yang <quic_kangyang@quicinc.com>
> ---

Reviewed-by: Aditya Kumar Singh <quic_adisi@quicinc.com>


-- 
Aditya

