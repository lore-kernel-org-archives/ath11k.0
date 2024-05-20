Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6773AC25B77
	for <ath11k@archiver.kernel.org>; Mon, 20 May 2024 21:13:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:CC:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=xYBI3s9zbQFrZaAYDGWNnmHK3hZZH/hJu0ShJO0Ceg8=; b=COLM7S6XAcIxO+i6FNsiUtjQgv
	2r3aT60NQV0MqjrahCnDsi8vrp17qnmecFJspid2sRbrU84L5m5KFE59xH4yB3tE/QHkPXfCOeeu/
	rqan0bQiVFMXQfNShsZrk6xlKryxzZ6XoCOtkN2/j/mohNfmDkv4qce7n1tvY2HblLme/EpYcnH4v
	YGZ9w4nATDNRhnmx2eR/xTFBP7jWTcYc3FfekDcD6I/pknXTZoRvjpyQHORzHVzM6hczv2cfYm8s3
	tcjbkBaMVhQ7dZvmLHU6WYORecjnnb1QJ/jbGpVWGKTO8/CbQ+g7MFhwnw/pz+/dsR41hMk6Ly+iS
	/oBEPa+Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s9AKE-0000000FZDL-3UrU;
	Mon, 20 May 2024 21:13:42 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s9AKB-0000000FZCU-22uq
	for ath11k@lists.infradead.org;
	Mon, 20 May 2024 21:13:40 +0000
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 44KBjM9C023459;
	Mon, 20 May 2024 21:13:36 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	message-id:date:mime-version:subject:to:cc:references:from
	:in-reply-to:content-type:content-transfer-encoding; s=
	qcppdkim1; bh=xYBI3s9zbQFrZaAYDGWNnmHK3hZZH/hJu0ShJO0Ceg8=; b=lF
	SqI2zd2YPI9jAHuzkIEHlYmAftk0WJ68xeKy7xMGuovbibNTbpp1dCMx3kX4jBic
	QPBLb6FnTCOAI8KRxLNCui0oOdEw4NpJ0MIIe00C0pH5RPk+vS/4vxQHgNaeKluc
	lEu8iH+aVzcp5bPFv27t8fPH+xRxG/+o1rq8Ckk/xFhaOQKbjQVACzZtDeX9wN1i
	Tw+ya4lYzRl6BIbgZ2pf/n4Puhidy3VqOjdWjJTpGeesmfCo5KOwc7cnO9ZyazyC
	9VQDIZwWgDV77F8tkj2AIms2BZxVBCL6+CXt0ni37aCFRIvFou5CpEKF6JNr6Uf4
	i0HigSKYzDgCriv0EGOw==
Received: from nalasppmta02.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3y6pq5c9an-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 20 May 2024 21:13:36 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA02.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 44KLDZ7u022550
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 20 May 2024 21:13:35 GMT
Received: from [10.110.17.44] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Mon, 20 May
 2024 14:13:34 -0700
Message-ID: <8efdfb76-c9fa-4622-bf78-185937439062@quicinc.com>
Date: Mon, 20 May 2024 14:13:34 -0700
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] wifi: ath11k: fix WCN6750 firmware crash caused by 17
 num_vdevs
Content-Language: en-US
To: Carl Huang <quic_cjhuang@quicinc.com>, <ath11k@lists.infradead.org>
CC: <linux-wireless@vger.kernel.org>
References: <20240520030757.2209395-1-quic_cjhuang@quicinc.com>
From: Jeff Johnson <quic_jjohnson@quicinc.com>
In-Reply-To: <20240520030757.2209395-1-quic_cjhuang@quicinc.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: JFSLwCTM8EG22QStGrTACYZnArVizhgb
X-Proofpoint-ORIG-GUID: JFSLwCTM8EG22QStGrTACYZnArVizhgb
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.650,FMLib:17.12.28.16
 definitions=2024-05-20_11,2024-05-17_03,2024-05-17_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 impostorscore=0
 malwarescore=0 adultscore=0 lowpriorityscore=0 priorityscore=1501
 suspectscore=0 spamscore=0 clxscore=1015 mlxlogscore=999 mlxscore=0
 bulkscore=0 phishscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2405010000 definitions=main-2405200169
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240520_141339_566457_28D0CAAA 
X-CRM114-Status: UNSURE (   8.86  )
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

On 5/19/2024 8:07 PM, Carl Huang wrote:
> WCN6750 firmware crashes because of num_vdevs changed from 4 to 17
> in ath11k_init_wmi_config_qca6390() as the ab->hw_params.num_vdevs
> is 17. This is caused by commit f019f4dff2e4("wifi: ath11k: support
> 2 station interfaces") which assigns ab->hw_params.num_vdevs directly
> to config->num_vdevs in ath11k_init_wmi_config_qca6390(), therefore
> WCN6750 firmware crashes as it can't support such a big num_vdevs.
> 
> Fix it by assign 3 to num_vdevs in hw_params for WCN6750 as 3 is
> sufficient too.
> 
> Fixes: f019f4dff2e4 ("wifi: ath11k: support 2 station interfaces")
> Reported-by: Luca Weiss <luca.weiss@fairphone.com>
> Closes: https://lore.kernel.org/r/D15TIIDIIESY.D1EKKJLZINMA@fairphone.com/
> Tested-on: WCN6855 hw2.0 PCI WLAN.HSP.1.1-03125-QCAHSPSWPL_V1_V2_SILICONZ_LITE-3
> Tested-on: WCN6750 hw1.0 AHB WLAN.MSL.1.0.1-01371-QCAMSLSWPLZ-1
> 
> Signed-off-by: Carl Huang <quic_cjhuang@quicinc.com>

Acked-by: Jeff Johnson <quic_jjohnson@quicinc.com>


