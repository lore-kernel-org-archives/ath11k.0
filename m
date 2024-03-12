Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6C563C54E49
	for <ath11k@archiver.kernel.org>; Tue, 12 Mar 2024 05:22:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:CC:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=+iuDYozJEoJXFte+dvHwWqMUc6lkfhn7XcMXI+LUu9s=; b=xcfY7KkZ8WnTcPSBxa1jgNlwXZ
	q3IC8yFzTn4LZrvdRqSzFQdb9qjrMsJZ3M0ptjBY/06pSC62jenC295BbpoQ1YjxrDB8L/oI4W/dj
	k7lYM7CNSIZdxrSlNVy+Kk0i7/lCJOS5HWuI4WuwY3ywXqf0+GMFsdaYedQc60Le1GFQpz/VuS31b
	2Qnd2bN+xbg1Y4NziJSze/EE7OMuTW6fzRM2obOzVS2TgGMoGszqps/Xsli/DTgyqsODfLmrbQFKD
	panV7N5H2qa/Kja3QKNLgeaTD927NblgRXpZAimX9vjkvrCciqeQW30GwA1KjZiv0DD2CHawPkjXC
	8zOwaAAg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rjub7-00000004OLJ-3oc3;
	Tue, 12 Mar 2024 05:22:45 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rjub3-00000004OKS-2ro3
	for ath11k@lists.infradead.org;
	Tue, 12 Mar 2024 05:22:43 +0000
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.17.1.24/8.17.1.24) with ESMTP id 42C4FUE2024327;
	Tue, 12 Mar 2024 05:22:37 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	message-id:date:mime-version:subject:to:cc:references:from
	:in-reply-to:content-type:content-transfer-encoding; s=
	qcppdkim1; bh=+iuDYozJEoJXFte+dvHwWqMUc6lkfhn7XcMXI+LUu9s=; b=o7
	fEXDU3pNTr+mPhijpQjeEYuvDVHU7QPcfoTl3w+MZiTDa9cCj0vnKAfQvqPPO2TL
	WKxe2pPjjz75onKNlqJRxZhX5RWe7PPJbZaYJBjQNp3pOZDMBYAMkFE9+IxLQGP4
	XRVmqyV78xCFKGZxcHqPAh1AIRMFMfcdPqbzTUNNLJjbQv3yrNvdqT1oOKEq6dqa
	CNrRH3NlanM1ZQ0gB8vm76n0f6dF28rNZY9z/T+CS3onLJOxkzG+ME2ktW5mKffT
	tSMdDwmPcIAzk4rOk8lWKlDzO2X+rrKgpsuVIL1dT8CzJrPqLDpE7Xb+j30K2UOw
	VtkOozkdktmkccgCxDLQ==
Received: from nalasppmta02.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3wt86tgwvy-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 12 Mar 2024 05:22:37 +0000 (GMT)
Received: from nalasex01b.na.qualcomm.com (nalasex01b.na.qualcomm.com [10.47.209.197])
	by NALASPPMTA02.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 42C5MAj5000689
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 12 Mar 2024 05:22:10 GMT
Received: from [10.253.9.188] (10.80.80.8) by nalasex01b.na.qualcomm.com
 (10.47.209.197) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1118.40; Mon, 11 Mar
 2024 22:22:09 -0700
Message-ID: <45d4ae89-70ff-4103-ad9f-ece3660924d0@quicinc.com>
Date: Tue, 12 Mar 2024 13:22:06 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 0/6] wifi: ath11k: P2P support for
 QCA6390/WCN6855/QCA2066
Content-Language: en-US
To: <ath11k@lists.infradead.org>, Kalle Valo <kvalo@kernel.org>,
        Kalle Valo
	<quic_kvalo@quicinc.com>
CC: <linux-wireless@vger.kernel.org>
References: <20240228093537.25052-1-quic_kangyang@quicinc.com>
From: Kang Yang <quic_kangyang@quicinc.com>
In-Reply-To: <20240228093537.25052-1-quic_kangyang@quicinc.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01b.na.qualcomm.com (10.47.209.197)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: DlfCUc4Tl6mp7x3kcK-j9BbUWWGYgA86
X-Proofpoint-ORIG-GUID: DlfCUc4Tl6mp7x3kcK-j9BbUWWGYgA86
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.1011,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2024-03-12_04,2024-03-11_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 clxscore=1015 malwarescore=0
 suspectscore=0 spamscore=0 priorityscore=1501 phishscore=0
 lowpriorityscore=0 bulkscore=0 mlxlogscore=999 impostorscore=0 mlxscore=0
 adultscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2402120000 definitions=main-2403120040
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240311_222241_883733_91DB0038 
X-CRM114-Status: GOOD (  11.72  )
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



On 2/28/2024 5:35 PM, Kang Yang wrote:
> Add P2P support for QCA6390/WCN6855/QCA2066.
> 
> v2:
>      1. patch #1, #4 and #6 have already been acked by Jeff.
>      2. patch #2: remove unnecessary initializer in
> ath11k_mac_setup_bcn_p2p_ie() and change judgement for P2P GO.
>      3. patch #3: verify the validity of descriptors number and remove
> blank line.
>      4. patch #5: change scan flag filter before
> ath11k_wmi_send_scan_start_cmd().
> 
> Kang Yang (6):
>    wifi: ath11k: change interface combination for P2P mode
>    wifi: ath11k: add P2P IE in beacon template
>    wifi: ath11k: implement handling of P2P NoA event
>    wifi: ath11k: change WLAN_SCAN_PARAMS_MAX_IE_LEN from 256 to 512
>    wifi: ath11k: change scan flag scan_f_filter_prb_req for
>      QCA6390/WCN6855/QCA2066
>    wifi: ath11k: advertise P2P dev support for QCA6390/WCN6855/QCA2066


Hi, kalle:
	We have a customer request for P2P on ath11k. They need us to upstream 
P2P feature. So could you help process this patchset?



> 
>   drivers/net/wireless/ath/ath11k/Makefile |   3 +-
>   drivers/net/wireless/ath/ath11k/core.c   |  20 ++-
>   drivers/net/wireless/ath/ath11k/mac.c    | 166 ++++++++++++++++++-----
>   drivers/net/wireless/ath/ath11k/p2p.c    | 149 ++++++++++++++++++++
>   drivers/net/wireless/ath/ath11k/p2p.h    |  22 +++
>   drivers/net/wireless/ath/ath11k/wmi.c    | 107 ++++++++++++++-
>   drivers/net/wireless/ath/ath11k/wmi.h    |  42 +++++-
>   7 files changed, 471 insertions(+), 38 deletions(-)
>   create mode 100644 drivers/net/wireless/ath/ath11k/p2p.c
>   create mode 100644 drivers/net/wireless/ath/ath11k/p2p.h
> 
> 
> base-commit: c39a5cfa0448f3afbee78373f16d87815a674f11

