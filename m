Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5EE36C79F9E
	for <ath11k@archiver.kernel.org>; Tue,  8 Sep 2026 13:53:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=hw+5cnd4ki5dnOjOOpMKffR2NH2On0qgbSYRCUSuV0A=; b=zfhPlCPNi6WXi5aEZzq+rkwfQK
	2EKX7FDkWMlFaHWHGAX2/rhNtKR8zyYoyIRkpe/z8qPr11JD/ht9ib5ze0TeRob1+iwwDnAPoSJaV
	Zl1T/k8cueHCfxhm5iqnHqoOT+YxDaBqF3HSSvKAw5ROi+E5IpavIyqVnvgjpulLSbMrcrnRndYYA
	N4SVTyb63PWLhjcKYcAFky0q0ucwIIycjcOEqae4RzbzSYwuD8mtLt8rQKpwLnnL1CQkcWCQnt9OQ
	rD+HFQPdEq6Wjn5mfT797i+NRwQ+AztPqV6f0K51KrBqBADZPVFfWZsAw179uXCWW+AqZ2IA1mx/Z
	YvF5asZw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x3wGR-00000009Boi-3tpS;
	Tue, 08 Sep 2026 13:53:31 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x3wGK-00000009Bh3-0hqS
	for ath11k@bombadil.infradead.org;
	Tue, 08 Sep 2026 13:53:28 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:MIME-Version
	:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:
	Content-Type:Content-ID:Content-Description;
	bh=hw+5cnd4ki5dnOjOOpMKffR2NH2On0qgbSYRCUSuV0A=; b=Z8W3ehYYpctOYf+hTDD17tMO2A
	tOMds86AODbiJdAEne4XWDvX+xRTFZLDTkRC37wDHCDKyufuPTrL5wuRigNWr9WmBLCXtM87F1ooD
	mpUBhynZ7IMb5/DOcvbd1UGXh0DO858S/Ce6FsKEnoimhLc8m1/kFrKDtYBiNYI94HXojSKdDOf0y
	CWbeXatHUEAQAcnVl+n/+2lmvdxnWJVnn/fYDoaoRPkQux+n8QTM7eBKfR9XbwyLkgcVVm6VUEBhk
	YtbNf4h7roI5WsV46NEaYFkw5faq9C/Bwcx2dW1oV0ap2F5YPD+dnOYdyv6yHcVJ9bpgwegxSqEly
	CjrQX3sQ==;
Received: from mail-ed1-x52c.google.com ([2a00:1450:4864:20::52c])
	by desiato.infradead.org with esmtps (Exim 4.99.2 #2 (Red Hat Linux))
	id 1x3wGH-0000000HUhx-0dmW
	for ath11k@lists.infradead.org;
	Tue, 08 Sep 2026 13:53:22 +0000
Received: by mail-ed1-x52c.google.com with SMTP id 4fb4d7f45d1cf-6a623987d32so6916007a12.1
        for <ath11k@lists.infradead.org>; Tue, 08 Sep 2026 06:53:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bairaktaris.de; s=google; t=1788875599; x=1789480399; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=hw+5cnd4ki5dnOjOOpMKffR2NH2On0qgbSYRCUSuV0A=;
        b=sQOFAjrQ97Rma0JwHPBHqO0MJWuhGravQvGyU+zSYK3Di1wbnwv1G6mOnRSTBAuTQq
         GLkrkIBZ1I77VnH56PBPUGy/Ac7MpotU0swN8dybu88p+eAPEhyvdnsLhuivTdLq84N2
         DrDuJbSLLFHve7EljkNi26rliJBoK+P7D/RIeSmNE58KFcjuAKEgTTIDrd2Z5YesQDv3
         O0BbQjQeTQ+gSHSHgik4G0cxaU36MUZDWEWaraWfkcJaKzGTINLvhYWyoMStA9rPpG5+
         c+/JQsIkjC/J/qRTGsocx8XfxxMeFd/nL7+NVVjWJWtQTcFuvSteOj8oYaZh4bxWyHEo
         RLsw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788875599; x=1789480399;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=hw+5cnd4ki5dnOjOOpMKffR2NH2On0qgbSYRCUSuV0A=;
        b=L9QBy08EcsxAmy8fXGatYKjFyygiooXKMfunGk1deoIbu2QRTArXLY9VS9U8NO8YcG
         VD2PI89deoTrnSR21DKoR6/n4pldSpbzVejA0G9V0gMi8JUGS5+q7Ku8CwrtiJrfdl79
         wYbL9zjRf7YPWoiA/peCBDQ1TXaxV2b7cvdFbpsjSDJXBb4DUa0Uumx+8P7Af0773dHV
         VKqesPBoC6SUGpSBD173OMuKYN4g18MdL5iaKkc6CFvRLratFAuPyzpolVnJKQxXaezu
         DkJThFdFzoUvueUxH1IUfJoUodoHCB9YtRWNO9kuTrV0gMMCK033+7F556+7yy0feGyL
         goeg==
X-Forwarded-Encrypted: i=1; AKwUvBxD7+JkhM4PH2v1dEC+w6FQQJ1BRnOyLJQyPawgaiF3EEsRkN7q/sNd+k/0rrUZJ8IBDSBKw50=@lists.infradead.org
X-Gm-Message-State: AFuF++mTGKy/dhf9Vt0F2Ob+mkMviitQDokIsJ9ANuVWgoZT58ltJ/Hg
	p5YBVJEgsZgn65Yot42T5QBxLJyuMDnx9riEmpXVydlJvjsMJO12SzDzN6aiYTQPssIKSVvHJJD
	A1su80B2qNDk=
X-Gm-Gg: AYBFou0pKMm4VRNxTr5uxXwpOGOppsS+DBplRYUQrwWuentVmHhnCuvWlO8X98E1vJ9
	dbiOOrshZ9zKo2suMh3F9PpZmvjAXH/FAM6LJTgP/eiGkVT+YBrUYJmppbqHtoycjy2REsrWRNJ
	KNySPt7La+a8BDA2VvyTrVK1q+bkRKsW27OLPkPV7LEtvPASyZv40TcKuKmLI1E6c6kJGMw1wvE
	Y6jE8HEC9fOAfwuNYJ+hov1m/tDRv+ZFt+755JOLlrhSjSTlKcZA0bn2wEBh71XK8aE2nGNvaET
	Dd0ctjK4Zj71qWWXh9uxNkyU9vwF4IZMO/Gd1ruE9Qnb+3tvMmrHcDJb3JiLtg/q/WCVEPow2IC
	Gwl6vRRQp65WtEpK6kx6TUis3X6hvhtNpgMRHtSzjFOnsxZX+eqlHKuXoi8HKGMvDyvu9vAZVlc
	Th9yAb3slYOyXKnrqQnExXNWwqtLr9IBUgebpE3OTNKWI+e+igXqZT9DQlviGtoXaj9HIL/K26Q
	HSmYf4Z6iFGzaAHW9/v8TZvSYhG/APZVDsrtRHbynSdfiKA1urUIFpMQxdSt9xEAH/clcodMgVA
	XyOeW4ZPSjqwumJy4gC3xIj2eG8ZRz16HQotEQSa2oUyC4INELiFd5a57zmlCiw5XB6pCOyOlT+
	WN44FkkubgPIwdL4tDzDXohWOXiEejzUcCJsiv6cQtpsC6F/pRj0wOlAWTm2LSb6uvlfN46q1Mw
	E6HDJYbi1K/gm4
X-Received: by 2002:a05:6402:2316:b0:6a9:857b:888a with SMTP id 4fb4d7f45d1cf-6a9857b8bd3mr352363a12.13.1788875598772;
        Tue, 08 Sep 2026 06:53:18 -0700 (PDT)
Received: from Desktop (pd951346e.dip0.t-ipconnect.de. [217.81.52.110])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6a7e68a6e19sm5519140a12.10.2026.09.08.06.53.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 08 Sep 2026 06:53:18 -0700 (PDT)
From: Julius Bairaktaris <julius@bairaktaris.de>
To: johannes@sipsolutions.net
Cc: toke@toke.dk,
	jjohnson@kernel.org,
	ath11k@lists.infradead.org,
	linux-wireless@vger.kernel.org
Subject: [PATCH v2 2/2] wifi: ath11k: declare that tx has no pushback
Date: Tue,  8 Sep 2026 15:53:15 +0200
Message-ID: <20260908135315.754126-2-julius@bairaktaris.de>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260908135315.754126-1-julius@bairaktaris.de>
References: <20260908135315.754126-1-julius@bairaktaris.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260908_145321_424886_73AEF398 
X-CRM114-Status: UNSURE (   8.93  )
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

ath11k hands every frame mac80211 dequeues to the firmware at once and
the firmware picks the station it serves next, so the order in which
mac80211 schedules the queues does not reach the air. Set
IEEE80211_HW_TX_NO_PUSHBACK so that mac80211 applies the airtime weight
to the airtime queue limit. The flag has no effect until ath11k
advertises NL80211_EXT_FEATURE_AQL, which "wifi: ath11k: airtime queue
limits, fairness and a driver TXQ scheduler" does.

Tested-on: IPQ8074 hw2.0 AHB WLAN.HK.2.9.0.1-02146-QCAHKSWPL_SILICONZ-1
Assisted-by: Claude:claude-opus-5
Signed-off-by: Julius Bairaktaris <julius@bairaktaris.de>
---
 drivers/net/wireless/ath/ath11k/mac.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/net/wireless/ath/ath11k/mac.c b/drivers/net/wireless/ath/ath11k/mac.c
index 2d55cdc4d165..87e6062c5550 100644
--- a/drivers/net/wireless/ath/ath11k/mac.c
+++ b/drivers/net/wireless/ath/ath11k/mac.c
@@ -10494,6 +10494,7 @@ static int __ath11k_mac_register(struct ath11k *ar)
 
 	ieee80211_hw_set(ar->hw, SIGNAL_DBM);
 	ieee80211_hw_set(ar->hw, SUPPORTS_PS);
+	ieee80211_hw_set(ar->hw, TX_NO_PUSHBACK);
 	ieee80211_hw_set(ar->hw, SUPPORTS_DYNAMIC_PS);
 	ieee80211_hw_set(ar->hw, MFP_CAPABLE);
 	ieee80211_hw_set(ar->hw, REPORTS_TX_ACK_STATUS);
-- 
2.53.0


