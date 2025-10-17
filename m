Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 65620CCD199
	for <ath11k@archiver.kernel.org>; Fri, 17 Oct 2025 01:49:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Message-Id:Date:Subject:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=bIVbDWRzimFDTaTG3mzRawATBmOXe/h2r+nkD+RHIxU=; b=1XEclf/8oqnQbC
	n39faNQRwD4jVfgUppBdenS52LNIjc2+QMVw8HK76mCAob/LOMHIiSu0GdkVfe3oXpgWUUI+EtN8Y
	qI7QmZZrBBk1m68RX9SpbYKdfhJHADA31Fm3wecFqxztK3Te4iEcaU1o4lEqk24oFFSMhDxXXaLwP
	L/4KumdREWE2rp3j7En5+ox7WFvi6OeyXCnVi1/w1DyLTHO6/IvfT8oGt4faz/l1XrHxoRpPvvwd/
	5A0vzZfLM7swFQA82Z3fv57XVB3Odii2vjgPy9zUT9VI0PQkeg5cQCyAvQLyMgp6UXWGx190mdAVs
	28KuVIHMsx1xL183343A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v9Zas-00000006MMl-1I5M;
	Fri, 17 Oct 2025 01:49:22 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v9Zap-00000006MLz-18zR
	for ath11k@lists.infradead.org;
	Fri, 17 Oct 2025 01:49:20 +0000
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 59GKLMaI006114
	for <ath11k@lists.infradead.org>; Fri, 17 Oct 2025 01:49:17 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=bIVbDWRzimFDTaTG3mzRaw
	ATBmOXe/h2r+nkD+RHIxU=; b=lZSIMxXeOyWRv3OCn4K+W3Y8kB/usQn9EIXawV
	X3BW6bxVcnBa3xt94eJW4Y80Fj3vNZ+L4ka8/uULC/g2TwUbC3AlFw0GAsW/eeDT
	gt3YGlodtCWWcnb+gyMFzhMx/uwwqFlSTgfqTumJzwFxHE+5nIBiW64E2UAlL8r/
	5n71m12survih/Vk3zTWHm0fhIBHcZBydmaUifpL8H/zmVzfmFxclij+fsLY3WzF
	gGeJ98Fb+aeOMwDN5LXn8MkhGnLvMRQv75cb8G1HcFsQXuSk2W/eVitHyf3ygpA9
	UQPqeGL3oR8r7vUNWFzrPmH8atAbmUNXgP47Yj9qf3okWajQ==
Received: from mail-pg1-f198.google.com (mail-pg1-f198.google.com [209.85.215.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 49s6mwvrab-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <ath11k@lists.infradead.org>; Fri, 17 Oct 2025 01:49:17 +0000 (GMT)
Received: by mail-pg1-f198.google.com with SMTP id 41be03b00d2f7-b62b7af4fddso908611a12.2
        for <ath11k@lists.infradead.org>; Thu, 16 Oct 2025 18:49:17 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760665756; x=1761270556;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=bIVbDWRzimFDTaTG3mzRawATBmOXe/h2r+nkD+RHIxU=;
        b=VRXFDHaA1x8/qYLSWDPLYjs6a9Rfr2YvZT3wvV8W3+Mc7T3SQa8yeupqEtCoonOWh8
         XsorYrJoTNScXSiBW8ZjqQRx9nthb1ahGyKsOqjrLs2IW8Mhnhma32otefE7Ipw5LrsQ
         OD3kH+rG3I1LFodcEvrcSyQVFu8JscJsVVUF/Dcep+0IrAAz1clTDQUNRz1JDBqnSycR
         xhXeDJazntfG6yTKAvu/TaB68UtGYnEsZx8dHQ6AQLvv62ULJEcF7Y+hDT2rmxY5LVPz
         XwITeKQSR4EH0jgBHhK7Q7bwbjoj/8kfHhWB2GR3XtYle3+np3kOyIc151g4MpGjJUpE
         +jVQ==
X-Forwarded-Encrypted: i=1; AJvYcCV33GxKIwE/SRwgqXpQWN848r4j5ET1t8BL9uLnnElQFmp223bDOr5NybQbMZp3AS9cV2TxRxg=@lists.infradead.org
X-Gm-Message-State: AOJu0YyLqklpzyS0KtJGBmznADR+rjNaCpTg79mavsz7xkSY3Ncaf1fb
	0aLwCGp4Xejo0T+0Sb5j3zXCPWC01dBJL0xfMxBtPsfN0zANwYjza7IKO64lOrUhXHE6eS/49AV
	0HDQjHkKepHeNfs1t5Y5iKIcZQICyYC36/PMB1bBajHmFmj0/lJwOkl73avErD3crPAcIHON4Vh
	o=
X-Gm-Gg: ASbGncsNQlLUQFkMwJZtYlyUhObOHCQo/uqMwhHGQhIVaH6WRl8fw/Ddkpz6WKeZUY4
	9jEHSxJWDB9FJ4FKRjfe+3MjeMSIO7qqQPNtNMMZgS0IBTP9+TDxGbYd0wYs8AAJWWI5N2NNR5D
	T1g371Gl/YmyronnZzc/kGCaSmZC9oavXvlJdFVsaLrr7gdNUOXDfhhylRbUcg0fW+DQxrIoh4O
	BreW+s+i5ioe8YjOxdYCKDkhW1Jt+czEv/guX5vyoQ+LJtYsUHHJGMGjj+WUTtJ4ONFkXguG6uj
	POrLQeO3wfsfv81stzvjx/iQiVF7ZoMC+RPCMh6FHYOUe9djsaOGTaNzei4C8DtmqKEvstzhTCc
	VhwgwVilJAfWBQkhXXxn98Gszo0JZd7EuAb9W0UAMcRm47EqXfN4t
X-Received: by 2002:a05:6a20:1585:b0:2fb:2e04:eeae with SMTP id adf61e73a8af0-334a854783emr2583380637.21.1760665756487;
        Thu, 16 Oct 2025 18:49:16 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IG4jRKRiQwDwGDChCQIJLJWOE5GV/XGwfAcol1Y8/0ZMz4s+xYCuZUXNHu7YLqoR6coYgSYyQ==
X-Received: by 2002:a05:6a20:1585:b0:2fb:2e04:eeae with SMTP id adf61e73a8af0-334a854783emr2583353637.21.1760665756006;
        Thu, 16 Oct 2025 18:49:16 -0700 (PDT)
Received: from [127.0.1.1] (tpe-colo-wan-fw-bordernet.qualcomm.com. [103.229.16.4])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-b6a22bbe7a0sm4181475a12.38.2025.10.16.18.49.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 16 Oct 2025 18:49:15 -0700 (PDT)
From: Baochen Qiang <baochen.qiang@oss.qualcomm.com>
Subject: [PATCH ath-next 0/2] wifi: ath11k: fix MCS assignment
Date: Fri, 17 Oct 2025 09:48:58 +0800
Message-Id: <20251017-ath11k-mcs-assignment-v1-0-da40825c1783@oss.qualcomm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAIqg8WgC/43OwW6DMAwG4Fepcm4q20kg2WnvMe0QQijRStgwQ
 50q3n0Zh56K1oulX9b/2TfBcUqRxcvhJqa4JE5jLgGPBxF6n89RprZkQUAGHJL0c4/4IYfA0jO
 ncx5inqVtHOm6cmixE6X7OcUuXTf3TZSKzPE6i/ey6RPP4/SzHVxw2/9jLyhBovdgXGNqBPM6M
 p++vv0ljMNwKmODF3oKo4I5Q9q2USlFe5h6ClN/GHWhBdKtdbSD6TuGAG4P0wWrgyXwVYUNPvp
 sXddfOv2gb7IBAAA=
X-Change-ID: 20250912-ath11k-mcs-assignment-8b924769181f
To: Jeff Johnson <jjohnson@kernel.org>
Cc: linux-wireless@vger.kernel.org, ath11k@lists.infradead.org,
        Baochen Qiang <baochen.qiang@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMDEzMDA4MyBTYWx0ZWRfX0mI1JMYcvcga
 Y1RbxV6QyP9M4MtCJyzMeqbaG+pqeMq4uMElFmGdQTLbalXdFfJMg1Peq/7T9vu+M9kvR5XbDCa
 FiEPH6l3S6FE3ByhnXyktRb8mSuOSezjs+PBOYW4Yq5IfqQbkKYXcTeUJ4aywo32ouoQp7zdmXe
 eTnn+4ZF0vpXtzgVfiYwxKuQbiKCkNP2LcE5ZhKj0imRjS0m/Q9kpy4/IiFcubisgOR0KyDo7YA
 Kk5O4Y1gWvCW21rGFv8T2+UOmY3/7dGsGvXKMVBT5aKF/HyxdhoYszQUThZOZ1KhbtKjb6kxaB7
 CURBC/uVTnoOLSyS9ldP+W+sf4Xp/KfV/lhS7sl9rxdKfUM4SnvrBkTTN3/dMc7W4cra56pa8RV
 N4wET7EYowCv2LVNCiAz0vsJln/Tgw==
X-Authority-Analysis: v=2.4 cv=Fr4IPmrq c=1 sm=1 tr=0 ts=68f1a09d cx=c_pps
 a=Qgeoaf8Lrialg5Z894R3/Q==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=IkcTkHD0fZMA:10 a=x6icFKpwvdMA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=EUspDBNiAAAA:8 a=9Y66H1pTm1UaMIwK48kA:9 a=QEXdDO2ut3YA:10
 a=x9snwWr2DeNwDh03kgHS:22
X-Proofpoint-GUID: -K0xxLSeXgEqysEsrGO5TbA1GrttnQOf
X-Proofpoint-ORIG-GUID: -K0xxLSeXgEqysEsrGO5TbA1GrttnQOf
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-10-17_01,2025-10-13_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 impostorscore=0 spamscore=0 phishscore=0 malwarescore=0
 adultscore=0 lowpriorityscore=0 bulkscore=0 suspectscore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2510020000 definitions=main-2510130083
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251016_184919_318131_F6C6C9F3 
X-CRM114-Status: UNSURE (   7.90  )
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

VHT and HE MCS handling are wrong, fix them.

Signed-off-by: Baochen Qiang <baochen.qiang@oss.qualcomm.com>
---
Baochen Qiang (2):
      wifi: ath11k: fix VHT MCS assignment
      wifi: ath11k: fix peer HE MCS assignment

 drivers/net/wireless/ath/ath11k/mac.c |  8 ++++----
 drivers/net/wireless/ath/ath11k/wmi.c | 20 +++++++++++++-------
 drivers/net/wireless/ath/ath11k/wmi.h |  2 ++
 3 files changed, 19 insertions(+), 11 deletions(-)
---
base-commit: d5ce93f136fbee2b7afbe221f34ca881036f8de3
change-id: 20250912-ath11k-mcs-assignment-8b924769181f

Best regards,
-- 
Baochen Qiang <baochen.qiang@oss.qualcomm.com>


