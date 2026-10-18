Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 07025CCF2CF
	for <ath11k@archiver.kernel.org>; Sun, 18 Oct 2026 13:19:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=EmlLkQ6dpljXtahKxB7AlkZKnbyW86lxsHxYr9rqtM0=; b=bEO3Eqc38Qn1xg4TaXOZdNUt6X
	DeqZ0WorHLHvzRmuNScjrwgj4i5ZTtcFXtiMBOFw3QsJRhjs+8wEEn6vsXbD593rCQ62tJFa4lb/C
	55wUImOBnCWN8y3gvXhTlnSq8taYVlOsM0fXw7FpdcwkRChBxNSp+db/cZiGumTbxXFacoQG/wt3G
	/MC8dwh1EFJgp9/CE2iR+SkJKBDZ2/wq5C5NTVSTFSPaKpVHh+TqdS0tA6o7fL2ExRKK5skKBbl7z
	Hh04VbNs274moIkIxMrN9L8pS/8Pus3yxfhkSHozmNvfJ5Zrpr3kzjmLdL4bQYFg+CeboODO5IMCY
	dzT2ljuw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xIQnb-00000005t0w-1qi9;
	Sun, 18 Oct 2026 13:19:39 +0000
Received: from mail-ej1-x62a.google.com ([2a00:1450:4864:20::62a])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xIQnY-00000005t08-1g9D
	for ath11k@lists.infradead.org;
	Sun, 18 Oct 2026 13:19:38 +0000
Received: by mail-ej1-x62a.google.com with SMTP id a640c23a62f3a-c2dc8cb0decso88322366b.2
        for <ath11k@lists.infradead.org>; Sun, 18 Oct 2026 06:19:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bairaktaris.de; s=google; t=1792329574; x=1792934374; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=EmlLkQ6dpljXtahKxB7AlkZKnbyW86lxsHxYr9rqtM0=;
        b=OGKh0IBRf7JojR3NmKfzttiJpaBzLQ7mrXbV1jq/G1yhE1HKCppfq3g4/B+S3IQrSy
         u2hIQVwR4DJLgBgpzfRgR+Gl4zevqS7iwv26j9C8d9ayAUKdCdLkXapB6blfdD/8LSot
         Q7SvlII0yxjW8DyMC6imkVjUC2PonaO+8JDt7SldC3qwfMShhjCdK+/jM/tPN6nYzE7u
         DqtRN/V7kHGdVNTJnFxI+XNmGINqCf2RKTbLj6sWwkFbfKVs7CO5m0FpOQ23XqMPkpum
         bEmABKbnxXBXoObnJTt7Sz/iOA+KJq8IhH4ghmdFdQSgYiYBpoAhn1owEt8kIGYh5HIK
         H4Bg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792329574; x=1792934374;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=EmlLkQ6dpljXtahKxB7AlkZKnbyW86lxsHxYr9rqtM0=;
        b=abW07CiGfZKzsPffa2wtI2kQhjJT1JKzqXZhPfdDILOP8jVe1TVjSOy6PbbK2k5zIc
         tDHiOcW92DPEqUuI4SeQWWWr/4nH3u4RMH6o9/S2yf99de1fB3ue5eZETZd3NpCFhp5E
         Wty71OOgxcd3n8/Z35059UoVhbbEmwaGgHkYiKoNFaU1CV2aHThLttEWRsWeOll9yO50
         REVDg3ZqzvMX9Gj9W8fwrIAffL5D8RbHH+4toJpAamYvBnQJiiH2dBsBO+uXIbafWWw7
         87QqmCu30pzBR8+Vy+ac6Ld5I2MQgZKnpnJ9SBsyihlBLWgVGqiKAJXIkuXx8D4INBCP
         b+/g==
X-Forwarded-Encrypted: i=1; AKwUvBwC2P7I6oWfK4XbJxY0SIi5bz6X3HyLIFQDU+SKB+XMDLmp5oIO43nwRIIw600q25nTlKu/5uU=@lists.infradead.org
X-Gm-Message-State: AFq9FYIV6exQvK7XFMu0mD3ZQZL82wBQpNr5Tja0aATTpYI+8Mi5xAWY
	iL8ehmYXfbFScrIMsbvPi6qXoFTW7YnLmOtH35TaruOBzUtN3oNyTTeLKJE3uG6S2w==
X-Gm-Gg: AYBFou3hKBAumrObGIQmyfzwyQu8bXkDRh77DPzz9N4popUfjt0W0Mi7n3pNd9B15Ee
	hoHur22cNp3BaWxBwg3cH3uRSDGjdBVmMmEcGnZwVg0QtAz5Y6jeNpJFCdqlIQskO7z8/zKvEXq
	+C1+7lcdSpSzwUPRTZQ0Jan+YGp+/hQmyshsZFEHr34wLsqsXHySW8kY5mo5Q3TXCx7GoqJzdpe
	Oh4HyFSnCLSuw5MDD7a1UZ1q98xk4YX6cMCh8pa9pYRQHj2GIR4j9VjUTb2H8Jyt8netlQgln5I
	i+0I9kJeD4uVTzbEJgyNpgX54wDiHelyBMm+ZPTTh/sckcnAhR1zPOp3X3ryrlEEJSguLS809p/
	c1pHmkYm9OgLxPwjS3Xixu9ElgaC2PN7/aeUCrbcoac3+fsRw7x9d5wklO7NlDfemnYmzPZcOP+
	fJ4SbTNyoCnFgmubDXR+91bWdrDVbjQkW/8OBO4r+Gbk24lJozqQVL3x6s4YkhP/+Gs3f5kwFMK
	jW9oIAwneVT/VvtiFbR77R2AYiw9eYUOUoH3VvHHuYtm8ODd0ly4wA6udEv1LH3HMHZTIsku84g
	BeJWy6yy+NpXF5IWrZ125g6iHJoAHAX+JSzyDrXH+mJduLsC9BdVyvD7a+QTvz0ialctyqXgW5P
	O4kXM5vwaFQufJPqHEsPRd1tfn6bdYuO/skb9FDfntdcdYndQnrXMlujTKEjAZ9oKTZIcve+xHW
	GTI5F7VlDBpdFWtwU49zg=
X-Received: by 2002:a17:907:d643:b0:c2e:7da8:f54f with SMTP id a640c23a62f3a-c419f80267amr348395066b.38.1792329574061;
        Sun, 18 Oct 2026 06:19:34 -0700 (PDT)
Received: from Desktop.fritz.box ([185.181.130.213])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c4090dd10d4sm264093166b.27.2026.10.18.06.19.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 18 Oct 2026 06:19:33 -0700 (PDT)
From: Julius Bairaktaris <julius@bairaktaris.de>
To: Jose Ignacio Tornos Martinez <jtornosm@redhat.com>
Cc: Tamizh Raja <tamizh.raja@oss.qualcomm.com>,
	jjohnson@kernel.org,
	Jeff Johnson <jeff.johnson@oss.qualcomm.com>,
	Baochen Qiang <baochen.qiang@oss.qualcomm.com>,
	Zhi-Jun You <hujy652@gmail.com>,
	ath11k@lists.infradead.org,
	ath12k@lists.infradead.org,
	linux-wireless@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v7 0/4] ath11k/ath12k: implement TX flow control
Date: Sun, 18 Oct 2026 15:19:30 +0200
Message-ID: <20261018131930.1116724-1-julius@bairaktaris.de>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20261017074012.35602-1-jtornosm@redhat.com>
References: <20261017074012.35602-1-jtornosm@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261018_061936_463422_88BD2471 
X-CRM114-Status: UNSURE (   9.30  )
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

Hi José Ignacio,

On Sat, Oct 17, 2026 at 09:40 AM Jose Ignacio Tornos Martinez wrote:
> For ath11k, my series is smaller (4 patches, 7 review cycles) and has
> no external dependencies, so it may be simpler to land first. Julius
> already offered to rebase onto it in his cover letter [1] and move the
> ring check into his scheduling round.

Agreed.

One thing on patch 3, from reading the code:

> +		if (num_free == 0) {
> +			spin_unlock_bh(&tx_ring->wake_tx_lock);
> +			break;
> +		}

When this breaks, the frames stay in the txq and nothing restarts it
until mac80211 queues the next frame for that txq. A sender waiting for
ACKs then stalls until its retransmit timeout. With AQL I measured this
in v4: one download in three stalled, max RTT 347 ms. A restart from
ath11k_dp_tx_completion_handler() fixes it.

For patches 1-3:

Tested-by: Julius Bairaktaris <julius@bairaktaris.de> # IPQ8074 WLAN.HK.2.9.0.1-02146

Julius

