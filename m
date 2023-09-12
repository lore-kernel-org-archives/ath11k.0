Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EBB78EE3F09
	for <ath11k@archiver.kernel.org>; Tue, 12 Sep 2023 17:52:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:CC:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=RUFdXFynmYk7ilXmJuxoIxP6R3Zz/Pn7WFaG2lB4eGQ=; b=m/G2VVUlTbawFs
	mzrzjhPbjNlZgacEoi6MMTJxwmUaudKvPk1SHFIHCrBivZnJPVpQ0mMUQcNHlgZKau1XJIEhS5WtQ
	GU6I73uBfb52D/NbSyVDR8d3Kc3BaPTzOB2dSh2Q3u+8OY6m9qSguKv6wXILndwoczsY6pP9U46/d
	ONk5+0BvOWDs/dBliQ2+rRhDByL6n4nZjwLAoTKDpg1azNhL3gQcFm+d7Mils1aAzzAmgpGkJhI89
	6icWn1PXNMuhMtCVVPynHLowOCvtPd1s/4APc9KNMrVFUEc0KbApgumjQFAeXgNHpEtPj5Mf/Nxez
	XeiHygF9fSTDT5kd2fHw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qg7YY-003whA-29;
	Tue, 12 Sep 2023 17:52:10 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qg7YV-003wf5-1r
	for ath11k@lists.infradead.org;
	Tue, 12 Sep 2023 17:52:09 +0000
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 38CGra9D005903;
	Tue, 12 Sep 2023 17:52:07 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=message-id : date :
 mime-version : subject : to : cc : references : from : in-reply-to :
 content-type : content-transfer-encoding; s=qcppdkim1;
 bh=cfCG/C001JEwNnf/LCPGEOwEP9gCWBUScd9moe+3Km4=;
 b=eNt1zy+6MaA0x6xDkTAe2ASJowLEqy9yHLw2ai5TUY5pJLhCMnE2o5nXkRElyV0noRi/
 HhcDST9gljRXJ0CD2YZVir0YhOmPKCmwteCP0A9PFF+emAFa6lWMRWsQ7mc+guHvuMh4
 oFG6K6IXHrP0H27jLuypRfnMFxKvL8sUUo8229ohZZmWKMvsiXO51R28aKkEnbZMslrP
 T2KXJoV1kCuxDwjK7UrUOqWZCphD4fc2/VBew7+F9fbGU7PMYYFvbmBzBoFPNDDZOyKx
 IQ7SykKgFNH698RSYSt5BVJ1GvHpkOu/HNKx5PzjS6buKRreymzh06Zihk5hLH7K5OgX Jg== 
Received: from nalasppmta01.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3t2qkj95dq-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 12 Sep 2023 17:52:07 +0000
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA01.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 38CHq5OQ029487
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 12 Sep 2023 17:52:06 GMT
Received: from [10.111.183.71] (10.49.16.6) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1118.36; Tue, 12 Sep
 2023 10:52:05 -0700
Message-ID: <83e9db20-24c9-4a0e-a632-b40f37260c64@quicinc.com>
Date: Tue, 12 Sep 2023 10:52:05 -0700
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 3/3] wifi: ath11k: fix Tx power value during active CAC
Content-Language: en-US
To: Aditya Kumar Singh <quic_adisi@quicinc.com>, <ath11k@lists.infradead.org>
CC: <linux-wireless@vger.kernel.org>, <johannes@sipsolutions.net>
References: <20230912051857.2284-1-quic_adisi@quicinc.com>
 <20230912051857.2284-4-quic_adisi@quicinc.com>
From: Jeff Johnson <quic_jjohnson@quicinc.com>
In-Reply-To: <20230912051857.2284-4-quic_adisi@quicinc.com>
X-Originating-IP: [10.49.16.6]
X-ClientProxiedBy: nalasex01c.na.qualcomm.com (10.47.97.35) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-ORIG-GUID: psEx7bDAuTZ3q5e0H4NwkqqTHFMlKr7U
X-Proofpoint-GUID: psEx7bDAuTZ3q5e0H4NwkqqTHFMlKr7U
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.267,Aquarius:18.0.957,Hydra:6.0.601,FMLib:17.11.176.26
 definitions=2023-09-12_16,2023-09-05_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 priorityscore=1501
 adultscore=0 impostorscore=0 suspectscore=0 spamscore=0 phishscore=0
 malwarescore=0 lowpriorityscore=0 bulkscore=0 mlxlogscore=999
 clxscore=1015 mlxscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2308100000 definitions=main-2309120151
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230912_105207_676108_C802B871 
X-CRM114-Status: GOOD (  21.47  )
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

On 9/11/2023 10:18 PM, Aditya Kumar Singh wrote:
> Tx power is fetched from firmware's pdev stats. However, during active
> CAC, firmware does not fill the current Tx power and sends the max
> initialised value filled during firmware init. If host sends this power
> to user space, this is wrong since in certain situations, the Tx power
> could be greater than the max allowed by the regulatory. Hence, host
> should not be fetching the Tx power during an active CAC.
> 
> Fix this issue by returning Tx power as 0 during active CAC since it
> is known that during CAC, there will be no transmission happening.
> 
> Tested-on: QCN9074 hw1.0 PCI WLAN.HK.2.7.0.1-01744-QCAHKSWPL_SILICONZ-1
> 
> Fixes: 9a2aa68afe3d ("wifi: ath11k: add get_txpower mac ops")
> Signed-off-by: Aditya Kumar Singh <quic_adisi@quicinc.com>

Acked-by: Jeff Johnson <quic_jjohnson@quicinc.com>

> ---
>   drivers/net/wireless/ath/ath11k/mac.c | 8 ++++++++
>   1 file changed, 8 insertions(+)
> 
> diff --git a/drivers/net/wireless/ath/ath11k/mac.c b/drivers/net/wireless/ath/ath11k/mac.c
> index 6b5f032197ff..a36698688f89 100644
> --- a/drivers/net/wireless/ath/ath11k/mac.c
> +++ b/drivers/net/wireless/ath/ath11k/mac.c
> @@ -9045,6 +9045,14 @@ static int ath11k_mac_op_get_txpower(struct ieee80211_hw *hw,
>   	if (ar->state != ATH11K_STATE_ON)
>   		goto err_fallback;
>   
> +	/* Firmware doesn't provide Tx power during CAC hence no need to fetch
> +	 * the stats.
> +	 */
> +	if (test_bit(ATH11K_CAC_RUNNING, &ar->dev_flags)) {
> +		mutex_unlock(&ar->conf_mutex);
> +		return -EAGAIN;
> +	}
> +
>   	req_param.pdev_id = ar->pdev->pdev_id;
>   	req_param.stats_id = WMI_REQUEST_PDEV_STAT;
>   


-- 
ath11k mailing list
ath11k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath11k
