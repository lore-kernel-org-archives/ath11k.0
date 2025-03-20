Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E13E2C35FFF
	for <ath11k@archiver.kernel.org>; Thu, 20 Mar 2025 02:35:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:CC:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=9UnTybxmMZFlU7y+EwxN0LFDCR9zp7D/whUB1r2NRjQ=; b=vrJaXPQ/BE/jClyy8VxkvNy9eH
	sntJzaj3G2IK7DbO9It5lVUl+K/TFc3mr8R4lrUq7EpXlC8q9b4SUWWg0rD9X2B7okDbkjJacIuQk
	oJUIsQbcDUOf6Vzowwcu92rtF0plnWtVD1tN4/uXB1nbayrpSFM642qU0WTamAGof1nUDL1fepAxU
	PYk9C11uoAiFg+dxJVe321unFShfgh5nJlCnZOd4RGm3AioQpGnILa3pshE0vO7/g6IN8caJYvGT2
	HPnQPPBA89d1cGmUoE4/N5pyNk4BmeVyCmKK5Z/vboiA/gNoawpJV2nlT9mDEniOymlCQsvjGCBR9
	ZTGg316Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tv5lD-0000000AuoI-0uHE;
	Thu, 20 Mar 2025 02:35:55 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tv5fk-0000000Atzo-3T15
	for ath11k@lists.infradead.org;
	Thu, 20 Mar 2025 02:30:18 +0000
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 52JG7Z0e031271;
	Thu, 20 Mar 2025 02:30:15 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=9UnTybxmMZFlU7y+EwxN0L
	FDCR9zp7D/whUB1r2NRjQ=; b=UowMmgTMN/V2DXUp+jmEfIlegkNwQUsyOTManN
	CVzxdG5a7ro84gA42PbPbrkDTeAVB6tXgVVm4iyXtCNmyUIHeS1uneQ2ujgBAL0A
	ltDxO5sr9dHL3pNMG5cmunr9Qe5gbYzv7IM8vIJYW9oU6cIt+WNdm8G3UhEvmW0D
	8qc450fgBPCulZfXqz4vWTFYwnEIEIZg0EXrdJPRSRdL8H4HR24eahzvL/L3jG83
	/aT6R2q0BolrUvgT8AQ1N9isbHnVOUIv5bihrdIpmLMPYxnfcJRlBknxpg5GG5hO
	6GHaP+KhKWndqCt79o871FOr2VMp7VVoyJxRnf9oQlv+1TTw==
Received: from nalasppmta04.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 45g15y1bur-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 20 Mar 2025 02:30:15 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA04.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 52K2UEmh011310
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 20 Mar 2025 02:30:14 GMT
Received: from bqiang-SFF.qca.qualcomm.com (10.80.80.8) by
 nalasex01a.na.qualcomm.com (10.47.209.196) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.9; Wed, 19 Mar 2025 19:30:13 -0700
From: Baochen Qiang <quic_bqiang@quicinc.com>
To: <ath11k@lists.infradead.org>
CC: <linux-wireless@vger.kernel.org>, <quic_bqiang@quicinc.com>
Subject: [PATCH ath-next 0/5] wifi: ath11k: bring hibernation support back
Date: Thu, 20 Mar 2025 10:29:58 +0800
Message-ID: <20250320023003.65028-1-quic_bqiang@quicinc.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: NjtdsxdgaXIlH9apn6xzCBADJe5B_eRV
X-Proofpoint-ORIG-GUID: NjtdsxdgaXIlH9apn6xzCBADJe5B_eRV
X-Authority-Analysis: v=2.4 cv=VaD3PEp9 c=1 sm=1 tr=0 ts=67db7db7 cx=c_pps a=ouPCqIW2jiPt+lZRy3xVPw==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17 a=GEpy-HfZoHoA:10 a=Vs1iUdzkB0EA:10 a=VwQbUJbxAAAA:8 a=GTWTkweOQRfIT-LzBWMA:9
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1093,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-03-20_01,2025-03-19_01,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 clxscore=1015 impostorscore=0
 bulkscore=0 lowpriorityscore=0 adultscore=0 mlxlogscore=543 phishscore=0
 spamscore=0 priorityscore=1501 suspectscore=0 mlxscore=0 malwarescore=0
 classifier=spam authscore=0 authtc=n/a authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2502280000
 definitions=main-2503200015
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250319_193017_007750_232A7DD2 
X-CRM114-Status: UNSURE (   9.20  )
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

To handle the Lenovo unexpected wakeup issue [1], previously we revert
commit 166a490f59ac ("wifi: ath11k: support hibernation"). However we
need to bring it back, of course with additional changes such that Lenovo
machines would not break.

As those machines work well in Non-WoWLAN suspend mode, the thought here
is that we do WoWLAN suspend on Lenovo machines while do non-WoWLAN
suspend (which is done in the reverted commit) on other machines. This
requires us to identify Lenovo machines from others. For that purpose,
read machine info from DMI interface, match it against all known affected
machines. If there is a match, choose WoWLAN suspend mode, else choose
non-WoWLAN mode.

[1] https://bugzilla.kernel.org/show_bug.cgi?id=219196

Baochen Qiang (5):
  wifi: ath11k: determine PM policy based on machine model
  wifi: ath11k: introduce ath11k_core_continue_suspend_resume()
  wifi: ath11k: refactor ath11k_core_suspend/_resume()
  wifi: ath11k: support non-WoWLAN mode suspend as well
  Reapply "wifi: ath11k: restore country code during resume"

 drivers/net/wireless/ath/ath11k/ahb.c  |   4 +-
 drivers/net/wireless/ath/ath11k/core.c | 245 +++++++++++++++++++++++--
 drivers/net/wireless/ath/ath11k/core.h |  11 ++
 drivers/net/wireless/ath/ath11k/hif.h  |  14 +-
 drivers/net/wireless/ath/ath11k/mhi.c  |  14 +-
 drivers/net/wireless/ath/ath11k/mhi.h  |   5 +-
 drivers/net/wireless/ath/ath11k/pci.c  |  44 ++++-
 drivers/net/wireless/ath/ath11k/qmi.c  |   4 +-
 8 files changed, 301 insertions(+), 40 deletions(-)


base-commit: b6f473c96421b8b451a8df8ccb620bcd71d4b3f4
-- 
2.25.1


