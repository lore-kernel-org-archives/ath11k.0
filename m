Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D666FC5478A
	for <ath11k@archiver.kernel.org>; Wed, 21 Feb 2024 19:46:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:CC:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=j9l9WM1qKo7UMdTBEdEi1ZcMt204djLcampA01wtfYM=; b=iQ7zeTmDwVsen0YkQUHOvoSM/s
	SPrEJE6vSBb1a2qZ4DMIuIYSiTBbanrODME6dZdejDlEW3wwqEuIDtoEJ/GHgnY3OdEJ8rniqOC80
	R+gXt38ga0cnadLFkerRiZb2cCqz+6LklsUBKMnxYHZB4cSaoOb1Zd+DGu5n6cFRYiUT/udHmlDxW
	XORrjtiR5zP7BEYKUcTqh+m3J+VFRe5AekaB1vaPbrzvt1K0D9JGlp4kYQoXvqBVlHfk0jsdFLOwz
	FxaWF65GBfG8hVo1iRRrLLTXfvjp7DFrJjT7YKEJjfNZvZukX0t+3N6NnD052/RJkqwyfKyfubFJK
	pf/A/+lA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rcsXZ-00000002Lcq-281b;
	Wed, 21 Feb 2024 19:46:01 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rcrR5-0000000281K-2wBU
	for ath11k@lists.infradead.org;
	Wed, 21 Feb 2024 18:35:20 +0000
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.17.1.24/8.17.1.24) with ESMTP id 41LAPkSC031361;
	Wed, 21 Feb 2024 18:35:14 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	message-id:date:mime-version:subject:to:cc:references:from
	:in-reply-to:content-type:content-transfer-encoding; s=
	qcppdkim1; bh=j9l9WM1qKo7UMdTBEdEi1ZcMt204djLcampA01wtfYM=; b=Kf
	2VAcjTKImtM2ODEnhjCUm3nZqd0o8PCl3blq6meVSo9ouDeqbR0ADCH/ARG+iono
	SLua+2z6q609F4LSArdR83z7hOeFgwsDPxAu+FitoV4lfNc8SvnnAyc2+wga8hag
	0/vp73wjL4/YXqNSdQTc1Dn/CtRUwoxtoUEKVFKWx1T/q9pHUZ4xOgcQqC7KCbdL
	7vhxtiG8lk8D8bfml5vWV3fXdG5MaFn1v7Ob9lbIlNx0kHFVBEfhCcdhl83RFzd4
	UjJNtCa3OE62PbnepDGqEJNlQfpbKtadAbwLn0XreqOzmy+9cWjmUq6M3p/nlr5e
	znguyBdWu2Q2DVZY3fnw==
Received: from nalasppmta04.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3wdckv9jdh-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 21 Feb 2024 18:35:14 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA04.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 41LIZDXA009405
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 21 Feb 2024 18:35:13 GMT
Received: from [10.110.34.22] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1118.40; Wed, 21 Feb
 2024 10:35:13 -0800
Message-ID: <93397cef-e088-419e-be5b-e7394e088ad0@quicinc.com>
Date: Wed, 21 Feb 2024 10:35:12 -0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 3/3] wifi: ath11k: support hibernation
Content-Language: en-US
To: Baochen Qiang <quic_bqiang@quicinc.com>, <ath11k@lists.infradead.org>,
        <mhi@lists.linux.dev>
CC: <linux-wireless@vger.kernel.org>, <linux-arm-msm@vger.kernel.org>
References: <20240221030026.10553-1-quic_bqiang@quicinc.com>
 <20240221030026.10553-4-quic_bqiang@quicinc.com>
From: Jeff Johnson <quic_jjohnson@quicinc.com>
In-Reply-To: <20240221030026.10553-4-quic_bqiang@quicinc.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: ABNJpMUmCDuXYEFoVC_wK083Gm9hgXr9
X-Proofpoint-ORIG-GUID: ABNJpMUmCDuXYEFoVC_wK083Gm9hgXr9
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.1011,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2024-02-21_06,2024-02-21_02,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 lowpriorityscore=0
 spamscore=0 malwarescore=0 mlxlogscore=934 impostorscore=0 mlxscore=0
 bulkscore=0 phishscore=0 priorityscore=1501 clxscore=1015 suspectscore=0
 adultscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2402120000 definitions=main-2402210145
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240221_103516_061472_313FF37E 
X-CRM114-Status: GOOD (  16.94  )
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

On 2/20/2024 7:00 PM, Baochen Qiang wrote:
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
Reviewed-by: Jeff Johnson <quic_jjohnson@quicinc.com>


