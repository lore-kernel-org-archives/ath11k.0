Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EE2A3C02190
	for <ath11k@archiver.kernel.org>; Fri, 31 Jan 2025 04:20:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:CC:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=iQgwdorvEufR6Df+GusIjyJkmVvMGB/OpB6e2sYU9eI=; b=mxGoegBpv1WF/p8AbCtQFkTm1E
	UkfiO7MsBjorQVZQ7a6oMnnG61YQbeZ+i4Nr+1mWFaCb8QTWnIFRcjMcdMT/W14gy1rpwtridswnO
	QYxsObmLYe5QEu/1Ns5PTQVFaWUuP9Zo/gH0qTs+NrWiu6fPEgko52/Di98sOWvlxe9KWdRVCD0ZH
	l6WRnnIcZ68n55mYdhu+1yZmvsDwmjzUNVx9oETVJ23MXCvxUPtEHIKxMffF1q31eeUQQbzZ0J/wo
	V3/LNXzgPWIvAzv6XZ8aLZo+jaxXyu0oVSG/SMjLecJUf9J1PtYOWxOSPnJMTrWj4EbdGqIufpaJk
	1y6fjhgg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tdiWQ-00000009zUu-2MWP;
	Fri, 31 Jan 2025 04:20:50 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tdiWO-00000009zUX-2MHw
	for ath11k@lists.infradead.org;
	Fri, 31 Jan 2025 04:20:49 +0000
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 50UJ2HmQ005148;
	Fri, 31 Jan 2025 04:20:47 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	iQgwdorvEufR6Df+GusIjyJkmVvMGB/OpB6e2sYU9eI=; b=cKdrYYpqMlhBnZSd
	Lzzb32kzvuqTwO0u5sU+pz1mC4PoV3k3i38IFTlv3z+2gbuMtERrOj4zVNatqU1u
	tN97eLK7A3MuWfvOrpKvZpn7VXHWou9msSposKffI9c81jPBYJe03mHIhpDF3O/6
	VJhIr3n6soeOTks6fXVN1RjcI3yBIJZa1cC3yxoAgPaXkJ5edNdRICWf+VyXHrti
	efPJxb2NOhyCO8TDXetXxvmu+YkG6fT1m607yG95X4kTxneciRZ8l9K0SVIkzrCK
	jfQyQ7L5APw0IKvD5jfSySJ0p5tEGRGPxJQDiVbnVgqL07FnUQe0TVOTBIFpQYFE
	gITFmg==
Received: from nalasppmta05.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 44gf7j8w5c-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 31 Jan 2025 04:20:47 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA05.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 50V4KkHZ001678
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 31 Jan 2025 04:20:46 GMT
Received: from [10.216.32.57] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Thu, 30 Jan
 2025 20:20:44 -0800
Message-ID: <05250ad5-d6cb-eebb-cf1d-7711e4df881f@quicinc.com>
Date: Fri, 31 Jan 2025 09:50:39 +0530
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
Subject: Re: [PATCH] wifi: ath11k: fix wrong overriding for VHT Beamformee STS
 Capability
Content-Language: en-US
To: "Yu Zhang(Yuriy)" <quic_yuzha@quicinc.com>, <ath11k@lists.infradead.org>
CC: <linux-wireless@vger.kernel.org>
References: <20250124075953.2282354-1-quic_yuzha@quicinc.com>
From: Vasanthakumar Thiagarajan <quic_vthiagar@quicinc.com>
In-Reply-To: <20250124075953.2282354-1-quic_yuzha@quicinc.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-ORIG-GUID: XoZIODlp9vxkWHNN1ygOtgRBjLltLEZE
X-Proofpoint-GUID: XoZIODlp9vxkWHNN1ygOtgRBjLltLEZE
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1057,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-01-31_01,2025-01-30_01,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 lowpriorityscore=0
 phishscore=0 impostorscore=0 bulkscore=0 adultscore=0 mlxscore=0
 mlxlogscore=640 spamscore=0 malwarescore=0 priorityscore=1501
 suspectscore=0 clxscore=1015 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.19.0-2501170000 definitions=main-2501310027
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250130_202048_610853_B805C485 
X-CRM114-Status: GOOD (  11.17  )
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



On 1/24/2025 1:29 PM, Yu Zhang(Yuriy) wrote:
> Current code in ath11k_mac_set_txbf_conf overrides nsts, which is
> incorrect as it confuses nss and nsts. nss is Number of Spatial
> Streams，nsts is Number of Space-Time Streams.
> 
> As mentioned in Fixes: 55b5ee3357d7, the nss used when acting as a
> beamformee in VHT mode should be reported by the firmware and should not
> be greater than the number of receiving antennas - 1. The num_rx_chains
> related nss rather than nsts.
> 
> If STBC is enabled, nsts is greater than nss. About nss are mapped to
> nsts, refer to IEEE Std 802.11-2020: 19.3.11.9.2 Space-time block coding
> (STBC), Table 19-18—Constellation mapper output to spatial mapper input
> for STBC.
> 
> Remove wrong overriding for nsts of VHT Beamformee STS Capability,
> acting DL MU-MIMO in VHT mode is working properly.
> 
> Tested-on: WCN6855 hw2.1 PCI WLAN.HSP.1.1-04479-QCAHSPSWPL_V1_V2_SILICONZ_IOE-1
> 
> Fixes: 55b5ee3357d7 ("wifi: ath11k: fix number of VHT beamformee spatial streams")
> Signed-off-by: Yu Zhang(Yuriy) <quic_yuzha@quicinc.com>

Reviewed-by: Vasanthakumar Thiagarajan <vasanthakumar.thiagarajan@oss.qualcomm.com>

