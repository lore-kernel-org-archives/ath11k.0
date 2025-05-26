Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EF82AC5B547
	for <ath11k@archiver.kernel.org>; Mon, 26 May 2025 11:48:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=STYoA34OCns4QcxJIHjJSFz5rDm0BpoAPDV+vDJdRBc=; b=IQ5GilU0idqFr+sJUh30uoyGT2
	mB/AJY2v5zzNlsC8MipSVlkQD6r3LrsWWmkIOY+TjCdd11JMkBzQ5fi1gfjvMBqSc0cfEpnGRnDwL
	BTUskSz+T13pPW2Oz8UvL9Tp9JXQERPWBtm48A6DWOXoZ7w/XLnT6cQQs24sftgkX+rx8tIoCyQjB
	C+jqpHKUNSJ1q9bT1nNDa6VEFhrnArqWm3yF8Kt1qQGTFFDc3DmRcRExI6jzjsY3yz6RtYlmw416u
	KFMrufaJwPEpGIryBtQcxqCRe9WKjmCIBun2mU/6DSMh6ksWh/cdMBOfgGUwFNS9Mdynz01ZHwVA9
	wUjS+b0g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uJWJf-00000008jU0-06gs;
	Mon, 26 May 2025 11:48:27 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uJWJc-00000008jRd-3uJi
	for ath11k@lists.infradead.org;
	Mon, 26 May 2025 11:48:26 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 0E17F4A3C1;
	Mon, 26 May 2025 11:48:24 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D0C73C4CEF4;
	Mon, 26 May 2025 11:48:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1748260103;
	bh=mjvrQsWSO1J2H28FWM14OXB9euTqINfAytRW7cgyZ0U=;
	h=From:To:Cc:Subject:Date:From;
	b=V6Zpfet+GvE0ZyXQlCnLklLek4ilDIFtwmdSki7VZ5P2Gh29oZSXOEA7A2zs4/0wR
	 k9VBpfTDBAz+7ZGBdVCqDH3ZKrSZbiAz9yuNkhNP15OssKm2/1gdZpLdQnKRiZYe1r
	 fgxVTiuLB1TbEUgX677owKsxTwmdCjx3xRqhDmoTF/vcenvci8FKoAe5PN8vbLHlCC
	 OzId22sIJflgJvJ3rIf43OcZdH/nayhJNDCqT9CK/jEdBB2q+EG4zn7503ebeKVu94
	 7O021o5Eg0yQn9tPlxborkENhqo40ktOgdL7hZpBSAH80cMMARsDwTjeJEsjA+/VjS
	 HN4bf2Z9iLGlw==
Received: from johan by xi.lan with local (Exim 4.97.1)
	(envelope-from <johan+linaro@kernel.org>)
	id 1uJWJc-000000000Yq-29Dy;
	Mon, 26 May 2025 13:48:25 +0200
From: Johan Hovold <johan+linaro@kernel.org>
To: Jeff Johnson <jjohnson@kernel.org>
Cc: Miaoqing Pan <quic_miaoqing@quicinc.com>,
	linux-wireless@vger.kernel.org,
	ath11k@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Johan Hovold <johan+linaro@kernel.org>
Subject: [PATCH 0/3] wifi: ath11k: fix dest ring-buffer corruption
Date: Mon, 26 May 2025 13:48:00 +0200
Message-ID: <20250526114803.2122-1-johan+linaro@kernel.org>
X-Mailer: git-send-email 2.49.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250526_044824_989748_FE6A84D7 
X-CRM114-Status: UNSURE (   6.81  )
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

As a follow up to commits:

	6d037a372f81 ("wifi: ath11k: fix ring-buffer corruption") 
	ab52e3e44fe9 ("wifi: ath11k: fix rx completion meta data corruption")

add the remaining missing memory barriers to make sure that destination
ring descriptors are read after the head pointers to avoid using stale
data on weakly ordered architectures like aarch64.

Also switch back to plain accesses for the descriptor fields which is
sufficient after the memory barrier.

Johan
	

Johan Hovold (3):
  wifi: ath11k: fix dest ring-buffer corruption
  wifi: ath11k: use plain access for descriptor length
  wifi: ath11k: use plain accesses for monitor descriptor

 drivers/net/wireless/ath/ath11k/dp_rx.c | 41 +++++++++++++++++--------
 drivers/net/wireless/ath/ath11k/dp_tx.c |  3 ++
 drivers/net/wireless/ath/ath11k/hal.c   |  2 +-
 3 files changed, 32 insertions(+), 14 deletions(-)

-- 
2.49.0


