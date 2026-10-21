Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A4BBA606A31A
	for <ath11k@archiver.kernel.org>; Wed, 21 Oct 2026 16:51:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=DKkn/G8H;
	dkim=pass (2048-bit key, unprotected) header.d=bairaktaris.de header.i=@bairaktaris.de header.a=rsa-sha256 header.s=google header.b=xz27CBwf
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=dacLjl7RN0IeeDiK9b8hPkWa1OXHnnZ0y7fVu/qkLNs=; b=DKkn/G8H2jzKrI31PYoeITz8E4
	7FdYk4zuPN8rmcitbSKC8Pjk8E0ecIP9a/RuQfi4BtXtA12EuWIqAxniPkzGWRD32SAN+D91G0eZx
	g0pmFO93ATz3iuHTQlSlfPxf+zzoCrm3q9E5oyJ13RvLsuCxCk5jLTbxzRKG8Bkohrq2iXLf1KTEJ
	nbGKuopdk2Ervzga+g1ujFlfd6AyNk5vG82o8C/NXDejN05ScvAtZzsMgn5SgEniui0ByRFjLjVAp
	OXXhEcQ9li0rinPaCNuVz3wmSBjEV3l7wx7rPE9AYpYWSIAD1KzUCqWNaI7EgqEBjhKmb+jU1lNyP
	tAKkW5Ig==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xJZXT-0000000CTH5-3B3z;
	Wed, 21 Oct 2026 16:51:43 +0000
Received: from mail-ej1-x629.google.com ([2a00:1450:4864:20::629])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xJZXR-0000000CTFd-0xVN
	for ath11k@lists.infradead.org;
	Wed, 21 Oct 2026 16:51:42 +0000
Received: by mail-ej1-x629.google.com with SMTP id a640c23a62f3a-c418e215671so123575766b.0
        for <ath11k@lists.infradead.org>; Wed, 21 Oct 2026 09:51:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bairaktaris.de; s=google; t=1792601499; x=1793206299; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=dacLjl7RN0IeeDiK9b8hPkWa1OXHnnZ0y7fVu/qkLNs=;
        b=xz27CBwf06UifPcRX2OKJSlZVPkUeNxJhS7tZusJvmVw3LKTlRy0I19HcWJEUVYKpJ
         diej+qvDjsp/NiYsFXyOHmJANBD768Pa23wGMOYiJCWC39u2QF3CHkudCNR46VjtHlfT
         jMpiYT5ZaUWOGR7zGA5cf8UvMIAev6T1Aa111q5o5Il/FxOqZ45rsKD5Yk/tjhEEFFBk
         szffHPHgqryYRKxGwbqEFPNAyenCpmpkB4uU0sWvQns+tO4Bf4mUoPGZSvA+2ksCbKLY
         j2wCtCI2Yuergl7qFz11K5Rv7jNECEr19MZZcOYP2UrqkAXBtKAJbjYlXii6USS3Lo6U
         r1sA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792601499; x=1793206299;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=dacLjl7RN0IeeDiK9b8hPkWa1OXHnnZ0y7fVu/qkLNs=;
        b=q6gs8bP8CfTvNrTI7qXtPc3Y8hIkEKYAdU3phs7p33hIBaO06OBXW0v1Ab3zNmshp4
         8rIzTOwiOBMpKsPWxO4gFy8R59dcPnHbMiBIKACE9lPqCxpuv+u2JcRK2Kghy0+ObwwL
         vWms2DH6UepL2eMD39E+nCDRIvvTylkgeLl5gNc3ee4mvgRvAlculRVQgC+V/rcLKbZT
         M3nCSsbccKmBNZgKc0k7h+uFfu9BwKTFPw3AwNsklmuPOAsYmkmi0jZXD8Rbyedkeh6Q
         ZpM0M0hfkusI4VJCn34P3SKVQEYsFtHgLtd7nTibJySkhAMLB6/XDJeyN3Ivve8DDahO
         GHNg==
X-Forwarded-Encrypted: i=1; AKwUvBwJFRqo8WHnl2X4YCQZtUOeBRz8htTFXJPZrMwC0Sg6mfek1eEdYsztz53Hrty73pOaEBo3ZE4=@lists.infradead.org
X-Gm-Message-State: AFq9FYIPlcCnlR5JCH3b7yf022e1Y6h7w2T8kUp1nkA8l5WjNKQ8o5rJ
	U7PvB1UObtbSvUe7/Ae6J7GSMex3U1m9Ex4j4y6JgZu7UsriMQNPvgaUav1pgmYVkw==
X-Gm-Gg: AYBFou0aQl2WcN2R4gWMhmY9NIGeAj4QlISosSV4bVPlzl7Voz0g0r5WcolBRtH+WPT
	nkrrUbFLDafpyS0WQZT8oyut6g4gdUY9+Zsg5j9V8ufchVE4Ff17gTCk1bRXtL4vQ3KXq5B3NbX
	R5iK1kNlIVR3x5bT68nGTi4S6/CKrPsMxyn93Pq7W9IEVzW1Uuo8roEdKC4UIl0vSNTAvtrFkPs
	cYuNlQrBTJolzbD8iCjjF6Dr5I7bEL+1EzyjUt3ACgv+Metxg+c5S6uoanr1zv/F1lwL9kIr/dd
	HWJeDnoik56WoimEc/5kiCDoZt3gpM2qAaZL7i0LjpvtZ9vkeUA9UUOzHg5pD4uCwRe1C0CDVQX
	i+koxUaEWbCp2dt5jzTWyxSdX56ds0Yt/pVu/31MdohpVRKDz2ONZVawGCWhmZLfFTEjgoSG4Nv
	CU64/uPe3sz76FlJ6/5WmQYKSIV1xFsucRCM2doFQZxL55NMLuuqiOLYhMkUbzX572Ola263UBX
	mlMy2QmvNZp8MobVW0Dne9HPHap3XMfUZTIbnhW68nwoIXsKrLY9d2sbqFHoLb6PXm5zwk/tDn7
	9KdukRh1YVcj9d7kyiEsx3A/f0wr7SPB16vVALoCHStgl4laNJvHV1hr1Gl6H6eD5A8bDdEJkgQ
	L3g1zTXhgd1VZOWMPEPbAxy2RAkoizGKsOrAikKmsQu6anL5mVRDFMCNFhvg1BIv42GkVRsn9uY
	vgqhh8vXuyBAUuLL9slP76KGpJdUPD19rPR39kruwbnAyn3AvFp63lu5YVOykDA+Q+
X-Received: by 2002:a17:907:e0c9:20b0:c46:8b87:c1f4 with SMTP id a640c23a62f3a-c468b87de82mr18142066b.20.1792601498828;
        Wed, 21 Oct 2026 09:51:38 -0700 (PDT)
Received: from Desktop.fritz.box ([113.30.223.169])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c468a5de48esm20782466b.66.2026.10.21.09.51.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 21 Oct 2026 09:51:38 -0700 (PDT)
From: Julius Bairaktaris <julius@bairaktaris.de>
To: jjohnson@kernel.org
Cc: rameshkumar.sundaram@oss.qualcomm.com,
	ath11k@lists.infradead.org,
	ath12k@lists.infradead.org,
	linux-wireless@vger.kernel.org
Subject: [PATCH v2 0/2] wifi: ath11k/ath12k: apply the 160 MHz NSS ratio to the radio
Date: Wed, 21 Oct 2026 18:51:36 +0200
Message-ID: <20261021165138.388593-1-julius@bairaktaris.de>
X-Mailer: git-send-email 2.53.0
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261021_095141_266883_4CB2BCE3 
X-CRM114-Status: UNSURE (   9.58  )
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


