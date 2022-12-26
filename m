Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B68A5C4708D
	for <ath11k@archiver.kernel.org>; Mon, 26 Dec 2022 08:33:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:CC
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=xXtSSXc18gRp+GR+pPC4cWRoqrrS65oCiTLaLoBboIM=; b=FKImaLIAhPhQnn
	HFdEMgUBGOK50MSbZelED58lXdk3br9VkmWNYdo1bMahSp+BGMzgTor7UO1++0idrDXY9rzqDNWgd
	Ps4DGQ3DHyXsSjvgMHJWrowF+wLK37hrKot525/A1CwYedUqGu51LGOlXVNxyVqPSWERrK6Edum0E
	ndu0Iv0YwztdT74AyyJJzvuPhOqlrX5v4MnnhfrX7c8NO1K0CSQQVhhoPGGA97lCyGNG2NQr2ADnQ
	rrEleR8RWJW8uuaOz3k5VyxzJg2H/s16aztpDksEeU/0nqOuzAetpWk4vrUgcQN9BETU/sFDfgSt5
	s6EpYZdyxm/LWgl6r8dQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1p9ivg-002hB0-Cw; Mon, 26 Dec 2022 08:33:52 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1p9ivb-002h93-Rj
	for ath11k@lists.infradead.org; Mon, 26 Dec 2022 08:33:50 +0000
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 2BQ613ik023054;
	Mon, 26 Dec 2022 08:33:44 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=from : to : cc :
 subject : date : message-id : mime-version : content-type; s=qcppdkim1;
 bh=JtBktoiPApKOwq9zVLTnK8tEIwQG9iT+PrZ1ZRozVCk=;
 b=N8Ik6PLvdIaEuiR7nWWU5zgqix94P0Ykha+1GTgQjlJTWakAWP7MeJXNyxcRnl6lYcWM
 ljhJ2ugt+a6Ia5QZMRb4bg/OdKjeBy+IZv5cywlWnFOm79Nsjr1dJzHcytH0ES9lq3MU
 vS8/M+FNU9C5dG3eQ44BcII9vmHJ/+pCwb1+1PcHo3n/Ai9nJVLnk6EQL5cTvXMDy+w4
 aPSmWRM13ng2uIJQdT0qI6VvRIpDVawTLv8Ujl0rA52MGzBBw7nFU9G0phsEAaF34j+p
 5EB96vb4dpI39Dp/GP8oBgIZnlQ65MghES8b82EBaJeY3KvBbM3R+9dPiu5AbGNBOlLR yA== 
Received: from nalasppmta04.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3mnpsvk4kn-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 26 Dec 2022 08:33:43 +0000
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA04.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 2BQ8XgA6026779
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 26 Dec 2022 08:33:42 GMT
Received: from ramess-linux.qualcomm.com (10.80.80.8) by
 nalasex01a.na.qualcomm.com (10.47.209.196) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.986.36; Mon, 26 Dec 2022 00:33:40 -0800
From: Rameshkumar Sundaram <quic_ramess@quicinc.com>
To: <johannes@sipsolutions.net>, <ath11k@lists.infradead.org>
CC: <linux-wireless@vger.kernel.org>,
        Rameshkumar Sundaram
	<quic_ramess@quicinc.com>
Subject: [PATCH 0/2] wifi: Add support to enable/disable bss color collision detection
Date: Mon, 26 Dec 2022 14:03:26 +0530
Message-ID: <20221226083328.29051-1-quic_ramess@quicinc.com>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: 9S4eX8x4zW6IHfSmxZa4graptBttdfNx
X-Proofpoint-ORIG-GUID: 9S4eX8x4zW6IHfSmxZa4graptBttdfNx
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.923,Hydra:6.0.545,FMLib:17.11.122.1
 definitions=2022-12-26_04,2022-12-23_01,2022-06-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 impostorscore=0
 mlxlogscore=669 phishscore=0 priorityscore=1501 mlxscore=0 suspectscore=0
 lowpriorityscore=0 clxscore=1011 bulkscore=0 adultscore=0 spamscore=0
 malwarescore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2212070000 definitions=main-2212260074
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221226_003348_670086_C97756F8 
X-CRM114-Status: GOOD (  12.36  )
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

This patchset adds configuration option to Enable/Disable 802.11ax BSS 
color collision detection.

Rameshkumar Sundaram (2):
  nl80211: add support to enable/disable bss color collision detection
  ath11k: add support to enable/disable BSS color collision detection

 drivers/net/wireless/ath/ath11k/mac.c | 5 ++++-
 include/net/cfg80211.h                | 2 ++
 include/uapi/linux/nl80211.h          | 3 +++
 net/mac80211/rx.c                     | 3 ++-
 net/wireless/nl80211.c                | 3 +++
 5 files changed, 14 insertions(+), 2 deletions(-)


base-commit: 44bacbdf9066c590423259dbd6d520baac99c1a8
-- 
2.17.1


-- 
ath11k mailing list
ath11k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath11k
