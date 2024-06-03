Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4CA4AC25B76
	for <ath11k@archiver.kernel.org>; Mon,  3 Jun 2024 09:15:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=biXZIWD1v9hTZVKd+qm0AHfD0kwBeNtZ397Rf7lcyC4=; b=is0+eS/gxMlxZwE+BR3uhONq26
	J484CM5Fw2eZJ5+0tx9V2rrEWJn7vpIb5Lb2rDkK4YcUn5DQyxsOVtohhklDJwkau6nXWQyZGRYEE
	jleqpy24/pWdA/AljvXiQKlb9dE43tNURIPzjZJEQnKQxoYq5JXKDs+8v1K8GKOabeMJSxccZPuMy
	EkoxwBYn8nj6P0C5MnzKV2/J4SJGRjg9Cm8KyRjaWAL+Hsoa8TQeTa83Ktxnb8btTfnYPDzf8dANV
	7sT+dt8c9zoFva4xKwJ3cCqcynxkz32WLp1pnd0VXKsyqcR47faAyre2wIqp0I4yeQrsqkmrfVqwN
	SmbFLSfg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sE3nJ-0000000G9yd-2gVT;
	Mon, 03 Jun 2024 09:15:57 +0000
Received: from www.zeus03.de ([194.117.254.33] helo=mail.zeus03.de)
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sE3nG-0000000G9wr-46F8
	for ath11k@lists.infradead.org;
	Mon, 03 Jun 2024 09:15:56 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	sang-engineering.com; h=from:to:cc:subject:date:message-id
	:mime-version:content-transfer-encoding; s=k1; bh=biXZIWD1v9hTZV
	Kd+qm0AHfD0kwBeNtZ397Rf7lcyC4=; b=OP4bcj5RoXfNjl8GPh3Khtnfrfzu5S
	2QsIL40M5PIr88oN1/isY8//G5RKCNgAhYgucx+9QEhBaWgOuippevPmHqXXjraE
	/OJk8qFlP2ggcDCYLWktNqWS+xz1pWxZIMF1ZiPwjjSs7rL4FwU7FntDBWqPlcd4
	WPH5xfhmGxZ48/Q64J9lHwI/oqtfjUqzyDdIP2YJUPjz7R6wCq52Yw1rHA4duWZX
	zVyE/T/+9y+mJnSiDlDCqigDIWajYW77nIXTINX+5uw3aQEvbrX3ld82CM4xIQ/D
	pw+HdhlhdlUiyqq0WvvBg1opzwcNKxZdAQ5suf+joYnbZYklmIUdF3ng==
Received: (qmail 1899198 invoked from network); 3 Jun 2024 11:15:45 +0200
Received: by mail.zeus03.de with ESMTPSA (TLS_AES_256_GCM_SHA384 encrypted, authenticated); 3 Jun 2024 11:15:45 +0200
X-UD-Smtp-Session: l3s3148p1@9Rsxx/gZ6oUgAwDPXzLGAH1eNELjOc3g
From: Wolfram Sang <wsa+renesas@sang-engineering.com>
To: linux-kernel@vger.kernel.org
Cc: Wolfram Sang <wsa+renesas@sang-engineering.com>,
	Arend van Spriel <arend.vanspriel@broadcom.com>,
	ath11k@lists.infradead.org,
	brcm80211-dev-list.pdl@broadcom.com,
	brcm80211@lists.linux.dev,
	Christian Lamparter <chunkeey@googlemail.com>,
	Jeff Johnson <jjohnson@kernel.org>,
	Kalle Valo <kvalo@kernel.org>,
	linux-wireless@vger.kernel.org,
	Ping-Ke Shih <pkshih@realtek.com>
Subject: [PATCH 0/6] net: use 'time_left' instead of 'timeout' with wait_*() functions
Date: Mon,  3 Jun 2024 11:15:33 +0200
Message-ID: <20240603091541.8367-1-wsa+renesas@sang-engineering.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240603_021555_352304_1408C59D 
X-CRM114-Status: UNSURE (   8.01  )
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

There is a confusing pattern in the kernel to use a variable named 'timeout' to
store the result of wait_*() functions causing patterns like:

        timeout = wait_for_completion_timeout(...)
        if (!timeout) return -ETIMEDOUT;

with all kinds of permutations. Use 'time_left' as a variable to make the code
obvious and self explaining.

This is part of a tree-wide series. The rest of the patches can be found here:

git://git.kernel.org/pub/scm/linux/kernel/git/wsa/linux.git i2c/time_left

Because these patches are generated, I audit them before sending. This is why I
will send series step by step. Build bot is happy with these patches, though.
No functional changes intended.


Wolfram Sang (6):
  wifi: ath11k: use 'time_left' variable with wait_event_timeout()
  wifi: brcmfmac: use 'time_left' variable with wait_event_timeout()
  wifi: mac80211: use 'time_left' variable with
    wait_for_completion_timeout()
  wifi: p54: use 'time_left' variable with
    wait_for_completion_interruptible_timeout()
  wifi: rtw89: use 'time_left' variable with
    wait_for_completion_timeout()
  wifi: zd1211rw: use 'time_left' variable with
    wait_for_completion_timeout()

 drivers/net/wireless/ath/ath11k/qmi.c         | 20 +++++++++----------
 .../broadcom/brcm80211/brcmfmac/cfg80211.c    | 10 +++++-----
 drivers/net/wireless/intersil/p54/fwio.c      |  6 +++---
 drivers/net/wireless/intersil/p54/p54pci.c    |  8 ++++----
 drivers/net/wireless/intersil/p54/p54spi.c    | 10 +++++-----
 drivers/net/wireless/marvell/mwl8k.c          | 10 +++++-----
 drivers/net/wireless/realtek/rtw89/core.c     |  6 +++---
 drivers/net/wireless/zydas/zd1211rw/zd_usb.c  |  8 ++++----
 8 files changed, 39 insertions(+), 39 deletions(-)

-- 
2.43.0


