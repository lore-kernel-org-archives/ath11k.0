Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A45E6C4332F
	for <ath11k@archiver.kernel.org>; Mon, 11 Dec 2023 21:54:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:CC:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=cYLWy8Z8XT8bQFQDNBoDTx4c/HY8Xs5/LrvAdqo0ps0=; b=puntrHb9lLWYMkCUue2a0IfljM
	q93QL4T2R6W6cKWsGPZ1iYUYOlZr0bYvkiRiJAAPDslpHUdTjtw5aLZNhq43Sb9odDO7h9gP3b7bh
	nFJbJ7rsEIXeiXtf4PgEnr24LtU2ZTCyW09SE5OJjELq9rG0WzNi7DS2nPwnILRtKGhgKkcQ9RUVN
	85RUFiS+48EYcaccOsW/YwEKXYn0xprW+DY1/B57BAY7VPhRQnyhkrryhvAbOIveYn5rflfdJyMr9
	hnF2AXnBw+eM/o2InTyIiIyWiV+qMQKVK8MNAa1W6I+jy7YwL7CW3wX0Qzc53nMSOz380QPb9RH90
	WxmyIheA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1rCoEf-008rXH-19;
	Mon, 11 Dec 2023 21:54:45 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1rCoEd-008rVr-0u
	for ath11k@lists.infradead.org;
	Mon, 11 Dec 2023 21:54:44 +0000
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.17.1.24/8.17.1.24) with ESMTP id 3BBLXKjp001032;
	Mon, 11 Dec 2023 21:54:43 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	message-id:date:mime-version:subject:to:cc:references:from
	:in-reply-to:content-type:content-transfer-encoding; s=
	qcppdkim1; bh=cYLWy8Z8XT8bQFQDNBoDTx4c/HY8Xs5/LrvAdqo0ps0=; b=Lc
	kOxhbqmPbqfZWLiRqZJElpZl/aDdpvzqDKOKAGzYZHx8+AsopBeYh6znQY9lB94q
	a0oUmZLP7blOfF9xbIMSt8Qkrk+GHpfSJr0uSeuaN5EC7NGZtgsiRym05aeb38gB
	ysA34oJUeNHQjDOmMLi6g7S7cBNxZU4MYmyVRv89D/x/09Bkepcr/DIWmXveLhvt
	m8QnqakjTn0Hd4O+skj05WoQa64FILNaPrT99wyZrZrTjK4FEi/5YFqdrBgk681g
	DUKtc2gyAgNmVT7T2HgSaQHW1UX0hjPU44enfwUepQk1+fdufRK3svBVesufCtRo
	9UANp8wKVAVXUM/zKFtQ==
Received: from nalasppmta02.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3ux25u1bc9-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 11 Dec 2023 21:54:42 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA02.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 3BBLsgkF000399
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 11 Dec 2023 21:54:42 GMT
Received: from [10.110.106.103] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1118.40; Mon, 11 Dec
 2023 13:54:41 -0800
Message-ID: <23780d61-d236-4742-acc0-fdd1d230773a@quicinc.com>
Date: Mon, 11 Dec 2023 13:54:41 -0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v9 12/12] wifi: ath11k: use WMI_VDEV_SET_TPC_POWER_CMDID
 when EXT_TPC_REG_SUPPORT for 6 GHz
Content-Language: en-US
To: Baochen Qiang <quic_bqiang@quicinc.com>, <ath11k@lists.infradead.org>
CC: <linux-wireless@vger.kernel.org>
References: <20231211062216.382164-1-quic_bqiang@quicinc.com>
 <20231211062216.382164-13-quic_bqiang@quicinc.com>
From: Jeff Johnson <quic_jjohnson@quicinc.com>
In-Reply-To: <20231211062216.382164-13-quic_bqiang@quicinc.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-ORIG-GUID: DE3SMGOg0pY9pWUN-kucaGZA-F4IAmOP
X-Proofpoint-GUID: DE3SMGOg0pY9pWUN-kucaGZA-F4IAmOP
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.997,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2023-12-09_01,2023-12-07_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 clxscore=1015 spamscore=0
 mlxscore=0 bulkscore=0 lowpriorityscore=0 phishscore=0 impostorscore=0
 malwarescore=0 suspectscore=0 adultscore=0 priorityscore=1501
 mlxlogscore=957 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2311290000 definitions=main-2312110180
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231211_135443_391570_B0273663 
X-CRM114-Status: UNSURE (   8.44  )
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

On 12/10/2023 10:22 PM, Baochen Qiang wrote:
> From: Wen Gong <quic_wgong@quicinc.com>
> 
> When station is connected to a 6 GHz AP, it has 2 ways to configure
> the power limit to firmware. The first way is to send 2 WMI commands
> WMI_PDEV_PARAM_TXPOWER_LIMIT2G/WMI_PDEV_PARAM_TXPOWER_LIMIT5G to
> firmware, the second way is to send WMI_VDEV_SET_TPC_POWER_CMDID to
> firmware which include more parameters for power control.
> 
> When firmware supports SERVICE_EXT_TPC_REG, it means firmware supports
> WMI_VDEV_SET_TPC_POWER_CMDID, then ath11k selects the second way.
> 
> Tested-on: WCN6855 hw2.0 PCI WLAN.HSP.1.1-03125-QCAHSPSWPL_V1_V2_SILICONZ_LITE-3.6510.23
> 
> Signed-off-by: Wen Gong <quic_wgong@quicinc.com>
> Signed-off-by: Baochen Qiang <quic_bqiang@quicinc.com>
Acked-by: Jeff Johnson <quic_jjohnson@quicinc.com>


