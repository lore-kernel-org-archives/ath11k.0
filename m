Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D89E8606A33D
	for <ath11k@archiver.kernel.org>; Wed, 11 Nov 2026 22:35:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=WCkhV4Xn;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=uClNB7ME
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=UERT3mFgssSg4oCx4N2jl+oQBf3c00QRenf12tiJJLk=; b=WCkhV4Xnj6dwSP
	qmNwb6ZtO8xxCFmxctAFN6zE5R97aEb5VvMMZICBJlDm1tA6L0xEeD2NPVjWbDgs2rF3us6JKJ4ql
	G9omAiFf73Fo4PBb6RPhRemqAjEeFz81PniU4xivzIT4lI6A8DfpkWpwSj01BU3DQCq3bNsYITklF
	bwCeci7BNzxQGYvIr2XsS8nIoz6ZN2VgW4zXkZ7u6RyjD1aOxcmoEGIly1LORvvgn+UkkpnczTkbJ
	o3QomIjwB1QuSDtO5I6zB2JdzbTPSgTNQRFncq6wiIbarBX3RRnXjp6Jfs2dkmm5GvGIsrsHAhnau
	FwGooYg9/GE4252o9j0Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xRGuY-00000007ynU-1kfc;
	Wed, 11 Nov 2026 22:35:22 +0000
Received: from mail-ot1-x32d.google.com ([2607:f8b0:4864:20::32d])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xRGuV-00000007ymt-30gn
	for ath11k@lists.infradead.org;
	Wed, 11 Nov 2026 22:35:20 +0000
Received: by mail-ot1-x32d.google.com with SMTP id 46e09a7af769-843ea301d60so2151478a34.0
        for <ath11k@lists.infradead.org>; Wed, 11 Nov 2026 14:35:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794436518; x=1795041318; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=UERT3mFgssSg4oCx4N2jl+oQBf3c00QRenf12tiJJLk=;
        b=uClNB7MEdmwU+BZ/mGNWuXy2xYpqVIFcHzSa2Y2ZjFQcSZLwTE2en+j4asXAixu1so
         FU9e8VNZJ0Jv2aHIaqWwQm+XouZsyWnB7PxvDIPkZ806mk5YHlUk3dWE/N2GlxsAicEt
         fLILFj+XrUeZhKSGxoCkf/cl3MKexivHFcoy+DUi1AVZTYGbfPTIfeH+00e2Gss9yS4t
         SIhfdO09SKx9PVKbbfAdy+JVUBGojDiMhIAIV41lPDybDZkR8kSKBz5u6NW/+bbsOMDU
         1cJ1s90QpjdRbc6JmPUk8mED8j6HJXV9RPbWjeEIPj2l0WyhkhECJLIfwhNLqHnCX7nG
         we6Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794436518; x=1795041318;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=UERT3mFgssSg4oCx4N2jl+oQBf3c00QRenf12tiJJLk=;
        b=vAL9WDu2b6l2zMsWv4ayV8RRGW6pM4yrQOjaVJdTjK+mjKhcnfqoG855E2e+WkEhkT
         Ub5gp4DJmlrwVUfJTiSqhIGfJkoXjOq/t4EfQB9xVwY6LEPx3hbXBFON75KdMLjLXvSG
         JUKZbh8b/xmRvr51BMTnZwxjWhlS36ok3tH4O78Ha11pwE+46Ki6kBkIeUleXR5AJD5I
         JYLaka4BWn3GiuBed2rbissdzuddwAvCKmlrwJXfjyHzRdecBVynk0GzwmqmAtM86oVV
         Qc1sbYP/BLGaWX5UrNTndMOdkxl95heqhUvgez/C6ylvAh4hWTx+O9h9bquyt8ioWGRW
         suEQ==
X-Forwarded-Encrypted: i=1; AL+hErFuVnDqeDEq1iaQw7mGD2Dp91PAEgY1z7Hj2v5kGv58VNqG9lPNDh29tNTeQZPeA8bqh+tWgOc=@lists.infradead.org
X-Gm-Message-State: APuU4Z+TlCSrIVjBCiy4zlqUwf7AuX/PB1YQE1BpsC056O+/MJVwr4Xg
	oqbJUN1RYPfQN4GT5ZEpi3bXRqgFuB1eCpziWwJmJBt2uTMSPxCkQzCG
X-Gm-Gg: AYBFou118ZMht7IibadsQiZ2/19NIVwBX6gakOLva7boAHiOAY1FHBvsu1LJ4KN8naz
	4xXni894AyUsNUFCM0azwtc4IaK1QV89d9Ur6+QrV1EEhP7sgldl3L9pNQQj1NitTdbWiIvXaVW
	QA19h0fuxT5xaYBYEcvE8hWcqUvixfyzxwzh8vJAo9NaCGbSt7afTfP3PoBVAIlrXsZFTzQ6BOh
	K3E7h4WRX+vkt5qgQ7RCnzlT0biz2Cuy3WjbCkbVOJhT3dUB1vp7zcgNhFeBO0Vo1LnfxN3gDNv
	UK8vt+S3ZWZC9QCRtfBKnG8pLlI/AifoLP/uUQMAsBffREm0kc4LKLCGXPgG17hWNwoPlsph7zT
	Yb/qJth92nDBxEYD2vbYbymdImhN7K/ANy2WluxLivAyRlMsp35lTzs5TaPB6WxjEJwr3a2I1gS
	fTgkAo0PMDbWTQhDMhy8pxNN0u3hYxQDJRoxHeY5dckhaLaqRGViXHEmNwV65+bPDthCTFeyL80
	kUFAE/RwTJ//AFMlXb4Y9qWoFCMLpu2rVo3InxROzLgUo9V2OnOO5/pEd80MdgxQthThaG4mCAm
	OrsyJHkAKVyBJL5nx4Nc+i2sEvSUyz93fC/ST8kwGFzdXuZYpALxkFhy8qnYmiRUQC3JoQ==
X-Received: by 2002:a05:6830:b13:b0:81e:a323:f3bc with SMTP id 46e09a7af769-860f2885fc2mr3646271a34.13.1794436517980;
        Wed, 11 Nov 2026 14:35:17 -0800 (PST)
Received: from cachyos-a.lan ([216.212.36.213])
        by smtp.gmail.com with ESMTPSA id 46e09a7af769-860dcb5f7ebsm5312424a34.7.2026.11.11.14.35.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 11 Nov 2026 14:35:17 -0800 (PST)
From: Patrick Lawler <patricktlawler@gmail.com>
To: jjohnson@kernel.org
Cc: linux-wireless@vger.kernel.org,
	ath11k@lists.infradead.org
Subject: Re: [PATCH ath-next] wifi: ath11k: require unique station addresses per radio
Date: Wed, 11 Nov 2026 17:35:09 -0500
Message-ID: <20261111223509.283556-1-patricktlawler@gmail.com>
X-Mailer: git-send-email 2.56.1
In-Reply-To: <20261001164139.370144-1-patricktlawler@gmail.com>
References: <20261001164139.370144-1-patricktlawler@gmail.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261111_143519_778777_7D3A13D4 
X-CRM114-Status: UNSURE (   5.83  )
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
X-Spam-Status: No, score=-5.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=no autolearn_force=no
	version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Hi Jeff,

Gentle ping on this one. It still applies to the current ath-next.

If you would rather have the driver-side check from 1e744bf218b5
instead of the mac80211 flag, I can send that as a v2.

Thanks,
Patrick

