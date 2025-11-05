Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E507ECCFA18
	for <ath11k@archiver.kernel.org>; Wed,  5 Nov 2025 17:22:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Message-Id:Date:Subject:Cc:To:From:Reply-To:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=U+YUYIU9pHv3xXIvUkPp9ADNA4qZc7XK8z6vznVXTVs=; b=kSXG6+ojZcKSRNTS7/rxm3EnTS
	yveCMl9M6BEGk36Hr4/hdYa4/pMDmZa7bVAGx46qxdtClNO41iSa3DQ2q5MGOxY4ZOs9AVYDHqf6X
	C6Wd5EzE4dInzfcdH5FSYczyvO6VKF8G7KNACfVun5T2aP2bQnnEkwbgjW707beHTFPlzWFRuY7VR
	VTvV4Fyk/TLBAfB7XeqdkLKSDty+uaF2Ynlr6cIRnYg+eT5QoJra4+IPSi33g4LS8OrqemeHh34iH
	16At5xpS17wO3Fpc54whebClJcWz1XYauA56hD4rbdEaTAP4gz7XZfzQFarXrQ9Mqw//dLQ+Y3rcR
	vi3XkcsQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vGhDO-0000000E9Vk-3xtF;
	Wed, 05 Nov 2025 17:22:34 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vGhDL-0000000E9UL-3SkB
	for ath11k@lists.infradead.org;
	Wed, 05 Nov 2025 17:22:33 +0000
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5A5B31KD655018
	for <ath11k@lists.infradead.org>; Wed, 5 Nov 2025 17:22:29 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=U+YUYIU9pHv3xXIvUkPp9A
	DNA4qZc7XK8z6vznVXTVs=; b=ivMvtIxWESCNmyu/GgAvo+qFhK8pZqvjYvrtdW
	KrdvKIBoFeSy2hEs+JxyxzBr5LVIPA8oT3Ec/LZ7G/co7yQFti07gc11vvqbgG0S
	8rcDLsG6FuI7DgeD2wWFv85FlcfEo3j3tQNy/cZnuCOCXJVUBU8TpVd7y4kl7fR6
	s0myNNww2eXyC5rYO8HovjgIjPWK6oQ+Hsn4V1QthzwXsfYqJ4E0SwYYPPBJaBcM
	N1d29lOKmtk2ZHrbBcU4wXA6VYaFpsFpgrT1FlTAwlz7OsSEa34BpHF6PaM4HT3G
	9yYL8MiQ5DgCM0vbn9LPrH+wFknzpUDaB8vpJW+iNCZh4FrQ==
Received: from mail-pg1-f198.google.com (mail-pg1-f198.google.com [209.85.215.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4a85c8h2n1-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <ath11k@lists.infradead.org>; Wed, 05 Nov 2025 17:22:29 +0000 (GMT)
Received: by mail-pg1-f198.google.com with SMTP id 41be03b00d2f7-b55283ff3fcso6750a12.3
        for <ath11k@lists.infradead.org>; Wed, 05 Nov 2025 09:22:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1762363348; x=1762968148; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=U+YUYIU9pHv3xXIvUkPp9ADNA4qZc7XK8z6vznVXTVs=;
        b=eaDESdOnzsewWxopwnxNu2pL/+zKyrjWHO7BknG/Frm8hrDr8SE7NQwlTP19J/muC4
         ju9FzzBSZGoK9esmKhBGlHVUEtb/mpeixsR9Oh3kFHuajkaRKJ3pcKSKKxRwUCe9neKB
         pT5s8aNOsZKg97QTFCSwTxI8q3gQ0I40ZLa5N2ZXAmhWRBIS6JWJjzIzdBT+IPBPqFiw
         NCQ6QabamrmYaNsuUk0pnFroPXTmH5+eSIZXHElfdTTBkq/ulPkUD/Dg/vCTKjaSAwSv
         enpm0Zsw3Y3oLLc7epajb+J9vECQFiYXVH2vXaxK2IZlfhldA6Y3aM6iU4j+/2jpd/yW
         FkdQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1762363348; x=1762968148;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=U+YUYIU9pHv3xXIvUkPp9ADNA4qZc7XK8z6vznVXTVs=;
        b=b0RIjJ5TX6EVncTdL8lw6dCiG2N575undwlQE+SJ6a1BfsASx8zjeBCSIgIAIQZYvO
         PVqqJ1hV+afZ+lAAgMCPdjYtTs37oR2RgktaIkolI3Nnbweblcei1ZYYBguoigMDv/oA
         M47LGNyFlmNzbtGYdwg1ul7IwEEX0T1oi1rvVaDjh6p34firqUt52oKMFGug7vb6HbXl
         T1pKd8YrrxGTPYTETNtyW3ZcfF/u0d3AOFMhC09Jt4d4CfsqRVSPR4U443JC2kdqraDy
         YvPRqrhTz7p7J1cL0qL1RG16JfAxge7YwIVEI7LzEfmdrcWMoHqbaPh1zeDo/jRuqX7m
         LrRg==
X-Forwarded-Encrypted: i=1; AJvYcCXY980ji4yEobV9nX9tFCR9ueYh3wQlhZg2TV6qO8L3gPJM9D4rC7o5n8gJ7BMLheDVdupcdYU=@lists.infradead.org
X-Gm-Message-State: AOJu0YzxYrAkV7Be29oAR4PsfMz4X7ju5B0EJpQv05lM1mSJM7c92L0K
	+p8VKJ+w7GiqrPppg6MjX9gCoGhiLxAPEbmaNaZk4av55GPz8z26GyCL2+HS5wnkx1yy+kftiLn
	OsVpH5KGkkG5vhBpNo6GHtGGEQB6LQVVwltWQLcTRpEfl7l0T78Joe7Wxh2Fe8PElAD/L9KRDG2
	Ic9A==
X-Gm-Gg: ASbGnctzOvcx0nWj1KYSwsFrprcrZfQlK+cY4/zMiKvJRPcvtAXW/qFjZ5YKquDaIRc
	3nYe7wJMkdbDswJjpereUMQb30levIuTRxWpO6vDEwvA6oafZWDAnpqP6yRuc8h6JGt9ym8phNx
	BxwCUSg5NJb/4Uq0CnABiOiU5amxh2oCR+qKT6SX6lU3+vBmzUuuloeqa3RHbXZUnRMPbx7ibAW
	F+PI5RfvNWZDtP4UXu1NX/aEPTJP1ctyXQGmga+LRTERUwFWQsBnREnAJHN5Vtd00TM9JQynG/5
	4/qMqUDEemIOJQ176CNFXp04CPOGx7dvYwohnIPsdCrDzfdckWOIWmOCbg/7kHv0kaDEH2TSkV4
	fLYIDJPGTFawjzR/z5Hzbu7yAB2ZPZvqzD55vVTFxjxsG
X-Received: by 2002:a05:6a20:7484:b0:33e:eb7a:4473 with SMTP id adf61e73a8af0-34f846fdc8bmr5054422637.23.1762363348395;
        Wed, 05 Nov 2025 09:22:28 -0800 (PST)
X-Google-Smtp-Source: AGHT+IEZwVfSw3eIQPRT1N/Rx23JfWFgBnMquNlKK4SWJ6as0e82cODYlNwm+u4AWn0nKCkC7l45OQ==
X-Received: by 2002:a05:6a20:7484:b0:33e:eb7a:4473 with SMTP id adf61e73a8af0-34f846fdc8bmr5054375637.23.1762363347827;
        Wed, 05 Nov 2025 09:22:27 -0800 (PST)
Received: from hu-yuzha-lv.qualcomm.com (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-7af48d83c20sm518014b3a.62.2025.11.05.09.22.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 05 Nov 2025 09:22:27 -0800 (PST)
From: "Yu Zhang(Yuriy)" <yu.zhang@oss.qualcomm.com>
To: jjohnson@kernel.org
Cc: baochen.qiang@oss.qualcomm.com, linux-kernel@vger.kernel.org,
        linux-wireless@vger.kernel.org, ath11k@lists.infradead.org
Subject: [PATCH ath-next v3 0/6] wifi: ath11k: Add single shot/periodic CFR capture support
Date: Wed,  5 Nov 2025 09:22:20 -0800
Message-Id: <20251105172226.3182968-1-yu.zhang@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Proofpoint-ORIG-GUID: 7twtGw1uDOS-SzV0YM8zoakcFqTgS5gz
X-Proofpoint-GUID: 7twtGw1uDOS-SzV0YM8zoakcFqTgS5gz
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMTA1MDEzNSBTYWx0ZWRfXxIE2DPD7MXai
 XmEAxiWh/Q6g1UN5w4SHVXBZ1y0QcMLC88Rboj+Xp6QxMs7usXfT/cmYZ3HlJj8Qv7G+kFu001U
 zmtMkYjEeK9G4BDc1kJcmstM5ESux5fBnfTpcPM90mMdD4TNrio4vcu1VxLfcYd1KxH2O2XEVt8
 xelLcca1elkkDTcZ09J2e5QUmwa43VNdhkqiZByqn3N8c0oReQrmUI2MQQms4VyeudmSWlyErTk
 03Z9sgRKUJ3W/OKW4BO+ObTMe5g3jBK44Oj+goV7HpAg17OglnN3NSH5hU18/y6kh/9Jmxbnlyp
 ERTenjgPm5drRyDnnJ/V6etdZZWovTyycO5QPk7Jb8fZQdPc0MjxA6F8/wgM+EmVtAM6ZGWIuDI
 1aULXslGFBM9YXQxQAovDOFcRiwQcw==
X-Authority-Analysis: v=2.4 cv=apS/yCZV c=1 sm=1 tr=0 ts=690b87d5 cx=c_pps
 a=Qgeoaf8Lrialg5Z894R3/Q==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=IkcTkHD0fZMA:10 a=6UeiqGixMTsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=VwQbUJbxAAAA:8 a=COk6AnOGAAAA:8 a=EUspDBNiAAAA:8
 a=DEz-XpLMnQOtgUD9lTEA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=x9snwWr2DeNwDh03kgHS:22 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-11-05_06,2025-11-03_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 suspectscore=0 spamscore=0 malwarescore=0
 lowpriorityscore=0 adultscore=0 bulkscore=0 phishscore=0 clxscore=1015
 impostorscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2510240001
 definitions=main-2511050135
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251105_092231_982456_FB594803 
X-CRM114-Status: GOOD (  12.49  )
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

echo “<mac address> <val> <periodicity>”
 > /sys/kernel/debug/ieee80211/phyX/ath11k/cfr_unassoc

Mac address: mac address of the client.
Val: 0 - start CFR capture
     1 – stop CFR capture
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

---
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
 drivers/net/wireless/ath/ath11k/debugfs_sta.c |  143 ++-
 drivers/net/wireless/ath/ath11k/hal.c         |    3 +-
 drivers/net/wireless/ath/ath11k/hw.h          |    5 +-
 drivers/net/wireless/ath/ath11k/mac.c         |   17 +-
 drivers/net/wireless/ath/ath11k/wmi.c         |  147 ++-
 drivers/net/wireless/ath/ath11k/wmi.h         |   97 +-
 15 files changed, 1833 insertions(+), 26 deletions(-)
 create mode 100644 drivers/net/wireless/ath/ath11k/cfr.c
 create mode 100644 drivers/net/wireless/ath/ath11k/cfr.h


base-commit: 059ca8fd692b67a77fb89e9d4e8f57cf08e32b08
-- 
2.34.1


