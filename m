Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1AC2CEB64DD
	for <ath11k@archiver.kernel.org>; Mon,  7 Aug 2023 06:18:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:CC
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=uKAeWf3prHZiwamwcYFwzK4ecmTNfelQRopupz9Ao34=; b=dtznvapjVq43m9
	tDMhTdg7iRgnQd8KQICG+gBW2Ema/HSNmcG7p2aI1axlDsNMI6NECXzq794T/+YeO6MaPzlz0xwT6
	MbbB442fLFVIIqP0RUje/n6J6sSuhv/h5tR6hUjQlhT/lU+nTcaK/XlI2sWh+cXQWOkpVUEx3XVV8
	CA8PEh7HoG8JS5kv83kCcmv5g1nCoaUe+47AM19Sbfwx+5mrTd35Wyo3ZBMTKParEyB9HTNfjL7nO
	dNmzzcgqEjYSGQTx06GPkpxd3pDnC8+PbSOFz/4MS3py99Wkq3cBqJ9yltyLP5SrsyDawNqiZwaQ7
	TpmP3guCBNPT1/JIuJ+Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qStZF-00GFq8-0t;
	Mon, 07 Aug 2023 06:18:13 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qStZC-00GFod-2I
	for ath11k@lists.infradead.org;
	Mon, 07 Aug 2023 06:18:12 +0000
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 3775nZhe013240;
	Mon, 7 Aug 2023 06:18:07 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=from : to : cc :
 subject : date : message-id : mime-version : content-transfer-encoding :
 content-type; s=qcppdkim1;
 bh=1shZU4r7MHTWFWwwrx85UxfDWH63nSNO7+YRtIbaE7w=;
 b=b36wKR00G99wyyp8EqwogxMI42ZrcN7SrTO1sBxlFfpc7jXp/xGk32IDWyl9zYXnj+EX
 +xRw6oX/jti3dRnceJU3NPf0Vce+P8N/0Qy2UOzBEGu5GnmhsxWPAZC5Ep2gX/xZtih9
 mdS4SIo7XGTbz7cVSPjfVNF3cktZjPw9omo+GBIHlngz0JXuA/n3O+eMaAmr+Vv4YQSK
 rNYTeQ4Kb25yznhgzWs1TNV4B5ER94vTALO+qpvfIyhg+aUnyBw1DWZc6A3ND2GrClQq
 NbNp8/O1dIuyutNqswDZ8nFzUFSiJxhEI8hE2FBPqrkJu7vx6fyEx4woBMHUxgDg8ldL vw== 
Received: from nalasppmta04.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3s9c4nturv-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 07 Aug 2023 06:18:07 +0000
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA04.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 3776I6CN031444
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 7 Aug 2023 06:18:06 GMT
Received: from bqiang-Celadon-RN.qca.qualcomm.com (10.80.80.8) by
 nalasex01a.na.qualcomm.com (10.47.209.196) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1118.30; Sun, 6 Aug 2023 23:18:05 -0700
From: Baochen Qiang <quic_bqiang@quicinc.com>
To: <ath11k@lists.infradead.org>
CC: <linux-wireless@vger.kernel.org>
Subject: [PATCH 0/2] wifi: ath11k: add support for QCA2066
Date: Mon, 7 Aug 2023 14:17:47 +0800
Message-ID: <20230807061749.9404-1-quic_bqiang@quicinc.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-ORIG-GUID: UFR65nIlvW1bxJLC1t_jU9QTtmBgTNBM
X-Proofpoint-GUID: UFR65nIlvW1bxJLC1t_jU9QTtmBgTNBM
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.267,Aquarius:18.0.957,Hydra:6.0.591,FMLib:17.11.176.26
 definitions=2023-08-07_03,2023-08-03_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 bulkscore=0
 lowpriorityscore=0 spamscore=0 impostorscore=0 priorityscore=1501
 mlxlogscore=838 clxscore=1011 malwarescore=0 mlxscore=0 adultscore=0
 phishscore=0 suspectscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.12.0-2306200000 definitions=main-2308070057
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230806_231810_756868_CA77D721 
X-CRM114-Status: GOOD (  13.14  )
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

QCA2066 is a PCI based DBS device. It is very similar to WCN6855
overall: they share the same PCI device ID, the same major and
minor version numbers, the same register address, and same HAL
descriptors etc. The most significant difference is that QCA2066
supports 3-antenna configuration while WCN6855 doesn't. To
differentiate them, subversion numbers are used. Currently four
numbers are used by QCA2066: 0x1019A0E1, 0x1019B0E1, 0x1019C0E1
and 0x1019D0E1.

In order to read subversion register, pci.ops needs to be ready
at that time, this change is done in the first patch.

The second patch enables support for QCA2066.

Depends on:
Carl Huang: public review
  wifi: ath11k: supports 2 station interfaces

Baochen Qiang (2):
  wifi: ath11k: move pci.ops registration ahead
  wifi: ath11k: add support for QCA2066

 drivers/net/wireless/ath/ath11k/core.c | 84 ++++++++++++++++++++++++++
 drivers/net/wireless/ath/ath11k/core.h |  1 +
 drivers/net/wireless/ath/ath11k/mhi.c  |  1 +
 drivers/net/wireless/ath/ath11k/pci.c  | 42 +++++++++----
 drivers/net/wireless/ath/ath11k/pcic.c | 11 ++++
 5 files changed, 128 insertions(+), 11 deletions(-)


base-commit: 3f257461ab0ab19806bae2bfde4c3cd88dbf050e
prerequisite-patch-id: 640366721125b1adea0eeabd5cdfca5e91476e7c
-- 
2.25.1


-- 
ath11k mailing list
ath11k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath11k
