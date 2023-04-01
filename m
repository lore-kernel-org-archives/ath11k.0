Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1AB50C761A6
	for <ath11k@archiver.kernel.org>; Sat,  1 Apr 2023 02:50:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:CC
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=6+5CH1sfbHfp85tH0JLRow73g2xMh8r5KEcXCOnHG+g=; b=YK6jvx+BDT+5Pk
	M65A5pBFhIBPi+w9ymxSWJc80/s9LBv/SQAjLKU52HgHkrm4rFL3tnLZkYP4w3tZPWUWptCT2CYVG
	V4BYbRNvWbu+qX6FD8eTVpgsB2t6EHpgxrTyA/y47bUYxY6WVYlN0fQrh0udQSKCM8QC2gPG/Fx9F
	lysBd8s4pQOgHggR7Jo2qRlWANNy0Suj3nqSvJG6mi18oYrdzJdQMJRPGFdipSp/rGU7ZYiswEMPG
	46rY+RN9m3htHXfbEW4QV32z8D+7+W5ahhOyv+hRDkTc8mrkR9Nl9WX7Wu8Zjjz9uyzHHswbNLn+Z
	jY2qxfxMmr5LhkGd0xfA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1piRJh-009bPV-1H;
	Sat, 01 Apr 2023 02:50:09 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1piRJe-009bNs-1l
	for ath11k@lists.infradead.org;
	Sat, 01 Apr 2023 02:50:08 +0000
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 3312NK1U021598;
	Sat, 1 Apr 2023 02:50:02 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=from : to : cc :
 subject : date : message-id : mime-version : content-type; s=qcppdkim1;
 bh=5W3MYYqKTnUUsN/LGdJR8AHOs2iU7R0OVx/q3OmrBxw=;
 b=f+n1G1UccSWjATuk9f/Wm7kP1nWWs1FOWd40tMtVDOVIYVk5gQDLbz8DIrEB+Wb1vc/s
 Q128VqCCi4ZKZCRJ0ajdlsUBf1pgkbAMtgIkcjAsdAkuStwQLguhWhelXt4Wivg0/4Ae
 3+oNvOZzvnZ7+qRWO/795rknl1tVSzrJjrpVBuQ1nltCcJBljiFoPYXlgWxkEtLh/+07
 xpEFM8PY9GMh39wXwj3SOeWPPvLOlouYHfwJK6+Mp3noTB+BdB3Y4sU0gkhzsfnFeqVs
 zP/EtTrc6x9tqvLJEOolfkqijNSFsV7HvB5Wty7uGsoFaxSiL3QcdeNzMuPwl2VGxMb3 Mw== 
Received: from nalasppmta03.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3pp29sseyx-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Sat, 01 Apr 2023 02:50:02 +0000
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA03.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 3312o13X019396
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Sat, 1 Apr 2023 02:50:01 GMT
Received: from pradeepc2-linux.qualcomm.com (10.80.80.8) by
 nalasex01a.na.qualcomm.com (10.47.209.196) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.986.42; Fri, 31 Mar 2023 19:50:00 -0700
From: Pradeep Kumar Chitrapu <quic_pradeepc@quicinc.com>
To: <ath11k@lists.infradead.org>
CC: <linux-wireless@vger.kernel.org>,
        Pradeep Kumar Chitrapu
	<quic_pradeepc@quicinc.com>
Subject: [PATCH V2 0/2] wifi: ath11k: bug fixes in tx encap offload and ppdu stats
Date: Fri, 31 Mar 2023 19:49:30 -0700
Message-ID: <20230401024932.11722-1-quic_pradeepc@quicinc.com>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: 6Q0KJM8QizWnKg3kVJkOpxhEQdbeF1FI
X-Proofpoint-ORIG-GUID: 6Q0KJM8QizWnKg3kVJkOpxhEQdbeF1FI
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.254,Aquarius:18.0.942,Hydra:6.0.573,FMLib:17.11.170.22
 definitions=2023-03-31_07,2023-03-31_01,2023-02-09_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 impostorscore=0 phishscore=0
 adultscore=0 lowpriorityscore=0 mlxlogscore=621 spamscore=0 malwarescore=0
 mlxscore=0 clxscore=1015 bulkscore=0 priorityscore=1501 suspectscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2303200000
 definitions=main-2304010023
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230331_195006_588948_BD50D679 
X-CRM114-Status: GOOD (  12.11  )
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

Fixes bugs in radiotap fields and tx status reporting in TX
encapsulation offload cases.

Tested-on: QCN9074 hw1.0 PCI WLAN.HK.2.7.0.1-01744-QCAHKSWPL_SILICONZ-1

Pradeep Kumar Chitrapu (2):
  wifi: ath11k: fix tx status reporting in encap offload mode
  wifi: ath11k: Fix incorrect update of radiotap fields

 drivers/net/wireless/ath/ath11k/dp.h     |  3 +++
 drivers/net/wireless/ath/ath11k/dp_tx.c  | 29 +++++++++++++++++++++++-
 drivers/net/wireless/ath/ath11k/dp_tx.h  |  1 +
 drivers/net/wireless/ath/ath11k/hal_rx.c |  4 ++--
 drivers/net/wireless/ath/ath11k/hal_rx.h |  2 +-
 5 files changed, 35 insertions(+), 4 deletions(-)


base-commit: bea046575a2e6d7d1cf63cc7ab032647a3585de5
-- 
2.17.1


-- 
ath11k mailing list
ath11k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath11k
