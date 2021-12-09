Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D87C6C4332F
	for <ath11k@archiver.kernel.org>; Thu,  9 Dec 2021 10:44:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=Sne5evFIcl0bgdBIece2fKJaVmi2wb/0aZlpvvtIU14=; b=JmnhIgy0H46RxR
	d8CcCWFircnLVPBu9JAoLaOS8/J2XtPzzZVK2Z+FIuK3ho6MN8tRwYUPyWLZx0zEUlToxSsHchBKw
	mFaw2Bzv1bKvJav8Pa4RWzpgjPhqsHzIoX1NBKqItslXX+EiVdovz2xj4QsHlMPtuz7ULhA8RaNIL
	mr4Bb0k4fyZ0B1FSVrMKJknXAzpiafhXpYKpyfFQr96XV86NogT7Yp1vmutQxuwhHfebonEjNTNF3
	x4MAvMwGaQfGPjI38TFM6bPLKF+iXRAlRRRNCAhAiYFcEjObnhjJjwGZ1FJRhU3QR04hH6V7BbQaO
	meSUKJ3RuCvt8SjeJwPA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mvGu8-00FeWG-Gm; Thu, 09 Dec 2021 10:44:00 +0000
Received: from ams.source.kernel.org ([2604:1380:4601:e00::1])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mvGu6-00FeVY-H3
 for ath11k@lists.infradead.org; Thu, 09 Dec 2021 10:43:59 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id 2A0ADB82437
 for <ath11k@lists.infradead.org>; Thu,  9 Dec 2021 10:43:57 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4F6BAC004DD;
 Thu,  9 Dec 2021 10:43:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1639046635;
 bh=4r+gF70dZYkhhS2mQGiZAQ/oImRo1KGJtpl5JDzvarg=;
 h=From:To:Cc:Subject:Date:From;
 b=j5FuP0Zhpcm6Z0CFxwYDScVEeOVn0SJnpo4oes92EIhiG9w/bqI/mTrwEQKzZ9YsM
 ciSDnRBmHygX5aF5Be+tUwf4eMjS3cE5GNYUlRO5UyDBj/YUeKTtpMtrH7agD2ATri
 RjUhZpnH8oDhWZqdGyoY5Uc1HVH1NDUjzGx0zU4Gk8RMKzBIJ590gRbSF23PzrnUQj
 AY34eQ/XoVhzR5xQVLJnIReldPVcGC+o0KF4jZQMXoMIDch4Vxpj5ec1gBcNFfhRT7
 WfhaDD+zLwFS2l2fImT/xs6eX7u6uMLP+i7q+tvsaAxSKYgANr2u8H+J43AJAX+qh/
 Vd15ENnYlCw6w==
From: Kalle Valo <kvalo@kernel.org>
To: ath11k@lists.infradead.org
Cc: linux-wireless@vger.kernel.org
Subject: [PATCH v3 0/2] ath11k: Change qcn9074 fw to operate in mode-2
Date: Thu,  9 Dec 2021 12:43:49 +0200
Message-Id: <20211209104351.9811-1-kvalo@kernel.org>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211209_024358_737385_EA2543A0 
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "ath11k" <ath11k-bounces@lists.infradead.org>
Errors-To: ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org

From: Kalle Valo <quic_kvalo@quicinc.com>

Use firmware mode 2 with QCN9074 to reduce host memory usage. Please review.

Kalle

v3:

* new patch: ath11k: add ab to TARGET_NUM_VDEVS & co

* remove now unused ATH11K_QMI_TARGET_MEM_MODE_DEFAULT

Kalle Valo (1):
  ath11k: add ab to TARGET_NUM_VDEVS & co

Seevalamuthu Mariappan (1):
  ath11k: Change qcn9074 fw to operate in mode-2

 drivers/net/wireless/ath/ath11k/core.c | 20 +++++++++++++++++++-
 drivers/net/wireless/ath/ath11k/hw.c   | 14 +++++++-------
 drivers/net/wireless/ath/ath11k/hw.h   | 21 ++++++++++++---------
 drivers/net/wireless/ath/ath11k/mac.c  | 10 +++++-----
 drivers/net/wireless/ath/ath11k/qmi.c  |  2 +-
 drivers/net/wireless/ath/ath11k/qmi.h  |  1 -
 6 files changed, 44 insertions(+), 24 deletions(-)


base-commit: a3d88d337890f66f594ae06cedc1adeb5d5f8f31
-- 
2.20.1


-- 
ath11k mailing list
ath11k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath11k
