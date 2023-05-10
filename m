Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 72D8EC77B7C
	for <ath11k@archiver.kernel.org>; Wed, 10 May 2023 10:06:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:CC:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=z/c6jjFszF3sa2hBPzluRuQ2ljqlkkcU5nzoguBQYaw=; b=J7Ptf2kZv4wio6
	+YdFE3YJaQZQwJB28+3pu7lbjpa0lwdJO5N+wmjD5pPsofvFVI3DHRUNmLxcdvPItlmvYS12PW5+n
	YaeycOu2z/Z91jGSrZkEjT1UB4nJ7WjSPumeNIdhTmF7/KzlKAHS5HJn4xZCjkz3ysDs5qjrK7k7i
	sEKW4PrbRy1NSXDZoAh79STXmgqUkQfTMU7A3ZTMDk/VXoiIKqky+pLIJ6yMeQ+fVE3dqsJJjND1G
	2XMnWcZvUhc95OcWdm7WFm3uq90p7sRCh3zVBWVLMcpxOKZ5vAwOoVBCEgsRsbDUa1srYwhggcdzr
	lW61xdJ89IFO9OOj1dBg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1pwgiD-005ik5-0F;
	Wed, 10 May 2023 10:06:21 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1pwgiA-005ijT-0E
	for ath11k@lists.infradead.org;
	Wed, 10 May 2023 10:06:19 +0000
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 34A9sRZm026210;
	Wed, 10 May 2023 10:06:17 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=message-id : date :
 mime-version : subject : to : cc : references : from : in-reply-to :
 content-type : content-transfer-encoding; s=qcppdkim1;
 bh=J50TnRZJRGL4MPfE6XpJpXDFU7AOXsklpyeumS3hO9U=;
 b=XQUuRZe7IeDGncXrt8Rs5Daz1IH/7yw8BPQFIdEpYPhIXVHw2DVnxwWY4d5p83OERnGt
 S8X93iXgB8KhwNpWLfOP3chWGD5asEfS84o9Pe4iNgLlPgEQt3r1eUFGDY1hXQ+tGKyg
 Udw2ZVVIO/bzwxvT/v3+BRuQ5cn0sxFDb8P226ZltsUwJnaU099k1t31dwPjxpzW1+9B
 SpcoMEiG1cbuVcfK4L1Y3bMP02Fbg7z1OfNaBYISLAZlXcuFEmvZ/X52nJvEwTw6vPxh
 GpsM7QCbKeLf/PiFJmBIWmI1SY+/Cd/6EZFKxh4KOWtqZQ3lc7qblHhPMhTna00Zsdl6 oA== 
Received: from nasanppmta03.qualcomm.com (i-global254.qualcomm.com [199.106.103.254])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3qfrut9v91-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 10 May 2023 10:06:17 +0000
Received: from nasanex01a.na.qualcomm.com (nasanex01a.na.qualcomm.com [10.52.223.231])
	by NASANPPMTA03.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 34AA618O023634
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 10 May 2023 10:06:01 GMT
Received: from [10.201.192.62] (10.80.80.8) by nasanex01a.na.qualcomm.com
 (10.52.223.231) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.986.42; Wed, 10 May
 2023 03:06:00 -0700
Message-ID: <3a2c1732-e690-231e-d3aa-decbb72588de@quicinc.com>
Date: Wed, 10 May 2023 15:35:57 +0530
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.10.1
Subject: Re: [PATCH 0/2] ath11k: Send HT fixed rate in WMI peer fixed param
Content-Language: en-US
To: <ath11k@lists.infradead.org>
CC: <linux-wireless@vger.kernel.org>
References: <20230504092349.3542530-1-quic_mkenna@quicinc.com>
From: Maharaja Kennadyrajan <quic_mkenna@quicinc.com>
In-Reply-To: <20230504092349.3542530-1-quic_mkenna@quicinc.com>
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nasanex01a.na.qualcomm.com (10.52.223.231)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: yMJbKlmVn-D2VCY_j3rGHGiM8WbkYfbD
X-Proofpoint-ORIG-GUID: yMJbKlmVn-D2VCY_j3rGHGiM8WbkYfbD
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.254,Aquarius:18.0.942,Hydra:6.0.573,FMLib:17.11.170.22
 definitions=2023-05-10_04,2023-05-05_01,2023-02-09_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 spamscore=0 malwarescore=0
 priorityscore=1501 impostorscore=0 suspectscore=0 phishscore=0 bulkscore=0
 clxscore=1015 adultscore=0 lowpriorityscore=0 mlxscore=0 mlxlogscore=999
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2304280000
 definitions=main-2305100079
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230510_030618_224429_5166349C 
X-CRM114-Status: GOOD (  12.19  )
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
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Sender: "ath11k" <ath11k-bounces@lists.infradead.org>
Errors-To: ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org

Hi,

Ignore this patchset, I have sent the v2 version of this patchset by 
rebasing it on latest TOT.

> Due to the firmware behavior with HT fixed rate setting,
> HT fixed rate MCS with NSS > 1 are treated as NSS = 1
> HT rates in the firmware and enables the HT fixed rate of
> NSS = 1.
>
> This leads to HT fixed rate is always configured for NSS = 1
> even though the user sets NSS = 2 or > 1 HT fixed MCS in the
> set bitrate command.
>
> Currently HT fixed MCS is sent via WMI peer assoc command.
> Fix this issue, by sending the HT fixed rate MCS in WMI peer
> fixed param instead of sending in peer assoc command.
>
> Maharaja Kennadyrajan (2):
>    ath11k: Relocate the func ath11k_mac_bitrate_mask_num_ht_rates() and
>      change hweight16 to hweight8
>    ath11k: Send HT fixed rate in WMI peer fixed param
>
>   drivers/net/wireless/ath/ath11k/mac.c | 93 ++++++++++++++++++++++-----
>   1 file changed, 76 insertions(+), 17 deletions(-)
>

-- 
ath11k mailing list
ath11k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath11k
