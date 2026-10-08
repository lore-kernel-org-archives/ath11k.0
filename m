Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 98EACCA6013
	for <ath11k@archiver.kernel.org>; Thu,  8 Oct 2026 22:59:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=HfIuMkKcZhoNGOCpjkNiN0ls+U2IBKT483IcF3W/m8s=; b=f4FA9kiVMzx7iTbD4qMQSpOlGR
	gX5nqMfiaZwu5ZZo+IAokD7D6D2DOVLAoUmUq6s2vZ5+b50t4ha72L8vFi5U+EyGbWKuvoNKCdJsX
	18N7XzstuWYzAyj4Ed1mHTM0UDxHb/sv4v82BgXnbf7iKc7oi1WxKYqfx/yjpLK9PbHmpkvTuWBPy
	Csh1OW7iFAvsOOGDScfHR1lo9Z/jFTG9EWz5qf0NROly9tjnyGKaYf3gqwk1TDgByhucdthOVDWFN
	CE/Zjsw+RAhtyVXrdIvWgPi3+odTRo6J/ZUcEqV/WlwrPf3nfCFzoHnuNzWb9RLOda5ZIQHFauhOm
	4oVNmRiA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xEx4z-000000059Ai-1EXK;
	Thu, 08 Oct 2026 22:59:13 +0000
Received: from mail-ej1-x631.google.com ([2a00:1450:4864:20::631])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xEx4w-0000000599u-1Bz8
	for ath11k@lists.infradead.org;
	Thu, 08 Oct 2026 22:59:11 +0000
Received: by mail-ej1-x631.google.com with SMTP id a640c23a62f3a-c29c6a3930bso775317066b.3
        for <ath11k@lists.infradead.org>; Thu, 08 Oct 2026 15:59:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791500348; x=1792105148; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=HfIuMkKcZhoNGOCpjkNiN0ls+U2IBKT483IcF3W/m8s=;
        b=eiaOUW01tuvmQ0SHnrmM6Eg0Ch1CbSyBTbDJkCgNtY3nIDfd2oKogoINtoVqiqcixP
         0vsRqYtZxr/jkLazFK0oYVGjZZTZr2Odzg8G2cT87i9we2l3ND4oWHnrbhqn0ZdRFOt/
         un9HQ7trHc9pK8SBZHuM+2Db1UpBmlIGGu/wgC2+hX/s9jFowxw+IVWWLTRl8t4aJYTU
         JKmSB3b5UgQpmr41QYsrlPz+qGx3ceoFxStsh7qmEm8cDwswhm4VqlJO/3RDz47XJS9K
         1d44AHJc0M7cLVnFTtdm5q2b/ogTEGos5gFD7ixMeYD7+8pUOVlbP+2oZeMwM5q1LdHE
         j+SQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791500348; x=1792105148;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=HfIuMkKcZhoNGOCpjkNiN0ls+U2IBKT483IcF3W/m8s=;
        b=QlXPoyhSeW8Jp8pbolpyyED1eWE5D3McFa57qFAgy00x0NrvjW4NBLxX6/UXcgFmJh
         iR7kHBVWxCl3cDlMoOz6tm4Br1F+XzIWjwqGZoXZAXDlojZD5fe6bzHWWa4M80YObap+
         LsEDEvk+HRtKdGd1tKncQYUN1HZdjXrBsPuLLNlW6DAE1wL1II9QHoADMWtiMiyCoUna
         zXFiwyIltgvsSl4j7ljqTPuWswZ1TQLfuBsCl6zL1LVouQZEIAYc84pL3mUidmRM/Cec
         Wgl7c2E2qVz8NoV1h93qRZS7/7b3sHLLhHyJaAhkT9qxEddUrohgosL8eL9ka6kqRXBA
         LaZg==
X-Gm-Message-State: AFuF++n2QbvxgACrL1jBb5UJ0EDLOGgw0jdSr42KrBXy6dZk3Xoq6bLv
	Q2wtWSJhlPqGPi/4cI3g0VEftb5tP9ollnQFHocWOYeiwOfubGAk8GUH
X-Gm-Gg: AYBFou21jkSGRGo+jwJH3xB1C8hmAtCFVEQnvVgQZoEV0f3Cd7EmGKLvG2xNUcel2uY
	WIirUbMjM2GmNh+oWNg69Zdkb+UNuDHl80gWOLM1eREsSJ+4q5sZzbE/Kz/ZYLFK1Qdgh9ahLTj
	nkWTFKA/M7QjgKWK1YtyKGiISKmhvNfxwHrvAh8R0TMbNCYM6Sj9tg+ixgy4anTAU9l2RfbJ7Bt
	u2s5bvA71zORMFKFyIrblLaYedBZhw1Zl4fKUgVnHInI8mQIZxcYMtp6qp/Yt2FIO/vt2Ul0GF7
	HuFbn+yxYB31/3IqnrfE9Q5R3ytLfFTlsXP3Kcc0Ia3O+pel6WsFPG+vXrXuu4bkiEpNgW4VVws
	WqGZrvp4KoLiF1BdajhHZCWx21js41V6K4eQ+j4aWNTAFbHH5janGu9Kp7BY+gVBvF1lFbIppFm
	dsVC2zv5bSgv/Rgrmhhv4WIt9yIpiUANY3t6RYKH0KvpIolpzAjtOrEjBYb5YrXhbneBGeQb+FW
	GAOpg==
X-Received: by 2002:a17:907:6d12:b0:c2a:704c:8c74 with SMTP id a640c23a62f3a-c31a9d578e7mr16894766b.28.1791500348119;
        Thu, 08 Oct 2026 15:59:08 -0700 (PDT)
Received: from nb-xps.ts.zxczxc.org ([78.56.243.43])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c31a9ae59f9sm6993566b.80.2026.10.08.15.59.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 08 Oct 2026 15:59:07 -0700 (PDT)
From: Nikolay Bryskin <nbryskin@gmail.com>
To: jjohnson@kernel.org
Cc: ath11k@lists.infradead.org,
	linux-wireless@vger.kernel.org,
	johannes@sipsolutions.net,
	Nikolay Bryskin <nbryskin@gmail.com>
Subject: [PATCH 1/2] wifi: ath11k: initialize txmgmt_empty_waitq before registering the hw
Date: Fri,  9 Oct 2026 01:58:52 +0300
Message-ID: <20261008225853.15399-2-nbryskin@gmail.com>
X-Mailer: git-send-email 2.56.0
In-Reply-To: <20261008225853.15399-1-nbryskin@gmail.com>
References: <20261008225853.15399-1-nbryskin@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261008_155910_335736_7C81A6E8 
X-CRM114-Status: UNSURE (   9.52  )
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

ath11k_mac_register() initializes ar->txmgmt_empty_waitq only after
__ath11k_mac_register() has returned, but __ath11k_mac_register() calls
ieee80211_register_hw(). From that point on userspace can transmit
management frames (iwd starts authenticating as soon as the wiphy shows
up), and a WMI mgmt TX completion event then ends up in
wmi_process_mgmt_tx_comp(), which calls wake_up() on the not yet
initialized wait queue head:

  BUG: kernel NULL pointer dereference, address: 0000000000000000
  RIP: 0010:__wake_up+0x5a/0xf0
  Call Trace:
   <IRQ>
   ath11k_wmi_tlv_op_rx+0x174c/0x32b0 [ath11k]
   ath11k_htc_rx_completion_handler+0x4fd/0x670 [ath11k]
   ath11k_ce_per_engine_service+0x2b2/0x380 [ath11k]
   ath11k_pcic_ce_tasklet+0x1d/0x40 [ath11k]
   tasklet_action_common+0x186/0x290
   handle_softirqs+0xe8/0x2a0
   ...
  Kernel panic - not syncing: Fatal exception in interrupt

The window is normally very short. The panic above was hit at boot with
an msleep(2000) inserted after ieee80211_register_hw() for testing, while
iwd authenticated to an AP during the delay.

Initialize the wait queue together with the rest of the txmgmt state,
before registering, as ath12k already does.

Tested-on: QCA6390 hw2.0 PCI WLAN.HST.1.0.1-05266-QCAHSTSWPLZ_V2_TO_X86-1

Fixes: dddaa64d0af3 ("ath11k: add wait operation for tx management packets for flush from mac80211")
Assisted-by: Claude:claude-opus-5-5
Signed-off-by: Nikolay Bryskin <nbryskin@gmail.com>
---
 drivers/net/wireless/ath/ath11k/mac.c | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/drivers/net/wireless/ath/ath11k/mac.c b/drivers/net/wireless/ath/ath11k/mac.c
index c1fa42edd363..3dfd24d7b5a6 100644
--- a/drivers/net/wireless/ath/ath11k/mac.c
+++ b/drivers/net/wireless/ath/ath11k/mac.c
@@ -10738,12 +10738,11 @@ int ath11k_mac_register(struct ath11k_base *ab)
 
 		idr_init(&ar->txmgmt_idr);
 		spin_lock_init(&ar->txmgmt_idr_lock);
+		init_waitqueue_head(&ar->txmgmt_empty_waitq);
 
 		ret = __ath11k_mac_register(ar);
 		if (ret)
 			goto err_cleanup;
-
-		init_waitqueue_head(&ar->txmgmt_empty_waitq);
 	}
 
 	return 0;
-- 
2.56.0


