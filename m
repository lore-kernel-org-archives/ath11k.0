Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9DA5DC54731
	for <ath11k@archiver.kernel.org>; Tue, 27 Aug 2024 21:24:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:CC:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=w+fxUiHiHPueOzRgw5JBaotNGvvazHhs8zICGYxeKnA=; b=oorQX9O0R1QAJT6hMgjB3OO+wh
	sh3HYc9aWOLBeEvZnDugHf8Siw/8ocqLOR38KJXrOSfO6C5b96azV+KGixtCHKmvsASuoA0hASj2J
	7iMIK2EEcIDckcHquUrlnN06jL7KW16Zqqso2SnVq69HxvZ51wz/8pU7Z914AIrVafOOPKEhp+u+e
	d7D5/TgP0JxVsmUxdQpSBuWDBt10/e0+DBH4c8hG0BewtMq7LuOePYMzf2fqPvVlNpdIKFRgZqKzL
	BVzkurWJy52Dv82tGFrpUrOhcSI8e6MO+x5ABqQRR1SgX3RcVJwoRf8nhILydkf6tOeP7WaUEOnM4
	2EkbA+QA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sj3g6-0000000Csd9-3d7N;
	Tue, 27 Aug 2024 21:24:39 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sj3fJ-0000000CsRj-2ilt
	for ath11k@lists.infradead.org;
	Tue, 27 Aug 2024 21:23:51 +0000
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 47RJkwOw018168;
	Tue, 27 Aug 2024 21:23:49 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	w+fxUiHiHPueOzRgw5JBaotNGvvazHhs8zICGYxeKnA=; b=osrUYKuF0xVPEDeh
	PEXP9tFA7bJZEL1vxwvQpnMfSR48oG/bMtg82kT5ITwpFm4eUezXRet6yOoxWA17
	Xzh0YsYCFQWhbTjtZww73htmU54ARLeAFeagxHriVdk3+niklDKfLsJ2TH3iu7oS
	kqWdUGvEM6G7R7xgYrziSFHQAB9ade4MMGmBYyZ6/DeWgtJAh1TXuspkKDoz0fXf
	AWhT3tk5SLxuYJfVzJylaYpgcnqaQJtLSzCng74CexRCw2//XcGm7j2KLN1AVJcW
	HFH1e1hYWsWS9idr9henyLmQob9ctFfVLFEBTV946GhkHjj9MyJslDYdjqOEQKjV
	vmlShA==
Received: from nalasppmta01.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4179810akm-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 27 Aug 2024 21:23:48 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA01.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 47RLNlIb020617
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 27 Aug 2024 21:23:47 GMT
Received: from [10.111.180.74] (10.49.16.6) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Tue, 27 Aug
 2024 14:23:47 -0700
Message-ID: <24340105-999a-4210-a74b-1cdc67de3678@quicinc.com>
Date: Tue, 27 Aug 2024 14:23:46 -0700
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/3] wifi: ath11k: refactor ath11k_dp_peer_cleanup()
To: Baochen Qiang <quic_bqiang@quicinc.com>, <ath11k@lists.infradead.org>
CC: <linux-wireless@vger.kernel.org>
References: <20240826014942.87783-1-quic_bqiang@quicinc.com>
 <20240826014942.87783-2-quic_bqiang@quicinc.com>
From: Jeff Johnson <quic_jjohnson@quicinc.com>
Content-Language: en-US
In-Reply-To: <20240826014942.87783-2-quic_bqiang@quicinc.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.49.16.6]
X-ClientProxiedBy: nalasex01a.na.qualcomm.com (10.47.209.196) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: 8yqUwEqCrtvi3ODOzcuOtSasqga3zJvh
X-Proofpoint-ORIG-GUID: 8yqUwEqCrtvi3ODOzcuOtSasqga3zJvh
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.28.16
 definitions=2024-08-27_10,2024-08-27_01,2024-05-17_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 bulkscore=0 impostorscore=0
 adultscore=0 mlxlogscore=906 spamscore=0 lowpriorityscore=0 clxscore=1015
 malwarescore=0 phishscore=0 priorityscore=1501 mlxscore=0 suspectscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.19.0-2407110000
 definitions=main-2408270157
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240827_142349_794725_3C848348 
X-CRM114-Status: GOOD (  11.44  )
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
> Currently ath11k_dp_peer_cleanup() acquires ab->base_lock inside itself. This is
> working because it is only called in below context where that lock is not held:
> 
> 	ath11k_mac_op_sta_state() --> ath11k_mac_station_remove()
> 
> In a upcoming patch that fixes memory leak in reset scenario, we need to do the
> same job as ath11k_dp_peer_cleanup(). However ab->base_lock is already held there
> so we can not directly call it.
> 
> So the decision is to move lock/unlock outside of ath11k_dp_peer_cleanup() such
> that we won't get deadlock in a context where the lock is already held. In order
> to make sure it is called with lock held, add LOCKDEP assertion there.
> 
> Tested-on: WCN6855 hw2.0 PCI WLAN.HSP.1.1-03125-QCAHSPSWPL_V1_V2_SILICONZ_LITE-3.6510.30
> 
> Signed-off-by: Baochen Qiang <quic_bqiang@quicinc.com>
Acked-by: Jeff Johnson <quic_jjohnson@quicinc.com>


