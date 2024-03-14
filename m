Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 43400C54E67
	for <ath11k@archiver.kernel.org>; Thu, 14 Mar 2024 15:05:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:CC:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=MJMU6Qoh7AZDZUKtL/bMo4bto1ABZh3rkz5XpjNQs2c=; b=qJRU9LfO2XptHHlnUrFI/qT1/e
	90n9VXriZMXZtyaepVrURIiOMDzOl7cLWAabO93YuBrD1Z7qOyk47EGo7gDwsmpzvt9XlFist0/58
	Cdscb9w9fF7swy3OmH5p3A/+lpq3ZQCssFacZW3rv+1Ftf+AJIS1O4ZT+ku2ylhPNO6XqfMHp6m4P
	RvQZO1q3ehTjUevfaULMROqhWnrMgCoLldZwSg4HfBUI9IMrf2HIaMTVp84VSCUjPrXqpAfTyg357
	dq2HHxLtA/isK52OOREzluXEJl7mGWXHf2yLhsIk52UV5vAZ5+kj+STrSdRnQ/m112c4DkN8elvJ+
	v6t7dKxg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rkmdy-0000000Eks5-13Q2;
	Thu, 14 Mar 2024 15:05:18 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rkmdu-0000000Ekr1-0Ftj
	for ath11k@lists.infradead.org;
	Thu, 14 Mar 2024 15:05:16 +0000
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.17.1.24/8.17.1.24) with ESMTP id 42ECNsZ3031849;
	Thu, 14 Mar 2024 15:05:12 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	message-id:date:mime-version:subject:to:cc:references:from
	:in-reply-to:content-type:content-transfer-encoding; s=
	qcppdkim1; bh=MJMU6Qoh7AZDZUKtL/bMo4bto1ABZh3rkz5XpjNQs2c=; b=Ci
	evCYgVqXYZw+hjpsUnCseRzmR4IkZhjCwmqa/VhYABwP+3F2wl3GOND+I4zp84Oi
	t/1AjAhWzsFOXqrwa5Emlw6HRpaX/X0i/8NuQWk3B0GKuzUQrC7Rcxs2B1YSiNNv
	a+CbNXSB4vpyIc5NFjlFxcxzr/NFcQ3NzSWqQ8DdOobGReToQhyZRwIlJVFjFhff
	LLIX8PCAEH49xZ+rY+gwDAbp+5M4fVIivU4OutjR2RqMKOCK+HsTs/OKMd1xOdVC
	r0uMJjYpxA+7Hit13EkEjwnR3sXYuj6trZaJWfgtmAZxLCjsIz0AewuZmK0fNB9C
	V9GjNxu21xUcd77D80eA==
Received: from nalasppmta02.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3wuy3g0mne-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 14 Mar 2024 15:05:12 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA02.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 42EF5BMN023227
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 14 Mar 2024 15:05:11 GMT
Received: from [10.110.27.195] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1118.40; Thu, 14 Mar
 2024 08:05:11 -0700
Message-ID: <415bd131-7305-4e9b-8b14-c3104a23312a@quicinc.com>
Date: Thu, 14 Mar 2024 08:05:10 -0700
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] wifi: ath11k: remove duplicate definitions in wmi.h
Content-Language: en-US
To: Kang Yang <quic_kangyang@quicinc.com>, <ath11k@lists.infradead.org>
CC: <linux-wireless@vger.kernel.org>
References: <20240314021654.304451-1-quic_kangyang@quicinc.com>
From: Jeff Johnson <quic_jjohnson@quicinc.com>
In-Reply-To: <20240314021654.304451-1-quic_kangyang@quicinc.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: QfJJCnuFtI4LxZH8bh63u_JGbhR_l2I0
X-Proofpoint-ORIG-GUID: QfJJCnuFtI4LxZH8bh63u_JGbhR_l2I0
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.1011,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2024-03-14_12,2024-03-13_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 malwarescore=0 adultscore=0
 mlxscore=0 spamscore=0 phishscore=0 bulkscore=0 suspectscore=0
 mlxlogscore=951 priorityscore=1501 impostorscore=0 lowpriorityscore=0
 clxscore=1015 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2402120000 definitions=main-2403140112
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240314_080514_450196_C9A791E2 
X-CRM114-Status: GOOD (  13.84  )
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

On 3/13/2024 7:16 PM, Kang Yang wrote:
> There are some duplicate definitions in wmi.h, remove them.
> 
> No functional changes, compile tested only.
> 
> Signed-off-by: Kang Yang <quic_kangyang@quicinc.com>
> ---
>  drivers/net/wireless/ath/ath11k/wmi.h | 6 ------
>  1 file changed, 6 deletions(-)
> 
> diff --git a/drivers/net/wireless/ath/ath11k/wmi.h b/drivers/net/wireless/ath/ath11k/wmi.h
> index bb419e3abb00..9652f4eb2f32 100644
> --- a/drivers/net/wireless/ath/ath11k/wmi.h
> +++ b/drivers/net/wireless/ath/ath11k/wmi.h
> @@ -60,10 +60,6 @@ struct wmi_tlv {
>  #define WLAN_SCAN_MAX_HINT_BSSID         10
>  #define MAX_RNR_BSS                    5
>  
> -#define WLAN_SCAN_MAX_HINT_S_SSID        10
> -#define WLAN_SCAN_MAX_HINT_BSSID         10
> -#define MAX_RNR_BSS                    5
> -
>  #define WLAN_SCAN_PARAMS_MAX_SSID    16
>  #define WLAN_SCAN_PARAMS_MAX_BSSID   4
>  #define WLAN_SCAN_PARAMS_MAX_IE_LEN  256

This patch doesn't apply (when using b4 shazam) when trying to verify with the
'pending' branch due to a pending change to WLAN_SCAN_PARAMS_MAX_IE_LEN.

So I verified against ath-next instead.

I'll let Kalle comment on if he can handle the conflict himself or if he wants
a rebased patch.

Acked-by: Jeff Johnson <quic_jjohnson@quicinc.com>



