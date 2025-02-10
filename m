Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AD2F2C3DA4A
	for <ath11k@archiver.kernel.org>; Mon, 10 Feb 2025 19:40:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=Gjew95/V5NgXtpzaCazVN4ozklSBnkqrhwTSJOZZ9N8=; b=kHMH1IDRqqopdoq3ig0GvUD/42
	pUDSZhzGScF6At6yrK+wx4HIjpLhISpA7+NFA/7WWW6/hB45JmGO3/2rrUAnQj0hMOwaqq+NvYnEa
	ZddMAVB3WjFaopYhj9rqcMOvcIVgr5JCe/1OAhSXmfigymFZWF7pgsfQ9UrOrS2yf50Y2F0nNBHj4
	HRAUWpn4XBrvS1SDz373D2+1ZWBJsZZn5DgnADvSux2pdMQ0cVFdQdClIfiNWLQlT0Qz3OFvCIebE
	zCOwncFSw8QssBJoC+xU/UZqGI0mcClv+tflKkvluk6UclkWMz0KnE+DB46Xjxwqz2UZUWW2re0xj
	zT/xomJQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1thZeB-00000001AXI-3uh1;
	Mon, 10 Feb 2025 19:40:47 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1thYVA-00000000v2j-0ZxJ
	for ath11k@lists.infradead.org;
	Mon, 10 Feb 2025 18:27:25 +0000
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 51ABgOeU000355
	for <ath11k@lists.infradead.org>; Mon, 10 Feb 2025 18:27:22 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=qcppdkim1; bh=Gjew95/V5NgXtpzaCazVN4ozklSBnkqrhwT
	SJOZZ9N8=; b=l9SRFCHx4pR1Z5GE9YMfbgbC/CF3IeBeLGIUaZh2eU74+BhgC49
	632AQsMVgAUT+v8rKJYQnv7tPnzOrvLI4BAors9EZLZTunu9ehQa6pHihAlr8kSc
	Vh7x86zb953NhcceiAdundKauAxyyfLCml++cy4SyizmNZVjqUltLLfZBuL0BRoP
	gJB0S9uvy96QX4pbWiH2gbEF+VoqTBf5vicmdWThmcau+exkdUzeZX2IRmbkNLO5
	ENNlicQ+/qIBx8B4FP+PAvS2aoW0jIGzXm2LO4ZtS1mNaq38aX+Iq8VNXKCD/Khe
	F4CTv1HyhwaVnlhYQcEOTBPUPl1gu0ENRgw==
Received: from mail-pj1-f70.google.com (mail-pj1-f70.google.com [209.85.216.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 44qgtk12wq-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <ath11k@lists.infradead.org>; Mon, 10 Feb 2025 18:27:22 +0000 (GMT)
Received: by mail-pj1-f70.google.com with SMTP id 98e67ed59e1d1-2fa6610fe70so3269287a91.1
        for <ath11k@lists.infradead.org>; Mon, 10 Feb 2025 10:27:22 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739212041; x=1739816841;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Gjew95/V5NgXtpzaCazVN4ozklSBnkqrhwTSJOZZ9N8=;
        b=JV0CuNbhS7m/0mhzy5e7l7JCXjxRojG+t1OqiBCNlr2mOjL4MmyFJhWVuledIqIaBY
         JVo6r+n5JaDVAjCQG2pFKXGqVEk63XZ/M65yGqEHvYHwzV0DUxP2iuseqhnxTksCKxG9
         N2O87rTIqkSe/xmSB6DIs/peS31ZR9qYlTqyxHJ+E4h1gblgopSM66qfmqlNGO268NhN
         8q9iHtBhOpdaLL8yqT63V20hoM6joLSrWu6PQ6vXbYVXUJroJLvLmr514kCRTODuk7LV
         CVDFfU2qASCaQ3nYT08qh+y5vImZNihBQ8WDaZeo27KcdXdgHiMBhnMBhvANEUotHQTS
         JqlA==
X-Gm-Message-State: AOJu0YzVzTL3wxc0/Z4HFtQ7boPt38WFh931CJXk7joQQeCAWP/YIBb5
	aYLWWEaJ94poi4St28gm+44kiGZwkwte+5hjvd8oEcGLV5fV0KyNBFl5mFVJBhimPlWGrqmEduq
	yVAuMxrWhUmOWiF10F13VYXUAbJ9PljE7KrcKXmebz7QaS3r/Gx/ZwTDyqG1IE8vX4FVO
X-Gm-Gg: ASbGncuVjfLeSaq6TiHUSETNPvqkz7QmGj8hs9oj0IVP/4Pr3kRaDYVdqlD0V7jd0jx
	EaK/Vs8iTZdNG5/SOxPWPg5AJqWkoUCOh2yqoeAdWf7lsHabHENs08Oz0qAma2sJLVi9kRb2S9W
	hhhBbTJ30Sl39xp0tgPVwA7yt0+ZxXG/lZwT1cbER0KkuV1lOOClkaCa5XiEyLWtjoZ/bgsmwNU
	za8E8VQGE/uwakcF8+za18YbgWq5J+r64SF2f+oAdN9PY2teFbjl1VUnLteanaIXkOTrPV52Z+b
	RkSAXfJrvPgDkd9ii/WCgWrwF7bPDTQVx9V0iIBj4NrEIGsekTjUUY5yS7RN
X-Received: by 2002:a05:6a00:2289:b0:725:460e:6bc0 with SMTP id d2e1a72fcca58-7305d2ac0admr25649697b3a.0.1739212041117;
        Mon, 10 Feb 2025 10:27:21 -0800 (PST)
X-Google-Smtp-Source: AGHT+IFPXrpGR0BvSH58Ju3d8FrcHnAh2KNvN/0WuaoCUw7XmsBPUZo/Z3DUS+E2PBVelTjibLdOTQ==
X-Received: by 2002:a05:6a00:2289:b0:725:460e:6bc0 with SMTP id d2e1a72fcca58-7305d2ac0admr25649634b3a.0.1739212040605;
        Mon, 10 Feb 2025 10:27:20 -0800 (PST)
Received: from alokad-linux.qualcomm.com (i-global254.qualcomm.com. [199.106.103.254])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-73048ae8e83sm7948372b3a.84.2025.02.10.10.27.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 10 Feb 2025 10:27:20 -0800 (PST)
From: Aloka Dixit <aloka.dixit@oss.qualcomm.com>
To: ath11k@lists.infradead.org, ath12k@lists.infradead.org,
        linux-wireless@vger.kernel.org
Cc: Aloka Dixit <aloka.dixit@oss.qualcomm.com>
Subject: [PATCH v4 0/5] wifi:ath11k/ath12k: refactor tx_arvif retrieval
Date: Mon, 10 Feb 2025 10:27:13 -0800
Message-Id: <20250210182718.408891-1-aloka.dixit@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-GUID: zZ9O44GEUcZ_0Vpjn-294YMv24jVEgLP
X-Proofpoint-ORIG-GUID: zZ9O44GEUcZ_0Vpjn-294YMv24jVEgLP
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1057,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-02-10_10,2025-02-10_01,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 spamscore=0
 priorityscore=1501 suspectscore=0 phishscore=0 impostorscore=0
 adultscore=0 clxscore=1015 mlxscore=0 malwarescore=0 bulkscore=0
 lowpriorityscore=0 mlxlogscore=999 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.19.0-2501170000 definitions=main-2502100149
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250210_102724_193468_E8668588 
X-CRM114-Status: UNSURE (   9.14  )
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

MLO MBSSID series for cfg80211/mac80211, which is in review here 
https://patchwork.kernel.org/project/linux-wireless/list/?series=902914&state=%2A&archive=both,
changes the way transmitted profile data is stored for each link.
As drivers currently retrieve 'arvif' for transmitted profile at
multiple places, MLO MBSSID changes will becomes unnecessarily
bloated with RCU operations for every retrieval. Refactor 'tx_arvif'
to avoid this.

Additionally, fix an issue in ath11k_mac_update_vif_chan() where
tx_arvif is not reset to NULL inside 'for' loop during each
iteration.

v4: Added "compile tested only" in commit descriptions for ath11k.

v3: addressed comment from v2 and removed NULL check for
vif->mbssid_tx_vif from patch #1.

v2: fixed kernel test robot error in patch 1/5 for tx_vif.
https://lore.kernel.org/oe-kbuild-all/202501160626.Jbb3GHnk-lkp@intel.com

Aloka Dixit (5):
  wifi: ath11k: refactor transmitted arvif retrieval
  wifi: ath11k: pass tx arvif for MBSSID and EMA beacon generation
  wifi: ath12k: refactor transmitted arvif retrieval
  wifi: ath12k: pass tx arvif for MBSSID and EMA beacon generation
  wifi: ath12k: pass BSSID index as input for EMA

 drivers/net/wireless/ath/ath11k/mac.c | 73 ++++++++++++------------
 drivers/net/wireless/ath/ath12k/mac.c | 81 +++++++++++++--------------
 2 files changed, 75 insertions(+), 79 deletions(-)

-- 
2.34.1


