Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2341EC4332F
	for <ath11k@archiver.kernel.org>; Tue, 18 Oct 2022 21:28:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:CC
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=IvKU735WMzS4zH2x61PdWuwUn3YxAC5ay+q+wir9t2A=; b=Z0pBMeXqnb6Wo0
	kCmKkwAoCI6wxjcNAEL3KbuVmY1tNAO7CDGW9Kf1yzuUakFRDH2EGfBaRHGcAu8zA6G4/thoI7rHu
	RleCFJxO0wKeUBP7IAvVbWI/v7JqpE7pnVBW8IolXAugUilKjmllWEvvJQPyPj/rtCPiL+w1bwwgr
	q4AQ61i1aa5rY7yQ3jTs2l7UWQEV8MmcUHPKfL6eupXTQS18KRg1zmY3na1UoibICFyODIXCrKogc
	ZYddTBr3n8wFWV13q/FkB/TDsV74OxExvQksLSyojAca9kHHLmgiq/ProPFxGcXP1kb3fvlleIDz4
	kg7/dgtYZwi9Re0L3yHA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oku8m-00Aa9k-0y; Tue, 18 Oct 2022 21:28:48 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oku8i-00Aa78-Rf
	for ath11k@lists.infradead.org; Tue, 18 Oct 2022 21:28:46 +0000
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id 29IKpK9S006750;
	Tue, 18 Oct 2022 21:28:40 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=from : to : cc :
 subject : date : message-id : mime-version : content-type; s=qcppdkim1;
 bh=UuJJ1Wyj8yU7mqpGUbXZPK1ImQIY8T5tunMZvhm020E=;
 b=agLmSALY6L19axxyIJMJf6Xwzp/E/qQV4RQ7v4qhu07dlCbEaEfoG9A1m2R57z1uic8p
 fKwfiExaOaaZ7XKpMsudDYti8ICOFjQXiTWkIaQq1rqP/8F82eJRM8A9mm0wCGBGHG0H
 xeuZk9Yw1AmvtctYftijfarouQ4YMriP4HDdL25yVzplboDp5rrFzaeuy5TEgAdfuoT/
 V5vkFVZZ+WjWyBIngDcpyIa/ktDVlXaRvQWSlmPgMCJUtSa09J4LkECu29N6ZLUDFmL2
 1J4excXaFaiNxvk9qaaccBngNBiBChSWBFeIgFdksly8vQRsACbI3QcsZv2hnbAQ3/Ec Zg== 
Received: from nalasppmta03.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3ka3j1r2df-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 18 Oct 2022 21:28:40 +0000
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA03.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 29ILSe3L031972
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 18 Oct 2022 21:28:40 GMT
Received: from msinada-linux.qualcomm.com (10.80.80.8) by
 nalasex01a.na.qualcomm.com (10.47.209.196) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.986.29; Tue, 18 Oct 2022 14:28:39 -0700
From: Muna Sinada <quic_msinada@quicinc.com>
To: <ath11k@lists.infradead.org>
CC: <linux-wireless@vger.kernel.org>, Muna Sinada <quic_msinada@quicinc.com>
Subject: [PATCH v2 0/4] wifi: ath11k: push MU-MIMO configurations to hardware
Date: Tue, 18 Oct 2022 14:28:17 -0700
Message-ID: <1666128501-12364-1-git-send-email-quic_msinada@quicinc.com>
X-Mailer: git-send-email 2.7.4
MIME-Version: 1.0
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-ORIG-GUID: 0XTZmuq9BpiicSaNOUALOnUXNXhJ42ON
X-Proofpoint-GUID: 0XTZmuq9BpiicSaNOUALOnUXNXhJ42ON
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.895,Hydra:6.0.545,FMLib:17.11.122.1
 definitions=2022-10-18_07,2022-10-18_01,2022-06-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 suspectscore=0 adultscore=0
 mlxlogscore=999 bulkscore=0 mlxscore=0 phishscore=0 impostorscore=0
 spamscore=0 priorityscore=1501 malwarescore=0 lowpriorityscore=0
 clxscore=1015 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2209130000 definitions=main-2210180120
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221018_142844_990101_7BF6412B 
X-CRM114-Status: GOOD (  12.15  )
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

Currently enable/disable configurations for MU-MIMO in hostapd are
only reflected in beacon, probe response and assoc response. These
configurations are not present in hardware.

The change is parsing MU-MIMO configurations in beacon IE and pushing
the configurations to the hardware.

This patchset is dependant on mac80211 patchset:
https://patchwork.kernel.org/project/linux-wireless/list/?series=683322&state=%2A&archive=both

---

v2: 
 - cleaned compilation errors
 - added mac80211 dependancy comment to commit message

---
Muna Sinada (4):
  wifi: ath11k: modify accessor macros to match index size
  wifi: ath11k: push MU-MIMO params from hostapd to hardware
  wifi: ath11k: move HE MCS mapper to a separate function
  wifi: ath11k: generate rx and tx mcs maps for supported HE mcs

 drivers/net/wireless/ath/ath11k/mac.c | 249 ++++++++++++++++++++++------------
 drivers/net/wireless/ath/ath11k/wmi.h |  27 ++--
 2 files changed, 180 insertions(+), 96 deletions(-)

-- 
2.7.4


-- 
ath11k mailing list
ath11k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath11k
