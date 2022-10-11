Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 46B2DC433FE
	for <ath11k@archiver.kernel.org>; Tue, 11 Oct 2022 07:24:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:CC
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=ygbhA763Ci/8mOLsh6OaLjvMuPOcWaeI23d0IPv4c18=; b=mMzPHw1m4/48SI
	63SnlUQAHp7bTHi0BjWMeT3fYj2ddj5NLCHAL4m3KJbiPQMHkLLtIvfRkPp4eB8bsz/Yt1R5/0UWO
	UPFof8A+A4OSUID5OclGqz0RrJhH1gNL0UPdgSdtRVkDGHGn1BKjuOStnR8yp0v/AZbH9lOhsYtvY
	e+bBBqWxmD/SMu56a/0GCa3aceGI/FRVmfcJ48Nj02inZUDbNs8BezMdz9bhfRQFReJNXORwALzSJ
	Lm0xDLYJlbZ2vGOXatx4Do3QIeUaMRYK2s/VGXvf5m0TqMw3guh7e4lnLg/qaaJPvwG8dJv3uAi99
	9tx76LiAR+CoyVycnvDg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oi9d9-003ZqQ-Sz; Tue, 11 Oct 2022 07:24:47 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oi9d8-003Zp4-2R
	for ath11k@lists.infradead.org; Tue, 11 Oct 2022 07:24:47 +0000
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id 29B7DJ7E002297;
	Tue, 11 Oct 2022 07:24:43 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=from : to : cc :
 subject : date : message-id : mime-version : content-transfer-encoding :
 content-type; s=qcppdkim1;
 bh=I2KOBFFNummN2yYwexN9QcGc9ucCqI7BM68vKmqXJCg=;
 b=MoV8mHkC3SUOPPtLSetWC9rd7tfNsmZrq23NFcYOtw+abk0uY8dDExyQWfwEtBE+oPyd
 g6SHGmKXBbVT8ic7BiK3uTZNz3Q/CvzoAvCpqCF/S6D/ofXrwybjfcAG0FzZ8HNwj1Nj
 onH90zD6pw/Hz+mRsqxjqL5gOxmhI9S2xKnJl2R6oE2RfvCq9Fi2007etIVtQgHS9j2/
 PU3FnlupNuUiuXpit++M9q+AbnWSrRHUwy2/HxfKEb02DQvxHx4LQ9lW7d1A6L6DTkX/
 y4EZ78IKCLh1HjlP1kY0E4LSk4aPkxAhlX048Bi642gXcoQQV6tBCeQIKsWJEHp2HOAH 4g== 
Received: from nalasppmta02.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3k4rx19fbm-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 11 Oct 2022 07:24:43 +0000
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA02.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 29B7OgAx031122
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 11 Oct 2022 07:24:42 GMT
Received: from wgong-HP3-Z230-SFF-Workstation.qca.qualcomm.com (10.80.80.8) by
 nalasex01a.na.qualcomm.com (10.47.209.196) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.986.29; Tue, 11 Oct 2022 00:24:41 -0700
From: Wen Gong <quic_wgong@quicinc.com>
To: <ath11k@lists.infradead.org>
CC: <linux-wireless@vger.kernel.org>, <quic_wgong@quicinc.com>
Subject: [PATCH v3 0/2] wifi: ath11k: reduce the timeout value for hw scan
Date: Tue, 11 Oct 2022 03:24:06 -0400
Message-ID: <20221011072408.23731-1-quic_wgong@quicinc.com>
X-Mailer: git-send-email 2.31.1
MIME-Version: 1.0
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-ORIG-GUID: S2cg6KYt7x5ZMM7HYwXngE84amHlbM3j
X-Proofpoint-GUID: S2cg6KYt7x5ZMM7HYwXngE84amHlbM3j
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.895,Hydra:6.0.528,FMLib:17.11.122.1
 definitions=2022-10-11_03,2022-10-10_02,2022-06-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 lowpriorityscore=0
 phishscore=0 adultscore=0 mlxlogscore=650 clxscore=1015 impostorscore=0
 mlxscore=0 bulkscore=0 priorityscore=1501 suspectscore=0 malwarescore=0
 spamscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2209130000 definitions=main-2210110040
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221011_002446_137120_76A2F99A 
X-CRM114-Status: GOOD (  10.80  )
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

v3:
change code and log of "wifi: ath11k: reduce the timeout value back for hw scan from 10 seconds to 1 second"
to handle the "failed to start hw scan: -110" correctly.

v2:
add "wifi: ath11k: change to set 11d state instead of start 11d scan while disconnect"

Reduce the max timeout for hw scan started.

Wen Gong (2):
  wifi: ath11k: change to set 11d state instead of start 11d scan while
    disconnect
  wifi: ath11k: reduce the timeout value back for hw scan from 10
    seconds to 1 second

 drivers/net/wireless/ath/ath11k/mac.c | 28 +++++++++++++++------------
 1 file changed, 16 insertions(+), 12 deletions(-)


base-commit: c6d18be90f9b0c7fb64c6138b51c49151140fb57
-- 
2.31.1


-- 
ath11k mailing list
ath11k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath11k
