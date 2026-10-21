Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C82D9606A32D
	for <ath11k@archiver.kernel.org>; Wed, 21 Oct 2026 16:52:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=ZIzNTJAY;
	dkim=pass (2048-bit key, unprotected) header.d=bairaktaris.de header.i=@bairaktaris.de header.a=rsa-sha256 header.s=google header.b=V/UEYCrJ
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=SSE/aiGp07O28xClfqJkfRnHef6QHlRoW33T0GdwSH0=; b=ZIzNTJAYuWk2NEgN8Y2Z7vWiNk
	RNnRlH/hGfRUHj2WtzHK3n4vMShV6SjYehO1PPvv8ZyX0aVKmxViBtOoGgW4YL2IwMM4eQCm7eTXO
	BgCAKtl0Su8v1+5zmjJKrBTiZgj9m6NtDvG16WqOPFRG2GqRZm+0A3Z7Q3YTmqGkSfSWd2onV3ypu
	rEMrEO5pkQFYaBJsvTX7RoTwNO6LsWBQVU7T9Wy1zX9DipZl72m6PA8/+JlgtqEWB0lLd1FApd4oO
	ICLiyNgGSRtEdHoHilVcTo61P1uwbutFXn1UcIB5EXNdRi+I2+HrswkNeDoek0OyW8m1m5mpLta/K
	ZK3TVvCQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xJZYR-0000000CTvP-2yXC;
	Wed, 21 Oct 2026 16:52:43 +0000
Received: from mail-ej1-x632.google.com ([2a00:1450:4864:20::632])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xJZYP-0000000CTtR-08bH
	for ath11k@lists.infradead.org;
	Wed, 21 Oct 2026 16:52:42 +0000
Received: by mail-ej1-x632.google.com with SMTP id a640c23a62f3a-c46822eefb6so104161766b.2
        for <ath11k@lists.infradead.org>; Wed, 21 Oct 2026 09:52:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bairaktaris.de; s=google; t=1792601559; x=1793206359; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=SSE/aiGp07O28xClfqJkfRnHef6QHlRoW33T0GdwSH0=;
        b=V/UEYCrJE7aBZXen7hQGrTIuG0viTEo+G6e85HLM7VzJryw2GRtA6OFU4yRIHGm7zy
         uGOILrSvdQLorGo/56Rr5zl8yxfpHsYTDGkiocjIJWwbYcTCzFSRgbIYcj1YZuH4vhuL
         6i7cSx3mT15M/ZCL41hcR58bAQQlln10p1IV8rFj2G/Q7wyNn3Ky8Wpdnz7IWTjhqXOQ
         yHXA6a/c/L/djNABLF4Q/EwfusgMrevN8CqMHVZeCCTsvpc0IAj0ARCP3wAfj/fZv03z
         2SWfOHkQkYbyzACWtoLzXy2dOJbHTZ6AmS1fpS2xFa1gzg5NUe7bBeDGCe9b4bzdoV80
         nHHQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792601559; x=1793206359;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=SSE/aiGp07O28xClfqJkfRnHef6QHlRoW33T0GdwSH0=;
        b=PejMWQtqeViWPjfMedNcyShZxdP35pnu5A+F+7fL4G4UUJsR4dtXHCRrr1/VXmGDCt
         1VLFfp8AO4okokFe8dyPZ8DsLechMfuLPMnNHCNj4PVZzWKC04HFrK9yNS4J5raVOIsj
         mboEtZs6nT9c3XyQ9PRes6MP9V+GcvmhqaT6NOfX4RPQ+9so9IcpPLsKz+VVaTTvF6qS
         SMur46wZKKsNlJDBY1piOcjeBH/gVQLF0xq+41o8fL8r6DOGWPL5GGp934dB1ZQNOssn
         ckZFof7MIjdTudyIj7WFxxxO3XegLMdsDIJxW+ViVW4XZXINfZE0FVtJe16fwdY9Nf4v
         9Fgw==
X-Forwarded-Encrypted: i=1; AKwUvByylREuiZR6wnuBQqG57CPyyKGnX8a+kruii1UlMwAlyc4mextEvgO7hDurHR6q65zXxyx4+ZQ=@lists.infradead.org
X-Gm-Message-State: AFq9FYKi7zHOnEb1OVcCr0t5Nq2WLVvMnT044zogtRXhtpwjNUTQc+WM
	P+fparWtvSfBmIFnroqvv9L1VnBxHYWmEGzfOmcUFUuDxgodMaytWqXETLLQkxG3Ow==
X-Gm-Gg: AYBFou2r8yizFO8vpJHjUVBL5hnQcVbdZ1lDVjL3QDW1q7+yVxe8vVyYZ9vjsFtEvun
	QrZHW2EcqDCvcjZya9e63FYa2mSv++lvPohDrBqCeiavu83NUWvc2a8eJ0PgQ7PnOtMItHPGoj0
	KnyaYMxIRMNO2ZWJlZEYVPMSpnduhjFJerE5k7nnyOUPFIysqMHMMwuF7CEByjBTEDjuwh/Zw2g
	B5a9N1YR5m1lHnceLkPYt1HtFRsNMsmkBuYBitTYVcMSdB1/pPc4BPHB9ZMJC5Qcg/pZtmhXbU0
	W7zf/CGeewZJybCqlYhzT0G4HaOuof6Mj5Y1GNHd2iXswCl9HhjoOPGwsURXnZL8+zwz61g1CcB
	7Tkv6xDrub0QXloHhvmUv/JGmWXP6H8h8MP2j5uNomMs4j8iUxB3bY47zBqX3lXz7kaeK9KjfpD
	M+kiNN3x6kA5sAxrxtvTR+aIkPQlwRRi947yYfeRn+Z93ale8u+XQNPnAr4rhmag/VbKqoo6Sae
	iaHeqClsP72hwhwKp+1SRwVzuZ5L6a3rZrOzFzwMD4Bd5y39oZ/kM0U7zeI0Axzw74O0/i4cisO
	OV1yImOz/dixNXY0NbPa9XLdfIenNVJvHtQ1joSS3Mk4eBOMOW9lPPOd2GtiT4PDg/XDga9VFDb
	CYJ3ID8xrCFbhCIGuwmw76jtTfWp5ZFdxZ9FUBxdmJ6st6eHgO1QLtY6FlfXmOQxi+7UNIHhClV
	sbveuUnn91WKtCwSEQe8EB4Izn+mXbNGH3tMkE5UvuqbwWq8HhPPQR/EOvkHV+4mPa+Q==
X-Received: by 2002:a17:907:1c95:b0:c26:19de:9aec with SMTP id a640c23a62f3a-c4679b577d3mr222087166b.43.1792601559256;
        Wed, 21 Oct 2026 09:52:39 -0700 (PDT)
Received: from Desktop.fritz.box ([113.30.223.169])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6b4030daedbsm1043728a12.13.2026.10.21.09.52.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 21 Oct 2026 09:52:38 -0700 (PDT)
From: Julius Bairaktaris <julius@bairaktaris.de>
To: jjohnson@kernel.org
Cc: rameshkumar.sundaram@oss.qualcomm.com,
	ath11k@lists.infradead.org,
	ath12k@lists.infradead.org,
	linux-wireless@vger.kernel.org
Subject: Re: [PATCH v2 0/2] wifi: ath11k/ath12k: apply the 160 MHz NSS ratio to the radio
Date: Wed, 21 Oct 2026 18:52:39 +0200
Message-ID: <20261021165239.388945-1-julius@bairaktaris.de>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20261021162023.280823-1-julius@bairaktaris.de>
References: <20261021162023.280823-1-julius@bairaktaris.de>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261021_095241_086571_24F234E2 
X-CRM114-Status: UNSURE (   4.94  )
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
X-Spam-Status: No, score=-9.2 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_GIT autolearn=unavailable autolearn_force=no
	version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Please ignore this one, the send was interrupted after the cover letter.
The full series is at
https://patch.msgid.link/20261021165138.388593-1-julius@bairaktaris.de

