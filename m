Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 74615C433EF
	for <ath11k@archiver.kernel.org>; Tue, 30 Nov 2021 17:51:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:CC
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=QDId89axsBtDkFPE243VcjHZryU/f95+Yf9mBmBynJk=; b=rDvZr6e6iJ7C41
	+qneMPtypKmh/u+TKKZq8LYqTnUEU8llRXN2aK/fGkU5TyW0KtrjNLGdg1lJFZ2HI9B8b5un6HEeG
	Jp31vC+E3l13gIPqw0oNj+PREoUR+wC4sHfV82OD4nL7x06lBK6YEvhS7HwOCR7UvcU97gtImJcIm
	ZmJzWsgSwyXnf/mP4VK8aWsLnY4IdDuaaI5rqDducWe4ZkpCsFLRVGPjj5tL3wzLf6SNmqLiK7bPt
	slWN3RHTIKL7hKOgTl9cAyJKEcGRzzWTBkDs1JPmFnRsNWGdjlhF0p8EE6kb6z84ZtkFRHLyUmmsq
	GZAokSg1INTMpEeCVQtQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ms7Hj-006OuO-CW; Tue, 30 Nov 2021 17:51:19 +0000
Received: from alexa-out.qualcomm.com ([129.46.98.28])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1ms7Hf-006OtP-TR
 for ath11k@lists.infradead.org; Tue, 30 Nov 2021 17:51:17 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=quicinc.com; i=@quicinc.com; q=dns/txt; s=qcdkim;
 t=1638294676; x=1669830676;
 h=from:to:cc:subject:date:message-id:mime-version;
 bh=2IKdhhCjaL2qt7idoUOQkSwxJJjrvzuuIwI6+Uzmgfg=;
 b=zI2olSkQyprTJmF4gclIQhuzFhj/5kYkEdntXZUA7vXkz8DfTNIETDvF
 syztO0CuWq96kWx07UVqPy9dKcscvjyAwk6yREGDHHDiQI8qi+am3uaO1
 d5aeNuwWVkeXGhLTLBGDDtISWhw20+MSah0ggrxPKxVmoG6FrFR22rsJ+ 8=;
Received: from ironmsg09-lv.qualcomm.com ([10.47.202.153])
 by alexa-out.qualcomm.com with ESMTP; 30 Nov 2021 09:51:13 -0800
X-QCInternal: smtphost
Received: from nasanex01c.na.qualcomm.com ([10.47.97.222])
 by ironmsg09-lv.qualcomm.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Nov 2021 09:51:13 -0800
Received: from nalasex01a.na.qualcomm.com (10.47.209.196) by
 nasanex01c.na.qualcomm.com (10.47.97.222) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.922.19; Tue, 30 Nov 2021 09:51:12 -0800
Received: from ppranees-linux.qualcomm.com (10.80.80.8) by
 nalasex01a.na.qualcomm.com (10.47.209.196) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.922.19; Tue, 30 Nov 2021 09:51:10 -0800
From: P Praneesh <quic_ppranees@quicinc.com>
To: <ath11k@lists.infradead.org>, <johannes@sipsolutions.net>
CC: <linux-wireless@vger.kernel.org>, P Praneesh <quic_ppranees@quicinc.com>
Subject: [PATCH 0/2] mac80211/ath11k: add FEC type in radiotap header
Date: Tue, 30 Nov 2021 23:20:46 +0530
Message-ID: <1638294648-844-1-git-send-email-quic_ppranees@quicinc.com>
X-Mailer: git-send-email 2.7.4
MIME-Version: 1.0
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211130_095116_038669_0F34B38A 
X-CRM114-Status: UNSURE (   8.19  )
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "ath11k" <ath11k-bounces@lists.infradead.org>
Errors-To: ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org

This patch series adds LDPC FEC type in 802.11 radiotap header
in the captured packets.

P Praneesh (2):
  mac80211: fix FEC flag in radio tap header
  ath11k: add LDPC FEC type in 802.11 radiotap header

 drivers/net/wireless/ath/ath11k/dp_rx.c | 12 +++++++++++-
 drivers/net/wireless/ath/ath11k/hw.c    | 16 ++++++++++++++++
 drivers/net/wireless/ath/ath11k/hw.h    |  1 +
 net/mac80211/rx.c                       |  7 ++++++-
 4 files changed, 34 insertions(+), 2 deletions(-)

-- 
2.7.4


-- 
ath11k mailing list
ath11k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath11k
