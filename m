Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8D029C5473A
	for <ath11k@archiver.kernel.org>; Tue, 27 Aug 2024 21:24:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:CC:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=6ATruHzgf+ZRTibHdRDA0EM9Ge4yqYIFW8Zi7HPoOt0=; b=juz/nV53LQkvvPk1oxn291UStz
	DS79pL7gAEVJqahPmC33VX+Bii1KRoOgKRYoXzdQnKQy60GR5TmUbRAS5sFuCvc/++ValiKh3vu+k
	tcNFLBfzK1tln78D4pRbVMkpkPX1LGuMky0k/cN/tVBr6nqa1U5tQByjjlXiGsR/dywM4IoNqgTOk
	uq86ac3YnVT1vDCC5mCBlxcEYEsoy8GJyQlf5Eu7/2XrTkU0uvGjYosYl2NYBUVOWTP4ZKs2L78rT
	5mBr74BylhWCZ9Guz+6zlqnHqWdzKeNurENQ3Jm0tCfEJWD+dXIvCpzfzTjfHf5wKDA1YF8mVA7pS
	WUQF4EPA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sj3g8-0000000Csdq-0TGS;
	Tue, 27 Aug 2024 21:24:40 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sj3fV-0000000CsVj-1Pec
	for ath11k@lists.infradead.org;
	Tue, 27 Aug 2024 21:24:02 +0000
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 47RJl4Qx004601;
	Tue, 27 Aug 2024 21:24:01 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	6ATruHzgf+ZRTibHdRDA0EM9Ge4yqYIFW8Zi7HPoOt0=; b=e6X+6BJE//UK4f2B
	niTRUnv4eeXg4p7oxiw4CymJqkzopzofqD7GQhr46WOQkG6KlydpxRGOb7P9/Wg3
	taTFWB9DgdKfEBO4FiHTWMwKbDuVR1WgnP1kE+IOLJ+IHTRdtNaAKPLCaxpLYwQp
	gPq4k+Y/9ZTl8FMSWeKBwkNo/VvLBG3mZJIrVDpB3fibIk8eEHan4BrKjHyhD6F4
	Pko8XhU1LzFJV7TJibD+e6pK944L1nP2fJAvYuTPfVYTxVso7kjYC89zKvTid404
	kP9YTbGNucdzEQPeU7L61pyEWVutM8GpFbeyi2ilRiTMWId27hhaxnqnvy+Q+W7B
	smnUYw==
Received: from nalasppmta04.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4199yt27ym-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 27 Aug 2024 21:24:00 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA04.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 47RLO0RH018660
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 27 Aug 2024 21:24:00 GMT
Received: from [10.111.180.74] (10.49.16.6) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Tue, 27 Aug
 2024 14:23:59 -0700
Message-ID: <e6d674b3-fcf8-4a0c-b7c7-24865870cc0d@quicinc.com>
Date: Tue, 27 Aug 2024 14:23:59 -0700
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 3/3] wifi: ath11k: fix leaking station RX/TX stats in
 reset scenario
To: Baochen Qiang <quic_bqiang@quicinc.com>, <ath11k@lists.infradead.org>
CC: <linux-wireless@vger.kernel.org>
References: <20240826014942.87783-1-quic_bqiang@quicinc.com>
 <20240826014942.87783-4-quic_bqiang@quicinc.com>
From: Jeff Johnson <quic_jjohnson@quicinc.com>
Content-Language: en-US
In-Reply-To: <20240826014942.87783-4-quic_bqiang@quicinc.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.49.16.6]
X-ClientProxiedBy: nalasex01a.na.qualcomm.com (10.47.209.196) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: TzaidvqHj0LjKl5DrWIApPjVzdW-yeOY
X-Proofpoint-ORIG-GUID: TzaidvqHj0LjKl5DrWIApPjVzdW-yeOY
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.28.16
 definitions=2024-08-27_10,2024-08-27_01,2024-05-17_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 phishscore=0 mlxlogscore=985
 suspectscore=0 malwarescore=0 spamscore=0 impostorscore=0 clxscore=1015
 bulkscore=0 priorityscore=1501 mlxscore=0 adultscore=0 lowpriorityscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.19.0-2407110000
 definitions=main-2408270157
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240827_142401_427379_BC3411B8 
X-CRM114-Status: UNSURE (   9.78  )
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

On 8/25/2024 6:49 PM, Baochen Qiang wrote:
> Currently ath12k_sta::rx_stats/tx_stats would only get freed when the station
> transit from NONE to NOTEXIST state within ath11k_mac_op_sta_state(). However
> in reset scenario, there is no chance for it to go through such transition.
> Further, after reset, when a new connection to AP starts, ath12k_sta is zerod
> in NOTEXIST to NONE transition, making rx_stats/tx_stats leaked:
> 
> Kmemleak reports:
> unreferenced object 0xffff9a3cd0a23400 (size 1024):
>   backtrace (crc 21ee4c52):
>     kmalloc_trace_noprof+0x2ba/0x360
>     ath11k_mac_op_sta_state+0x1b6/0xca0 [ath11k]
>     drv_sta_state+0x11e/0x9c0 [mac80211]
>     sta_info_insert_rcu+0x469/0x880 [mac80211]
>     sta_info_insert+0x10/0x80 [mac80211]
>     ieee80211_prep_connection+0x295/0x950 [mac80211]
>     ieee80211_mgd_auth+0x230/0x5a0 [mac80211]
>     cfg80211_mlme_auth+0xeb/0x2a0 [cfg80211]
> 
> Add a new function which frees them, and call it during reset to fix this issue.
> 
> Tested-on: WCN6855 hw2.0 PCI WLAN.HSP.1.1-03125-QCAHSPSWPL_V1_V2_SILICONZ_LITE-3.6510.30
> 
> Fixes: d5c65159f289 ("ath11k: driver for Qualcomm IEEE 802.11ax devices")
> Signed-off-by: Baochen Qiang <quic_bqiang@quicinc.com>
Acked-by: Jeff Johnson <quic_jjohnson@quicinc.com>



