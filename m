Return-Path: <SRS0=85K5=O7=lists.infradead.org=ath11k-bounces+ath11k=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 21147C433F5
	for <ath11k@archiver.kernel.org>; Mon, 11 Oct 2021 08:27:11 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id E3D2C608FE
	for <ath11k@archiver.kernel.org>; Mon, 11 Oct 2021 08:27:10 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org E3D2C608FE
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=ZO7WoMFRjobnzTd/OYyoyTnx4HoFOVDcJrhh43SoUHo=; b=sku1FyqvU9help
	FNDYsrCoMzyLAp3Dzheb9B+SK88mHSk9lTgr5ZHucS4ODbViw8dztlKXVhibX/c38MZX0M10KlKUP
	ve6GW52cDVdkDrGH5G7gLygLqMKi6mvBrl/FkjakgzKI897OqE3TdXE1lAwt/JLApTCCgCqZ88qhc
	xxDSYqCoi9l27Qo28+7bRcvFXUC0NZeISHcxEW6auKKc+ukiXYBZ/YDj38I0H4TkrsTmrPFtThWik
	sm2mhdw3CFDcDcqz2Rk6io/elHkmj7W43qH7oaRpOU2irPesQfFI+AuogAPZJqdIIn3tWJA/vn9WZ
	uNoExkx2Jx+tZW2dNrNg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mZqeK-008JcZ-Io; Mon, 11 Oct 2021 08:27:08 +0000
Received: from so254-9.mailgun.net ([198.61.254.9])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mZqXo-008H9H-7U
 for ath11k@lists.infradead.org; Mon, 11 Oct 2021 08:20:26 +0000
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org;
 q=dns/txt; 
 s=smtp; t=1633940425; h=Content-Transfer-Encoding: MIME-Version:
 Message-Id: Date: Subject: Cc: To: From: Sender;
 bh=qxmSLdyNolPiCCXEjjGqh6sRGjLf8GR45MclK36iiVg=;
 b=NeFD9b/c2aragRASH6rKlL1SdTFvnOYRBVoRu0LY2Iu8y7mjPHfGsrAPmL2cFDnBLUvI3neQ
 41i/mRebaD/37NjWsssu2m0QuiL/Rq3TQKuQGISRGdEqRlW09dYLcG+RWdE8xbhXjPNuTm8B
 sOgGmAGRNIumNZszU1F30/98w7U=
X-Mailgun-Sending-Ip: 198.61.254.9
X-Mailgun-Sid: WyJmOGQ2ZiIsICJhdGgxMWtAbGlzdHMuaW5mcmFkZWFkLm9yZyIsICJiZTllNGEiXQ==
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171]) by
 smtp-out-n06.prod.us-west-2.postgun.com with SMTP id
 6163f3c38ea00a941f13bc8f (version=TLS1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256); Mon, 11 Oct 2021 08:20:19
 GMT
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
 id 8885AC43616; Mon, 11 Oct 2021 08:20:19 +0000 (UTC)
Received: from wgong-HP3-Z230-SFF-Workstation.qca.qualcomm.com (unknown
 [180.166.53.21])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-SHA256 (128/128 bits))
 (No client certificate requested) (Authenticated sender: wgong)
 by smtp.codeaurora.org (Postfix) with ESMTPSA id 3983DC4360D;
 Mon, 11 Oct 2021 08:20:17 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.codeaurora.org 3983DC4360D
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org;
 dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org;
 spf=fail smtp.mailfrom=codeaurora.org
From: Wen Gong <wgong@codeaurora.org>
To: ath11k@lists.infradead.org
Cc: linux-wireless@vger.kernel.org,
	wgong@codeaurora.org
Subject: [PATCH 0/3] ath11k: add feature for device recovery
Date: Mon, 11 Oct 2021 04:19:35 -0400
Message-Id: <20211011081938.30327-1-wgong@codeaurora.org>
X-Mailer: git-send-email 2.31.1
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211011_012025_332788_1DD1DF40 
X-CRM114-Status: UNSURE (   7.92  )
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

Add support for device recovery.

Wen Gong (3):
  ath11k: add ath11k_qmi_free_resource() for recovery
  ath11k: add support for device recovery for QCA6390
  ath11k: add synchronization operation between reconfigure of mac80211
    and ath11k_base

 drivers/net/wireless/ath/ath11k/core.c | 119 +++++++++++++++++++++++--
 drivers/net/wireless/ath/ath11k/core.h |  18 ++++
 drivers/net/wireless/ath/ath11k/mac.c  |  41 +++++++++
 drivers/net/wireless/ath/ath11k/mhi.c  |  33 +++++++
 drivers/net/wireless/ath/ath11k/pci.c  |   3 +
 drivers/net/wireless/ath/ath11k/qmi.c  |   5 ++
 drivers/net/wireless/ath/ath11k/qmi.h  |   1 +
 7 files changed, 212 insertions(+), 8 deletions(-)

-- 
2.31.1


-- 
ath11k mailing list
ath11k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath11k
