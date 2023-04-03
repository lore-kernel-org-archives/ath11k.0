Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DDDF9C761AF
	for <ath11k@archiver.kernel.org>; Mon,  3 Apr 2023 18:24:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:MIME-Version:List-Subscribe:List-Help:
	List-Post:List-Archive:List-Unsubscribe:List-Id:Message-Id:Date:Subject:Cc:To
	:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=o7bQ0BiR3VgQOG3VPodh7p5vOaXr1cxRaPeLX5ruJqg=; b=ffr4OyUgOmJ4ta
	9BGcji51sKk/r5tpFZxpIutn1ywBqtfB9btaToQdvliH3c1PvpvoTyLmtAhyK8pUG+2nGauTsMNKA
	/Ww1OvMzcQ2fdWjT29VaXfodnzIwBTeT/w90+hNGw+QdyXzaao26Fvuywx/1m+JyTWhJ9s0Eooc28
	JuLu9WpkYGJnhuglsk4tfybVp/6llCH2xPuvYpup0azVMGGYR3weJQkm+qcOQtYmPyEEPQ5J5uLrV
	82hAtYEyvSj7pHdX0bX3/Z+Xjv9byVU+bww9n+pc0D6n2NTJdVNcC8XASBkQ2JA6MJvFeawdnzmUy
	46CIQZJorxL8sDbP2Lnw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1pjOr4-00GBqn-1n;
	Mon, 03 Apr 2023 18:24:34 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1pjOr0-00GBne-2L
	for ath11k@lists.infradead.org;
	Mon, 03 Apr 2023 18:24:32 +0000
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 333CpfKB027040;
	Mon, 3 Apr 2023 18:24:26 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=from : to : cc :
 subject : date : message-id; s=qcppdkim1;
 bh=mQuo5gZYMZ53IJaHn39A+7pE35b8Ceybxka+rvsmmSA=;
 b=dXWjewmc+mHoIjSa24GNP7LAXS7wLTDNy9hSfXmN7NHuNhvAmDiQnrYigRZPbnw6bqgU
 VZguyqjKdeR7QMLdCXzr5D9UZo0mzndIODXxl7PLN+8MJtOlgWlsqtYuKHeHmiuNhpUE
 /Yo0ZvlOmYZX6QWtGD1Oyvn/Q3pn4s0Jf+kvR7PN1v6FjGjnzTfqP9UR64EiZsoPg/ID
 wUDiCeGsss/dea8zfLsHmuHcwFehU8fzKtejU9j4JhPBMjQDNH5l43Bxvq9p1RDGNX18
 OxmtYaaDnsSUxl6+LF0Ect0hAJGrm3j69sYn6MfIJrv/0cxWRFZw1nNzy90SJrkGO90q mA== 
Received: from nasanppmta05.qualcomm.com (i-global254.qualcomm.com [199.106.103.254])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3pqy620uas-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 03 Apr 2023 18:24:26 +0000
Received: from pps.filterd (NASANPPMTA05.qualcomm.com [127.0.0.1])
	by NASANPPMTA05.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTP id 333ILB7s028556;
	Mon, 3 Apr 2023 18:24:25 GMT
Received: from pps.reinject (localhost [127.0.0.1])
	by NASANPPMTA05.qualcomm.com (PPS) with ESMTP id 3pr3e7red9-1;
	Mon, 03 Apr 2023 18:24:25 +0000
Received: from NASANPPMTA05.qualcomm.com (NASANPPMTA05.qualcomm.com [127.0.0.1])
	by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 333IOP4E001872;
	Mon, 3 Apr 2023 18:24:25 GMT
Received: from hprem-linux.qualcomm.com (hprem-linux.qualcomm.com [10.201.162.248])
	by NASANPPMTA05.qualcomm.com (PPS) with ESMTP id 333IOOwM001504;
	Mon, 03 Apr 2023 18:24:25 +0000
Received: by hprem-linux.qualcomm.com (Postfix, from userid 4146166)
	id 3DA7AB003D4; Mon,  3 Apr 2023 23:54:23 +0530 (IST)
From: Harshitha Prem <quic_hprem@quicinc.com>
To: ath11k@lists.infradead.org
Cc: linux-wireless@vger.kernel.org, Harshitha Prem <quic_hprem@quicinc.com>
Subject: [PATCH 0/3] wifi: ath11k: fix double free of peer rx_tid
Date: Mon,  3 Apr 2023 23:54:17 +0530
Message-Id: <20230403182420.23375-1-quic_hprem@quicinc.com>
X-Mailer: git-send-email 2.17.1
X-QCInternal: smtphost
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: 9jr4brrW-CzCLBb4HJHwdBR0OlcoIuLA
X-Proofpoint-ORIG-GUID: 9jr4brrW-CzCLBb4HJHwdBR0OlcoIuLA
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.254,Aquarius:18.0.942,Hydra:6.0.573,FMLib:17.11.170.22
 definitions=2023-04-03_15,2023-04-03_03,2023-02-09_01
X-Proofpoint-Spam-Details: rule=outbound_spam policy=outbound score=67 priorityscore=1501
 suspectscore=0 bulkscore=0 mlxlogscore=-30 phishscore=0 mlxscore=67
 adultscore=0 impostorscore=0 clxscore=1015 malwarescore=0
 lowpriorityscore=0 spamscore=67 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.12.0-2303200000 definitions=main-2304030141
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230403_112430_770231_449A5E84 
X-CRM114-Status: GOOD (  10.11  )
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
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "ath11k" <ath11k-bounces@lists.infradead.org>
Errors-To: ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org

During stability testing, double free crash was seen while handling
reo flush command. To handle the same, this patch series includes
changes to address the double free and to avoid the issue case

Harshitha Prem (3):
  wifi: ath11k: fix double free of peer rx_tid during reo cmd failure
  wifi: ath11k: Prevent REO cmd failures
  wifi: ath11k: add peer mac information in failure cases

 drivers/net/wireless/ath/ath11k/dp.h    |  2 +-
 drivers/net/wireless/ath/ath11k/dp_rx.c | 59 +++++++++++++++++--------
 drivers/net/wireless/ath/ath11k/hw.c    |  1 +
 3 files changed, 43 insertions(+), 19 deletions(-)


base-commit: bea046575a2e6d7d1cf63cc7ab032647a3585de5
-- 
2.17.1


-- 
ath11k mailing list
ath11k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath11k
