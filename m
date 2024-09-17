Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CE8B6CAC581
	for <ath11k@archiver.kernel.org>; Tue, 17 Sep 2024 14:51:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:CC:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=nbGtzBxAlbgIm97/cNG5R95eJg4LGVDNeZiOuoQsdeo=; b=in/DL8HUNnbeTaiQVsaBnHDnWR
	PW4+JG8lNO2224YiDOs72k0M/3ImIl+iMv2z8oc/Z3ycUJcx3AA4Ck2wG5dOlcbgrEYZCzLRW8HFG
	Fs4W03xVNP6xQ9U5EIPIH2cDfDXYfb6rq1+Fib004XmJDAqvr9ZGos/lcImT0BkCRpHa4DywhbMvb
	p/k4D+C80FTK6ML3wCWi86a8OEDa2qNWtAu+b2dJk1vL5wOaOFq5LYkgIiaeMA+uotorsPhAhq6MV
	XcUmoCv/gmheviPj91gAxf44qMK/S24hWIDhmcbn6yF31cuDJM/pgSPzzK5qBYLhfm+t8eznLf8md
	MQtzEpIQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1sqZXs-00000006LOx-1hbb;
	Tue, 17 Sep 2024 14:51:12 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1sqZXq-00000006LOd-0Hqw
	for ath11k@lists.infradead.org;
	Tue, 17 Sep 2024 14:51:11 +0000
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 48H1jtkB025608;
	Tue, 17 Sep 2024 14:51:09 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	nbGtzBxAlbgIm97/cNG5R95eJg4LGVDNeZiOuoQsdeo=; b=a3utGVtTiv7KuxKg
	6rV4WxhArV1rnBGWL4fOdVMS8cIXA/VgAy14kQvLYNhOYICRF69c5SMrTy6mdKK5
	4AvISucjpqWVrgOPoC8Dd1R/YhoPvhNua3PIFCHtxAlEirY0zwuemmkRiOaLymAV
	JpdAVSmCC0timpxRus86tEk70KyNY27Yy1uN5H1cTM+pMtAFVB+gW2k3004BLXq9
	/KjDk8cgqHw/sGRk0eVTyrkGVyECWWi4j6LP2bfCgVX4oOIhq1T3bR9sfvGNHpK/
	dNazGhpcXpihxzuMYZZTSygncLMlbIXLSGETJIfq3wjvZnAky0pA9lfTzwKFmOQE
	1cucVg==
Received: from nalasppmta03.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 41n4gcy1bg-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 17 Sep 2024 14:51:08 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA03.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 48HEp8pC018585
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 17 Sep 2024 14:51:08 GMT
Received: from [10.111.182.118] (10.49.16.6) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Tue, 17 Sep
 2024 07:51:07 -0700
Message-ID: <0279cc0e-c225-468f-b228-f1910f95f2d7@quicinc.com>
Date: Tue, 17 Sep 2024 07:51:07 -0700
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 1/2] wifi: ath11k: move update channel list from update
 reg worker to reg notifier
To: Kang Yang <quic_kangyang@quicinc.com>, <ath11k@lists.infradead.org>
CC: <linux-wireless@vger.kernel.org>
References: <20240906033200.472-1-quic_kangyang@quicinc.com>
 <20240906033200.472-2-quic_kangyang@quicinc.com>
From: Jeff Johnson <quic_jjohnson@quicinc.com>
Content-Language: en-US
In-Reply-To: <20240906033200.472-2-quic_kangyang@quicinc.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.49.16.6]
X-ClientProxiedBy: nalasex01a.na.qualcomm.com (10.47.209.196) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-ORIG-GUID: nlQz5mmP7YQ__PnCCt76GHs9BNOjUneg
X-Proofpoint-GUID: nlQz5mmP7YQ__PnCCt76GHs9BNOjUneg
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 malwarescore=0 suspectscore=0
 bulkscore=0 clxscore=1015 spamscore=0 adultscore=0 lowpriorityscore=0
 mlxlogscore=999 impostorscore=0 mlxscore=0 priorityscore=1501 phishscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.19.0-2408220000
 definitions=main-2409170106
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240917_075110_152395_53CF875C 
X-CRM114-Status: GOOD (  14.21  )
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

On 9/5/2024 8:31 PM, Kang Yang wrote:
> From: Wen Gong <quic_wgong@quicinc.com>
> 
> Currently ath11k call regulatory_set_wiphy_regd() in ath11k_regd_update()
> to notify the reg domain change to cfg80211 and update channel list by
> reg_work, then ath11k immediately update channel list to firmware by
> ath11k_reg_update_chan_list(). 
> 
> callstack:
> ath11k_regd_update
> ->regulatory_set_wiphy_regd
>            -> schedule_work(&reg_work)
> -> ath11k_reg_update_chan_list
> 
> They are running in two threads, it leads the channel list data out of
> sync caused by muti-threads without synchronization. At this time,
> ath11k may update wrong channel list to firmware because the reg_work
> still running or even hasn't started yet.
> 
> The correct flow is after reg_work update the channel list according to
> new reg domain, ath11k call ath11k_reg_update_chan_list() and update the
> new channel list to firmware.
> 
> reg_call_notifier()(finally it will call ath11k_reg_notifier()) will be
> called to by reg_work to notify ath11k when it finishes the channel
> list update. So at this time, call ath11k_reg_update_chan_list() in
> reg_call_notifier() with initiator type NL80211_REGDOM_SET_BY_DRIVER.
> Then ath11k_reg_update_chan_list() will use the correct channel list.
> 
> Tested-on: WCN6855 hw2.0 PCI WLAN.HSP.1.1-03125-QCAHSPSWPL_V1_V2_SILICONZ_LITE-3
> 
> Fixes: f45cb6b29cd3 ("wifi: ath11k: avoid deadlock during regulatory update in ath11k_regd_update()")
> Signed-off-by: Wen Gong <quic_wgong@quicinc.com>
> Signed-off-by: Kang Yang <quic_kangyang@quicinc.com>
Acked-by: Jeff Johnson <quic_jjohnson@quicinc.com>


