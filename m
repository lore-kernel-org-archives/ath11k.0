Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4F9DEC4345F
	for <ath11k@archiver.kernel.org>; Thu, 11 Apr 2024 16:55:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=kGbJlhDW+1MpNWUWsGu0WLnQ6P55FcDo24JWWmXkUi8=; b=oeC5uuKxFwChDrzTX7t95ypFOq
	JSVLRtatgS77sJ/+KnTCc0IKVCMN1Z7AXUKqXri/peK/5dvO5ZBrjy2CRh882Kz8xCckutULOW4IZ
	3V2UGsa0hU34dkfbOk+k0AZYl2H+1+0qPCGxQD/hudwEIXhf9RajPlp5Pf37QaDPRzy8VmXXQ5o4/
	0KqWtSISHOlN+CuD3fK8eR+ud9peYqiVGr6z8kuwLLYBs62DYpOknpiD5WFWhfiZ2j0ZkWJmVFQRr
	pc9KpTbtTffeGx2O0qwCMexkRoT3FnnEJUvm5nSr0uNZy+igy7v//WZ4IX4UUr2wpVoQeQGd5paf1
	iQ5iiT+g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1ruxhu-0000000DCah-1nIc;
	Thu, 11 Apr 2024 16:55:26 +0000
Received: from sin.source.kernel.org ([2604:1380:40e1:4800::1])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1ruxhq-0000000DCYA-0I6W
	for ath11k@lists.infradead.org;
	Thu, 11 Apr 2024 16:55:23 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sin.source.kernel.org (Postfix) with ESMTP id 6403CCE1003
	for <ath11k@lists.infradead.org>; Thu, 11 Apr 2024 16:55:20 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 13260C072AA;
	Thu, 11 Apr 2024 16:55:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1712854519;
	bh=gk1IHjYzbP2eNwqxUsPH6sgseRZXBtkXRndssS6uIqk=;
	h=From:To:Cc:Subject:Date:From;
	b=Y1LYvVHFKdZcSasMzkquHW0BkDkWwx/N/iHI2puNzVlrzV+pp3YHgR7vOabsgmJo7
	 K7qz2oFrKSMazBzIJpwnaSozUYN0k9VQUzJfix81WLS+OMJJii24SxkVF4x1yubYmp
	 mm0H79mAKCyimSbMrFqIN4S1jU6GnnqiFuK6xwMEn8quSme/m/MO+mq3KfkldCjXXY
	 tFkvBiouLTfOy9/7EFRM7SwHEWzPZspltfSTWiEQhYieh/HjLuEE623eGlxJrjh/lq
	 SKLg0iduk3VP+E4NkfOhe4P0Qexs8JT+7AATMRZ8TUgVoxuumN7VF6w8jBIWOcgrKR
	 4GbVXhaCoJ+VA==
From: Kalle Valo <kvalo@kernel.org>
To: ath11k@lists.infradead.org
Cc: linux-wireless@vger.kernel.org
Subject: [PATCH 0/2] wifi: ath11k: use RCU when accessing struct inet6_dev::ac_list
Date: Thu, 11 Apr 2024 19:55:14 +0300
Message-Id: <20240411165516.4070649-1-kvalo@kernel.org>
X-Mailer: git-send-email 2.39.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240411_095522_325680_06D1EF7B 
X-CRM114-Status: UNSURE (   6.76  )
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

From: Kalle Valo <quic_kvalo@quicinc.com>

Fix a recently introduced sparse warning in ath11k_mac_op_ipv6_changed() and
switch to use list_for_each_entry() in the same function. My plan is to get
first patch to wireless tree and the second patch ath-next (once the first
patch is there).

Please review.

Kalle Valo (2):
  wifi: ath11k: use RCU when accessing struct inet6_dev::ac_list
  wifi: ath11k: ath11k_mac_op_ipv6_changed(): use list_for_each_entry()

 drivers/net/wireless/ath/ath11k/mac.c | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)


base-commit: 363e7193eaf258fe7f04e8db560bd8a282a12cd9
-- 
2.39.2


