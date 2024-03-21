Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AEC6AC54E58
	for <ath11k@archiver.kernel.org>; Thu, 21 Mar 2024 20:24:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:CC:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=aSC/hwgBiHdEXRtLyH9E+zGRrOtf2nwYRVkjGuq1Ym4=; b=nYZtczF8vA07nLPgn57jRnv/L+
	8HtMVbxcKyjYHP3Q7YJCIIIiunIJ2kwgPeVrWwxMpOcMOI1jGiIukoN3YHO2605QHCrP0B6wtTWGz
	yOXU65kM4ENRUmc0nj17L4IKaYu3nuF2PtZtjlEvVzQq2SUcOBsEvGqVDc9IKAHMSRiH5wBJnnU1T
	lfmvZMf5pxQBCUVDv1OiZNv6k6uux8WFY7Da0jPHZusJUTH5ZwEQz79XGQQN2yADMhH4i3MzI0q5v
	itDlUWHQl98oK5/yJY4Xztr5QH8WZG/IU+zygKfZ/inLJrvPOB9KbHF37JQeStmNGyP7uG9o31xxE
	7BcSB+ZQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rnOxX-00000004W4K-08H2;
	Thu, 21 Mar 2024 20:24:19 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rnOxU-00000004W3y-1CWK
	for ath11k@lists.infradead.org;
	Thu, 21 Mar 2024 20:24:17 +0000
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.17.1.24/8.17.1.24) with ESMTP id 42LJ64pY028676;
	Thu, 21 Mar 2024 20:24:15 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	message-id:date:mime-version:subject:to:cc:references:from
	:in-reply-to:content-type:content-transfer-encoding; s=
	qcppdkim1; bh=aSC/hwgBiHdEXRtLyH9E+zGRrOtf2nwYRVkjGuq1Ym4=; b=S7
	EYDVTWFHCbrwqtM6n9G5rJkZT0qBmQB+Xuo9pb65dXawvn9pZ1UoSLKDgb9PaVh/
	L8xd/1VOy4s5HFY7ssFqSh4fy/ATBbnQoQqWl3NSuAJYvYj61wc5tw6fNEg0LmqX
	JnZvP6bYjPNgNlO2bD2l/x7PI4KkcPo+pINjuNoLH0biYAOgpMChWRuxc8w8s92b
	llPx7DM++RfJG6RxTnUX/WavnEIwUnUfGlNMp+l9YEzZE8Aojrv4yZfAfmYAzMYy
	MXsBYn9bVGXRsgL/g2gMzyZ9PAIAN0lBYcf3o8zSSi6V3vwaisJMyJ/83SQCANJi
	7NLBF1NkAXEt82W3ZvWw==
Received: from nalasppmta05.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3x0trh84t3-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 21 Mar 2024 20:24:15 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA05.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 42LKOE8F014854
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 21 Mar 2024 20:24:14 GMT
Received: from [10.110.74.135] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1118.40; Thu, 21 Mar
 2024 13:24:14 -0700
Message-ID: <23c3a9c9-b2fb-4d35-916b-94cdd96a62aa@quicinc.com>
Date: Thu, 21 Mar 2024 13:24:13 -0700
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 0/2] wifi: cfg80211/ath12k: Add support to rx retry
 stats
Content-Language: en-US
To: Hari Chandrakanthan <quic_haric@quicinc.com>, <ath11k@lists.infradead.org>
CC: <linux-wireless@vger.kernel.org>, <ath12k@lists.infradead.orgi>
References: <20240319134522.4021062-1-quic_haric@quicinc.com>
From: Jeff Johnson <quic_jjohnson@quicinc.com>
In-Reply-To: <20240319134522.4021062-1-quic_haric@quicinc.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: zoZHw6SIRJkdHDv-UgS_D-t4mF7Td6Bi
X-Proofpoint-ORIG-GUID: zoZHw6SIRJkdHDv-UgS_D-t4mF7Td6Bi
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.1011,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2024-03-21_12,2024-03-21_02,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 priorityscore=1501 mlxscore=0
 phishscore=0 malwarescore=0 suspectscore=0 impostorscore=0 adultscore=0
 spamscore=0 clxscore=1011 mlxlogscore=727 bulkscore=0 lowpriorityscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.19.0-2403140001
 definitions=main-2403210152
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240321_132416_384305_DC9A934B 
X-CRM114-Status: GOOD (  12.49  )
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

On 3/19/2024 6:45 AM, Hari Chandrakanthan wrote:
> This patch series adds support to count station level rx retries.
> 
> wifi: cfg80211/mac80211: Add support to rx retry stats
> wifi: ath12k: Add support to rx retry stats
> 
> Tested-on: QCN9274 hw1.0 PCI WLAN.WBE.1.2.1-00148-QCAHKSWPL_SILICONZ-1
> 
> Hari Chandrakanthan (2):
>   wifi: cfg80211/mac80211: Add support to rx retry stats
>   wifi: ath12k: Add support to rx retry stats
> 
>  drivers/net/wireless/ath/ath12k/core.h   | 1 +
>  drivers/net/wireless/ath/ath12k/dp_mon.c | 8 ++++++++
>  drivers/net/wireless/ath/ath12k/hal_rx.h | 7 ++++++-
>  drivers/net/wireless/ath/ath12k/mac.c    | 3 +++
>  include/net/cfg80211.h                   | 2 ++
>  include/uapi/linux/nl80211.h             | 3 +++
>  net/mac80211/rx.c                        | 6 ++++++
>  net/mac80211/sta_info.c                  | 5 +++++
>  net/mac80211/sta_info.h                  | 1 +
>  net/wireless/nl80211.c                   | 1 +
>  10 files changed, 36 insertions(+), 1 deletion(-)
> 

Incorrectly sent to the ath11k list and not the ath12k list.
But please don't repost just due to that

cc'ing the ath12k list as an FYI


