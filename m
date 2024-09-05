Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 008F8CD5BB8
	for <ath11k@archiver.kernel.org>; Thu,  5 Sep 2024 19:09:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:CC:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=A2CNT/QmIpCkJQq/GecEyJBDYeCGIgBSihLWMhsKSZI=; b=FA6sYf9uku2GKFeYffn+jEvh/0
	uX5I7rC2Cn+uOMPXb28XVqUxc53uwE5g/iVoc8E0qcoglFDwollYwTsGpy0xGTaD8yF/DEQunQ2/c
	rFsbg14auOsvJc1jiYDbVkN83eKMW4NL50ckwuwfiycujF+TptQoQSBstPfQId/c7YZ7InnyNmU76
	iBy7mfhjXPfWgbd0Y/3ucah7fetJq1DTwMDqfgSME1GAPNsaK8kukiA31Punh/xiKU3fadIRu9B8F
	DeB5lxD+XW7S00C2VObp7JOXJhlCa5qLIIRiEXexod2wSJUGxLPdMChoknulPugBCTZMsl8Frs6w7
	+uPfwc7Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1smHrc-00000009Yzd-2AWO;
	Thu, 05 Sep 2024 19:09:52 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1smHrZ-00000009Yyz-2yZR
	for ath11k@lists.infradead.org;
	Thu, 05 Sep 2024 19:09:51 +0000
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 485IQGHo001232;
	Thu, 5 Sep 2024 19:09:45 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	A2CNT/QmIpCkJQq/GecEyJBDYeCGIgBSihLWMhsKSZI=; b=lnVzNylsC1yPtZJk
	Cw7FGXiIdpT90SBowwcSSI5Wxhg+nUWNlSc40dVs1puxhaQpJ3+DYgR7JyfLyzAv
	Kt3kTvFl6RPQ7T12eq9kL1wajxTWR4O2bxKK6rug0BUtY4BIpUdes+fbN8wUD61T
	Rnz+Jbb51+HuVlIqx2R7PcU//XFSxxxJ1C7ICDx42fsZSaa+qhpQfvwIjqU1ULXO
	1MsgOtiwVKEw1W9T6MkEJNoAQTiQbiQXbveetnqOiQ8RBsm2aHv4lvXBbpwsJBFW
	XQkuxQGEfXtssg5mv+m0/5UrUeJgyXequzLJsB5eIQVygHCFSS6gBSViqNxeWMFO
	QtTbZw==
Received: from nalasppmta02.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 41fhwt82ux-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 05 Sep 2024 19:09:45 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA02.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 485J9iaI016548
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 5 Sep 2024 19:09:44 GMT
Received: from [10.227.110.203] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Thu, 5 Sep 2024
 12:09:43 -0700
Message-ID: <ce020663-4314-488e-a73f-55a09369d730@quicinc.com>
Date: Thu, 5 Sep 2024 12:09:43 -0700
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] wifi: ath11k: fix the stack frame size warning in
 ath11k_vif_wow_set_wakeups
To: Miaoqing Pan <quic_miaoqing@quicinc.com>, <kvalo@kernel.org>
CC: <ath11k@lists.infradead.org>, <linux-wireless@vger.kernel.org>
References: <20240829075253.657667-1-quic_miaoqing@quicinc.com>
From: Jeff Johnson <quic_jjohnson@quicinc.com>
Content-Language: en-US
In-Reply-To: <20240829075253.657667-1-quic_miaoqing@quicinc.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: httPf6ynvTt1pwOdmR6T6lxQrB-vOmPG
X-Proofpoint-ORIG-GUID: httPf6ynvTt1pwOdmR6T6lxQrB-vOmPG
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-05_13,2024-09-05_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 suspectscore=0
 impostorscore=0 clxscore=1015 priorityscore=1501 malwarescore=0
 adultscore=0 mlxscore=0 spamscore=0 bulkscore=0 mlxlogscore=844
 phishscore=0 lowpriorityscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.19.0-2408220000 definitions=main-2409050142
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240905_120949_906225_E83C2209 
X-CRM114-Status: UNSURE (   6.93  )
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

On 8/29/2024 12:52 AM, Miaoqing Pan wrote:
> Fix the following W=1 kernel build warning:
> 
> drivers/net/wireless/ath/ath11k/wow.c: In function ‘ath11k_vif_wow_set_wakeups’:
> drivers/net/wireless/ath/ath11k/wow.c:461:1: warning: the frame size of 1352 bytes is larger than 1024 bytes [-Wframe-larger-than=]
> 
> Remove the nonessential variable 'struct cfg80211_pkt_pattern
> old_pattern' by relocating bitmask to bytemask conversion into
> ath11k_wow_convert_8023_to_80211().
> 
> Tested-on: WCN6855 hw2.1 PCI WLAN.HSP.1.1-04358-QCAHSPSWPL_V1_V2_SILICONZ_LITE-1
> 
> Signed-off-by: Miaoqing Pan <quic_miaoqing@quicinc.com>
Acked-by: Jeff Johnson <quic_jjohnson@quicinc.com>


