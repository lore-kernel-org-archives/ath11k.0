Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 37B4AC636D4
	for <ath11k@archiver.kernel.org>; Mon, 13 Feb 2023 13:09:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:CC
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=bKZGXZdGDZ+Tyifxa+rR4KRUZglS7u/7GzRDtVaWooo=; b=hCKuQF3mICOvVP
	MtgPrG48qm1/aIrNbFLBz+G4CcC7Os7j6YtrVwNPIP1Gtg1C3TRTVshAWf6tIECbP6NEbFD0TxUUU
	4N5R2TsFOEC2aaTxPMJv2EwDNPrFQgHMD99ChpgnXB8hiXld+pn40/TdYrMfPMHFesqFXMrNbAn32
	GFim5RNNU3Ff5Fi5ok/oLzJOPuHELdqj5DQayiJKW77NxRgkaYoT5B4RMqEOpMkXXox647IdQPb8B
	yhqqAUYS7i9FyxhvvgVH0PbVTMMO7yq4NVVAGSzxziCEDgWmj0V0kf42paABKwFTjpK2grS1WckAJ
	2N5dTXD9vm3GJUDAm7kw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pRYaN-00El3V-I5; Mon, 13 Feb 2023 13:09:35 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pRYaI-00El0U-IO
	for ath11k@lists.infradead.org; Mon, 13 Feb 2023 13:09:34 +0000
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 31DBSPDJ004107;
	Mon, 13 Feb 2023 13:09:25 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=from : to : cc :
 subject : date : message-id : mime-version : content-type; s=qcppdkim1;
 bh=cHUipU6ET/S0aJAmNFojqgGyyTKEOme+s69n5meWiTo=;
 b=K7l1uv44gRin6zYLglgTs/Rn7wY3d/2QV9xMiH0OFOU2xqIrzALAH3zDuVI4CYjU0Om6
 fwKXI361vUNycVL1BnLc/ExahddqLOpj9hf/DyIywOGdGOKyMPhUC0KV+ppiDdVZDh8w
 BpkTZSU4jH54e+NtUY5ljnnOjZrCHMa5Py9GQgD7HSZtAwHNxj8rgBGOyfegoNCxtKWb
 U62Uh1c5CDtfemHf1z0gGCxeXdezp81NF/SDX8mZrYA3sfq1L1Bfv5N17yCNa+mjEGYm
 wMmr2cmN69rmElYKnwYkpAxbu3IspZvQXaK/NU5yyxU+CzVwaLMgyk9MqxhQ4XUnzPsW GA== 
Received: from nalasppmta01.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3np0qpv6ht-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 13 Feb 2023 13:09:25 +0000
Received: from nalasex01b.na.qualcomm.com (nalasex01b.na.qualcomm.com [10.47.209.197])
	by NALASPPMTA01.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 31DD9OqN008555
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 13 Feb 2023 13:09:24 GMT
Received: from rajkbhag-linux.qualcomm.com (10.80.80.8) by
 nalasex01b.na.qualcomm.com (10.47.209.197) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.986.36; Mon, 13 Feb 2023 05:09:23 -0800
From: Raj Kumar Bhagat <quic_rajkbhag@quicinc.com>
To: <ath11k@lists.infradead.org>
CC: <linux-wireless@vger.kernel.org>,
        Raj Kumar Bhagat
	<quic_rajkbhag@quicinc.com>
Subject: [PATCH 0/2] ath11k: factory test mode support
Date: Mon, 13 Feb 2023 18:38:52 +0530
Message-ID: <20230213130854.2473-1-quic_rajkbhag@quicinc.com>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01b.na.qualcomm.com (10.47.209.197)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: UPeCKMRv_u3LvK8va6PqrpMMfftLnmTP
X-Proofpoint-ORIG-GUID: UPeCKMRv_u3LvK8va6PqrpMMfftLnmTP
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.219,Aquarius:18.0.930,Hydra:6.0.562,FMLib:17.11.170.22
 definitions=2023-02-13_09,2023-02-13_01,2023-02-09_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 mlxscore=0 impostorscore=0
 malwarescore=0 phishscore=0 adultscore=0 suspectscore=0 spamscore=0
 lowpriorityscore=0 clxscore=1011 bulkscore=0 mlxlogscore=850
 priorityscore=1501 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2212070000 definitions=main-2302130118
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230213_050930_663577_33388D7F 
X-CRM114-Status: GOOD (  13.85  )
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

Device is booted in factory test mode to calibrate the board.
The commands are sent from a userspace application, which is
sent to firmware using wmi commands. Firmware will send the
response back to the application which stores the calibration
data in caldata.bin file. This file will be loaded when the
device boots up normally next time.

Govindaraj Saminathan (1):
  wifi: ath11k: factory test mode support

Sowmiya Sree Elavalagan (1):
  wifi: ath11k: Allow ath11k to boot without caldata in ftm mode

 drivers/net/wireless/ath/ath11k/ahb.c        |   3 +-
 drivers/net/wireless/ath/ath11k/core.c       |  20 +-
 drivers/net/wireless/ath/ath11k/core.h       |  14 +-
 drivers/net/wireless/ath/ath11k/debug.h      |   2 +
 drivers/net/wireless/ath/ath11k/mac.c        |  13 +-
 drivers/net/wireless/ath/ath11k/pci.c        |   3 +-
 drivers/net/wireless/ath/ath11k/qmi.c        |  10 +-
 drivers/net/wireless/ath/ath11k/testmode.c   | 323 ++++++++++++++++---
 drivers/net/wireless/ath/ath11k/testmode.h   |  21 +-
 drivers/net/wireless/ath/ath11k/testmode_i.h |  19 ++
 drivers/net/wireless/ath/ath11k/wmi.c        |  40 ++-
 drivers/net/wireless/ath/ath11k/wmi.h        |  20 ++
 drivers/net/wireless/ath/ath11k/wow.c        |   3 +-
 13 files changed, 427 insertions(+), 64 deletions(-)


base-commit: ddd8e84e007263f3aa8993f32a3dd4dc8ec0876a
-- 
2.17.1


-- 
ath11k mailing list
ath11k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath11k
