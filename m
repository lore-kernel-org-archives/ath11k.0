Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 32DF8C02183
	for <ath11k@archiver.kernel.org>; Sun, 19 Jan 2025 05:23:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=gDWiRUfx1ZKo8bEQYsYj0h07t8RZmfw5u+KjMRLsDSg=; b=wW9c7r9JItGLYMv7ZnOoBVZeTQ
	MKizH7mcN0QHWTnaerhM+WryvIrxVKdicsJOsfqYmdlqEwQSWcy1HIItu2GLxbWhs0dxY3IqqkkR8
	FONoqwKPiMoQIBZFAwMEjpeCSDgf3sSJswmmEbWfgTsWgbWRd/K/3ZaOOUgnDrU9NAOHYQXE2/TmZ
	0gx/YTXgsWmH/rvfeCFZ2hOqWK3VYKwP3Po7YiuooExGVwxPijndh2dpXpWqZnAHIPAw9f9k+i75f
	tjqNz5z0YwDjGXUANlYI9NPTvM+qJ6IYr6BDlDKFwv8raqMdDpYlOjKhjmtHLB7FJ2l+5RgSi+ghC
	nr5VFQ1Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tZNmW-00000003QOa-3psZ;
	Sun, 19 Jan 2025 05:23:32 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tZNlx-00000003QIk-1L7H
	for ath11k@lists.infradead.org;
	Sun, 19 Jan 2025 05:23:02 +0000
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 50J4gR1I020959
	for <ath11k@lists.infradead.org>; Sun, 19 Jan 2025 05:22:55 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=qcppdkim1; bh=gDWiRUfx1ZKo8bEQYsYj0h07t8RZmfw5u+K
	jMRLsDSg=; b=m4/vwzaVKEuOooWxqHIHSvE/g/LVd/1VDXMvkoIC7Uw1AmRvwwb
	3U/pz8lOMphZSmOSFNxHKQELE38D8eczGjBlotLjCw9AH2CkFJ3ODBthIRarsdzn
	m7tK58ppXeQFKNocx6cnEaq7GHHzLpLsY4vBl+NzfjQdI7EmcKaLccq/ddmyv8dp
	MuFmr/nrzcwBrjTkUhJt58tFTpVhCMVtftpKZSoBAxBUI9uaZsbX0dTRtOOF1uPA
	nprqlHERowo1MHIk0bLR2Zu+Bo2PiXCaaTWuZ4y9FgqoYKZ/zCSRTrQ9RgsPmBD9
	HAFe9QxMonFTB8iL81RCy1PWvayq4Pos51w==
Received: from mail-pj1-f71.google.com (mail-pj1-f71.google.com [209.85.216.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 44852d1gux-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <ath11k@lists.infradead.org>; Sun, 19 Jan 2025 05:22:55 +0000 (GMT)
Received: by mail-pj1-f71.google.com with SMTP id 98e67ed59e1d1-2f550d28f7dso6465067a91.3
        for <ath11k@lists.infradead.org>; Sat, 18 Jan 2025 21:22:55 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1737264174; x=1737868974;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=gDWiRUfx1ZKo8bEQYsYj0h07t8RZmfw5u+KjMRLsDSg=;
        b=PutlBTCk9febROqZYU9K3i4aXXkXxtsex6jdWc7nb3qpcEWxvy72FbelHF61cAXeWh
         TiSYz3SR/8OjR6y7p66zDnfgWd2Vg4x/00syCWbQ02sTpfg5gy2eK+sxEmBilOYe6lUn
         USu+bFlIo15NqkokXTTgI7tEdAk9x+ooeyicxmIjk6Y9vwB5JHhWpauyOIZloOgLP8cM
         DtYDbWDzw0GG0IQaNnFYkBWzrOyulRTnRlV4keTT1INNs/Nmt1FkqIhmfRykKEWSwY6s
         bT2p3UZn8gIMRa4Yh31J50kFxdNQZW5W0vPU6m5eP2mZL7xq8+EZXMgAvXPld2uXfelp
         ZB4w==
X-Gm-Message-State: AOJu0Yy0FwQQFtmahyP7g9AIaE/l/hP7kOfncNg3+EEYJylfqz8gP2Qt
	GQp9/DxRss6RQb1zTpgdfRohNHkVNo8FoXVq84uxtWwmBmYpcaOgtwTlAMWCds1D4QddVFfIjqQ
	bgszNNh44NkfRBw4VBMrf6+S9CCKixro4JkIIN6Fc0Yiisu+YFbITvJ23Z2Ool8TUwM2t
X-Gm-Gg: ASbGncsoGceLJ4/EKMGLwLpoS46k/2qu9un8W4Bjtxewo2pkSXsiDel/uYqclGcZcHr
	zaM/GYqhhKi2TNgR80xCqZdJtLsjhlVAufSUjcz/fnIYWCuY2xaBfDW/LMpz++LPFKRJ9KeAOaU
	R/cb3tupSwpsPm0FOTzu5SebiDfMV+l5pvYBkad+OO68Ph/x98zv9B8J+DiAIivcbifo3PSYHax
	JZtMTrQhRgML7+mCdpMGby17m91XRZgYolGvHiTy0aTi5gHcHve20ltAp8YoqZuBqNLoa1Ii4nx
	Eh5l00tRwurOWp3dN52VDNpBFhB/rcylBbF+QLOC4GgNXuDkBA==
X-Received: by 2002:a17:90b:530f:b0:2ea:5054:6c44 with SMTP id 98e67ed59e1d1-2f782d86491mr11714020a91.31.1737264174243;
        Sat, 18 Jan 2025 21:22:54 -0800 (PST)
X-Google-Smtp-Source: AGHT+IGm13KSOHvfQLgtw6hyQxS9E/MOoHXkOylL19cWnXyfaDpZ+N8bKi720gk6gFcr/UUVFUF40g==
X-Received: by 2002:a17:90b:530f:b0:2ea:5054:6c44 with SMTP id 98e67ed59e1d1-2f782d86491mr11714004a91.31.1737264173826;
        Sat, 18 Jan 2025 21:22:53 -0800 (PST)
Received: from alokad-linux.qualcomm.com (i-global254.qualcomm.com. [199.106.103.254])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-2f77611a295sm5062553a91.7.2025.01.18.21.22.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 18 Jan 2025 21:22:53 -0800 (PST)
From: aloka.dixit@oss.qualcomm.com
To: ath11k@lists.infradead.org, ath12k@lists.infradead.org,
        linux-wireless@vger.kernel.org
Cc: Aloka Dixit <aloka.dixit@oss.qualcomm.com>
Subject: [PATCH v2 0/5] wifi:ath11k/ath12k: refactor tx_arvif retrieval
Date: Sat, 18 Jan 2025 21:22:45 -0800
Message-Id: <20250119052250.3488343-1-aloka.dixit@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-ORIG-GUID: nExtEUbwMDDOG_zGlApE9GyN9GhscPhC
X-Proofpoint-GUID: nExtEUbwMDDOG_zGlApE9GyN9GhscPhC
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1057,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-01-18_10,2025-01-16_01,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 adultscore=0 malwarescore=0
 clxscore=1011 bulkscore=0 mlxscore=0 phishscore=0 mlxlogscore=926
 impostorscore=0 priorityscore=1501 suspectscore=0 spamscore=0
 lowpriorityscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2411120000 definitions=main-2501190042
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250118_212257_807395_6590844C 
X-CRM114-Status: UNSURE (   8.79  )
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

From: Aloka Dixit <aloka.dixit@oss.qualcomm.com>

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

v2: fixed kernel test robot error in patch 1/5 for tx_vif.
https://lore.kernel.org/oe-kbuild-all/202501160626.Jbb3GHnk-lkp@intel.com

Aloka Dixit (5):
  wifi: ath11k: refactor transmitted arvif retrieval
  wifi: ath11k: pass tx arvif for MBSSID and EMA beacon generation
  wifi: ath12k: refactor transmitted arvif retrieval
  wifi: ath12k: pass tx arvif for MBSSID and EMA beacon generation
  wifi: ath12k: pass BSSID index as input for EMA

 drivers/net/wireless/ath/ath11k/mac.c | 75 ++++++++++++-------------
 drivers/net/wireless/ath/ath12k/mac.c | 81 +++++++++++++--------------
 2 files changed, 76 insertions(+), 80 deletions(-)


base-commit: e12eaef2f7ad3451fea43de58fd9da64ec888c01
-- 
2.34.1


