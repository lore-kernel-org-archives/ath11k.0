Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 83AC6C433FE
	for <ath11k@archiver.kernel.org>; Tue, 22 Nov 2022 13:22:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:CC
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=6gaHZG2iar3gmnsHOYWf/+m845OJajxcKAw0kLw/1xw=; b=uvfvLcqE+iwjcH
	5bOcqHeH02vHbHdI1iiK/McXT9Oup9n9D/fILacRn8zk/jON0tYlbdnAgehQftISTLeQJLCMOhp7w
	2IkJLfeSUALURXQMSWiEXJ4gGDkhJHHIaDyLbAS4IyCVqilQmzhLiq5mWXdznnGOHFnkISDnu2FsM
	c5ehgZnaZRvgGASqNIEib5Ccrute/FbolKIxziHCdlMMaL8dF2maI2/barSj6JcugC6APtR9mMGms
	umOZce8Q6XVEFPfNahPjtcp6Y76bGVqWkSFNB2d7f5qCmEgdsVVa8Pe6H9MAE6FYAssu5qoz5zgeI
	m+m5SiugVq0mLVx0zyfw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oxTE6-009bsC-SU; Tue, 22 Nov 2022 13:22:14 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oxTE4-009bpL-01
	for ath11k@lists.infradead.org; Tue, 22 Nov 2022 13:22:13 +0000
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 2AMBj8wT003626;
	Tue, 22 Nov 2022 13:22:07 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=from : to : cc :
 subject : date : message-id : mime-version : content-transfer-encoding :
 content-type; s=qcppdkim1;
 bh=YkBJEHiJeayRClsMFuf6Qr1QDZXYuPcYH7gAHaEdbEQ=;
 b=Jp6fvXWKufLK3b0Wi70VYWHuwF8BVS0l4ZlN80VsuipVmLR4V3sudO1LXEqHfIUAWwa4
 WhyLLAGLyR4yWJfIkFRpmYutejMgAiiv48gDHw5Zm9SoZMoFRgLPMXtwpXQGLSUEEYaZ
 lOtK+B6iBXuKXxZK3CQZ8H3iOsmBoLNRXbk7U+wIyeavDlpu70kCco/SRaXCxAzafKmX
 DrcVQ1hHqpiy6vIp241s6x37j6TPulbba7sU5cQmNU3iVzipiJi9elvDQe+j5l8mXEak
 XJC6Hu14gWHGRn5WXx69Uwtzd8NXycml41pgU9fZ7FN5nul0lm4PBpXo+aLuegykB6rh Sw== 
Received: from nalasppmta04.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3m0hwp9nt4-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 22 Nov 2022 13:22:07 +0000
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA04.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 2AMDM6a3030510
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 22 Nov 2022 13:22:06 GMT
Received: from kathirve-linux.qualcomm.com (10.80.80.8) by
 nalasex01a.na.qualcomm.com (10.47.209.196) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.986.36; Tue, 22 Nov 2022 05:22:04 -0800
From: Karthikeyan Kathirvel <quic_kathirve@quicinc.com>
To: <ath11k@lists.infradead.org>
CC: <linux-wireless@vger.kernel.org>,
        Karthikeyan Kathirvel
	<quic_kathirve@quicinc.com>
Subject: [PATCHv2 0/8] wifi: ath11k: Add support for IPQ5018
Date: Tue, 22 Nov 2022 18:51:44 +0530
Message-ID: <20221122132152.17771-1-quic_kathirve@quicinc.com>
X-Mailer: git-send-email 2.38.0
MIME-Version: 1.0
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: AvTw6PjfNh22L3ZVkIl4LH-pF_PzBDz2
X-Proofpoint-ORIG-GUID: AvTw6PjfNh22L3ZVkIl4LH-pF_PzBDz2
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.219,Aquarius:18.0.895,Hydra:6.0.545,FMLib:17.11.122.1
 definitions=2022-11-22_06,2022-11-18_01,2022-06-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 impostorscore=0 clxscore=1011
 malwarescore=0 mlxlogscore=733 lowpriorityscore=0 mlxscore=0 bulkscore=0
 spamscore=0 phishscore=0 adultscore=0 priorityscore=1501 suspectscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2210170000
 definitions=main-2211220098
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221122_052212_067164_E7B16046 
X-CRM114-Status: GOOD (  14.33  )
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

This patchset adds support for IPQ5018.
   - IPQ5018 is a AHB based 2G 2x2 device.
   - The CE reg space in IPQ5018 is not part of WCSS as in IPQ8074
    or IPQ6018 and these sections (CE register space and WCSS) are not
    contiguous, hence the ce space is io remapped separately and
    the registers are handle accordingly based on the offset.
   - The rx descriptors are similar to QCN9074
   - The hw ops are similar to QCN9074 except for rx hash computation which
     is defined newly
   - The UMAC registers are different, hence new MACROS are defined for
    their usage.

Tested-on : IPQ5018 hw1.0 AHB WLAN.HK.2.6.0.1-00861-QCAHKSWPL_SILICONZ-1
Tested-on Modes : AP, STA and Mesh

Sriram R (8):
  dt: bindings: net: add IPQ5018 compatible entry for ath11k
  ath11k: update ce configurations for IPQ5018
  ath11k: remap ce register space for IPQ5018
  ath11k: update hal srng regs for IPQ5018
  ath11k: initialize hw_ops for IPQ5018
  ath11k: add new hw ops for ipq5018 to get rx dest ring hashmap
  ath11k: add ipq5018 device support
Karthikeyan Kathirvel (1):
  ath11k: update hw params for IPQ5018

Signed-off-by: Karthikeyan Kathirvel <quic_kathirve@quicinc.com>
---
v2:
	- Fixed Warnings
	- Updated Tested-on tag
	- Fixed pci device boot-up issues with this patchset

 .../bindings/net/wireless/qcom,ath11k.yaml         |   1 +
 drivers/net/wireless/ath/ath11k/ahb.c              |  71 +++-
 drivers/net/wireless/ath/ath11k/ce.h               |   5 +
 drivers/net/wireless/ath/ath11k/core.c             |  37 ++
 drivers/net/wireless/ath/ath11k/core.h             |   8 +
 drivers/net/wireless/ath/ath11k/dp.c               |   9 +-
 drivers/net/wireless/ath/ath11k/hal.c              |  48 ++-
 drivers/net/wireless/ath/ath11k/hal.h              |  15 +-
 drivers/net/wireless/ath/ath11k/hal_rx.c           |  18 +-
 drivers/net/wireless/ath/ath11k/hw.c               | 371 +++++++++++++++++++++
 drivers/net/wireless/ath/ath11k/hw.h               |  10 +
 11 files changed, 553 insertions(+), 40 deletions(-)
-- 
2.7.4

-- 
ath11k mailing list
ath11k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath11k
