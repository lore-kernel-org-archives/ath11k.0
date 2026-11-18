Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 608F660A2620
	for <ath11k@archiver.kernel.org>; Wed, 18 Nov 2026 15:30:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=lGH9uig9;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=infradead.org header.i=@infradead.org header.a=rsa-sha256 header.s=desiato.20200630 header.b=Jovu05dA;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=ZtFzCMPs
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Unsubscribe-Post:List-Owner;
	bh=rHS9B+0BHde2X4jb3Xb3RONvqSby0IcB+XScTmz0upM=; b=lGH9uig9At7mp+2b5EpGq3onWX
	JmOh5qQVRO2v21EfWzwtafLFElQ0ObZchU4hY+Fq0/KCdixwTHygTncQUhgw01yHAPnxv5mQeL0Vp
	qGGaEaB8JK0fDA9czEGmCoQVG4QeBKhfPM1YA3wiWRNM2WIf7zvzBgPXWteAff/yD6h0EKHdi4z2j
	JR6dMdy2r94kpl/iH3RNPeSOU/tlPjNfTWEmV+iSO+VyILdyA7tZdRyN0nr4Y0Tux1nPgi7eZMkdH
	eCO69BZG4QTlEU/SjR5oMnsp0DEyV7qCL9aqaJNIKfYEY5WNIsxRaiSn8SleJ6XCVlyg24E64Y2SF
	j5fbkBsw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xThcC-00000009InJ-15SE;
	Wed, 18 Nov 2026 15:30:28 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xThcB-00000009IlU-2CMz
	for ath11k@bombadil.infradead.org;
	Wed, 18 Nov 2026 15:30:27 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:MIME-Version
	:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
	Content-Description:In-Reply-To:References;
	bh=rHS9B+0BHde2X4jb3Xb3RONvqSby0IcB+XScTmz0upM=; b=Jovu05dA0hwbxKcH8y0H1kqbAn
	qyUQ596YdC10jgfB0W3t9zc2ee0yFQD/kBxuGy2A9px1e1UjxAwMONZLTxkx2ma/6upTfKxXRs0w0
	uCYeDRolhH7lWjey/86skzHSz8GMO81djXcJIUps+lf4BVZZVSyM5qrKFancgAS3n01ipoBmv7BCw
	f2KC39XDd90LErhNUh0V7wUNCRSkwjW5HUIKFmkV9cKhZCYoMG7qbOzcdnpz/90dP2KtkD8UVufz4
	FPqhgPVIKdtai4ICMjWFeRYwc6tb3oFQvFafvCB9m9WJLmfAoiBBKR3ivUmWUsZunCbhL5wSOy9vW
	XgVrFrjQ==;
Received: from mail-dy1-x132b.google.com ([2607:f8b0:4864:20::132b])
	by desiato.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xThbz-0000000GD7N-0vo4
	for ath11k@lists.infradead.org;
	Wed, 18 Nov 2026 15:30:22 +0000
Received: by mail-dy1-x132b.google.com with SMTP id 5a478bee46e88-33fb4680717so2700957eec.1
        for <ath11k@lists.infradead.org>; Wed, 18 Nov 2026 07:30:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795015811; x=1795620611; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=rHS9B+0BHde2X4jb3Xb3RONvqSby0IcB+XScTmz0upM=;
        b=ZtFzCMPsykE4EyQRjx6evy7wKbzEtpAVGDuiheyAlpo6bSosBi44x7ifwRFOECd5FA
         BszkB06xhJsA3ET+OBBi06jvEsqqjNvHX40xaBwpOdE/cs6MC+/fOCxVl/zsGHCHjrZb
         NvwiYoJJjkHCzVUYsH3P7xdKN2STo/R8+MIZMVvLRTGeThp+uxVMSVjsA4ORILEnti4N
         QsHZkcUmqyZxClaH+ZXg9FlvBB9A1ctkSG9gw8katIY/AFz37eTjgWsPu7KfY7/Pic5P
         rv0pbhqovgqDV/M1Fz2mmQmO4pn65G5HzWE86lLtnpD9SvHnmkY6V9r+x10c9OBCa+x8
         kV0Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795015811; x=1795620611;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=rHS9B+0BHde2X4jb3Xb3RONvqSby0IcB+XScTmz0upM=;
        b=pbmHkvnA2ROrhJLxMHuIty1AhI6QlaE/0eo1rZ0PSShEkaXtIMqBSjLF4WcH/wpdhV
         mTsot2leWGTof19kJsNZf/0gp7C5j/Hvo1hsRxgAVAdFVDO+ZCZDeo9CoY4Vcg3Q5xoz
         zwMz2RqJ2lPwvsv5CN+HKPxWR5xycK7xE+gwJiJ9Aompa5jj2gPo3F5fsEw2iYQOLkm0
         XTJwDfYx3bGBEBrpYrxPwpcmAbJDAS5Cl29iXF3WLOotxiS7nQyBWoH5mjg9R5WHXtIY
         gmzH+DbzJBA7h08bYK6wanyhTTrR7u3A45o6shpJc78Zvkl1oOchYQD2Hz4KmQg+I24w
         WKAQ==
X-Forwarded-Encrypted: i=1; AL+hErEaiukaPM/NvO00A4VMgo10TaHLbmdfyJSuhnZGLSg5VU9+7oWSApbvA4LBYK/adwiGVOjOOYw=@lists.infradead.org
X-Gm-Message-State: APuU4Z+U4wvcxM3EMkkcLRaMG42nlgpmFot3hMddl4ngdR/ujeiVCDB5
	gmrIOVNkoHpzMtEUw5WOVgvXSHYS3/AIXD8HrdXjmCjXbFPQOzA7TAmo
X-Gm-Gg: AZFdTZf2P5wInU0ikK2Nf/4aSn9Kv+BN3nMaE/hZoIwzWI2DYBQn94z8pPtZfAAqCVa
	MOH/hQUtaHFjH44V46IZoK5Ewi5A/2bh9mTNQufauFD/a7xLcItY6qYedUbD71jazni0QuhZZx1
	9rVlFhQTV7UMOJF8DMS+gsGWyfj1jHhpX5QuQE+0f2SVgkRNQkr4MoCu0XOziQmUar2kNHk8waU
	7k4AO1DNczNfNvrRKB1WP5L4y8fXUcn+k0LQHbO4/kl/VgxaEFLkaueO3embV67jSW/aSYsQCdz
	0YS7OdSbQFkEsMyz0YqgvwL9KmSe9YYBeE7k/r+5wW/vUffdNgNHc9hCC0umdk2h7D+TH/mN+zl
	Uer0S1vzHo5muYmVQs62U/9Jq9DgBn90btvAZxptIZB09Mn7ruZvcGvgaQ3pX313GagpNajvMpJ
	J4tpgI7fL1jbx1y/dQV7bf0Arc5BwTD+X3ldAVOgCgdK3xfVwKDpZKfRn2R9cWVhvtamKRyz9/v
	i5w7F7hOsISoosXEi9iEaMRmM6FHe59PF/+xn6hr2XEkJ+hdN1+RJXGOOFe/vaeyg5tgk/ZSr2o
	IYRFeAAG6iW3qlSaw/cvaAmJfmj8WClnJvTMN8GIuqwLq8MKWQwHTMFWgDE=
X-Received: by 2002:a05:7300:50ca:b0:381:7f3b:3c13 with SMTP id 5a478bee46e88-382803787demr2845493eec.23.1795015810729;
        Wed, 18 Nov 2026 07:30:10 -0800 (PST)
Received: from G7XWH7K1F3 ([2408:8256:2e80:7371:2c16:ada8:2d24:d03])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-382a630517asm8922616eec.8.2026.11.18.07.30.03
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Wed, 18 Nov 2026 07:30:10 -0800 (PST)
From: Zhao Li <enderaoelyther@gmail.com>
To: Jeff Johnson <jjohnson@kernel.org>
Cc: Kalle Valo <kvalo@kernel.org>,
	Wen Gong <quic_wgong@quicinc.com>,
	Baochen Qiang <baochen.qiang@oss.qualcomm.com>,
	Anilkumar Kolli <quic_akolli@quicinc.com>,
	linux-wireless@vger.kernel.org,
	ath11k@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH ath-current 0/3] wifi: ath11k: give the regulatory state the lifetime of the device
Date: Wed, 18 Nov 2026 23:29:39 +0800
Message-ID: <20261118152942.62838-1-enderaoelyther@gmail.com>
X-Mailer: git-send-email 2.56.1
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261118_153020_658290_BE0F66A0 
X-CRM114-Status: GOOD (  11.10  )
X-Spam-Score: -0.2 (/)
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
X-Spam-Status: No, score=-10.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

ab->reg_info_store, with the rules it holds, and the default_regd[] and
new_regd[] domains live as long as struct ath11k_base, but their
teardown does not follow that lifetime. The SERVICE_READY_EXT error
path frees the store from a transient event handler, and the remove
paths that follow a failed start never call ath11k_reg_free().

Patch 1 lets ath11k_reg_free() cope with a store that was never
allocated. Patch 2 moves ath11k_reg_free() into ath11k_core_free(), so
that every teardown path frees the regulatory state. Patch 3 then drops
the free from the SERVICE_READY_EXT error path. In this order no step
adds a crash or a leak.

A separate patch, sent on its own, makes a failed SERVICE_READY_EXT
fail the start instead of letting SERVICE_READY_EXT2 complete it.

Zhao Li (3):
  wifi: ath11k: don't walk an unallocated regulatory info store
  wifi: ath11k: free the regulatory state when the device is freed
  wifi: ath11k: keep the regulatory info store on a SERVICE_READY_EXT
    error

 drivers/net/wireless/ath/ath11k/core.c | 2 +-
 drivers/net/wireless/ath/ath11k/reg.c  | 6 ++++--
 drivers/net/wireless/ath/ath11k/wmi.c  | 9 ---------
 3 files changed, 5 insertions(+), 12 deletions(-)


base-commit: b1ed5a45b994a6473ca1cf34f35a1bf87f1d8e2a
-- 
2.56.1


