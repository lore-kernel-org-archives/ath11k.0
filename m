Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A57E5C433F5
	for <ath11k@archiver.kernel.org>; Fri,  1 Apr 2022 17:30:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=LIVHbXb/rtRsH3bna8XSWl9LouYfpyPjNcA4Wnuv0wY=; b=BtNrPzMk46UtWP
	6wvyt8wxM1XEikGm2284IIM2gMiDrnYZPPdrrbceHwSPp+koGXNT52ONvkg0uaAsxREWm3zGKvov4
	Ab2i9T5aqZzxm1M/6gg0JJTvtM1qHp7qJAWSYFFWu/7wqE91i10bWeKPZRd8mpMBZzoxBE0Mh/uSy
	zKKGCsISI3Ny7AL/9EkgKILhFimdbBgh1Nfv2prRikWbydNLPIljCk/fzNUNWBmjx6Ise4gIt66UV
	PtboDxPogwJpVP/LmfODphji/l8dX8M6l3DDpC+b3sFGSZRqQu+DfnPMRJq40/2CskaqKozvhD3pG
	JLq1EV+kaiMd+edJfoeA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1naL6o-006i57-AH; Fri, 01 Apr 2022 17:30:50 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1naL6l-006i4h-GY
 for ath11k@lists.infradead.org; Fri, 01 Apr 2022 17:30:48 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 0BD8F61D19
 for <ath11k@lists.infradead.org>; Fri,  1 Apr 2022 17:30:47 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D3FADC2BBE4;
 Fri,  1 Apr 2022 17:30:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1648834246;
 bh=RQCpqP+2w7fIiUWEq3fqVySlWEsSP9xopeGa9g2TQvM=;
 h=From:To:Cc:Subject:Date:From;
 b=SBC9ji05Bx1olG2OYwBczO6gZD+dmndI0v4FwYNzJlTAyxV0vJdtdcipRPsW5Sj0n
 GvodO2j4JcON7160b0DYeyg9alADnburI6ZB9TZeqHu13tSjoSjlmi5RKtMoZdglxg
 uh3FC76wczXLUtt8iNmSf6jJ0dmZHyn5Exp1fiqBjrRo+ThmJXiRCVK1ntsZCA8CY5
 E5yebZt4/oFBB0E6SqwoZWxje3EIaAkN2a5AlDH/OuW+y2FJUJS+BrKgkXUefnKj5n
 b6b+Xv+eneKZqSpikqDb7zWiIkZwEWPqmowqmq3Hfo2bCkEy5SZEXtwveZN6R3LznR
 r9Aqta/ii3+zg==
From: Kalle Valo <kvalo@kernel.org>
To: ath11k@lists.infradead.org
Cc: linux-wireless@vger.kernel.org
Subject: [PATCH 0/3] ath11k: mhi cleanup
Date: Fri,  1 Apr 2022 20:30:39 +0300
Message-Id: <20220401173042.17467-1-kvalo@kernel.org>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220401_103047_624985_73EA26F6 
X-CRM114-Status: UNSURE (   7.14  )
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

Some minor cleanup to mhi.c, please review.

Kalle Valo (3):
  ath11k: mhi: remove state machine
  ath11k: mhi: add error handling for suspend and resume
  ath11k: mhi: remove unnecessary goto from ath11k_mhi_start()

 drivers/net/wireless/ath/ath11k/mhi.c | 222 ++++----------------------
 drivers/net/wireless/ath/ath11k/mhi.h |  17 +-
 drivers/net/wireless/ath/ath11k/pci.c |   8 +-
 drivers/net/wireless/ath/ath11k/pci.h |   1 -
 4 files changed, 38 insertions(+), 210 deletions(-)


base-commit: 57b7042c114767b7330b14a260f61732e556742e
-- 
2.30.2


-- 
ath11k mailing list
ath11k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath11k
