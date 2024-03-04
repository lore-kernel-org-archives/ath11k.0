Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3EB06C5478C
	for <ath11k@archiver.kernel.org>; Mon,  4 Mar 2024 15:43:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:CC:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=deRVXEzWEHdzZK+Mwu06ZOOus810hUYZYRCV3UNPgGM=; b=pwbdu8sD1RQ2lZko276McYyTnz
	POMJm7b55zhCq7kE1TZOMkAWUb1sx0R1Kh2pdwPx+pb9evMfGgjuJFS0E8H1e8YEnuxV8hklU02Po
	zGX2kiq8cjSwlAWFmQVh84KZafcn6j8s45dkB/wLCHL9aWoidA3pdbJc4QpYFQC93k0Xh4O4LLq4v
	Od8IkGDocDrhY2XScaXxfsRa0epDI0vGcIRuGHjIgIpE4mE92vfyfUsRlCCONvd+V0QtjLhqV8EBs
	J4km+IlwOXS7Cy0qc/gV4JsGueWDHATeYBi6zF9zJlL6DxyKfnZKptVqGJDUhl88VJE0YC3pNQPMe
	bYr9oV1w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rhATb-00000009fM3-3bB8;
	Mon, 04 Mar 2024 15:43:39 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rhATY-00000009fDx-1Xev
	for ath11k@lists.infradead.org;
	Mon, 04 Mar 2024 15:43:38 +0000
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.17.1.24/8.17.1.24) with ESMTP id 424DpTpY012644;
	Mon, 4 Mar 2024 15:43:00 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	message-id:date:mime-version:subject:to:cc:references:from
	:in-reply-to:content-type:content-transfer-encoding; s=
	qcppdkim1; bh=deRVXEzWEHdzZK+Mwu06ZOOus810hUYZYRCV3UNPgGM=; b=Wj
	mK5HMqhA31kVDitqHBmpfSjz408304m6gbeR7htqsgtJ0+RCAQt5Vy2aN5COemd9
	kp2+Du0uDiyouanV0IJVM1YOlGvav/5SkrXC0K9Hdvh1HXkIfYlpGOua/s6tCNce
	oFj31YU5XGOlW0tyUJYMAQx7p+F44bTpLqd8fMamXxoS0/pyRy0LUrJ3SwSeQEOm
	YtrJZnnn8alfzPdm/fAQ/GsM4mryJLgITN2+A5RDrC1akMzU0yP1sRFizmLsIYFr
	WFX2lGwKKwTl7bg0Z9iu6G/8aO+HBkuhoOzOAXpLiAxxHXp/++MaQUJkkQuasana
	z7ghdqASt0d/Ml8qGr2A==
Received: from nalasppmta05.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3wn5b39ek4-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 04 Mar 2024 15:42:59 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA05.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 424FgwxO020247
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 4 Mar 2024 15:42:58 GMT
Received: from [10.110.86.150] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1118.40; Mon, 4 Mar
 2024 07:42:58 -0800
Message-ID: <95c5d498-e00c-4f51-9517-1881a9b3585d@quicinc.com>
Date: Mon, 4 Mar 2024 07:42:57 -0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v6 3/3] wifi: ath11k: support hibernation
Content-Language: en-US
To: Baochen Qiang <quic_bqiang@quicinc.com>, <ath11k@lists.infradead.org>,
        <manivannan.sadhasivam@linaro.org>
CC: <linux-wireless@vger.kernel.org>, <linux-arm-msm@vger.kernel.org>,
        <mhi@lists.linux.dev>, <davem@davemloft.net>, <edumazet@google.com>,
        <kuba@kernel.org>, <pabeni@redhat.com>, <netdev@vger.kernel.org>
References: <20240304060932.80839-1-quic_bqiang@quicinc.com>
 <20240304060932.80839-4-quic_bqiang@quicinc.com>
From: Jeff Johnson <quic_jjohnson@quicinc.com>
In-Reply-To: <20240304060932.80839-4-quic_bqiang@quicinc.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: hrrJl6C6UIcbQ-X-j1sKrhXvHn1IHjTX
X-Proofpoint-ORIG-GUID: hrrJl6C6UIcbQ-X-j1sKrhXvHn1IHjTX
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.1011,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2024-03-04_11,2024-03-04_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 bulkscore=0 phishscore=0
 mlxlogscore=692 lowpriorityscore=0 suspectscore=0 priorityscore=1501
 spamscore=0 clxscore=1015 mlxscore=0 adultscore=0 impostorscore=0
 malwarescore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2402120000 definitions=main-2403040120
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240304_074336_461365_78D54170 
X-CRM114-Status: GOOD (  17.89  )
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

On 3/3/2024 10:09 PM, Baochen Qiang wrote:
> Now that all infrastructure is in place and ath11k is fixed to handle all the
> corner cases, power down the ath11k firmware during suspend and power it back
> up during resume. This fixes the problem when using hibernation with ath11k PCI
> devices.
> 
> For suspend, two conditions needs to be satisfied:
>         1. since MHI channel unprepare would be done in late suspend stage,
>            ath11k needs to get all QMI-dependent things done before that stage.
>         2. and because unprepare MHI channels requires a working MHI stack,
>            ath11k is not allowed to call mhi_power_down() until that finishes.
> So the original suspend callback is separated into two parts: the first part
> handles all QMI-dependent things in suspend callback; while the second part
> powers down MHI in suspend_late callback. This is valid because kernel calls
> ath11k's suspend callback before all suspend_late callbacks, making the first
> condition happy. And because MHI devices are children of ath11k device
> (ab->dev), kernel guarantees that ath11k's suspend_late callback is called
> after QRTR's suspend_late callback, this satisfies the second condition.
> 
> Above analysis also applies to resume process. so the original resume
> callback is separated into two parts: the first part powers up MHI stack
> in resume_early callback, this guarantees MHI stack is working when
> QRTR tries to prepare MHI channels (kernel calls QRTR's resume_early callback
> after ath11k's resume_early callback, due to the child-father relationship);
> the second part waits for the completion of restart, which won't fail now
> since MHI channels are ready for use by QMI.
> 
> Another notable change is in power down path, we tell mhi_power_down() to not
> to destroy MHI devices, making it possible for QRTR to help unprepare/prepare
> MHI channels, and finally get us rid of the probe-defer issue when resume.
> 
> Also change related code due to interface changes.
> 
> Tested-on: WCN6855 hw2.0 PCI WLAN.HSP.1.1-03125-QCAHSPSWPL_V1_V2_SILICONZ_LITE-3.6510.30
> 
> Tested-by: Takashi Iwai <tiwai@suse.de>
> Signed-off-by: Kalle Valo <quic_kvalo@quicinc.com>
> Signed-off-by: Baochen Qiang <quic_bqiang@quicinc.com>

As was the case in the MHI patch, this looks strange. If you are adding
Kalle's SOB just because he was a proxy for v1, please remove it. But if
Kalle provided significant modifications then you should add a
Co-developed-by: tag.

/jeff

