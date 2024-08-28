Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D083DC5B54A
	for <ath11k@archiver.kernel.org>; Wed, 28 Aug 2024 15:43:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:CC:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=fz+jyOUHiqicb0q5TClyvt2Yxf+WHzOKQwY7LgY+Ep4=; b=UvUwY31slbjND0k3xHvbmNRPfy
	kT+Pej5NQQyxZvM8qT/fnj2jgTXcyNCM7zo1yex7Jz++NNpRh9M0c3TU/PeEUsAjIQfATKik6m3G6
	5iEl9Y/fF0QQN3x1WNk2wF7ftE9oLDw/a7oXs7RYcCpBwHoPQY8CvJ+ztDJqJGPCXEp3JUC1WVetc
	1QI/DrBegVDQYuity1tvAr+ws0PnLzkrLH5LIDYZP8z+WjidF0TBQL4dCjFKjyb1vGC6af916LvzE
	wEgiCWPeRFtImSGHWgMxRhxBCDMr+bYkC8rCk1kdxAHqjMExNy/LC3XHZwnsY5TWs2CPbpXBqQlm8
	3i0Hc89A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sjKpB-0000000G1oB-1j5D;
	Wed, 28 Aug 2024 15:43:09 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sjKOT-0000000FvMw-0UGL
	for ath11k@lists.infradead.org;
	Wed, 28 Aug 2024 15:15:34 +0000
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 47SBHSc6009010;
	Wed, 28 Aug 2024 15:15:31 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	fz+jyOUHiqicb0q5TClyvt2Yxf+WHzOKQwY7LgY+Ep4=; b=fUbZQBpKXEJXXnzE
	8tDvYIuIJEmxN7g3FJ26yb3ZDer3M/s/z9VwQEXuWFmzfktfNIAVr/mZV+oOFPIE
	RaqPwmQUVF5QnSTy4n/h/El7A1L+LvQBPm6vqANfCpR4k8vh51djc/rd73mRbp7z
	/lD7J+3/BDuhMFhezUlZxW04qJJCuHBHL3fLZXWYg7KjvFFvhAB0lSqhN0FTCTE2
	ILS21oZLbnE3sFGUduh2g4FFABiprODqSAGHVRvjrmfZ6yVWrH/Uhz+rCgwRFoda
	vpMINK143Fzl6U+t8OxToDK4PFAe1skFme6qnZUGmnFI1YKEEVoLbqzKiazR4dP3
	aaaF8Q==
Received: from nalasppmta03.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 419px5j6rg-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 28 Aug 2024 15:15:30 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA03.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 47SFFFNw005701
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 28 Aug 2024 15:15:15 GMT
Received: from [10.227.110.203] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Wed, 28 Aug
 2024 08:15:14 -0700
Message-ID: <6c525c85-1439-4a5c-aacd-f094dd882180@quicinc.com>
Date: Wed, 28 Aug 2024 08:15:14 -0700
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] wifi: ath11k: enable fw_wmi_diag_event hw param for
 WCN6750
To: Balaji Pothunoori <quic_bpothuno@quicinc.com>,
        <ath11k@lists.infradead.org>
CC: <linux-wireless@vger.kernel.org>
References: <20240828103043.2413-1-quic_bpothuno@quicinc.com>
Content-Language: en-US
From: Jeff Johnson <quic_jjohnson@quicinc.com>
In-Reply-To: <20240828103043.2413-1-quic_bpothuno@quicinc.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-ORIG-GUID: xTIcptSioBqdMBYmmYc0IaakWYsxvmj0
X-Proofpoint-GUID: xTIcptSioBqdMBYmmYc0IaakWYsxvmj0
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.28.16
 definitions=2024-08-28_05,2024-08-27_01,2024-05-17_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 phishscore=0 clxscore=1011
 adultscore=0 suspectscore=0 lowpriorityscore=0 mlxlogscore=843 spamscore=0
 priorityscore=1501 bulkscore=0 mlxscore=0 malwarescore=0 impostorscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.19.0-2407110000
 definitions=main-2408280110
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240828_081533_289403_D80A60ED 
X-CRM114-Status: UNSURE (   9.05  )
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

On 8/28/2024 3:30 AM, Balaji Pothunoori wrote:
> WCN6750 firmware sends the log messages via WMI_DIAG_EVENTID only
> when the host driver enables the same via QMI_WLANFW_WLAN_INI_REQ_V01
> QMI message. This is further controlled via fw_wmi_diag_event.
> Hence set this flag to true for the firmware to send the logs.
> These logs are further collected in the user space through
> the trace infrastructure.
> 
> Tested-on: WCN6750 hw1.0 AHB WLAN.MSL.2.0.c2-00233-QCAMSLSWPLZ-1
> 
> Signed-off-by: Balaji Pothunoori <quic_bpothuno@quicinc.com>
Acked-by: Jeff Johnson <quic_jjohnson@quicinc.com>


