Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 42785606A31F
	for <ath11k@archiver.kernel.org>; Wed, 21 Oct 2026 16:20:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=Do7xV9rX;
	dkim=pass (2048-bit key, unprotected) header.d=bairaktaris.de header.i=@bairaktaris.de header.a=rsa-sha256 header.s=google header.b=vnjrwRK+
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=dacLjl7RN0IeeDiK9b8hPkWa1OXHnnZ0y7fVu/qkLNs=; b=Do7xV9rXIhR6zvW0WgeZsAW2aF
	0sJuRixVrzqOsRTQQMlaUXcxrvNoQ76TZR6SnlCP9nsAWpAsASCAXQxXE09zNdALG++kd0TswY74U
	TpesYYTwYZ4kavrRzYlJ9ceMpjD2sA84u2SBHRjmPYqmrYP4bjCps6dlQvl3YMyvWFaQvsUTPHKr5
	ZstY43KjAn2jVy9bFAUnolzQbmDn+5qIAwdYikk7sCFH0NpMsbwG4ENfEuwTgbHGBmUlK1X2ZWdMB
	pwAMbOOnoVGlf9VdhlmUz2jNTOXt9yP7ssDeNwWp8eyxMpspimNx+c+TaR7NR5GO1SSnR7CWDqGV/
	M4RQDL2w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xJZ3F-0000000COkL-373j;
	Wed, 21 Oct 2026 16:20:29 +0000
Received: from mail-ej1-x62e.google.com ([2a00:1450:4864:20::62e])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xJZ3C-0000000COhp-30G8
	for ath11k@lists.infradead.org;
	Wed, 21 Oct 2026 16:20:28 +0000
Received: by mail-ej1-x62e.google.com with SMTP id a640c23a62f3a-c20ce3c118aso14773366b.0
        for <ath11k@lists.infradead.org>; Wed, 21 Oct 2026 09:20:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bairaktaris.de; s=google; t=1792599625; x=1793204425; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=dacLjl7RN0IeeDiK9b8hPkWa1OXHnnZ0y7fVu/qkLNs=;
        b=vnjrwRK+R/cIZl/yrPsFitznHnOGt0zHCHezY8aTNtQRON4TXNmb5y+nLU3ssRUeTP
         aWM9IPMPc34kpCH5c42WL31Aqf8ga2ATPEw5D3TCVlQ3VaVxlBEFi/y9DmSlz1zJgnUf
         SuqMf0anTn99fOMXqyBkcrk2DriFRfwhA0hOeN9HKZlrn8dZqAdAhj4yGBWyih/Xcg0q
         nspm8enjtgH9QwJ/8wsGZPCnsUhLpmW2GDsmJk5AhzdV7u+2bNAG3utoROWEDj14P3UE
         AMfkX02wKpocM7wHv/QoNRjdNuF9U78WF7eXfiiSjX9fNjxLAQAomsWoapzlz39+Fs1K
         egTg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792599625; x=1793204425;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=dacLjl7RN0IeeDiK9b8hPkWa1OXHnnZ0y7fVu/qkLNs=;
        b=q8C22Qf5KDeC+Srf+FpJVi0Z0sXWAfX/BWnPiSPs96OGUdH5Ua7g6PjzTGLudwzy/0
         12PKJrme5vQ1B1rpjNAc7XpJQe+e3pr9M/HnlSr/e3ZgI1CkCdFLie4c2WorBUlA/4Sb
         FEWIYvHuWRh33Q8Y7LBn2BvEw19tpqEWki0J0CnT7Y1lZF4V/8LtpvH97HCtjQfd/Tdh
         xNDKvt/q+8PZzkVlVKCI+OYLG3Z9hnQ/N/4YueDUa5Tuh2eKUgH7dmi5Ji/nkG3n5ix0
         9fnGhuB8IJyGsMJ/m+0c0lR3rURE2/+gkHrL9mI+H00rBvg6YNLhhoVPrNRwl4ekwka2
         Fjcg==
X-Forwarded-Encrypted: i=1; AKwUvBwegPE4BADgl7k8GHiRuE+4XdXkrreKf/nT/vOHS7C61ohDtMzsf4x2SC1pVmFYM3s8B3EjmR8=@lists.infradead.org
X-Gm-Message-State: AFq9FYJYYWMS9iI761gHPkLJJoOdanxqGwVWyGQHsdtp1pGoKvN3MNkR
	CKVRMmUbFzUq5EFwL8xav0w8KzBf0Y3iK/NIwIKdK3b4RqV6Y/VurbjlFHOd73u7jw==
X-Gm-Gg: AYBFou36+8hLIa2bhiU7zoX76hXMp6IHohNUo2/tG4t2Ji7TIAEnVbK7oR+Umlmxnl6
	YSzW6V9QxvoyI1E27I06aWfa8k96s3XO8hSDl5mgJ0i4xMguZDGOEqUQdr4QkDlmzyl/vg9xJfB
	1AgKIMeepWbInWO5qCbBjVZN0Ythu/hbO0Ks80jxafYrM74isElbnkSbJf/W4qUyHImCTQQ5OLw
	gFD4NkDldQnZZ8AcLzxCePpLtLyUY+Yoj5IKTYrZ10yNc8QNAI6gkE+8CzA1CdA9rRTEhA4zZv4
	UorXdkT6UroYGWhTlRze7axg4b38E1XC3e6MRwcXUPF6IFWIxx1e3y/I9T8pgN6nyqU2tIFgGDw
	JpHDR0cnnqF3MxdVaYrasvwKY+X8+imJJKrMn23ZLXR4Wj9FPFCIF1lIzJ5iH86W/hmTXFDYbQI
	Pnqcg0OFO7Igetm+KvLQGrJ/rzjmjFBXFEdzQcBbZofdyneQYaahWWSpmbG/3sDuhZEnsixHVix
	lLqQzBvunbyFsNPkE3muKw5yAZXOXJp0hBLAGTkmGZtCA1t866unzAHq2XTPQwS/8d/JV9QGWt2
	uKw3XdGj170mjL4Igzdp1To73+6jsk/aKINMkvTw9ncIkfm7wjX71Hug668hQLWTeBJbzo39vAI
	kIF/R/L5CJR7olp4Z/U+XZbK+uwY/wnbQGrv5eeQUjKHTKgZXSkcGRgNnXr1+kbuXy4sQRyb84O
	r9Q7lWjBlNHbL1zj+LgMzuWJly7BB0McoqtpTJHsz9o2LXJZrQ4FA/DIpqgmuwVKQR/so7w8iwC
	UrZnkM=
X-Received: by 2002:a17:906:9f86:b0:c36:777f:824c with SMTP id a640c23a62f3a-c4600c81c46mr477496066b.4.1792599624671;
        Wed, 21 Oct 2026 09:20:24 -0700 (PDT)
Received: from Desktop (pd9513e2d.dip0.t-ipconnect.de. [217.81.62.45])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c468a5625cesm17445766b.39.2026.10.21.09.20.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 21 Oct 2026 09:20:23 -0700 (PDT)
From: Julius Bairaktaris <julius@bairaktaris.de>
To: jjohnson@kernel.org
Cc: rameshkumar.sundaram@oss.qualcomm.com,
	ath11k@lists.infradead.org,
	ath12k@lists.infradead.org,
	linux-wireless@vger.kernel.org
Subject: [PATCH v2 0/2] wifi: ath11k/ath12k: apply the 160 MHz NSS ratio to the radio
Date: Wed, 21 Oct 2026 18:20:21 +0200
Message-ID: <20261021162023.280823-1-julius@bairaktaris.de>
X-Mailer: git-send-email 2.53.0
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261021_092026_758891_D5C58E34 
X-CRM114-Status: UNSURE (   9.52  )
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
X-Spam-Status: No, score=-14.2 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=unavailable
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

The firmware reports the 160 MHz NSS as a ratio of the radio's 80 MHz
NSS, but ath11k applies it to the peer's NSS and advertises every chain
in the HE 160 and 80+80 MCS maps. ath12k fixed this for HE and still
has the peer-based calculation in its VHT path.

On a Xiaomi AX3600 (IPQ8071A, 4-chain 5 GHz radio, firmware reports
WMI_NSS_RATIO_1BY2_NSS), `iw phy` lists 4 streams in the HE 160 MHz
MCS sets without patch 1 and 2 with it. Patch 2 is compile tested only;
I have no ath12k hardware.

Changes in v2:
- Add Fixes tags.
- Use the plain Assisted-by form from coding-assistants.rst.
- Add patch 2 for the same bug in the ath12k VHT path (Rameshkumar).

v1: https://patch.msgid.link/20261011123631.1664734-1-julius@bairaktaris.de

Julius Bairaktaris (2):
  wifi: ath11k: apply the 160 MHz NSS ratio to the radio
  wifi: ath12k: apply the 160 MHz NSS ratio to the radio for VHT

 drivers/net/wireless/ath/ath11k/mac.c | 24 +++++++++++++++++-------
 drivers/net/wireless/ath/ath12k/mac.c |  2 +-
 2 files changed, 18 insertions(+), 8 deletions(-)

-- 
2.53.0


