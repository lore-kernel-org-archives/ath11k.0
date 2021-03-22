Return-Path: <SRS0=owuj=IU=lists.infradead.org=ath11k-bounces+ath11k=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-17.2 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT autolearn=unavailable
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8E5F7C433E0
	for <ath11k@archiver.kernel.org>; Mon, 22 Mar 2021 16:04:33 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 3C598619AB
	for <ath11k@archiver.kernel.org>; Mon, 22 Mar 2021 16:04:33 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 3C598619AB
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding
	:Content-Type:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-Id:Date:
	Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=H841vSLtk9jP5d/v36NgDlLBJLlZzy7TuTVaj7+Cesc=; b=in2ebds6IZZeCG5dYEYFQIYrH
	Fa9zK/tUt1+tgZXJJOxx3rWZ0zjk2Ex859NqCrRyDbN3FytL0fVBJ7ER1uEpMBlTosIbX8szPgw8V
	5NvYkOMW1PrOmHaE9BDHrAw3QpHJAZGS1Ipv/iN3WOv9yNH+YueaGHda97ELG5tzv6fd61P5xJI23
	zXfFnfLra1EZEU9wLF65HOp9UfEBdw8zRERxqD3OUfJu/Uj6yUG+IlAHSWYGXMYz5egzUk6nSYPMA
	I4t404p985jvIpq1mqyLtVC3T+VqY5jOUAkb5eVPiLSO5mfNtuXDpfQ716uewm8sR+ikzOfoCbAlz
	eotuEnLuw==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1lON2Z-00BxPz-No; Mon, 22 Mar 2021 16:04:28 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lON2R-00BxMp-Eo; Mon, 22 Mar 2021 16:04:24 +0000
Received: by mail.kernel.org (Postfix) with ESMTPSA id 60C55619A7;
 Mon, 22 Mar 2021 16:04:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1616429056;
 bh=n4YjjyF/BQX1oLI53brWrn/ZFErJefAlbdz/B6a/LhI=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=PJL0qpPDqSs2z7UPLYK5QVJo9sc76O7NWlWo5JPHSsPqGyDVDF4pF7hWXIkB1JA75
 QpQt35+7BgO8L8Mn3URqgy3oEgZ8mXFVdUTizaV6t4aX9h9ExQGoEX/rwcyz2jamB2
 scTuPUkDJISJZufdWGtFTIeZztxCxD3lXQOLujQyrS4sySOSS+Y/vZY+qg8LWnqJQL
 I/Aimz84KOYue+E+Dz/GzEJ2kjYrLgh/PeozYrKn1GELVG7ePD4iEbNB0WU3el9Rvz
 crDXO284w80Ehtcr/BjQheDrwVIVIOc3LE73CNZdbBcsVLFqijc8sIiXIjFKbmSQwm
 LtmW3NkvnLTfA==
From: Arnd Bergmann <arnd@kernel.org>
To: linux-kernel@vger.kernel.org, Martin Sebor <msebor@gcc.gnu.org>,
 Kalle Valo <kvalo@codeaurora.org>, "David S. Miller" <davem@davemloft.net>,
 Jakub Kicinski <kuba@kernel.org>
Cc: Arnd Bergmann <arnd@arndb.de>, x86@kernel.org,
 Ning Sun <ning.sun@intel.com>, Jani Nikula <jani.nikula@linux.intel.com>,
 Simon Kelley <simon@thekelleys.org.uk>,
 James Smart <james.smart@broadcom.com>,
 "James E.J. Bottomley" <jejb@linux.ibm.com>,
 Anders Larsen <al@alarsen.net>, Tejun Heo <tj@kernel.org>,
 Serge Hallyn <serge@hallyn.com>, Imre Deak <imre.deak@intel.com>,
 linux-arm-kernel@lists.infradead.org, tboot-devel@lists.sourceforge.net,
 intel-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 ath11k@lists.infradead.org, linux-wireless@vger.kernel.org,
 netdev@vger.kernel.org, linux-scsi@vger.kernel.org,
 cgroups@vger.kernel.org, linux-security-module@vger.kernel.org,
 Carl Huang <cjhuang@codeaurora.org>,
 Maharaja Kennadyrajan <mkenna@codeaurora.org>,
 Pradeep Kumar Chitrapu <pradeepc@codeaurora.org>,
 Johannes Berg <johannes.berg@intel.com>,
 Ritesh Singh <ritesi@codeaurora.org>,
 Rajkumar Manoharan <rmanohar@codeaurora.org>,
 Aloka Dixit <alokad@codeaurora.org>, Felix Fietkau <nbd@nbd.name>
Subject: [PATCH 04/11] ath11: Wstringop-overread warning
Date: Mon, 22 Mar 2021 17:02:42 +0100
Message-Id: <20210322160253.4032422-5-arnd@kernel.org>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20210322160253.4032422-1-arnd@kernel.org>
References: <20210322160253.4032422-1-arnd@kernel.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210322_160422_056733_A1CD3722 
X-CRM114-Status: GOOD (  13.22  )
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

From: Arnd Bergmann <arnd@arndb.de>

gcc-11 with the kernel address sanitizer prints a warning for this
driver:

In function 'ath11k_peer_assoc_h_vht',
    inlined from 'ath11k_peer_assoc_prepare' at drivers/net/wireless/ath/ath11k/mac.c:1632:2:
drivers/net/wireless/ath/ath11k/mac.c:1164:13: error: 'ath11k_peer_assoc_h_vht_masked' reading 16 bytes from a region of size 4 [-Werror=stringop-overread]
 1164 |         if (ath11k_peer_assoc_h_vht_masked(vht_mcs_mask))
      |             ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
drivers/net/wireless/ath/ath11k/mac.c: In function 'ath11k_peer_assoc_prepare':
drivers/net/wireless/ath/ath11k/mac.c:1164:13: note: referencing argument 1 of type 'const u16 *' {aka 'const short unsigned int *'}
drivers/net/wireless/ath/ath11k/mac.c:969:1: note: in a call to function 'ath11k_peer_assoc_h_vht_masked'
  969 | ath11k_peer_assoc_h_vht_masked(const u16 vht_mcs_mask[NL80211_VHT_NSS_MAX])
      | ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

According to analysis from gcc developers, this is a glitch in the
way gcc tracks the size of struct members. This should really get
fixed in gcc, but it's also easy to work around this instance
by changing the function prototype to no include the length of
the array.

Link: https://gcc.gnu.org/bugzilla/show_bug.cgi?id=99673
Signed-off-by: Arnd Bergmann <arnd@arndb.de>
---
 drivers/net/wireless/ath/ath11k/mac.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/net/wireless/ath/ath11k/mac.c b/drivers/net/wireless/ath/ath11k/mac.c
index b391169576e2..5cb7ed53f3c4 100644
--- a/drivers/net/wireless/ath/ath11k/mac.c
+++ b/drivers/net/wireless/ath/ath11k/mac.c
@@ -966,7 +966,7 @@ ath11k_peer_assoc_h_ht_masked(const u8 ht_mcs_mask[IEEE80211_HT_MCS_MASK_LEN])
 }
 
 static bool
-ath11k_peer_assoc_h_vht_masked(const u16 vht_mcs_mask[NL80211_VHT_NSS_MAX])
+ath11k_peer_assoc_h_vht_masked(const u16 vht_mcs_mask[])
 {
 	int nss;
 
-- 
2.29.2


-- 
ath11k mailing list
ath11k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath11k
