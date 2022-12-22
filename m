Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E10C7C4332F
	for <ath11k@archiver.kernel.org>; Thu, 22 Dec 2022 13:35:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:CC
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=e2pmQry16KvNufclA8SXvHPRdaNQO2I+2UQM0Z6+ie4=; b=VSVjk+W0aNYxxj
	QsneuonBwU4psVhwsXAfPRc0DAHW8abb2haKd9NCpyHD0+wwZ6eVx4ikvCOSBmXmf0+KiTxDxr81d
	LUNUFPN6q0XiJj8q4S0jLCktaCffMyKM5HMg2VvRCtVHC7FgkBDg5ntN0nygIAoEtgeIhb/YdASOz
	Bl8xEgm0669/FEJB7opRM5dhZI+lFPhyARQZtvMddOk0ziKNaJ/1ND84gLIVcFRgZs/o/Muvb7zcg
	wo3vWhIMXx/lqKQ8nbxpb/2SoAlyxpD8y9cWwCRY+mu0tXam9t7E6ZJ0hfRZz5OwqgASJnE25VTVv
	VraPx1pyiyBAoguet+cw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1p8LjG-00CScS-MY; Thu, 22 Dec 2022 13:35:22 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1p8KKi-00Bg8T-Fq
	for ath11k@lists.infradead.org; Thu, 22 Dec 2022 12:05:58 +0000
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 2BMBmY1L015206;
	Thu, 22 Dec 2022 12:05:53 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=from : to : cc :
 subject : date : message-id : mime-version : content-transfer-encoding :
 content-type; s=qcppdkim1;
 bh=r/pPEbroEmGbejvtkaFEgasQ1s3Bh3a8Jr/qPya89Iw=;
 b=eXF3NFI2PspEnrZ7uEaBWKYYG/68d3J6FyG0Qbefmm2rbj1vrYymLieEhiJn4m/9dHEA
 4qDB1g1ABuU3BBG/N5+gDqZf5V2v5CFOeuu0BoL502DUuJFBym46AbxwYmikuvFQfzwJ
 7t+gSQ4jd3FrPnry3CAKVSG7mH7X08Bq+hsvcDPm8XUKgD9JPUuQwrljyNkM+pHpTHDy
 wY2n1Joplxgj50/JYk9ZUENZGiBKtVwfFDt2hhWiRAKmopT56qeR6JnVtuTzRRPaeRE9
 guFX73GBLjCdrX/1KeFUiQdKmg4kUYSitlpDO1plF1J7V2z2zYC+lgxlY+nD8FlG5VQt Jg== 
Received: from nalasppmta05.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3mm5r2j2vm-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 22 Dec 2022 12:05:53 +0000
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA05.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 2BMC5q5Y012341
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 22 Dec 2022 12:05:52 GMT
Received: from youghand-linux.qualcomm.com (10.80.80.8) by
 nalasex01a.na.qualcomm.com (10.47.209.196) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.986.36; Thu, 22 Dec 2022 04:05:50 -0800
From: Youghandhar Chintala <quic_youghand@quicinc.com>
To: <ath11k@lists.infradead.org>, <johannes@sipsolutions.net>
CC: <linux-wireless@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        <quic_mpubbise@quicinc.com>,
        Youghandhar Chintala <quic_youghand@quicinc.com>
Subject: [PATCH 0/2] Update the channel list if the change in channel flags 
Date: Thu, 22 Dec 2022 17:35:27 +0530
Message-ID: <20221222120529.31436-1-quic_youghand@quicinc.com>
X-Mailer: git-send-email 2.38.0
MIME-Version: 1.0
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: SgtG3stDz-2jJBmmxQ_-XzQBBylySYjf
X-Proofpoint-ORIG-GUID: SgtG3stDz-2jJBmmxQ_-XzQBBylySYjf
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.923,Hydra:6.0.545,FMLib:17.11.122.1
 definitions=2022-12-22_06,2022-12-22_01,2022-06-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 mlxscore=0 lowpriorityscore=0
 priorityscore=1501 phishscore=0 mlxlogscore=781 malwarescore=0 bulkscore=0
 impostorscore=0 spamscore=0 clxscore=1011 adultscore=0 suspectscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2212070000
 definitions=main-2212220105
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221222_040556_642593_6353BDF1 
X-CRM114-Status: GOOD (  16.66  )
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "ath11k" <ath11k-bounces@lists.infradead.org>
Errors-To: ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org

There are connection failures in hidden SSID case when the device is with
default reg domain WW.
For WW reg domain most of the 5 GHz channels are passive. When device
listens to the beacon on that channel, the driver is updating its channel
flag but firmware is not aware of it and firmware is not sending probes
on that channels.
Due to this, we are seeing connection failures when the device is tries to
connect with hidden SSID AP.
Whenever the driver detects a channel flag change, send the updated channel
list command to the firmware.

Youghandhae Chintala (2):
  wifi: cfg80211: Add beacon hint notifier support
  wifi: ath10k: update the channel list if change in channel flags.

 drivers/net/wireless/ath/ath10k/mac.c | 11 +++++++++++
 include/net/cfg80211.h                |  2 ++
 net/wireless/reg.c                    |  5 ++++-
 3 files changed, 17 insertions(+), 1 deletion(-)

-- 
2.38.0


-- 
ath11k mailing list
ath11k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath11k
