Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 64D71ECAAD5
	for <ath11k@archiver.kernel.org>; Fri,  2 Sep 2022 12:59:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:CC:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=RaPnrpee9qR49vlaQ68bGTTFKfvfpQJCcOV5Rdh/ZL0=; b=MjJSTZdCkm/xYQ
	wYd6jAxxBg6s2p6gb6WS1y6QBXQM7JKWjwlDTeA6QKC3XwyFMblBDlWc51Oyz7goNmDDCw/tIR3hC
	M/AIkTVzb0LgWNTSiCrkhflVNA/8TIeQVJshEguRoUViFGKKNeFksgiLfZOnqlybAfNNvpJkJGtHW
	sde9gK8V3X3hMKBE91GCO+4dLIGvhFiuhtmjskrr/fz6Yj1o5rqx69cSswJtfqArAY5Mw9fzW6rmT
	2Jy73cMPLxcLMGuiKRV1flo7nBP+N4M2VH/wY0P20v0b/g/O20qeU5ycY41QZvtNB8NcrJNwoPtUH
	D78K1KFoucTQdMwNJmmQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oU6GW-004tG4-6o; Fri, 02 Sep 2022 12:59:20 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oU6Bt-004q00-GD
	for ath11k@lists.infradead.org; Fri, 02 Sep 2022 12:54:35 +0000
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id 282Ar9Ot006598;
	Fri, 2 Sep 2022 12:54:29 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=message-id : date :
 mime-version : subject : to : cc : references : from : in-reply-to :
 content-type : content-transfer-encoding; s=qcppdkim1;
 bh=OR00aDu05wizlIsoeTPnNtPz9tPjGRV1Toqs51iUOek=;
 b=ks271CKm9WnHfL1HAK+npwlHmzxcDHgBrKaOZYEOvbtia24ik29dEGfuFls59AUpmQVa
 1Yy74HXfjZbt3dnUDfRSapASJhH4d8azPsezoUlBXw9IUhWkvWDADSjKB+5Kr6YL6FgC
 j/7LjlLQrwO1YrYWFuGGGmpUxW2HIUP6igqMzrpquUh5Z91gwMC5T/bdalUeIyFXvc+h
 uoQCvzuWq3r7S9VQpBdDeprRT1IOe8AUZ0sJ5Vhe22PyCdQ8ZcpP8r4S7PPuW1RqKo5z
 4472IQnKefy6fc21j5Zto9Oij+0W+574h53lp6TkVV3VJxkioT7wvHWo8S40NvN46IWJ zw== 
Received: from nalasppmta04.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3jb5k925bn-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 02 Sep 2022 12:54:29 +0000
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA04.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 282CsS4K007408
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 2 Sep 2022 12:54:28 GMT
Received: from [10.216.25.75] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.986.29; Fri, 2 Sep 2022
 05:54:27 -0700
Message-ID: <6fd6c592-3bad-ce39-24ea-e28d5ad98e7b@quicinc.com>
Date: Fri, 2 Sep 2022 18:24:23 +0530
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.8.1
Subject: Re: [PATCH 1/3] ath11k: Enable threaded NAPI on WCN6750
Content-Language: en-US
To: Kalle Valo <kvalo@kernel.org>
CC: <ath11k@lists.infradead.org>, <linux-wireless@vger.kernel.org>
References: <20220720135113.15755-2-quic_mpubbise@quicinc.com>
 <166212222808.10242.13626602156198198987.kvalo@kernel.org>
From: Manikanta Pubbisetty <quic_mpubbise@quicinc.com>
In-Reply-To: <166212222808.10242.13626602156198198987.kvalo@kernel.org>
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-ORIG-GUID: O3jMhQAjcFGgTxSPJIuGklltC0ToKwdA
X-Proofpoint-GUID: O3jMhQAjcFGgTxSPJIuGklltC0ToKwdA
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.895,Hydra:6.0.517,FMLib:17.11.122.1
 definitions=2022-09-02_02,2022-08-31_03,2022-06-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 impostorscore=0 phishscore=0
 mlxlogscore=855 malwarescore=0 spamscore=0 adultscore=0 lowpriorityscore=0
 bulkscore=0 clxscore=1015 mlxscore=0 priorityscore=1501 suspectscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2207270000
 definitions=main-2209020062
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220902_055433_611380_935ECC3D 
X-CRM114-Status: GOOD (  13.53  )
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
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Sender: "ath11k" <ath11k-bounces@lists.infradead.org>
Errors-To: ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org

On 9/2/2022 6:07 PM, Kalle Valo wrote:
> Manikanta Pubbisetty <quic_mpubbise@quicinc.com> wrote:
> 
>> Enable threaded NAPI on WCN6750. Unlike traditional NAPI poll which
>> runs in softirq context and on the core which scheduled the NAPI,
>> threaded NAPI makes use of kernel threads which are under direct
>> control of the scheduler and helps in balancing the NAPI processing
>> load across multiple CPUs thereby improving throughput.
>>
>> In the case of WCN6750, enabling threaded NAPI has improved
>> 160 MHz RX throughput by nearly 400 Mbps. This should give similar
>> gains for other ath11k devices as well, therefore enable threaded
>> NAPI on all other devices.
>>
>> Tested-on: WCN6750 hw1.0 AHB WLAN.MSL.1.0.1-00887-QCAMSLSWPLZ-1
>>
>> Signed-off-by: Manikanta Pubbisetty <quic_mpubbise@quicinc.com>
> 
> Fails to apply and no base commit provided, so please rebase.
> 
> error: patch failed: drivers/net/wireless/ath/ath11k/core.c:111
> error: drivers/net/wireless/ath/ath11k/core.c: patch does not apply
> error: patch failed: drivers/net/wireless/ath/ath11k/hw.h:205
> error: drivers/net/wireless/ath/ath11k/hw.h: patch does not apply
> stg import: Diff does not apply cleanly
> 
> 3 patches set to Changes Requested.
> 
> 12924009 [1/3] ath11k: Enable threaded NAPI on WCN6750
> 12924011 [2/3] ath11k: Add multi TX ring support for WCN6750
> 12924010 [3/3] ath11k: Increase TCL data ring size for WCN6750
> 

Sure, thanks!

-- 
ath11k mailing list
ath11k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath11k
