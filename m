Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 123E2E6F06C
	for <ath11k@archiver.kernel.org>; Tue, 23 Dec 2025 09:27:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=xdv+Kw434solMCgNe+PG6ZV7uuga6N23qYDP/e0DdwY=; b=qU+n2oS2BZm1ZgdFAL5FBcSiOA
	u9ZDP+sp1+LcNQtBY1x4nJI9qOhyxt1hFM27uVWtIwJBjnYl/lwVbeSLiGIIIZAJ2/0UNm8v2pc9u
	Cf60poZOlsyWADuN/Sxd3unTl+M4+m4KMWsJVACXnSNu5o7j3bc5A2HdvBNiDebf+6MAO9h/hjGKk
	m/rw4yE0siBKgQBxCueDIJXYjVdtanTLmDzOWwL/Li4ZxsO/EMDymo6Cw/OLXeS5GOUq/UDRte/qV
	AJasLaC258ntR66QljPoOqXr+vdzUw8ekj0QktNAFFZAJeesXMfqy2RXkz6RqTb/IRdpfX7H17zbS
	4d+O3wWA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vXyg9-0000000Ekah-1Knt;
	Tue, 23 Dec 2025 09:27:41 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vXyg5-0000000EkZv-455A
	for ath11k@lists.infradead.org;
	Tue, 23 Dec 2025 09:27:39 +0000
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5BN79FmQ1630570
	for <ath11k@lists.infradead.org>; Tue, 23 Dec 2025 09:27:37 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=qcppdkim1; bh=xdv+Kw434solMCgNe+PG6ZV7uuga6N23qYD
	P/e0DdwY=; b=Yn0KRnQGGxQI12/9hJDKqeQstctPpweVc/H34FAuRYN2tLNdOhy
	az97RFpvBdu+AJshm5Llu2lfnBpMLNG+7C2O4QzoXKDbmR8Yl/397pue2puaAGei
	NaSZdOT6uRMU2ENSQe8wmWhwawsUBB/EOWASsf0e35we3XYDnA3QO4LkEsj1RFzv
	PUglg+oKtWROBG7p1+QqnizSzk4z9OQLd7Q2EhmOYt6kRgNQ8vyRn+KpmSI3NwDE
	Dpjd/FBA88gmCJoFWaM2aaMJAI3HO55+zbi6tgw11m8rcr42qsnOmkXA3nna2ulT
	SSowEb25eLRyTsX/hxNuhVuSJS9UtjzFAUg==
Received: from mail-pg1-f200.google.com (mail-pg1-f200.google.com [209.85.215.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4b7ck8j5mw-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <ath11k@lists.infradead.org>; Tue, 23 Dec 2025 09:27:37 +0000 (GMT)
Received: by mail-pg1-f200.google.com with SMTP id 41be03b00d2f7-bf493d248baso8353979a12.2
        for <ath11k@lists.infradead.org>; Tue, 23 Dec 2025 01:27:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1766482056; x=1767086856; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=xdv+Kw434solMCgNe+PG6ZV7uuga6N23qYDP/e0DdwY=;
        b=hnE+EA7Ykr8tvmQsBKDlNqHC1rpNbQliakXOzCYNRioqc5mBePa2qzbddpByuXn7KT
         Iudf3MDy8clSr7Wx7/22gj+YdrEe2AaHxhnb2n5oQVAm5LI9ZNPNEpUEpoZjRuduLa5w
         RrmOEqGMIYHCnuT6hfmwoA+RHHjf64dt8NcIEpWzQNp7uoX5uFhKwT/DdpCFmT2cp8GE
         61yDeGTo9f/7pHTaSC419JY5JIQLefxJFtOm+UQ82bcRSdRZAW7VGXnyoqPKMrnuGJkp
         PvluKX4FzlX64Ly5ra7d0wzaEHZlszCA4Ckl7mjL1fo1RYzVk9CrABPX6EbUvge+4JJn
         tV/Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1766482056; x=1767086856;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=xdv+Kw434solMCgNe+PG6ZV7uuga6N23qYDP/e0DdwY=;
        b=js3fxXYLCLP88bgIaVfP02C6M/f+NDpiZDGw8j5v/x3tia0N+k7y4bRvG3aO9oa8Oc
         cU+N9pRLJl2TwAt03SQZkHNFcZaCkeEUPkg2oMroXXZ6jOzYmsiZ+x1ZVbNZDjW7tuXv
         URzPu1wsNLVwMVK9fwwLyGsJzCcfMHVuBOTojyY0Ign0cZLEaQTc/XIzBorMWXBj1E3W
         qR6xD3np5h7tbnWgeNu57qxCKJOEQGUWqVKeY16yFko7hL2wHJMlQPQLQrELV0J1rPYb
         Asw3OfZ3VLdvLN5MuvuinmH7LzOnGScAEqtKTiCiPiVDrzsBG85BFB376BmaPhuSirxY
         c2mg==
X-Gm-Message-State: AOJu0YwgB+xpQsSKPdaGtnHTgMsX+r+MXLr4Ug9Ms6pao5DkD3tXIptg
	PwB8RvPp2Bq8bCI4WNFsxoQrdXqd6f5MHAKZw8jHKbHOqO2HEl6ATYBTOG92OWK2tjw/aAusCZq
	MOqqRfPF0ulwx5zuSPbEJsAdJz3B7XIAxgaa2iDEJCBATs1fHPVAey/x3vkftREAOWqStc7Ae/P
	xFhw==
X-Gm-Gg: AY/fxX7d3Bz9n94q5F0UuU1rGq7WEqyLC2A8OPyKPKA7RvMGSSHB/FgyK7hyGwxR/a2
	xperciPugA6A5gSJNkXC/WS9IGfxOuwe+3dQYKEJ9jUhhDfm9Asi2b3PjcBGhYQh2AeK4Ug0I8M
	N7BNyqIBS64lszpNI3gqdgfvSguh+y38ZP87JLXHdD3K7WlOIVqE5nnQbUlPpJDi79NTagdChDA
	CDMhnWvtmrQ0G94y3MpB7q2HGwLl7mlq0gkvNA0a6qXonbT5kQY0cy2PwoLkhVTt/B9sjeCHVgz
	O9nOJb/oCPTYeyAcsWUlF2rncu0lLT7cMsNYYYZVJ7N9fNBwHf60lMCrTPQIbloJjGiWVSbkIP/
	NU+HX4AGiQ3y+h0bdg9lBLs+zoIvjfFja5so=
X-Received: by 2002:a05:7022:7e83:b0:11b:ceee:b78a with SMTP id a92af1059eb24-121722ac4eemr11979043c88.19.1766482056228;
        Tue, 23 Dec 2025 01:27:36 -0800 (PST)
X-Google-Smtp-Source: AGHT+IFyn225g2T80mOS4H2fFQrWlbxZvcFkZaDRaP7g/bLR2CUsoMDX7EaVQ9RKV9YV5kMu4Nw6NQ==
X-Received: by 2002:a05:7022:7e83:b0:11b:ceee:b78a with SMTP id a92af1059eb24-121722ac4eemr11979027c88.19.1766482055701;
        Tue, 23 Dec 2025 01:27:35 -0800 (PST)
Received: from hu-zhangq-sha.qualcomm.com ([114.94.8.21])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1217243bbe3sm56130940c88.0.2025.12.23.01.27.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 23 Dec 2025 01:27:35 -0800 (PST)
From: Qian Zhang <qian.zhang@oss.qualcomm.com>
To: ath11k@lists.infradead.org
Cc: linux-wireless@vger.kernel.org, Qian Zhang <qian.zhang@oss.qualcomm.com>,
        Yu Zhang <yu.zhang@oss.qualcomm.com>
Subject: [PATCH ath-next v4 0/6] wifi: ath11k: Add single shot/periodic CFR capture support
Date: Tue, 23 Dec 2025 14:57:22 +0530
Message-Id: <20251223092728.1950017-1-qian.zhang@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-ORIG-GUID: pS6eImHKX_Z-vdn6Avo9IKhskxkpkSAP
X-Proofpoint-GUID: pS6eImHKX_Z-vdn6Avo9IKhskxkpkSAP
X-Authority-Analysis: v=2.4 cv=asi/yCZV c=1 sm=1 tr=0 ts=694a6089 cx=c_pps
 a=oF/VQ+ItUULfLr/lQ2/icg==:117 a=Uz3yg00KUFJ2y2WijEJ4bw==:17
 a=wP3pNCr1ah4A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=VwQbUJbxAAAA:8 a=COk6AnOGAAAA:8 a=EUspDBNiAAAA:8 a=9BubwUf0Dsy1eebtEi0A:9
 a=3WC7DwWrALyhR5TkjVHa:22 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMjIzMDA3NSBTYWx0ZWRfX9T8mRHsunFbj
 92sG/Ae//VFPprAUn/934uwiDWux4R19t65FtJ7CfbltyVLMe71HghBJP4eDhD5u6xSpplVE6pq
 DsOHFAiOjP286TtcKzfivFoQDmo5ta4Ytc1GqTZvHcE8ffYJlbCxFe1KNzsaCtVr6/3iZqvEriJ
 tsNytEGj9vaNXI5qVYNrLBdH+7PC8RobfTdUQwpyP7rW1fzQJnqUv8+Vmd98uPsffZimmzcgFbY
 bgfY65SbCHPDHOsAtzwqaJq2GS3/S7d0qePd/f0NE+u1zoEYH99ZI5RaTftE4zq6OwkJEOMLiFY
 ZFsIc+8wOr4RtkJFfJOaADuQy/k3FRQup3A7lWJU7gWJQaQ4cC/zU9s2JBFKCEiR2e1lJnVcX8v
 FNfdAuSJpj9KikD4nJY2uVflYd5zbsK05lL52BlXyMC8HBKKhvxx+lcUYTtig8SBUPBxYXdbwV7
 opetgjOjXuzR5CaU3qA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-12-23_02,2025-12-22_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1011 priorityscore=1501 malwarescore=0 adultscore=0 spamscore=0
 phishscore=0 lowpriorityscore=0 impostorscore=0 bulkscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2512120000 definitions=main-2512230075
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251223_012738_017158_945BFC0D 
X-CRM114-Status: GOOD (  12.45  )
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

To enable/disable cfr feature use command,

echo <val> > /sys/kernel/debug/ieee80211/phyX/ath11k/enable_cfr

where, val: 0 to disable CFR and 1 to enable CFR.

To enable CFR capture for associated peers,

echo "<val> <bw> <periodicity> <method>"
 >
/sys/kernel/debug/ieee80211/phyX/netdev\:wlanx/stations/<mac>/cfr_capture

val: 0 - stop CFR capture
     1 - start CFR capture
bw: CFR capture bandwidth
     0 - 20MHZ
     1 - 40MHZ
     2 - 80MHZ
Periodicity: Periodicity at which hardware is expceted to collect CFR
dump.
     0 - single shot capture.
     non zero - for Periodic captures (value should be multiple of 10
ms)
method: Method used by hardware to collect the CFR dump.
     0 - from the ACKs of QOS NULL packets.

To enable CFR capture for unassociated clients,

echo "<mac address> <val> <periodicity>"
 > /sys/kernel/debug/ieee80211/phyX/ath11k/cfr_unassoc

Mac address: mac address of the client.
Val: 0 - start CFR capture
     1 - stop CFR capture
Periodicity: Periodicity at which hardware is expceted to collect CFR
dump.
     0 - single shot capture.
     non zero - for Periodic captures (value should be multiple of 10
ms)

To collect the cfr dump,
cat /sys/kernel/debug/ieee80211/phy0/ath11k/cfr_capture0 > /tmp/cfr.bin

Previous link:
https://lore.kernel.org/all/1645005922-7252-1-git-send-email-quic_vnaralas@quicinc.com/

Signed-off-by: Yu Zhang(Yuriy) <yu.zhang@oss.qualcomm.com>
Signed-off-by: Qian Zhang <qian.zhang@oss.qualcomm.com>

---
Changes in v4:
 - Update patch 2/6
Changes in v3:
 - Update related comments.
Changes in v2:
 - Update related comments.
---

Venkateswara Naralasetty (6):
  wifi: ath11k: Add initialization and deinitialization sequence for CFR
    module
  wifi: ath11k: Register debugfs for CFR configuration
  wifi: ath11k: Add support unassociated client CFR
  wifi: ath11k: Register relayfs entries for CFR dump
  wifi: ath11k: Register DBR event handler for CFR data
  wifi: ath11k: Register handler for CFR capture event

 drivers/net/wireless/ath/ath11k/Kconfig       |   11 +
 drivers/net/wireless/ath/ath11k/Makefile      |    1 +
 drivers/net/wireless/ath/ath11k/cfr.c         | 1007 +++++++++++++++++
 drivers/net/wireless/ath/ath11k/cfr.h         |  302 +++++
 drivers/net/wireless/ath/ath11k/core.c        |   41 +-
 drivers/net/wireless/ath/ath11k/core.h        |   19 +-
 drivers/net/wireless/ath/ath11k/dbring.c      |   50 +-
 drivers/net/wireless/ath/ath11k/dbring.h      |    8 +-
 drivers/net/wireless/ath/ath11k/debug.h       |    8 +-
 drivers/net/wireless/ath/ath11k/debugfs_sta.c |  142 ++-
 drivers/net/wireless/ath/ath11k/hal.c         |    3 +-
 drivers/net/wireless/ath/ath11k/hw.h          |    5 +-
 drivers/net/wireless/ath/ath11k/mac.c         |   17 +-
 drivers/net/wireless/ath/ath11k/wmi.c         |  147 ++-
 drivers/net/wireless/ath/ath11k/wmi.h         |   97 +-
 15 files changed, 1832 insertions(+), 26 deletions(-)
 create mode 100644 drivers/net/wireless/ath/ath11k/cfr.c
 create mode 100644 drivers/net/wireless/ath/ath11k/cfr.h


base-commit: 25f833fff81de4fbb9b5382806860b63768567e8
-- 
2.34.1


