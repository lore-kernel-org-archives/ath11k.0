Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3089FE9411C
	for <ath11k@archiver.kernel.org>; Tue, 30 Dec 2025 08:25:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=z6kIqpz/Ze0IIYsOgToqHSxZLG/w25D8IPxklemj1SE=; b=muOAdjxW6UMRe/HgFvNWTvOFAq
	CweaXJm6lp7JuzLjepkGskBK8P917ECm/rZoBX33lz10HQeT5Gwu+XwPnnpUseA3wDrpGl9NtiS+6
	OKwFfsAQ9ox2arwCEqQCIdv+sfYzj2msp1GixTgVh+NjKuUtugyqVtMWnpi1UN/DpFVvw3nwavlV8
	iCMVTl10E3mjhtSUAshjrJjRihWamnTZE1JrPP9dzCSNxIYU4mHjPyPVRyh3riDF902B+aYwcWtQ1
	IIiP2RQrkBRqjjOT37Haxqs/PXHYXoQfDi+sKT7tF1AbCgRced38UQP58Kd6/YnUh55oRnK92Q2Yu
	C72hGRmg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vaV2o-00000004ZcK-2mG5;
	Tue, 30 Dec 2025 08:25:30 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vaV2m-00000004ZbZ-1KPW
	for ath11k@lists.infradead.org;
	Tue, 30 Dec 2025 08:25:29 +0000
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5BTLoYBB2392639
	for <ath11k@lists.infradead.org>; Tue, 30 Dec 2025 08:25:27 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=qcppdkim1; bh=z6kIqpz/Ze0IIYsOgToqHSxZLG/w25D8IPx
	klemj1SE=; b=cMXf6/KuZwLvFaXbwDBdZplu6duGwaltrNZoEfyuFbHbzKXhMdS
	BdchspRTRY8JpXm60+mfRDQ3h+WEs0OWzsR2+YtZHhMeZGUyOeVjq6/fHNrbxHVG
	fOTdwC3lzIujhRSL+0xk0PSwiYaTpsZoV1x+1EFf/zTQzdgWUszLw7usgNgKDoqq
	c+1/W6oTaKNLLFKQbvp59gUBI0YHShwgyJdGc0/BBXnmSIwKA05X0goIXHg4IIpg
	RxqRp5Gl7uN6WSGlO1+QSxsIpR9Kva5iCOQLIP0q66asI0H/LmryTxwxqB9+1PM2
	re6MnJQTNdTk+rLaptHZlOKQnW1nEnMeovA==
Received: from mail-pg1-f199.google.com (mail-pg1-f199.google.com [209.85.215.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4bbqk1ak6b-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <ath11k@lists.infradead.org>; Tue, 30 Dec 2025 08:25:26 +0000 (GMT)
Received: by mail-pg1-f199.google.com with SMTP id 41be03b00d2f7-bce224720d8so18607092a12.1
        for <ath11k@lists.infradead.org>; Tue, 30 Dec 2025 00:25:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1767083126; x=1767687926; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=z6kIqpz/Ze0IIYsOgToqHSxZLG/w25D8IPxklemj1SE=;
        b=U8oT6Ic6nOs2vBVj8T5ZVPrY/ZcIK13iNGIzZaESNH/ziZrMxLiOcpC3L9d9ECH6k2
         3ZyI8uZBT9vzan4py1t6kQaQWsrGTHdoa+MC1FgVrnsGT28TNega6flMnlzqfpPDkMnd
         DxcgUTqQsq/fMSlwurr4ckDjpnQFhhvdDFTf5bt8n5mx2vDdtC/jvcpgF3jsscf6+TxK
         0gKYsyYUawt6QXZRgDELmG5j7Yd2eeT+aRt55d11/nefdz9rSAxSU0vxo5b5KtXAjpcM
         kxD89O3xrFtfXmMNoYvcQS97wdJYD+iEwtqdKuoqtPOQFnwaiqXr5aNgF6h7z4N7ks3i
         AIBA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767083126; x=1767687926;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=z6kIqpz/Ze0IIYsOgToqHSxZLG/w25D8IPxklemj1SE=;
        b=kBrqOSCCVTTgR3Cgq7q5Y6T7XfyA7fEhohsBD1BagyrgEwpyym5ECfoA6Vm6szRC/G
         NzXcIH1100IEhWMQ6ItR2T818KUBo/u4vc6IrHsP0A6btw9rEVIJI1ZaZX4pMBJlqE6Q
         SfbNqhyASV5AhTl2TeQUIAIkJbTiQWy/OkiTCjbTTQCZ7Vlsnp8dMcX/GV6TRmhwlLXn
         Qtbemtj5cAwJcY39q5+wiSCO7YrWtQk6dW4ZGtn+HjCI16s235w40yudMcA73I32cWLe
         I7AzlCptx1PnRo4pae31qQGvTegSqMSnPbEqIOqHwkxtbjta1pLxHhChz3Ysvrb5yHuL
         3Ziw==
X-Gm-Message-State: AOJu0YwJ3dwzPabcoqLbAMcEydcn4RTL8kDoNsA6S/uleU1wpecw28RI
	2UOsyRDHptZUxVi4lsaWrggezpByWzsl+MwEx/JRv+TdykFvAxRLV1TT/eH7acn4q8L1g14suOS
	RUQSLffxCculGo/qjCyKxUKM1WtO3FhorDFZJMymtgQu+BpYm54Yr3CIXQnZTWCTBA3CRgH4dJE
	yUQA==
X-Gm-Gg: AY/fxX67iNeyZef+0oSdEX6G7tzi+ab4tXs+Dv1lsQjk1Gm3JsGcslhgdGiVyTzz6LO
	ktfZK98CRkK3wKaaW+R7B+GGTC+P9aQA2u3YQaL5WnJqR1QgzQMfH4TekrJTj5HAlNkiAdABOhM
	MA0OeMdRst7KHWrf1EHAj9H2Zb2SwynhqJrlY4KuGfGqfZgEpbXV/fkr9XnuUMay7DFK6ebWhjL
	p6oDA4NkZ0yQ+5LmeBIMsSgnqrKXsvr/Wk3OjQPKzYKHAJhIuEv1kfzHOqFhylIn5ukosdASuns
	Advpsh0Go2krS8pNNPo+sjeroanuLB9xY8/1zFE8z+Vs8Az12xeDrG1X96A0vQGb8e5M9TT6Pp4
	29JZ5UIpNSDUgSnuH96RIiiZQ7AAy250OP7o=
X-Received: by 2002:a05:7300:881a:b0:2ae:598e:abe8 with SMTP id 5a478bee46e88-2b05ec8547amr34799906eec.24.1767083126084;
        Tue, 30 Dec 2025 00:25:26 -0800 (PST)
X-Google-Smtp-Source: AGHT+IHZ03fBnJh5IVut31WCRFRfBq74vw+oTGSzxa1jpYzzB+8Z+UAHAf5MM2mbT8P0rljvnB5NeA==
X-Received: by 2002:a05:7300:881a:b0:2ae:598e:abe8 with SMTP id 5a478bee46e88-2b05ec8547amr34799884eec.24.1767083125213;
        Tue, 30 Dec 2025 00:25:25 -0800 (PST)
Received: from hu-zhangq-sha.qualcomm.com ([114.94.8.21])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-2b05fcfc1b7sm73275620eec.0.2025.12.30.00.25.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 30 Dec 2025 00:25:24 -0800 (PST)
From: Qian Zhang <qian.zhang@oss.qualcomm.com>
To: ath11k@lists.infradead.org
Cc: linux-wireless@vger.kernel.org, Qian Zhang <qian.zhang@oss.qualcomm.com>,
        Yu Zhang <yu.zhang@oss.qualcomm.com>
Subject: [PATCH ath-next v5 0/6] wifi: ath11k: Add single shot/periodic CFR capture support
Date: Tue, 30 Dec 2025 13:55:14 +0530
Message-Id: <20251230082520.3401007-1-qian.zhang@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-ORIG-GUID: S4WglwPCplpoZBvbAmm8i2w57K82aGsv
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMjMwMDA3NSBTYWx0ZWRfX6U0yTfqUIs0j
 Ix7cLDsBA0wjIVrJDvdRf7guCobyWqHviBaNFP9w+sHyPBAcUffvnJeINjS2LWg1q/BFgqbG5N5
 s3vrX+G0St/iiodqIt0Mf/tu9sAWl46zaVJR0pYRQrdGj9VWx2hMLyzxRc6a6h9T9A4aGztaQrg
 vFKbhe7P0dTgS5zmo6sSlnScHSIj9T2uXWS5h5jH/XxD7N3nTGQ0fhPNOUUXEM8XyR80QCf7jIt
 YXD07oS5AhlQCEKi4OGF/P3zve6oWbZX++sTVLljawWxOt97bYDIGmKAoVkQ6wn90+1Cg8W8YX/
 dij1ACwg/QVfbgT4E/E9CUUgb9AHmjZKNLUa6E5hkcqnkmIHmipio23RX0u25k0x7JtLVnlG6Qb
 ww3DNI6NoMWwsQQ8BKj8/KynSu9SGELhpNF78MG55QTRIJ0lPvYnHLRjinTw2KyTSMx6toPgMck
 uAQy8LYeIitt07S+R1Q==
X-Authority-Analysis: v=2.4 cv=Tf6bdBQh c=1 sm=1 tr=0 ts=69538c77 cx=c_pps
 a=Oh5Dbbf/trHjhBongsHeRQ==:117 a=Uz3yg00KUFJ2y2WijEJ4bw==:17
 a=wP3pNCr1ah4A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=VwQbUJbxAAAA:8 a=COk6AnOGAAAA:8 a=EUspDBNiAAAA:8 a=yv3IMDKv9k7fc5CDy5MA:9
 a=_Vgx9l1VpLgwpw_dHYaR:22 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-GUID: S4WglwPCplpoZBvbAmm8i2w57K82aGsv
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-12-29_07,2025-12-30_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 clxscore=1015 impostorscore=0 suspectscore=0 malwarescore=0
 spamscore=0 lowpriorityscore=0 phishscore=0 priorityscore=1501 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2512120000 definitions=main-2512300075
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251230_002528_367500_AB148006 
X-CRM114-Status: GOOD (  13.65  )
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
Changes in v5:
 - Restore the author in all patch commit messages.
 - Update patch 6/6. Cache the phymode during association and
   use it to replace phymode reported by the firmware.
Changes in v4:
 - Update patch 2/6. Remove redundant bw parameter check in
   ath11k_dbg_sta_write_cfr_capture()
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
 drivers/net/wireless/ath/ath11k/cfr.c         | 1022 +++++++++++++++++
 drivers/net/wireless/ath/ath11k/cfr.h         |  308 +++++
 drivers/net/wireless/ath/ath11k/core.c        |   41 +-
 drivers/net/wireless/ath/ath11k/core.h        |   19 +-
 drivers/net/wireless/ath/ath11k/dbring.c      |   50 +-
 drivers/net/wireless/ath/ath11k/dbring.h      |    8 +-
 drivers/net/wireless/ath/ath11k/debug.h       |    8 +-
 drivers/net/wireless/ath/ath11k/debugfs_sta.c |  142 ++-
 drivers/net/wireless/ath/ath11k/hal.c         |    3 +-
 drivers/net/wireless/ath/ath11k/hw.h          |    5 +-
 drivers/net/wireless/ath/ath11k/mac.c         |   19 +-
 drivers/net/wireless/ath/ath11k/wmi.c         |  147 ++-
 drivers/net/wireless/ath/ath11k/wmi.h         |   97 +-
 15 files changed, 1855 insertions(+), 26 deletions(-)
 create mode 100644 drivers/net/wireless/ath/ath11k/cfr.c
 create mode 100644 drivers/net/wireless/ath/ath11k/cfr.h


base-commit: 4465d808fda12fa47f83733a9f7b7dbc29d0ea54
prerequisite-patch-id: f44bdcbd36af0c3fd57b477848bf4699cade9389
prerequisite-patch-id: 76c61f8f00aac2a3b9ff31e0166bb12997c2b0cf
prerequisite-patch-id: 886b24b2496167c304e8ed42b5d879e0ecab111c
prerequisite-patch-id: 672baf608620c531b3765941c2719ad9d34b99c1
prerequisite-patch-id: 07c9ff6fcaf4ba464be993caa19eb49113eedbdf
-- 
2.34.1


