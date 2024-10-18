Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E631DD3F2BE
	for <ath11k@archiver.kernel.org>; Fri, 18 Oct 2024 22:16:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:CC:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ZNL0jqFWdQOGnm6VIGRZjM8Ug5MDoKzZo6g/fJk6yEQ=; b=O/7DRN1GYuntxDTvswFJhrNW28
	+NwSk10Zu/RV48XBgSHQu7caXty4NLVMzOxeniUUSm9TY+Zo1/fCGp/D8eCzbUuNgj6sxH8f0QWHM
	M/SWjjKKbD7mr5HDXRlgAg9Uc3V4pRU57XGLnQ0FxLFWKhgbGq2UxReu4wKA8RO4LczGFCJ5P5nio
	yZ1Oi4E9qhe2MWsqXDZAjhrnZJFZYWrxw4QfWA8IKX2oCEcqVlR1WCxbXufgqScHaIoJdJh6a+1lL
	0o7C/kDXv3KfRhU4KTHo8kyA4pf82kQVahGSdzU+S3sKM6sfY7MMKiEjgzb92H/8iqqrNDv0aPRfX
	uJCkaWDw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t1vGY-00000002AGh-01q6;
	Fri, 18 Oct 2024 22:16:14 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t1vGU-00000002AG1-3CGt
	for ath11k@lists.infradead.org;
	Fri, 18 Oct 2024 22:16:12 +0000
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 49ILK3ph005910;
	Fri, 18 Oct 2024 22:16:05 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	ZNL0jqFWdQOGnm6VIGRZjM8Ug5MDoKzZo6g/fJk6yEQ=; b=YMB18N2+Qh3akVQs
	Pp5WLxcVAPQcjtzfFgoSbhvv9iU4+20pnAESvRGfaVHOyDEbC2aWTBu+0dMhQ8m+
	K3FGAAzUa9daU1AyV6KkSTvnvlwnI8GauLfaK9cTYRaYw2uYbbIU5LCOj7ZNnEY3
	PofTrhvV5+sUPXtfcktX8NilIgYrhs4iooxap13wbA9zo6CKyw9CDNT3OAq9v1JL
	TCUIvlElbBw8A4hSBTbKWjMrT3ydi7xMJycXYwuIyxfumvJB7WzTpiZOhzjxUlQU
	WPjRGrQxZgVue6NU1yIE7RquB+vagGN4cgBIVRsZz56AjRSfd1HS0n/VbLeYcFad
	t6YTPw==
Received: from nalasppmta02.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 42b8rr3v8c-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 18 Oct 2024 22:16:04 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA02.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 49IMG3S0007991
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 18 Oct 2024 22:16:03 GMT
Received: from [10.48.241.209] (10.49.16.6) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Fri, 18 Oct
 2024 15:16:03 -0700
Message-ID: <379780f5-bf30-4452-aa9e-f1b6915b6389@quicinc.com>
Date: Fri, 18 Oct 2024 15:16:02 -0700
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC PULL] ath11k: move WCN6750 firmware to the device-specific
 subdir
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
        Kalle Valo
	<kvalo@kernel.org>, Jeff Johnson <jjohnson@kernel.org>,
        Bjorn Andersson
	<andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, <linux-firmware@kernel.org>
CC: <ath11k@lists.infradead.org>, <linux-arm-msm@vger.kernel.org>
References: <20241011061606.1612918-1-dmitry.baryshkov@linaro.org>
From: Jeff Johnson <quic_jjohnson@quicinc.com>
Content-Language: en-US
In-Reply-To: <20241011061606.1612918-1-dmitry.baryshkov@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.49.16.6]
X-ClientProxiedBy: nalasex01c.na.qualcomm.com (10.47.97.35) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: h04S1F-VDBdhS1TE6Z5Md8fSu7Jd0fL3
X-Proofpoint-ORIG-GUID: h04S1F-VDBdhS1TE6Z5Md8fSu7Jd0fL3
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 priorityscore=1501
 lowpriorityscore=0 bulkscore=0 spamscore=0 mlxlogscore=661 clxscore=1015
 mlxscore=0 suspectscore=0 phishscore=0 malwarescore=0 adultscore=0
 impostorscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2409260000 definitions=main-2410180142
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241018_151610_957840_04CD1CD2 
X-CRM114-Status: GOOD (  19.19  )
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

On 10/10/2024 11:16 PM, Dmitry Baryshkov wrote:
> The firmware under ath11k/WCN6750 can not be utilized on other devices using
> WCN6750 to provide WiFi (e.g. on the Qualcomm RB3 gen2 board).  This is an
> attempt to propose a solution by moving the file into device-specifig subdir.
> Other platforms can place firmware files in other subdirs, depending on the
> SoC.
> 
> Note, while performing the move I also propose squashing the firmware file.
> This is the practice recommended by the msm platform maintainers for the DSP
> firmware (not to mention that it also saves us from the extra symlinks). If
> Kalle, ath11k maintainer, objects, I will keep the firmware in the split form.
> 
> For now this is an RFC in order to gather opinion form respective platform and
> driver maintainers.
> 
> ----------------------------------------------------------------
> 
> The following changes since commit d55315295cccf8ce5dc288a74d75cf09b8063cfc:
> 
>   Merge branch 'superm1/qci-patches' into 'main' (2024-10-10 19:11:13 +0000)
> 
> are available in the Git repository at:
> 
>   https://gitlab.com/lumag/linux-firmware wcn6750-device-specific
> 
> for you to fetch changes up to abe8c109a2b4c422b627335d124473734c8790d8:
> 
>   ath11k: move WCN6750 firmware to the device-specific subdir (2024-10-10 22:26:20 +0300)
> 
> ----------------------------------------------------------------
> Dmitry Baryshkov (1):
>       ath11k: move WCN6750 firmware to the device-specific subdir
> 
>  WHENCE                                             |  12 ++----------
>  ath11k/WCN6750/hw1.0/{wpss.b04 => sc7280/wpss.mbn} | Bin 5819999 -> 7463728 bytes
>  ath11k/WCN6750/hw1.0/wpss.b00                      | Bin 340 -> 0 bytes
>  ath11k/WCN6750/hw1.0/wpss.b01                      | Bin 6848 -> 0 bytes
>  ath11k/WCN6750/hw1.0/wpss.b02                      | Bin 10300 -> 0 bytes
>  ath11k/WCN6750/hw1.0/wpss.b03                      | Bin 4096 -> 0 bytes
>  ath11k/WCN6750/hw1.0/wpss.b05                      | Bin 164332 -> 0 bytes
>  ath11k/WCN6750/hw1.0/wpss.b06                      | Bin 266684 -> 0 bytes
>  ath11k/WCN6750/hw1.0/wpss.b07                      | Bin 1176368 -> 0 bytes
>  ath11k/WCN6750/hw1.0/wpss.b08                      |   0
>  ath11k/WCN6750/hw1.0/wpss.mdt                      | Bin 7188 -> 0 bytes
>  11 files changed, 2 insertions(+), 10 deletions(-)
>  rename ath11k/WCN6750/hw1.0/{wpss.b04 => sc7280/wpss.mbn} (77%)
>  delete mode 100644 ath11k/WCN6750/hw1.0/wpss.b00
>  delete mode 100644 ath11k/WCN6750/hw1.0/wpss.b01
>  delete mode 100644 ath11k/WCN6750/hw1.0/wpss.b02
>  delete mode 100644 ath11k/WCN6750/hw1.0/wpss.b03
>  delete mode 100644 ath11k/WCN6750/hw1.0/wpss.b05
>  delete mode 100644 ath11k/WCN6750/hw1.0/wpss.b06
>  delete mode 100644 ath11k/WCN6750/hw1.0/wpss.b07
>  delete mode 100644 ath11k/WCN6750/hw1.0/wpss.b08
>  delete mode 100644 ath11k/WCN6750/hw1.0/wpss.mdt

I'm waiting for Kalle to respond, but at a minimum I suspect our internal
firmware tooling would be impacted by this change.

Kalle, do you have concerns or suggestions on how to handle this issue?

/jeff

