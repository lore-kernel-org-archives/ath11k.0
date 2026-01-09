Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 58651D232DC
	for <ath11k@archiver.kernel.org>; Fri,  9 Jan 2026 04:45:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=tZp+kfHUaolqheLYLg650A6pQ/r2SBSRElAC2RJMB0s=; b=2yii/1pNaDDisDovVV8qt/yAib
	Y+9DFfdO5IF8/fL1Qf7aRf2Xpz2U1dQOhCmSkZ84Uv7GEIXonrTGGRWP+mi8q0frJ4J+24+SHC5WW
	fccVZK+bj29azXpRDkPV7swNYsL/ZdJ5SGygiNSCmqGi/tiKMD2v9I9+OQ88qxeeWEH/jj0YPtDQV
	LQTGQmzoi8g/8huoSQNhJXnzwe62SvARtNY4PqagFEHTqHO9ly/Gm9yCSFmynO7DIFKn9H8ci+J+t
	9lMyxJ9+m1tITs+oLUK1r7G69IP51lKMA8E/QN3vha8VcSFeGRtIDa5lwfaHGghe+oi7/jSlKZ4Qn
	wmGDT2dw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ve4N1-00000001KsV-1xXj;
	Fri, 09 Jan 2026 04:45:08 +0000
Received: from mail-oi1-x22a.google.com ([2607:f8b0:4864:20::22a])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ve4Mx-00000001KrI-0XDE
	for ath11k@lists.infradead.org;
	Fri, 09 Jan 2026 04:45:05 +0000
Received: by mail-oi1-x22a.google.com with SMTP id 5614622812f47-4557f0e5e60so2523723b6e.3
        for <ath11k@lists.infradead.org>; Thu, 08 Jan 2026 20:45:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1767933901; x=1768538701; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=tZp+kfHUaolqheLYLg650A6pQ/r2SBSRElAC2RJMB0s=;
        b=BqX80YNWRqDUmAFxgIKe/B5BAC69oquUJHKiLtKcqz5Xrx/s+Rr+AzMiObhW2R1tgN
         kwlWzrvljAjX9onNKkHK7uKqR7JKTS3wZ84NtGzyzYbvkv9JeeBxsdem7hk96zAcwFVk
         RG4GC1abBJHjkzrNNfTDghKA6wo5fyNG5UjS5RP07mKV98tLaUJIf3CwDtOxU1yjC3bj
         9CQfEN9FBv8oX3Fw6xBdZoBNH0WRaDZRNtvHelpuYyaOzZSeRBzcrp2S/tWPPDd/vM1V
         Dn5kYMm6v4vaXyQU7cxhYRYtKrkLHT8b4mHUG01ff5x/lTEtm0A6K7vNyJ50eb7QWYqs
         5JFA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767933901; x=1768538701;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=tZp+kfHUaolqheLYLg650A6pQ/r2SBSRElAC2RJMB0s=;
        b=eOtnAJbdfOhTTqF7pRl6mPnTV+MFpOu07YyPlij055qbfvEM5ty6TFTEXaYSDfyZUU
         fyur6p6ToSBhhZaWN/iCbqcKw0gff1rsNN2eZUehAN0Pc/eLUqTMppVdYXUG/rIKjafL
         3nYvp+ardcLFODmFb6U1HvxiOdWK3VuGulh7uxqunpmi2wehVCRsb6wterd4DTZYUZGy
         6s8bKmjJGanmD9M4UxhQNq2qEdyZ5QOYie/E2lk+Y3LhHyY4bN6cvGB1hvaR2jDJ9K7A
         LNUbnL3CPT/Ra+/99zoDTawfvTtTTBv6oZA7XmVBqfAY6X02kTmdO8TxrGB1r19tCrC8
         LH2Q==
X-Forwarded-Encrypted: i=1; AJvYcCX9HwrUdCNyDP/329Zm4iH3AwrYhU/H5RhrIsrcEuWFp/QsK1P+pua9IndgUIS7XyNItmwDZwo=@lists.infradead.org
X-Gm-Message-State: AOJu0YxMLo8ORfWJCvDUXoXV8JPUXQQ8i9lELrpeefZxejjWUB3jSYHn
	lAD+VunS9WrisGj8FeXMNiTN0P86iqQL4u7swdzrcbYI5TPVAd/0wbZw
X-Gm-Gg: AY/fxX7lrlXGY51UD27NZoARSnXj56opNGhidJF9bh0c8PfRkVIyQp4+KdefKXaMqkU
	eTIDil6iF+mOEGLqMyIokCASOhWlPgBmYET2zPELzlUnV1/4nWGlQSl+iFVKfESpljG0jeumpk6
	OKHKkRuyrm3bfYqovKi43PKAKfWsB9Tsh5c1QnwDgxe04az1ZYeO2O04RQRRSy6l4+lbO7YoTWL
	aPfCNtrgLk2ZFo2jxlfAog3hYmr8OuJJSnWKyorQXEPNfKUtXNIcX1n+RQayhUpItAfZFFf/guD
	RjC3XiFJ/frz+G0Y86mCLlNb2S9svlVqGqwIwJYEQpBpDIERXUlXCxGMNO5OuH55NNEvsgBBLkN
	bXsyJzrqLzP07iPy5ODBnySs+royk6DlAoZhkmSiTb/vjdzoVN9KPbz/2jlGJXRp3GBeoL6Hdz3
	H61tNTFWbIEJXhxQsrH2BvfbF3ekKke1M0Xefh1HOxHUHuItLQdssW685yNzXgOYeo8IUszJTm1
	OzLCcMSeTtOtKzPn4t5uuHFfgaR
X-Google-Smtp-Source: AGHT+IHedFIfG2wReSbPveqXV4uDnobziG+QJflWOiBLTxU7Ae0czMlXONHjUMHL2RQJtC6hSKZYTQ==
X-Received: by 2002:a05:6808:4482:b0:450:10b:a53a with SMTP id 5614622812f47-45a6bee7f84mr4029885b6e.65.1767933901142;
        Thu, 08 Jan 2026 20:45:01 -0800 (PST)
Received: from nukework.lan (c-98-57-15-22.hsd1.tx.comcast.net. [98.57.15.22])
        by smtp.gmail.com with ESMTPSA id 46e09a7af769-7ce47802551sm6683515a34.1.2026.01.08.20.44.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 08 Jan 2026 20:44:59 -0800 (PST)
From: Alexandru Gagniuc <mr.nuke.me@gmail.com>
To: robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	jjohnson@kernel.org,
	ath11k@lists.infradead.org
Cc: johannes@sipsolutions.net,
	linux-wireless@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Alexandru Gagniuc <mr.nuke.me@gmail.com>
Subject: [PATCH v2 0/2] ath11k: support IPQ9574
Date: Thu,  8 Jan 2026 22:44:52 -0600
Message-ID: <20260109044457.3074510-1-mr.nuke.me@gmail.com>
X-Mailer: git-send-email 2.45.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260108_204503_354168_49D023A5 
X-CRM114-Status: GOOD (  11.69  )
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

This is my attempt to make ath11k work on IPQ9574. IPQ9574 is intended
for wifi-7 devices, so it seems the exception rather than the rule to
pair it with a wifi-6 chip. That's exactly what my Archer BE550 does.

This consists of a wifi-6 (QCN5024) chip connected via PCIe to the
SoC, but exposed to the OS via AHB. The Q6 firmware [4] requires
remoteproc support introduced in a separate series [3]. The QMI
firmware interface is very similar to IPQ6018, such that almost no
new code is needed.

I am not including the wifi@c000000 devicetree node in this series, as
it depends on nodes from the remoteproc series [3].

I have been successfully doogfooding this for a few of weeks in AP mode.
There dependencies to this series. [2] is a compile-time dependency,
whereas [1] and [3] are needed for full functionality. I was adivsed to
leave [1] and [2] as separate patches and not add them to this series.
`

[1] https://lore.kernel.org/ath11k/20251206175829.2573256-1-mr.nuke.me@gmail.com/
[2] https://lore.kernel.org/ath11k/20251228151408.2116108-1-mr.nuke.me@gmail.com/
[3] https://lore.kernel.org/linux-remoteproc/20260109043352.3072933-1-mr.nuke.me@gmail.com/
[4] https://github.com/quic/upstream-wifi-fw

Changes since v1:
 - place compatible strings after instead of before ipq8074

Alexandru Gagniuc (2):
  dt: bindings: net: ath11k: add IPQ9574 compatible
  wifi: ath11k: support ipq9574

 .../bindings/net/wireless/qcom,ath11k.yaml    |  3 +
 drivers/net/wireless/ath/ath11k/ahb.c         |  4 +
 drivers/net/wireless/ath/ath11k/core.c        | 82 +++++++++++++++++++
 drivers/net/wireless/ath/ath11k/core.h        |  1 +
 drivers/net/wireless/ath/ath11k/hw.c          | 51 ++++++++++++
 drivers/net/wireless/ath/ath11k/hw.h          |  1 +
 6 files changed, 142 insertions(+)

--
2.45.1


