Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BF063606A8B3
	for <ath11k@archiver.kernel.org>; Sat, 14 Nov 2026 22:56:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=y7WLZ1P+;
	dkim=pass (2048-bit key) header.d=bairaktaris.de header.i=@bairaktaris.de header.a=rsa-sha256 header.s=google header.b=AuSowuRM
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Unsubscribe-Post:List-Owner;
	bh=gQ8gDJLRQlElR0wWw/QqmoQfKumrgn/Rw4A6LOdpZ/8=; b=y7WLZ1P+UwEGXZTA6oQ1sRY5QG
	eDxdCmKZ6ch5a7Mi+ISUtUeO/7kAY0RAF9PW14pXlrpu7GEOH7md32jhtM+mHJDNUJXaIiSLXkPwr
	379tTF/YzUAk4BIhysqoeuAs3wFyG8jOnkMrkDG5FW4H+Rpbq/IYKODUtvEKm2yaCak8LjdhCGznk
	2NK+vkc00OWd6JKNpiTReh6Vq/zLFTyEDfH8x/tYXQM/U/URr/G/tsKUhHErrcEtAAN3aM82+1uyT
	GWCk7dOkOQBzbyYG5L2RLdECMTtL0Yyy9jZVP1v+UKBd/FlYsqZ1BvNVLB26x9zKOTF6ryQH4UGSN
	V4McBsLQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xSMfy-0000000GraG-43I6;
	Sat, 14 Nov 2026 22:56:50 +0000
Received: from mail-ed1-x531.google.com ([2a00:1450:4864:20::531])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xSMfv-0000000GrZY-3PzY
	for ath11k@lists.infradead.org;
	Sat, 14 Nov 2026 22:56:49 +0000
Received: by mail-ed1-x531.google.com with SMTP id 4fb4d7f45d1cf-6b5973a4b4cso3311791a12.2
        for <ath11k@lists.infradead.org>; Sat, 14 Nov 2026 14:56:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bairaktaris.de; s=google; t=1794697006; x=1795301806; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=gQ8gDJLRQlElR0wWw/QqmoQfKumrgn/Rw4A6LOdpZ/8=;
        b=AuSowuRMEnO+JZwkKymSdwPDEND3P9ktQF5cDD5ynei/lItyTrikMxCqc2R+Y4qkGe
         AWfdu2OcDrPeNwCoD0mTDy7GfoKoRvfWlzQb9OKrVAqyXB/cr1krMm1AgYgqFezcSc3w
         NKhz2vcxz8iLWbRu1fjuSz3WJMLAdMaDwnVEk3nPgniG0RG6B0LXz3GhZJvHNWGHEnDd
         /9h39i69ZmH6EYPoPRGk19mOC0OnuaeEktIg2V8IUdy4ovdJgo9VH8ggLoNyQ2sz5nYG
         dL5tbxA7ss9pcbzVcT3SCHEpOXcOguGhv5k3vL0DX9TNGvevFVg5zoI9kd/qmfbgvxbv
         EqGg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794697006; x=1795301806;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=gQ8gDJLRQlElR0wWw/QqmoQfKumrgn/Rw4A6LOdpZ/8=;
        b=lsOtN9IyT0/X3eWmBViQ8e+yXEQEDbNn5h1HMdj0CTnjfCrU4CdSjmOIzXcWo3SXck
         LT9+NzPH/JdYQGDDjsKRlqx5iU+RDY00kQhjRTiss/3JLoZsI6Afb/SfbCpeiW20PDAV
         xY7JA83FrkomvUz2t8FwE4+8YaCJW5u0kMZ1jRRzCPN1Uepqc8Vn7WJWrFC8qq/zvHzT
         NhMBVyO8TFP18y/F5zt62f2y8msAETnoQgcbztrGgqVOB0BMSHjx/jcz1brwxinbq2e7
         QoS5cilDzq7CgJhFKlXsa4l2zBbMVH7AN5yz806w6slyR/U1e963AM/KIH/+uh9a2ElV
         iHMQ==
X-Gm-Message-State: APuU4Z+cxp5HPxJ5NNDIVi66eWUep+16EGLTLAF662Z/of1dbDI3XSar
	SCoBP466MlCTHGOLP74BfRarkH1pJwQRWXug5MME77MgVIbVdfVa89cMK1ey8SPxvg==
X-Gm-Gg: AYBFou1T21ajWAq7fi+MOYkFqEgnrWeB1PX5XZJN5oxsGh8z9uNpND5KYqUCB8nyKCn
	gAc7Qgs7/GcUn2VZtRVPvbrZB5ZORfzn73E7ez92RqSV3SOUDFnosEVfJCyYA78wiDjq4s+FjCZ
	qcW4qLQGeMPahyE7syAujvfXDUOaOV4CYUBUSPhP7D815MNTVc96G/ZLLDqcbO+xlejnF+B8buT
	AHs/jp4xeR7jO7WpLl8uDjAgJfZRioHXPh2kwhY3ITu8MlQfeVnRPYBMdzVgGwX5orTFSMX1HBh
	FyC4uPrrWwe4iNpB6NcXDJsKUQJ9sqtkN19UGM7dMsZdm5EKIdG4q3UDkybjo2Ya8j/o6aW7vn1
	ozUGf3+bsQ0izfn+JvaPnS6gzRvenCoABa3raX4JmtaWRsQG5U5hCQp4yEX/ft7ljUWZscm9lIc
	3TfDGnIeFvcOPcpE4b/0wYaF4JFJ1u3d5q0jZY7QA8DIjimDPDLJ7X6pf5qEhwIKyBfnrnmTY5N
	UqtPv4/l0iz9KgqQP1GO5iJmEvCp/ii01IBId58jRtvsgjL5qFcwF20P6SEVevgnYNc0M05cNMq
	eMCut28mu1AXpPni5053FVKhwLAnAVmd39eYKZll5UFkpnVM9LA3FhwiSJ/d6Jn5KQaZ9lXEyrn
	+EgT767hDUanOFk6PACdx7rY9oL18zzC5+G9m/CYzjj2dqlJknaHKZMvmDNcPxmXuaQLs1VdA6k
	BozoecvnuK/Co85GlJsZHbm02H0zAiIwT5JySypo+ITBU0TT5ju06jSWXnHyh1TgPmksPlede0g
	3BSCX94uONMoQlS5emdqOFx5d5/Fom/F0POt1sIeVLVL5tBg88VZIczYcmTN2QHQ3ZoO64LOfa5
	hY1M9WeJYfe4fu9tmLv0zmR04/2t5O7058UuSrq967sg7IlwfUhReojRJ89CmK7m
X-Received: by 2002:a05:6402:14d0:b0:6b6:e857:19d4 with SMTP id 4fb4d7f45d1cf-6b7c0bbc8ffmr4343531a12.11.1794697005786;
        Sat, 14 Nov 2026 14:56:45 -0800 (PST)
Received: from Desktop.fritz.box (p200300f24709e8006da21e9e53ecde1c.dip0.t-ipconnect.de. [2003:f2:4709:e800:6da2:1e9e:53ec:de1c])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6b7c23c757esm2751595a12.17.2026.11.14.14.56.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 14 Nov 2026 14:56:44 -0800 (PST)
From: Julius Bairaktaris <julius@bairaktaris.de>
To: Jeff Johnson <jjohnson@kernel.org>
Cc: ath11k@lists.infradead.org,
	linux-wireless@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Rameshkumar Sundaram <rameshkumar.sundaram@oss.qualcomm.com>,
	Baochen Qiang <baochen.qiang@oss.qualcomm.com>,
	John Crispin <john@phrozen.org>,
	Karthikeyan Periyasamy <quic_periyasa@quicinc.com>,
	Pradeep Kumar Chitrapu <quic_pradeepc@quicinc.com>,
	Rajkumar Manoharan <rmanohar@codeaurora.org>,
	kbuild test robot <lkp@intel.com>
Subject: [PATCH ath-next v2 0/2] wifi: ath11k: do not fail down transitions of the station state
Date: Sat, 14 Nov 2026 23:56:41 +0100
Message-ID: <20261114225643.962015-1-julius@bairaktaris.de>
X-Mailer: git-send-email 2.53.0
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261114_145647_895070_AED3D7DA 
X-CRM114-Status: UNSURE (   9.86  )
X-CRM114-Notice: Please train this message.
X-Spam-Score: -2.1 (--)
X-BeenThere: ath11k@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <ath11k.lists.infradead.org>
List-Archive: <http://lists.infradead.org/pipermail/ath11k/>
List-Post: <mailto:ath11k@lists.infradead.org>
List-Help: <mailto:ath11k-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/ath11k>,
 <mailto:ath11k-request@lists.infradead.org?subject=subscribe>
Sender: "ath11k" <ath11k-bounces@lists.infradead.org>
X-Spam-Status: No, score=-13.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no
	version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

mac80211 warns when a driver fails a down transition of the station
state, and ath11k does so while the firmware is down. Patch 2 fixes that.
Patch 1 is new: with the firmware down, a key whose removal failed stayed
in peer->keys[] although mac80211 had freed it.

I used Claude (Anthropic) to help write these patches.

Tested on an IPQ8074 AP (hw2.0 AHB, WLAN.HK.2.12-01460): the firmware was
crashed through debugfs and the station deleted at once. In 3 of 3 runs
with this series station del returned 0 with no mac80211 warning and no
key removal error, and the station re-associated. With the v1 patch alone,
one run logged "failed to remove peer key 0: -108" and "failed to clear all
peer keys for vdev 0: -108".

Changes in v2:
- New patch 1.
- Patch 2: continue the host cleanup after a failed early vdev stop and
  a failed RTS/CTS update instead of returning from them (Sashiko review
  of v1).

v1: https://lore.kernel.org/all/20261101174422.1275413-1-julius@bairaktaris.de/

Julius Bairaktaris (2):
  wifi: ath11k: forget a key the firmware failed to remove
  wifi: ath11k: do not fail down transitions of the station state

 drivers/net/wireless/ath/ath11k/mac.c | 21 +++++++++++++--------
 1 file changed, 13 insertions(+), 8 deletions(-)


base-commit: 1be6c8d3027d4a421dc46b93a89a196c61945614
-- 
2.53.0


