Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2C69AEE49A3
	for <ath11k@archiver.kernel.org>; Tue, 22 Aug 2023 15:03:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:CC:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=vQIFW07pm9gJa55LaYdGS0eBdYbdTxoOG7AVjH/+RJ4=; b=cvLyOU5w2MQJX3
	p4UC05i0Tl4jUcSJjtOfUq0oggEtUS2qrey6jb4fy6PplCqQPQDyv9zzjSaGduRMYEUqDWrhyrvtN
	mEHrf6FtaRNnm6hZfvCKLf35N6iMP4LSJpfEINcYhNTPBJ3iml/x+7kKK/jGFvllpebKfwXxS4qeh
	WU1coL78J7oKGRQzPZ0RpQXPF15DxbYfNqjonMRGjd/HW+gIOCYlIqDdiiM+mFZVceieaamkV3dVh
	kk9F4Q8IEFlUpLeRutbirVVN0z2nBAn8qwkyGmtTn5wQp4huNllZ7OaXEUjIvpQ+C01uaVl62KFTM
	5nyQNygoRfXxDGSq31mA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qYSuT-00GHsw-2L;
	Tue, 22 Aug 2023 15:03:09 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qYSuR-00GHsN-0s
	for ath11k@lists.infradead.org;
	Tue, 22 Aug 2023 15:03:08 +0000
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 37MBxKMc000706;
	Tue, 22 Aug 2023 15:03:06 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=message-id : date :
 mime-version : subject : to : cc : references : from : in-reply-to :
 content-type : content-transfer-encoding; s=qcppdkim1;
 bh=PaN4TojYzPZ3KFjDhk+97Ocy1UsIYtZWOEIgM+zXcIY=;
 b=hDC9JbmHM4O7wdX2BILg/jUTcbcbtoqstdw7UDqOyJRkH611vaWnLP0G1UOlVBdzVmnz
 zT81je8hdzRUIBUeXSFDAxFYsdiOrV8+ZvYXHU1kbrETQT25W7MEmKPz5tK/bYyAKPIA
 kVS//J8mInLeF6PLzBAJIhs9gbUOEOCv/Y7GJ1m86l6U3Pv4QH6FOKHeFp953BI78SuA
 1BjdfgV30MmWR5Z+RKuQZ8EXUxU426EnFM5PfsS19aYKHU01aWWcI6BjTUvrO/7p6hz1
 XwVxUSEo27qTGhrL3aPkqoAZaJWFtY0AKnLszHGQz088bMr60CAaZIaYr2IItcm4T5fu 9g== 
Received: from nalasppmta02.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3smreu10ny-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 22 Aug 2023 15:03:06 +0000
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA02.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 37MF35Kt023729
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 22 Aug 2023 15:03:05 GMT
Received: from [10.48.244.52] (10.49.16.6) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1118.36; Tue, 22 Aug
 2023 08:03:05 -0700
Message-ID: <10b4a983-de36-48f9-89f6-613519dc94a5@quicinc.com>
Date: Tue, 22 Aug 2023 08:03:04 -0700
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 3/3] wifi: ath11k: fix Tx power value during active CAC
Content-Language: en-US
To: Aditya Kumar Singh <quic_adisi@quicinc.com>, <ath11k@lists.infradead.org>
CC: <linux-wireless@vger.kernel.org>, <johannes@sipsolutions.net>
References: <20230607124647.27682-1-quic_adisi@quicinc.com>
 <20230607124647.27682-4-quic_adisi@quicinc.com>
From: Jeff Johnson <quic_jjohnson@quicinc.com>
In-Reply-To: <20230607124647.27682-4-quic_adisi@quicinc.com>
X-Originating-IP: [10.49.16.6]
X-ClientProxiedBy: nalasex01c.na.qualcomm.com (10.47.97.35) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: GxaWNuZnngpn9k19UHtqCQUmWDD3i4H_
X-Proofpoint-ORIG-GUID: GxaWNuZnngpn9k19UHtqCQUmWDD3i4H_
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.267,Aquarius:18.0.957,Hydra:6.0.601,FMLib:17.11.176.26
 definitions=2023-08-22_13,2023-08-22_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 lowpriorityscore=0
 clxscore=1015 bulkscore=0 mlxscore=0 priorityscore=1501 mlxlogscore=999
 impostorscore=0 malwarescore=0 spamscore=0 suspectscore=0 phishscore=0
 adultscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2306200000 definitions=main-2308220114
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230822_080307_318546_165A848E 
X-CRM114-Status: GOOD (  20.89  )
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

On 6/7/2023 5:46 AM, Aditya Kumar Singh wrote:
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
> index 31982545266b..9707910928b4 100644
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
