Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AD634C54F52
	for <ath11k@archiver.kernel.org>; Wed, 29 Jul 2026 01:05:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Message-Id:Date:Subject:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=MZOKf9mSd0crSLc2wh8F4zMblAYXsOwHLgHJ66RKogc=; b=GYalRPcebMAOhk
	4grB7ksQrzMOtreK9oSUSzuI310m6e8RBqHyeX4LiOjmv5yKOWoyQBEEOIe0R2DQZlQdBnmQvNv5I
	Kev/KMHc57ZSMPmsgQ9s/pJqnXrmiKp/L1IIKdimKx4F2bLnEmTawepGI2vfPQKf1YvohxDWxqo2b
	erhLwO5CMyBOLpie9qSrm58vxI4qEa86LbjKk4Ie0xz8RT/a9ACxVBRz7kmkwQi61wZWXhUL/i+sN
	VqnL3BbAccWfmoYIRqHYgX/gCS+96fKOsDSYgCAmSZgXwtdbl+pkZCnkGrN+b7aoILgPETp9aNCfg
	wfcXc56sUIxFTTdKyplg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wosjq-00000006YYi-1Fbj;
	Wed, 29 Jul 2026 01:05:38 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wosjn-00000006YWn-0kKF
	for ath11k@lists.infradead.org;
	Wed, 29 Jul 2026 01:05:36 +0000
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66SL2mwA4087290
	for <ath11k@lists.infradead.org>; Wed, 29 Jul 2026 01:05:33 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=MZOKf9mSd0crSLc2wh8F4z
	MblAYXsOwHLgHJ66RKogc=; b=JKSl9Mt9+gt0IHs6Rf0xu63xOpDPX/vivq7WaV
	+aQVM28mZvKa9sLgrd0BqBIEDub399c91g6al5rLjkyRxJLdty8ShQ+l5m7TG3Na
	+jhN+mDdYqiRCXkjsgKeYsf4O3Xb37RC0E74xGXx7orShoWY05IHA2zgeY8dIueR
	dBWUw/A22dnJoegupbX3ebDGyEKBILh4l2HgzXM6wLRAxDxYwh5x/BGxDLnD+atQ
	fgkAg7tQtYtvDDvUITraA3DUizGpuSHBYcXbpRYj+un3Lzi+riwEmUDjNhYFwm3c
	2zBDsU0Xc+QeWzIeAV4OZyQto25c60T9LsDimS7177A7jBzw==
Received: from mail-pg1-f198.google.com (mail-pg1-f198.google.com [209.85.215.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fpvtvb46d-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <ath11k@lists.infradead.org>; Wed, 29 Jul 2026 01:05:33 +0000 (GMT)
Received: by mail-pg1-f198.google.com with SMTP id 41be03b00d2f7-c856470fe9fso298316a12.2
        for <ath11k@lists.infradead.org>; Tue, 28 Jul 2026 18:05:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1785287133; x=1785891933; darn=lists.infradead.org;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=MZOKf9mSd0crSLc2wh8F4zMblAYXsOwHLgHJ66RKogc=;
        b=La6st6ahOeID+a0qdl9T9XaqMLsupbyqC4+xQtzdtJx24V43+v5IkJ9do5HU7DXOz0
         /xnioc2y0q9spAEmO6vW3CNz/kX6ENvPw+KP6/PeCeLwF7yON9pBYdd9b23uJ2hHpcEM
         1O8FvbSMD+YgpNUOeUAOfKs2o92a/LZd0K50ks0m+G4v3RDaF2eof+nKvMArjB2fHjCc
         lwl69xYIuAduWNE2pMc+qNjqGR+GQ+dMTfrtlVc6zhThcBKhA/+nHRK8wRmx89Dqel7G
         DL8HyMEtJR3Y180raDYjw9fgNsgxqPpb5LipBL1W0KljcTNS+JtoYEPMQn47y7mXKcyg
         ImNA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785287133; x=1785891933;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=MZOKf9mSd0crSLc2wh8F4zMblAYXsOwHLgHJ66RKogc=;
        b=rgZV4kYwnPlDLF7eAvt3BxsLQiDZHhWbhB/Ao6qTGPG21qyaTKHohxHVyoLdsMOlxP
         xT8q5vtwBhE3moglrMIb2IcqKDB1zJ6U62rpoDsn1sHHH2WTWu80lHPgnNSl1EKpCdL4
         AbE5YNzJbgQ1fjuGzFiL5ldGK/oNm1LPM48buFR5itrwHLHdK0m9v51cZZn8SLIDO+10
         FY6nqvPaek5dAFiXK+FpFTDyKEidYfPe4/pZ8aK54C+m6p5ZphtTX4OfpW5pXPrnbwY0
         i4t6GHd9QyS1o6IqLSlaYd30xJNvm7zs8PNjn7cg9hKgKw3x8IcnXkvmqcITxkGzlXZ9
         f/JQ==
X-Gm-Message-State: AOJu0Yx2LHDYa/3BhiTa5BMSnIPmZm8rQOZNS3AJgy3KYBOHFe1WBggs
	iK1xj0RNwqYcLxkKOXVVHmUvYTz9BiG1wFplY8/wdFIcqmnmgxltenAOrcpG3oiXhj1oiufwphq
	j1bFw8I1wrgdoKfJcH/Rp+SeMZQWHjGDxKSvfOWQKqxuaBhNP5+Tf76cIQFUDlJxHEyuZ5dJp
X-Gm-Gg: AR+sD12474A6VTzjG5VRRM5qXMLA1fzBIul1xKkuDt41qYosonNpwWq64V+zdwqHmWE
	HG7E1VbKpPhrvmV8zhJo+PhhDjv9rhxlwACdDG0xgpIel5QzTeovz+cUrVML+xEwU05aSyrYAzr
	1IUf30WHJYOoFk5ZH1VWwGuy/OHDdl6ZWoZ3zahd2cAx/lgurYC+Uq6n2gQCjeVx+ZVj6kxcJ4Y
	p5j+tFSrzUvdAZlBQ0AzlKtqqFTAslJQBxcgo/9GAxtcNL7NqrVw+JiuDKszx1Vauq0EVzgmNNr
	gB7pDRVgayhFDVdW4Wc6Lk+P/LeXz0bNxUgsGmOe3cwisWV3Kwc3abFxjVvrMI5NL5SWgwdmnXp
	wlZ9Aa3dmL5iRN60ukuxYIGvgpnPO5ZAhLpy8lTa5JKxa/spt57SyX9s=
X-Received: by 2002:a05:6a20:908:b0:3c8:e313:8d42 with SMTP id adf61e73a8af0-3c8e3139510mr383626637.31.1785287132718;
        Tue, 28 Jul 2026 18:05:32 -0700 (PDT)
X-Received: by 2002:a05:6a20:908:b0:3c8:e313:8d42 with SMTP id adf61e73a8af0-3c8e3139510mr383600637.31.1785287132249;
        Tue, 28 Jul 2026 18:05:32 -0700 (PDT)
Received: from hu-jjohnson-lv.qualcomm.com (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-31504b67063sm3699381eec.9.2026.07.28.18.05.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 28 Jul 2026 18:05:31 -0700 (PDT)
From: Jeff Johnson <jeff.johnson@oss.qualcomm.com>
Subject: [PATCH ath-next 0/2] wifi: ath: fix stride mismatch in
 mac_phy_caps_parse
Date: Tue, 28 Jul 2026 18:05:27 -0700
Message-Id: <20260728-mac_phy_caps_parse-stride-mismatch-v1-0-27a9c1a3fbd0@oss.qualcomm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIANdRaWoC/5WNUQqDMBBEryL73UhMUWu/eo8isiRrE2g0zaaii
 Hdv8Ab9GXgMM28HpuiI4V7sEGlx7OYpQ3UpQFucXiScyQxKqka2SgqPegh2GzQGHgJGJsEpOkP
 CO/aYtBXUqk7VNznmAeSjEGl06yl5AiYrJloT9LmxjtMct9O+VGf/j2iphBStkYjXkZradI+Zu
 fx88a1n78sc0B/H8QMAKsWj5QAAAA==
X-Change-ID: 20260720-mac_phy_caps_parse-stride-mismatch-e7292580f072
To: Jeff Johnson <jjohnson@kernel.org>
Cc: ath11k@lists.infradead.org, ath12k@lists.infradead.org,
        linux-wireless@vger.kernel.org, linux-kernel@vger.kernel.org,
        Jeff Johnson <jeff.johnson@oss.qualcomm.com>
X-Mailer: b4 0.14.3
X-Proofpoint-GUID: sTdu3ao9YElmfUvaRJcXNZr0I7bSpchU
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzI5MDAwNSBTYWx0ZWRfXw2aCYDp9NkcG
 YelxjzbwPEGWOU+piFbvnzdOjcQvcwsezoLQ/p+F/is2xy85B0vKh/9L6O6JdpIDcAI/BvnWTCQ
 F/zR8vKE66V7sLq6Hl2qWC1L7HOxMlY=
X-Proofpoint-ORIG-GUID: sTdu3ao9YElmfUvaRJcXNZr0I7bSpchU
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzI5MDAwNSBTYWx0ZWRfX+TPURbvcns7V
 /3d1PQJvalpNodY45E85wS8JJ7fXof/k7c9BKIr9dbMOT4kMxLCRNRIdwLBjmzuYDyI129qjBdK
 C30RA63bUGc5zCQ4tTZ3Mo2I/kV9dgdsvsUhHzCDbT9hpqx3K/zWnGXjKWFlNx/PW09NhxTSnyg
 8wBmsZMijalECaE0XEKIGGSIA7cgZDOsNndzphjjZ0v434toIci1+UQlwpi7DbWj2fyuvHJLHif
 vcqemdc7tPLeM51cEQT9UF9kYzhmHIprt2CBcHM1SHosWe4oZ2CddbEoVg5cvAHsq4sN/DL6O3c
 BIQIdNWKpNoi9vb4PzL2KPYLKPVztouqFYqf9Ybl7FXG+1xE4BSA7seuoAxIEmPu7S6yj/55bxN
 GxLPFhC2bd9RiTYT7HsgWYzP6QPA4KjoGGqZqxj0TaKTWWyGnA8k5IDcApwDAjpkGH2RBIXF9sL
 jSsIMlhKyUlucmIL4KA==
X-Authority-Analysis: v=2.4 cv=dOiWXuZb c=1 sm=1 tr=0 ts=6a6951dd cx=c_pps
 a=Qgeoaf8Lrialg5Z894R3/Q==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22
 a=rUlN9L5Rg0sLS0zbAgQA:9 a=QEXdDO2ut3YA:10 a=x9snwWr2DeNwDh03kgHS:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-28_06,2026-07-28_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 spamscore=0 bulkscore=0 phishscore=0 lowpriorityscore=0
 clxscore=1015 impostorscore=0 suspectscore=0 malwarescore=0
 priorityscore=1501 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2607290005
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260728_180535_354341_7816C599 
X-CRM114-Status: UNSURE (   8.82  )
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

Both ath11k and ath12k have the same issue.

---
Jeff Johnson (2):
      wifi: ath12k: fix stride mismatch in mac_phy_caps_parse()
      wifi: ath11k: fix stride mismatch in mac_phy_caps_parse()

 drivers/net/wireless/ath/ath11k/wmi.c | 8 +++++---
 drivers/net/wireless/ath/ath12k/wmi.c | 8 +++++---
 2 files changed, 10 insertions(+), 6 deletions(-)
---
base-commit: 189721a4afa1804315e7dcfca9ca0539c7b1d7af
change-id: 20260720-mac_phy_caps_parse-stride-mismatch-e7292580f072


