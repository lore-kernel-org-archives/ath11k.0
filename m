Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6BF7BCA1005
	for <ath11k@archiver.kernel.org>; Fri, 30 Aug 2024 16:01:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:CC:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=fZ6BleY6hJxhqNSKGHouVM4VvjSsw9CDGQREuyoil4U=; b=MLOywcYCd7RXqjwq2SYfwvO+Pl
	0wcygt6sCAfuAZLGofAXYPWl424NAUpzaXyDR1qKLzrevZYSEPxosNtbtwnQH7Eu74gE/xlFmbDYn
	NPasUL5ubLgtLYYiTVUeye0oHn4lkn+mnE9RacV4C3k1TFkJtqrY6gDWZHkRgk8sN0Fapxe12cy63
	beKcRYCJdPrZ0SrzTQ9sRAt0taPxX3caO8SzM6qFsslFbe8IAMRwP+OMG8Top4U8wxpYMVQkoo5BC
	kpOZ2k/qWwuFL2x7u7BLbaQL98KywMjJgBp6dlIQrLFM3F/0qmq9ZCQHTEcVI60REqN0lQ+Fbc128
	USuaV5yQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sk44L-00000006wBP-3AOx;
	Fri, 30 Aug 2024 16:01:49 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sk44J-00000006w9o-0SiI
	for ath11k@lists.infradead.org;
	Fri, 30 Aug 2024 16:01:48 +0000
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 47UEttMM011674;
	Fri, 30 Aug 2024 16:01:40 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	fZ6BleY6hJxhqNSKGHouVM4VvjSsw9CDGQREuyoil4U=; b=jZAtzviAb4NjNWR8
	5llO2FoqPCfsZXwpNcLCfvqor0OpeXwtBviJySKVJZEO8Oy827/+QDjdBDQhPbe/
	T63Zib5JO1WjFlS8Jj06OOt0mRZl9zm1fnkvnAF0VFqbXMiyXwG4sC59JdalfrYH
	DMHJkmuuT1iBuiMWJXxCedS6nLWsRAARe9PX2a2YvazD0aIZ8wHUIpr9QIE+P9kW
	iYNHxB1LL56M50Qt7JTQ033GF+y4GiAsnfDd6IflJVuRH6r4ZMlHZFOL+hoCE5Jf
	qGpyS/pIWsxoQ7ovQYY8jXoHPNak8lGHcr34ASfPNFSEWfwXMrggb0KhTLUnEmJ4
	uuo0KQ==
Received: from nalasppmta02.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 419pv0sk4m-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 30 Aug 2024 16:01:38 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA02.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 47UG1bt1030541
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 30 Aug 2024 16:01:37 GMT
Received: from [10.111.180.95] (10.49.16.6) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Fri, 30 Aug
 2024 09:01:36 -0700
Message-ID: <29bf2e9c-ca24-46d1-93e4-3b3f3f812705@quicinc.com>
Date: Fri, 30 Aug 2024 09:01:36 -0700
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] ath11k: Fix potential RCU dereference issue in
 ath11k_debugfs_htt_ext_stats_handler
To: Jiawei Ye <jiawei.ye@foxmail.com>, <kvalo@kernel.org>,
        <jjohnson@kernel.org>, <corbet@lwn.net>
CC: <linux-wireless@vger.kernel.org>, <ath11k@lists.infradead.org>,
        <linux-kernel@vger.kernel.org>
References: <tencent_A64CA96B962349E369B349EA01EBC53C3505@qq.com>
From: Jeff Johnson <quic_jjohnson@quicinc.com>
Content-Language: en-US
In-Reply-To: <tencent_A64CA96B962349E369B349EA01EBC53C3505@qq.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.49.16.6]
X-ClientProxiedBy: nalasex01b.na.qualcomm.com (10.47.209.197) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: ARulsQs3EzcXSvTL9NRtBApJhL6BoHhr
X-Proofpoint-ORIG-GUID: ARulsQs3EzcXSvTL9NRtBApJhL6BoHhr
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.28.16
 definitions=2024-08-30_10,2024-08-30_01,2024-05-17_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 lowpriorityscore=0
 mlxlogscore=737 bulkscore=0 impostorscore=0 phishscore=0 clxscore=1011
 mlxscore=0 spamscore=0 suspectscore=0 malwarescore=0 adultscore=0
 priorityscore=1501 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2407110000 definitions=main-2408300122
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240830_090147_303516_2C24F158 
X-CRM114-Status: GOOD (  12.97  )
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

On 8/30/2024 5:02 AM, Jiawei Ye wrote:
> In the `ath11k_debugfs_htt_ext_stats_handler` function, the `ar` pointer
> obtained via RCU lock is accessed after the RCU read-side critical
> section might be unlocked. According to RCU usage rules, this is illegal.
> Reusing this pointer can lead to unpredictable behavior, including
> accessing memory that has been updated or causing use-after-free issues.
> The `ath12k_debugfs_htt_ext_stats_handler` function in the
> `drivers/net/wireless/ath/ath12k/debugfs_htt_stats.c` file provides a good
> example to follow for addressing this issue.
> 
> This possible bug was identified using a static analysis tool developed
> by myself, specifically designed to detect RCU-related issues.
> 
> To address this issue, the RCU read lock is now kept until all accesses
> to the `ar` pointer are completed. A `goto exit` statement is introduced
> to ensure that the RCU read unlock is called appropriately, regardless of
> the function's exit path.

This analysis is incorrect since ar is not an RCU-protected structure

The rcu_read_lock() is required internally within
ath11k_mac_get_ar_by_pdev_id() when retrieving the RCU-protected pdev pointer.

So NAK this patch.



