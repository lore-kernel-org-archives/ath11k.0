Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F17A0C27C53
	for <ath11k@archiver.kernel.org>; Wed, 12 Jun 2024 19:26:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:CC:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=g3ftkoyR5O0kSK38yll0SLWdrY4adiKP1UY4i0+tPjU=; b=BbUeKqPE8DaoydWCveZTP+dSoz
	AeWkUQUZuhCTW/w9SLt2NhqLyuHQenxeiqnDIOoOArKCPbbSPOQT7hJlYAcIiQd7zXFGSqQNSB/BZ
	Rim/rOmADsqVoBgeZ5+s/2EtU+Kqgdo+ov79xKoI4LGLpiQl0ombeTCdn05sfT4rmNySaEwVHIU8U
	f/ps9/YK6PCWxELTaiY4AC1rN+7wN3EGQjll91KTllsucRcasCR4dosMMb/Y6IMB3gsnNb3seZl3g
	WRSen42C9KBrmgl3axkjGtAQFSaarxJfqE8zprvXNe3Wm3Bbmf7hR+UibuBMidMvyEeIs8VGY5t5O
	0E93clXg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sHTcG-0000000DtJN-2tqT;
	Wed, 12 Jun 2024 19:26:40 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sHTcD-0000000DtIs-2ELg
	for ath11k@lists.infradead.org;
	Wed, 12 Jun 2024 19:26:39 +0000
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 45CDqqZN019231;
	Wed, 12 Jun 2024 19:26:36 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	g3ftkoyR5O0kSK38yll0SLWdrY4adiKP1UY4i0+tPjU=; b=T72jWBUZ8jcnNpnF
	xD3T16jNLnjMvgKWwsL96XkPr7R/bRgqm0x02gwbXbT7ACjPTQV+MJlJBvIB/kqu
	/w2iMrpET7vzwDZZzb1aqJqDQsIwUOxa99f0BAHbM0CYusH1daziz6SvO+Os/wpz
	9ThjbNgM2XRtBheRR0lbTWbvPTioVxlQtSfwgY/YkLrKNOLB16N1FthzBjDAWKtx
	OrQOorivIwu5AnoRH7hhDhHcMAdxIeqYL/z901ypzFN6JFuuL4fMzojc0VE3zECf
	O7DOaMLdMdciR2FWd/vuYPg2thZRn0ms+f93+UYdNuy8OkSLYzbaQcVEdV8IakKz
	lGokrg==
Received: from nalasppmta04.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3yqcxth1xq-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 12 Jun 2024 19:26:36 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA04.qualcomm.com (8.17.1.19/8.17.1.19) with ESMTPS id 45CJQZjB000751
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 12 Jun 2024 19:26:35 GMT
Received: from [10.48.243.20] (10.49.16.6) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Wed, 12 Jun
 2024 12:26:35 -0700
Message-ID: <5cf39d31-c470-4c28-bb82-a489a44488ef@quicinc.com>
Date: Wed, 12 Jun 2024 12:26:34 -0700
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] wifi: ath11k: fix ack signal strength calculation
Content-Language: en-US
To: Lingbo Kong <quic_lingbok@quicinc.com>, <ath11k@lists.infradead.org>
CC: <linux-wireless@vger.kernel.org>
References: <20240611022550.59078-1-quic_lingbok@quicinc.com>
From: Jeff Johnson <quic_jjohnson@quicinc.com>
In-Reply-To: <20240611022550.59078-1-quic_lingbok@quicinc.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.49.16.6]
X-ClientProxiedBy: nalasex01b.na.qualcomm.com (10.47.209.197) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-ORIG-GUID: 80f8f7cz3vu-P3IBDnYl0jvH1L7-Fpz2
X-Proofpoint-GUID: 80f8f7cz3vu-P3IBDnYl0jvH1L7-Fpz2
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.28.16
 definitions=2024-06-12_10,2024-06-12_02,2024-05-17_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 impostorscore=0 adultscore=0
 lowpriorityscore=0 mlxlogscore=999 spamscore=0 mlxscore=0
 priorityscore=1501 bulkscore=0 phishscore=0 suspectscore=0 malwarescore=0
 clxscore=1015 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2405170001 definitions=main-2406120137
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240612_122637_699536_90EC04A7 
X-CRM114-Status: GOOD (  10.21  )
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

On 6/10/2024 7:25 PM, Lingbo Kong wrote:
> Currently, the calculation of ack signal strength is incorrect.
> 
> This is because before calculating the ack signal strength, ath11k need
> to determine whether the hardware and firmware support db2dbm. If the
> hardware and firmware support db2dbm, do not need to add noise floor,
> otherwise, need to add noise floor.
> 
> Besides, the value of ack_rssi passed by firmware to ath11k should be a
> signed number, so change its type to s8.
> 
> After that, "iw wlan0 station dump" show the correct ack signal strength.
> 
> Such as:
> root@CDCCSTEX0799733-LIN:~# iw wlp88s0 station dump
> Station 00:03:7f:12:df:df (on wlp88s0)
>         inactive time:  75 ms
>         rx bytes:       11599
>         rx packets:     99
>         tx bytes:       9029
>         tx packets:     81
>         tx retries:     4
>         tx failed:      0
>         rx drop misc:   2
>         signal:         -16 dBm
>         signal avg:     -24 dBm
>         tx bitrate:     1560.0 MBit/s VHT-MCS 9 80MHz VHT-NSS 4
>         tx duration:    9230 us
>         rx bitrate:     1560.0 MBit/s VHT-MCS 9 80MHz VHT-NSS 4
>         rx duration:    7201 us
>         last ack signal:-23 dBm
>         avg ack signal: -22 dBm
> 
> Tested-on: WCN6855 hw2.0 PCI WLAN.HSP.1.1-03125-QCAHSPSWPL_V1_V2_SILICONZ_LITE-3.6510.30
> Tested-on: QCN9074 hw1.0 PCI WLAN.HK.2.7.0.1-01744-QCAHKSWPL_SILICONZ-1
> 
> Signed-off-by: Lingbo Kong <quic_lingbok@quicinc.com>
Acked-by: Jeff Johnson <quic_jjohnson@quicinc.com>


