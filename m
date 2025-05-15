Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 444B2C3ABDD
	for <ath11k@archiver.kernel.org>; Thu, 15 May 2025 17:37:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:CC:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=28kQjLma94V279htA/iRUZ04/rNy/zv5ChEU82zgGeo=; b=mCaUHsbwXAPJ097ZScKJ0dbKTU
	jl5v2QbUSkSmDQKh7RyRNe804OL66zV/7Y6WfUL0kNkb1f+gdI0sJpe4RyckTSuwLhpaBWxPYKXh2
	JhoDMKK8jsAedoKxbTQjTzQK13NXOjX+L78QvMqEbtEzPUQBPNNFYTxhNKe8KeCzeR+maItPSbcLP
	NJ3ofI9qZSp/72MpqWhmxp7ajjwol799LbEkL7keaGI3SXRFMMDWhflI+2k5GdlXzgYTUgarwKCPO
	Lb7ynxkaZkms0dpoGUlFYk7ZbKxIXqmMMnNzjt4FQtnc77TZU+2SnguVqHXDrVEP0eiCElMoQ/K7K
	fGPJC2ow==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uFcWA-00000001Ro8-3co7;
	Thu, 15 May 2025 17:37:14 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uFcVx-00000001RjC-0ebw
	for ath11k@lists.infradead.org;
	Thu, 15 May 2025 17:37:02 +0000
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 54FEFBbT018190;
	Thu, 15 May 2025 17:36:56 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	28kQjLma94V279htA/iRUZ04/rNy/zv5ChEU82zgGeo=; b=CNw/STc3afD4WTn1
	yh1dl7t7QFwPNjMuYDbE5m0vbCJNcQ2+kKFi+wmEQ6xllgQY7/s622i/BnsiTZsX
	OVHEC9Tg4u1W6Ts6tJmda6GiIpOxRkdlIS6E7IKnIr+p7BKjkHIkXXcxAM/H34pM
	prk5+iN520le/vuPo0/99hgTbjJdxSY/IfNHowzVvT5n0Rk84CA1amZLkoMnIA7K
	5aWqA/MmoEX3wxcJCbvbpnS08KOph9Qvgs7RMEY7ywCtei6y61QeOOfZfiiWYNec
	+xUB7LB51atfYoJrJhBirOXaIDuijD8Eo6QT2bQqXosTnX5d+9SGaVvlevnTp1+w
	GP8AMw==
Received: from nalasppmta02.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 46mbcnq2qs-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 15 May 2025 17:36:56 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA02.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 54FHathE025188
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 15 May 2025 17:36:55 GMT
Received: from [10.216.54.71] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Thu, 15 May
 2025 10:36:52 -0700
Message-ID: <45758365-5f5a-6650-ed30-1c394b9b81de@quicinc.com>
Date: Thu, 15 May 2025 23:06:48 +0530
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
Subject: Re: [PATCH] wifi: ath11k: clean-up during wrong ath11k_crypto_mode
Content-Language: en-US
To: Rodrigo Gobbi <rodrigo.gobbi.7@gmail.com>, <jjohnson@kernel.org>
CC: <~lkcamp/patches@lists.sr.ht>, <linux-wireless@vger.kernel.org>,
        <ath11k@lists.infradead.org>, <linux-kernel@vger.kernel.org>
References: <20250515004258.87234-1-rodrigo.gobbi.7@gmail.com>
From: Vasanthakumar Thiagarajan <quic_vthiagar@quicinc.com>
In-Reply-To: <20250515004258.87234-1-rodrigo.gobbi.7@gmail.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-ORIG-GUID: PReVneVIMXdp61uFzSqd7vfdKRfVb5QO
X-Authority-Analysis: v=2.4 cv=aIbwqa9m c=1 sm=1 tr=0 ts=68262638 cx=c_pps
 a=ouPCqIW2jiPt+lZRy3xVPw==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=GEpy-HfZoHoA:10 a=IkcTkHD0fZMA:10 a=dt9VzEwgFbYA:10 a=pGLkceISAAAA:8
 a=FEClEzSTKUsJnvQcYz4A:9 a=QEXdDO2ut3YA:10
X-Proofpoint-GUID: PReVneVIMXdp61uFzSqd7vfdKRfVb5QO
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNTE1MDE3NCBTYWx0ZWRfX8I8f056ANsqr
 89fH4uIJyLmC3HgoVn3Rvx6Zl36BTt/61BiOID4jxePEQCkmxYxnCD+G6iaJXrkt5tUqC5shWQM
 ZUMMmMAO71IL2LJIwTeEaHwyKRKZEHJNzyyeKpxw4utPrrg0iUx/H1ntsfs5c5oitrIsCWAPGfg
 WfYdFss4T8UaGhgyqdHvON1OzjFqOaLbfxK1btisN5S/Xnvc37NQyY+aeN9SbwKBNx+rxKnFfue
 ATij+b85fLQ9uh2Y8/C9uFIq7iz1yy3CtQt8uh69AWthwR9O3bWtYpEUMtOrtOBcwLdurP3fmm2
 hJjCh/Pvse8Qj1zXRwfiYqP7S6R5n6OQAZiacRNjePLmeRCP9yrdsh3VxYlQboWQlBm+XGhxh5H
 6gcIaJrmUgLpnGiPhGNgryOjGQyA7im7Qx7DJuTl+wpg6NmRtHeWr2x5ZVxnI5ImJy4qAmgt
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-05-15_07,2025-05-15_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 mlxlogscore=957 malwarescore=0 bulkscore=0 impostorscore=0
 clxscore=1011 phishscore=0 suspectscore=0 mlxscore=0 spamscore=0
 lowpriorityscore=0 priorityscore=1501 classifier=spam authscore=0 authtc=n/a
 authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2505070000 definitions=main-2505150174
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250515_103701_323665_DE4A6CDA 
X-CRM114-Status: GOOD (  11.74  )
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



On 5/15/2025 6:10 AM, Rodrigo Gobbi wrote:
> if ath11k_crypto_mode is invalid (not ATH11K_CRYPT_MODE_SW/ATH11K_CRYPT_MODE_HW),
> ath11k_core_qmi_firmware_ready() will not undo some actions that was previously
> started/configured. It's reasonable to undo things during this condition, despite
> the value used at ath11k_crypto_mode not being valid in this case.
> 
> Signed-off-by: Rodrigo Gobbi <rodrigo.gobbi.7@gmail.com>
> ---
> Smatch got the following error:
> 
> drivers/net/wireless/ath/ath11k/core.c:2166 ath11k_core_qmi_firmware_ready() warn: missing unwind goto?
> 

This warning message can be included in the commit message itself.

> When the ath11k_crypto_mode, which is a module param, is not
> ATH11K_CRYPT_MODE_SW/HW, clean-up actions are not triggered.
> Considering the whole ath11k_core_qmi_firmware_ready() function,
> during potential errors, those actions are properly triggered.
> I'm suggesting a little change over the default case to clean things up.
> Tks and regards.

This can be dropped as it does not provide any additional information.

Vasanth

