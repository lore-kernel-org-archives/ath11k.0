Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F1205C35274
	for <ath11k@archiver.kernel.org>; Mon, 18 Dec 2023 21:13:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:CC:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=3D6I2GS9uD8Onl+FwDcPmN6v5Oh4wiAB+PjzvHHyMck=; b=SugLHvmOux7l7momSljWTI3Edd
	NTtV2L9Fu3i5xzpW9m7ANhYZsO0SdzhGQo6aOENqss96NpsAKsWVhuSeEVh5hgjw93rl+rABhFc1h
	9yD2vY7hKqvGHHHwXrNgKiySxy1tE/bylurNO8MK3fHw0bMFdG5Dm7AAa3S2k7GLFu11zwdLaTIko
	koiwIBYoPeuCqhc1hhmemcQHbNKl3SfYZesgrDl7BSqqkUCAXVfCQ8/Frf78m5dNcSiNGIgbtBriU
	sZYSYAtzX4SJ1dhlurddk1JRkHcVAykwmoiUDw3Pti2cIeOxwUTvSKPLZt1wy3PtJ/yeWi0BKAoNG
	rFJM9AIw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1rFKvV-00C6Qe-0R;
	Mon, 18 Dec 2023 21:13:25 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1rFKvR-00C6QI-25
	for ath11k@lists.infradead.org;
	Mon, 18 Dec 2023 21:13:23 +0000
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.17.1.24/8.17.1.24) with ESMTP id 3BIES3f4006283;
	Mon, 18 Dec 2023 21:13:19 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	message-id:date:mime-version:subject:to:cc:references:from
	:in-reply-to:content-type:content-transfer-encoding; s=
	qcppdkim1; bh=3D6I2GS9uD8Onl+FwDcPmN6v5Oh4wiAB+PjzvHHyMck=; b=jr
	+n81/ZLAmlNy6Askt9NQxyF/JYo2tMCV95pccQQVmINm9Foie6APzJR6h2oCPwK5
	tj8qz/ucnSytbxiyazoGEtyZAvOLGsFOV+YNNHmSmIqW2TDC9f1N/47MOgbLBbrd
	FJviBkaqJmS0HrBCOIbylbzRPyJOQrFgNzOw9lpjgsnUGekMRjv9jV/11dcvUinh
	D5TR//ouBM7me4WoDtA2oXjVXiIzf41ByoNqyTwk3aHS5PsSg4d5KPvdbKEokhtI
	1qgx56q+fYOHUcqP6kegXzx31ph00Tw9C3yRq04e+2yDsGhbBdFHC/5kuzv12oqo
	23f6fhjXWYcOHCLN7S4Q==
Received: from nalasppmta01.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3v2jx0ht9j-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 18 Dec 2023 21:13:19 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA01.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 3BILDIXw013036
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 18 Dec 2023 21:13:18 GMT
Received: from [10.110.4.21] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1118.40; Mon, 18 Dec
 2023 13:13:17 -0800
Message-ID: <8b754d39-e079-4ea0-bcc1-94e0cf14d5ae@quicinc.com>
Date: Mon, 18 Dec 2023 13:13:17 -0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v10 09/12] wifi: ath11k: fill parameters for vdev set tpc
 power WMI command
Content-Language: en-US
To: Baochen Qiang <quic_bqiang@quicinc.com>, <ath11k@lists.infradead.org>
CC: <linux-wireless@vger.kernel.org>
References: <20231218085844.2658-1-quic_bqiang@quicinc.com>
 <20231218085844.2658-10-quic_bqiang@quicinc.com>
From: Jeff Johnson <quic_jjohnson@quicinc.com>
In-Reply-To: <20231218085844.2658-10-quic_bqiang@quicinc.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-ORIG-GUID: _2DcA8Sz2N93FDWehjvhhTjX7-71s3kh
X-Proofpoint-GUID: _2DcA8Sz2N93FDWehjvhhTjX7-71s3kh
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.997,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2023-12-09_02,2023-12-07_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 bulkscore=0 clxscore=1015
 phishscore=0 priorityscore=1501 suspectscore=0 impostorscore=0
 lowpriorityscore=0 adultscore=0 mlxscore=0 malwarescore=0 spamscore=0
 mlxlogscore=729 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2311290000 definitions=main-2312180158
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231218_131321_828228_E4E9D7A5 
X-CRM114-Status: UNSURE (   6.82  )
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

On 12/18/2023 12:58 AM, Baochen Qiang wrote:
> From: Wen Gong <quic_wgong@quicinc.com>
> 
> Prepare the parameters which are needed for WMI command WMI_VDEV_SET_TPC_POWER_CMDID.
> 
> Tested-on: WCN6855 hw2.0 PCI WLAN.HSP.1.1-03125-QCAHSPSWPL_V1_V2_SILICONZ_LITE-3.6510.23
> 
> Signed-off-by: Wen Gong <quic_wgong@quicinc.com>
> Acked-by: Jeff Johnson <quic_jjohnson@quicinc.com>
> Signed-off-by: Baochen Qiang <quic_bqiang@quicinc.com>
> ---
...
>  drivers/net/wireless/ath/ath11k/mac.c | 284 ++++++++++++++++++++++++++
>  drivers/net/wireless/ath/ath11k/mac.h |   3 +

drivers/net/wireless/ath/ath11k/mac.h: QuIC copyright missing 2023

>  2 files changed, 287 insertions(+)


